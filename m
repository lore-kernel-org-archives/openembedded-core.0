Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 16B8E6D3DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 23:03:56 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id x13so987906ief.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 16:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3hmWDmgq6mBjgsxy+gaBQxjTG7w4C8u1YGJayb3bWWg=;
	b=tR77LWaMm/itBarRr0WUT05hq6MHQEgy7z/zHFb7BdOlXZ43jnB6DJD27aXN6bAC0m
	k1TMd9TN55+zXLUTIk8tl4yR9M+2HhgeB0tihezKR9veOOBFXv8l3k9jW4g6AD1133T5
	7A/rIV09XKz9AbmRPsQkuWZNmr/juRwSySm+kGA7x/cVdYpygoP7x07A3NqoHFhMytFW
	5nVXf2weDsD7p7h4ARlqjJtDEbjmaYjKEioYo30uGPqO/5nuhsDvETOidM7Xk76S5Pzq
	jkThArJ7ZE5t7A3xi9VsI0YajEJBGn+krQSvq3nxwNkOrOEwqiJOPdna3z9YKZhm+E4A
	Vtsw==
X-Received: by 10.50.23.103 with SMTP id l7mr135392igf.3.1383087837625; Tue,
	29 Oct 2013 16:03:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Tue, 29 Oct 2013 16:03:27 -0700 (PDT)
In-Reply-To: <1383022443-4171-1-git-send-email-rongqing.li@windriver.com>
References: <1383022443-4171-1-git-send-email-rongqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2013 16:03:27 -0700
Message-ID: <CAMKF1sqT+NZkhg=74iXJtZUKSiTu8HXzPbQbPRO881LzzDWsbA@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: fix library path in FILES_${PN}
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
X-List-Received-Date: Tue, 29 Oct 2013 23:03:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 28, 2013 at 9:54 PM,  <rongqing.li@windriver.com> wrote:
> -FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
> -FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
> +FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
> +FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
> +INSANE_SKIP_${PN} += "libdir"
> +INSANE_SKIP_${PN}-dbg += "libdir"
> +

may be you can use ${nonarch_base_libdir} instead of hardcoding

