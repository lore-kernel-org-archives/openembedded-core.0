Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCE37E285
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 19:10:33 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id z11so2685234vsq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=874kXtenqXT1E+jRwpZmcrF0mXeIyr7jzLNtQwYBVT8=;
	b=Cn0LItCurHjywL3JsCDSWVrLhG7R99fyNkRv/mPFa71cW7OqInnzI6ufD6GB/U5zGC
	Cu7nDGBZpFPrpE3dsTtQIkGZVmk/fwwntG2lI5dWPFu9efRLdOKS57NVt5bS8x81n+8A
	ZnAVp5btZaM2HjPZTXbsK12rAcv9iTN1KREvCj0G3BiI5AuLWNf/xhb7VvO0WfZBTGET
	KZQnqdvLELC7oYZwngMjI/uxg9dO5p3Ottu8jw8zcZu1d1i+OrYV7QNYqlonqNm5hecI
	muUvfQNlaHACuDuf/vAy3mIzJZa5HulMliHrzrXWMPibK8+us9wfVbFuZAHf1ZMuxW26
	Lwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=874kXtenqXT1E+jRwpZmcrF0mXeIyr7jzLNtQwYBVT8=;
	b=Z5IsS/crIOVw4eklgbhhQ4tjow4dQd0R0tx4UleCqanD5Yn0igJAqAlEtIAIjjpelC
	1DDw72R7BEGvV1QPNnOi+BhsOo+rQLLaCLU5vwjp1S/76lzrJ5k4L8yyILRlFitFhTiQ
	6qcmfsL6Rzn1h8sgGAUdzhFYywzY7i1If+lqCeYY4jbZBDWfqxIFFRA+lDnNlsXXyCYT
	vlmoF6FkRlo0zkB92wad7r11QBP9PBXGmkDbDatpF8eZYdW4nlglhOFzvlUthzKi2aGV
	Qhj1689VTCBUIj1/Qnz+unU2q9LXMaFo6UuqOaU1AsV70+AIhacgN2iy99inT1cufHhu
	I8Tg==
X-Gm-Message-State: APjAAAVsaYZ31K7fXyBNDjQzgugf21fZ1Tr/UD/pS4R4rQGujDkygnaK
	SEp1MD6ZBrWuUxny3LGKfcUO0KCGFB/yT4foRbsKhQ==
X-Google-Smtp-Source: APXvYqy1hBkt7fnBJKjjsx7R1PGH405jjNF0FQ+wa02Lm3wdvm1jqtQYS+ZItPthvUtAPoC9HhObAAexVAr5JuUA8no=
X-Received: by 2002:a67:ea0d:: with SMTP id g13mr33104919vso.137.1559157034028;
	Wed, 29 May 2019 12:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190529144130.21278-1-andrei@gherzan.ro>
	<43b12f6cf16d43e788827f48a935ff6bdc3c777d.camel@linuxfoundation.org>
In-Reply-To: <43b12f6cf16d43e788827f48a935ff6bdc3c777d.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 29 May 2019 12:10:21 -0700
Message-ID: <CAJ86T=VmDmhNA0BPikj2T5d12JCrrjbhEguWtnL9V7hR9Lj_oQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] ca-certificates: Fix openssl runtime dependency
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
X-List-Received-Date: Wed, 29 May 2019 19:10:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 29, 2019 at 11:46 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-05-29 at 15:41 +0100, Andrei Gherzan wrote:
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  .../ca-certificates/ca-certificates_20190110.bb               | 4
> > +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/ca-certificates/ca-
> > certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-
> > certificates_20190110.bb
> > index 4c0425302f..7c06573db2 100644
> > --- a/meta/recipes-support/ca-certificates/ca-
> > certificates_20190110.bb
> > +++ b/meta/recipes-support/ca-certificates/ca-
> > certificates_20190110.bb
> > @@ -82,6 +82,8 @@ do_install_append_class-native () {
> >      SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-
> > certificates
> >  }
> >
> > -RDEPENDS_${PN} += "openssl"
> > +RDEPENDS_${PN}_class-target = "openssl-bin"
> > +RDEPENDS_${PN}_class-native = "openssl"
> > +RDEPENDS_${PN}_class-nativesdk = "openssl"
>
> Wouldn't the nativesdk version be openssl-bin too?
>
> or really these would end up being openssl-native and
> nativesdk-openssl-bin?

What was the reason for moving the openssl binary into a different
package in openssl 1.1? As far as I can tell from the mailing list and
git history the change landed without any discussed or explanation.

