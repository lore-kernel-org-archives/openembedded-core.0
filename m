Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBXL9-0007FR-Dq
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 21:41:15 +0200
Received: by vwe42 with SMTP id 42so1756703vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 12:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=yFYTCOet+UcL2UAunYg7w8C6s8PldeZ+a9k57jkikew=;
	b=oHehSZ2S+cKrIxOueoMwqGhoDQeO7lDzpewLd08sPQd+tQzBa0BAmry6FJ1FGrOXZI
	t6KsjSn4Rv4QI1PMsmkUPaC6e7yFMUzFEBRlLhKzsGTeUHGSbRU0NADl2etQRqbyes0B
	zPnSW1y6rx4aN3fkmYtohrJZFR7DhmEOBys4g=
Received: by 10.68.31.129 with SMTP id a1mr21353931pbi.5.1317843339109; Wed,
	05 Oct 2011 12:35:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 5 Oct 2011 12:35:09 -0700 (PDT)
In-Reply-To: <4E8C662B.4090300@balister.org>
References: <4E8B6564.4090002@balister.org> <4E8B67C5.8050602@intel.com>
	<4E8B6C17.80509@balister.org> <4E8B6D47.9000600@intel.com>
	<4E8B8C05.5050508@windriver.com> <4E8C662B.4090300@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2011 12:35:09 -0700
Message-ID: <CAMKF1soVx-m6aa0xhHeSvPDSBQvwc+L37r1xgTs58ZuCs+XhzQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bringing an image from OE to OE-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2011 19:41:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 5, 2011 at 7:14 AM, Philip Balister <philip@balister.org> wrote:
>
> 1) I do not want rpm in the image. This would confuse my customer base.
> 2) I am tired of dropbear, I want openssh only.
> 3) I need the full versions of tools, not the busybox ones.
> 4) I am not limited to gpv2 software.
>
> Richard, it looks to me like we should add an item for the next Yocto
> development cycle to review how images are built and try to make the base
> stuff in oe-core more usable by everyone. We need to define what choices are
> made by distros. For example opkg, rpm, no package management in image.
> Images may want dropbear or openssh.
>
> Short term, I think I'll copy the tasks/images into my bsp and get some
> stuff together for testing. I'd like a better long term solution though.

There always will be customizations needed. But we can strive for
better basic blocks


