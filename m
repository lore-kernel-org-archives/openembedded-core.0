Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVtld-0004Kl-Up
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:40:46 +0100
Received: by lagj5 with SMTP id j5so491840lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=C7hfmhV6ZLebG9xzIbJWP04PxYRTFP/l5ePHlTgqyGQ=;
	b=NLNK+xBHoWuc9bc/zhmfBuvsulfHlr89HL49ZahnE4pHqN4xE1nk+4kyIxSUWAWOf6
	lb1B+A8F8/FKEa70aZCOfw58Uz6eP1FI6sxP/ZDDZGJOXwocSbt/TETxsonwZv6rUWBX
	9rdsCvRyEPxz77MDejIsnw+GbAsnsto9dMAp0=
Received: by 10.152.106.115 with SMTP id gt19mr2952502lab.27.1322696045344;
	Wed, 30 Nov 2011 15:34:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 30 Nov 2011 15:33:34 -0800 (PST)
In-Reply-To: <1322695568.17484.82.camel@ted>
References: <1322606818-2817-1-git-send-email-raj.khem@gmail.com>
	<1322695568.17484.82.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2011 15:33:34 -0800
Message-ID: <CAMKF1srY+NV83Y4uv5QQxq8_AAr_cJ3J8h3+9s1C9YsMxD2nRw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Apply libc-${LIBC} overrides to target recipes only
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
X-List-Received-Date: Wed, 30 Nov 2011 23:40:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 30, 2011 at 3:26 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'd like to think simpler. How about we change tclibc*.inc to do
> something like:
>
> LIBCOVERRIDE = ":libc-glibc"
> OVERRIDES .= "${LIBCOVERRIDE}"
>
> and then native.bbclass can just do:
>
> LIBCOVERRIDE = ""

OK let me experiment with this.


