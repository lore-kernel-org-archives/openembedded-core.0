Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8374D608BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 15:41:05 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id w7so1135125qcr.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=vh8O+2FjwXScPrUlXOJflxJ3+dHREew3qpi0jlDECaE=;
	b=GIG4x8cvfCO+vlTA4/sNxsyUbMxUEjoAXvfIIPZyuACth3xAg1qdkBnjAomlwHRlbe
	A+dVm26JNCENveheJ/Sb9+/9qLdL5phb4LltkQufrKmf0pd6Rs3xpwFwblXRpWdwNkV8
	VZmQsCBvmjLdTPyWm724dL84+yJdK5xe+k1ZiVTkU0Z0pR6hYOt4bLlWMRdDY7BUu8Dq
	CePnIJ5DjBQR7nyygUdCasYH7vO7a1AzQ7swUV/oOfp0Bt866MKatIsBmszLCadA90Kz
	go/YZVz56AvhI/rz7wh2rvPkdE3AKL6Xfi8l8txVY7XozXc5+5nvKSnzxOL5hSY4Phb5
	jR5Q==
X-Received: by 10.140.39.11 with SMTP id u11mr44817209qgu.32.1413906065109;
	Tue, 21 Oct 2014 08:41:05 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Tue, 21 Oct 2014 08:40:24 -0700 (PDT)
In-Reply-To: <543ef52e.0879c20a.1785.4076SMTPIN_ADDED_BROKEN@mx.google.com>
References: <543ef52e.0879c20a.1785.4076SMTPIN_ADDED_BROKEN@mx.google.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 21 Oct 2014 16:40:24 +0100
X-Google-Sender-Auth: q8DriNWaG4-9bvmM2_uDjoY62NY
Message-ID: <CANyK_8cVJEBpBWG2Nes705+1mdmT3W86izEnqYreiaCTD5yBdA@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] opkg: Call prerm and postrm scripts on package upgrade.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Oct 2014 15:41:06 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 23:27, Peter Urbanec <openembedded-devel@urbanec.net> wrote:
> opkg upgrade will now call prerm and postrm scripts from the old package
> with "upgrade new-version" arguments, similar to what dpkg does.
>
> Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
> ---
>  .../opkg/opkg/prerm-and-postrm-scripts.patch       | 81
> ++++++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
>  2 files changed, 82 insertions(+)
>  create mode 100644
> meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
> b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
> new file mode 100644
> index 0000000..98a447a
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
> @@ -0,0 +1,81 @@
> +From 476965fdb2d6eec559242e6205cbb07d539b80e1 Mon Sep 17 00:00:00 2001
> +From: Peter Urbanec <openembedded-devel@urbanec.net>
> +Date: Wed, 15 Oct 2014 14:32:22 +1100
> +Subject: [PATCH] opkg_install: Call prerm and postrm scripts on package
> upgrade.

Sorry Peter, it looks like this patch has been corrupted as well as
the one sent to the opkg-devel list. In this case I think it's mostly
lines like the above which have been incorrectly wrapped.

Could you resend this using 'git send-email' if possible?

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

