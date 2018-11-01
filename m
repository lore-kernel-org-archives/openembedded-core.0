Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7C34B79CE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 10:02:48 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id q15so11869627vso.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 03:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A2gvq3i7sq1ISa85HcEg3zcHG+cpjYZv4F5HGyds1Hc=;
	b=S7LMgTEUrMqMDNFeOtYAnI77lK7j/RmONnfmTLsfUcIn6pOs/nWNP27ZoSFTAT+fj3
	HPrd5N3meQMdpmuIPfIK7wxqDG+vT3Rn8u0fyGeOxzxSQQwyNsZfyzs63ws90z/PiNO0
	muXRUcNh0cedJy4ICs8vIC5QkCCFZwbk58B6oSkASbqTVgWdWkpbo85u0HmxLth7EUK0
	L0NvYI3eiSSbESyh+YCTbciiGGdu01MRoxbji6hVXFGe2QSB3kxnWyWRJfDOZJZikxff
	FdYupBC8gWbm4gLvqBqzhYBHMjgdeBupeLrL9QQcEJ/jQfb81Dmmr/Ovg2aFMKod66Nb
	YC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A2gvq3i7sq1ISa85HcEg3zcHG+cpjYZv4F5HGyds1Hc=;
	b=WbPbgEpjrBg86iSs4PLkQkVbRRnHwUdtwDuBtHhobPhU3nCoXEQIZfcsmBFFhbEuDK
	NIaGWnt0nzM5RrDKMDgG3s0+pX9yPLuTkI40l14i2HwZcdDBS+O91SbGlJQfysLanuIR
	63yHPsuEQQxgqc9BG9JZrGUXrTH2tzbbWSCMaR+tLxM7zx19fN1T9YWwu8675MYsnrJl
	CaAqi+0S9DwuXj1vMPjkIxYAmfk4h6w3ICRslNFipZDfGwkpSDAcR9gfXj/u8oCwRYjC
	IeZyn9PixY6bDxOzC7dn1OYxjn0zpXHKy7UnesN0Vmkonh9/8/wj5Ne+sxofC6xFPtfY
	hioA==
X-Gm-Message-State: AGRZ1gKHNEuZDn5EG+YFd3INTTd+1Kkl1wJqj6IbymxKXBxufmCMFZEU
	d5PBLPHR94gIzeniikUmSoQgXZkv+v80kTT0BoM=
X-Google-Smtp-Source: AJdET5c0uzRhUPYyrT3BCTfNL8Jyysq8qUx6d9SfNRIo7j8/eWhjbGQd5xqjxXjKlHPdpZZeX2/tIL9kbfl4OlPSTxY=
X-Received: by 2002:a67:1fcf:: with SMTP id t76mr2691611vsf.137.1541066568896; 
	Thu, 01 Nov 2018 03:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
	<1540217112-24479-4-git-send-email-akuster808@gmail.com>
	<CAJ86T=WVfW1E_4OStVRu8TN03hhnQB0Z0d8M6PnqEgkqR-SK3A@mail.gmail.com>
	<8c28b5f7-261d-32cb-a558-bf9de7384d89@gmail.com>
In-Reply-To: <8c28b5f7-261d-32cb-a558-bf9de7384d89@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 1 Nov 2018 03:02:37 -0700
Message-ID: <CAJ86T=V3xQqMGp+eFeUJA4-aP86FguSpNOG2esASz-GQ8i197g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] gnutls: update to 2.6.4
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
X-List-Received-Date: Thu, 01 Nov 2018 10:02:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 23, 2018 at 12:42 AM akuster808 <akuster808@gmail.com> wrote:
> On 10/22/18 9:06 PM, Andre McCurdy wrote:
> > On Mon, Oct 22, 2018 at 7:05 AM, Armin Kuster <akuster808@gmail.com> wrote:
> >> Notable change:
> >>
> >> libgnutls: Added the final (RFC8446) version numbering of the TLS1.3 protocol.
> >> see: https://lists.gnupg.org/pipermail/gnutls-help/2018-September/004457.html
> > Subject mentions 2.6.4 instead of 3.6.4
>
> Thanks for catching  that.

It looks like the v1 got merged to master-next instead of the v2 with
the corrected subject line.

> BR,
>
> Armin
>
> >
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} (93%)
> >>
> >> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.3.bb b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
> >> similarity index 93%
> >> rename from meta/recipes-support/gnutls/gnutls_3.6.3.bb
> >> rename to meta/recipes-support/gnutls/gnutls_3.6.4.bb
> >> index 441bbec..6d2a11d 100644
> >> --- a/meta/recipes-support/gnutls/gnutls_3.6.3.bb
> >> +++ b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
> >> @@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
> >>             file://arm_eabi.patch \
> >>  "
> >>
> >> -SRC_URI[md5sum] = "d3b1b05c2546b80832101a423a80faf8"
> >> -SRC_URI[sha256sum] = "ed642b66a4ecf4851ab2d809cd1475c297b6201d8e8bd14b4d1c08b53ffca993"
> >> +SRC_URI[md5sum] = "63363d1c00601f4d11a5cadc8b5e0799"
> >> +SRC_URI[sha256sum] = "c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a"
> >>
> >>  inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
> >>
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

