Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SvGMg-0003Ou-HG
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 01:24:06 +0200
Received: by pbbrq2 with SMTP id rq2so6503370pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2012 16:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=BxDUyB6zrL2OnpPkyka4TEMvITJxYbTGv4p42TiqfoY=;
	b=b+7koMQj3/XhC0XnSFNGSpymhTgThsrS0zfZE9vplL0rJEEzm4xpryEt5K+byi1mh8
	GwPdi9faIBsmOYDeGTcUA9I1FvdxEHSTsGEw9P8Ja0GveeWfd8Z/v+2wMi5UJQ7PZ2lD
	hR1Pvti0OmDSlvwIE3SdY1EfNfveaqqzDhiMA/d6+cNCON1ws1TOKsK3yPmHcM6Shv35
	YmmNN7mIY8lnVORE8n4606jqNxS2Z6eiLl3AMGg3VK+K935rCsWZU2D7Rv4cnVXjiScj
	NcKR9HTdsyPMKHIOE4lIkR6ijm22aXu3IoKn4tuiTZtX2uzSwilgR5PJaQnkUQhht34b
	FIjg==
MIME-Version: 1.0
Received: by 10.68.231.132 with SMTP id tg4mr24365356pbc.159.1343517151934;
	Sat, 28 Jul 2012 16:12:31 -0700 (PDT)
Received: by 10.68.62.228 with HTTP; Sat, 28 Jul 2012 16:12:31 -0700 (PDT)
In-Reply-To: <1336894870-12973-1-git-send-email-cazfi74@gmail.com>
References: <1336894870-12973-1-git-send-email-cazfi74@gmail.com>
Date: Sun, 29 Jul 2012 02:12:31 +0300
Message-ID: <CAF6bG8d+Y7t6n0WTkhfxAOQ=Btw=8djL1wM=5schP4tWwVoBxA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dpkg: update to upstream version 1.16.3
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
X-List-Received-Date: Sat, 28 Jul 2012 23:24:06 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2012 10:41, Marko Lindqvist <cazfi74@gmail.com> wrote:
> From: Marko Lindqvist <cazfi@cazfi-64>
>
> Update dpkg recipe to get latest upstream version (1.16.3) as
> 1.15.8.7 is no longer available.

 Just to reminding you that final versions I posted suffered from no
bugs I'm aware of. This dpkg update patch works standalone. apt update
one requires patch "package_deb.bbclass: don't handle advanced
dependency marker as version number" before updated apt works at all.
Bug fixed by that patch is not new with apt update - it just isn't
causing fatal error with earlier version of apt (or any other
package).

 Computer I had set up for OpenEmbedded development failed over a
Month ago, and I'm still using just temporary solutions for all my sw
development needs - making OE setup to these temporary environments is
not feasible. So I'm afraid I cannot do any real development at the
moment, but I'll try to answer any questions you have about those
three patches.


 - ML


