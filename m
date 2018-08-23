Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id F1A5E794A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:03:12 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id s12-v6so3341754ljj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dyu5D8y1XNCvpaS6YNQgLpbiuCmSDeIoKO18myq7Hig=;
	b=tgpFV4qWfin6Fg1VA/xCXr8Y6tbnopkt6aGZ5o4YeaSYi69+EjXxxNSVSK6i6Lwej6
	HHjtt62nAQTwh3HR3jIUgm4v2/qrxgafkS0NRFoO+DlFlPMg69j5SDHfsQQTMvef3AY4
	7zETPZuRuyIgUUGqNIVheWI4QWlXhW9nz7KE30OmpgdhITzGyZHnyik9w4TIqnePRcma
	dzPTiqAMiAzXP/8AAs2pVXAUrJUJihrgbQGmc+OrNym2jRleTBkkZd4briAw9P7FWTal
	pG8P6//sTpdzhzyaTiWicDHfZHxyC1llFqxCyi7zXOjFuWYHLNf9/Y+Wy4SpsxMHSmFp
	L68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dyu5D8y1XNCvpaS6YNQgLpbiuCmSDeIoKO18myq7Hig=;
	b=GfjllwufjJ6FwYS2oYhdLpwaub+Dpau7ZSq/iKkncwN+sPxheci8dM7Rj5JZKrzsiQ
	Q2B682YFIwNVlnNmrdUVyY3U8dJyRIA5uPXMu04X11Aoa197GcsGnkoU+h/4DY9WNuEA
	nriHQfYzWtnvjQvb64aNcn2DAcjFlvsSgES0cTWQSEJwsAGaZV05DmXfG58SRyUibiyE
	22mSBSCzkfwT76Xd4N4wnliq/aBQaGrU/M0mxe6nxLSlEY49INrXU1WkcVzt4F3WFYuP
	5kA4rrOm/LwTnfAn0mx9Ax6pAgllb76t1fmTtU2qO38WgleJG8XuPi/6Uw3vaWMKLa6j
	KNDA==
X-Gm-Message-State: AOUpUlHN0XMcxCUUgqNlX+FD6V9VSgHjResZ8t1Rk97W97sAXaELuFrk
	uvo7m78T0AROCiHzLJIUBjSpwXttEvXaxJM6nhM=
X-Google-Smtp-Source: AA+uWPx4zMrzy8mdtMZ9ulRGRc+v6IBpYFXrOK3yyDzg2fgd7HG+hdcxaRRHM0Qnc5oC0U2mGg3//x/s/rr/bZOyHbk=
X-Received: by 2002:a2e:8514:: with SMTP id
	j20-v6mr15072247lji.10.1535007793344; 
	Thu, 23 Aug 2018 00:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
	<CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
	<a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
	<CAPybu_0QAOWyz9+XGKEADtZqj+wj2Ro7hQx_q8BkX9BBrjPPCg@mail.gmail.com>
	<e0ffd2ccefb534b1c4171449256c123e9e6b5e55.camel@linuxfoundation.org>
	<CAPybu_1NAf_p0zfZSPTAbweKYunAyGL_6tLwhao-Kw6be3FX9w@mail.gmail.com>
	<CAPybu_0oQ2sjiVTMqXXbvTs+3dagLn8Wps5-AxYhqtjKz-9M6w@mail.gmail.com>
	<15ac7737a9a1a20bfbb6ed98a79ba140a6e6c786.camel@linuxfoundation.org>
	<CAPybu_2BB1XmsvrrME9poTKABtW+C6qZvJo3eoo=MDUDJa5cuA@mail.gmail.com>
	<8fe6af7262abdf19ade58f0c04a25637b20d5aef.camel@linuxfoundation.org>
In-Reply-To: <8fe6af7262abdf19ade58f0c04a25637b20d5aef.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 23 Aug 2018 09:02:56 +0200
Message-ID: <CAPybu_2jcaa=YtWzN-K_NAVcSgJNArYfYuWO+owQ_B-W_KJNuA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Thu, 23 Aug 2018 07:03:13 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, Aug 22, 2018 at 4:57 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-08-22 at 15:39 +0200, Ricardo Ribalda Delgado wrote:
> > On Wed, Aug 22, 2018 at 3:37 PM <richard.purdie@linuxfoundation.org>
> > wrote:
> > > > RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> > > > /libx32/ld-linux-x32.so.
> > >
> > > I just looked at what the function is doing and its broken. What is
> > > DEFAULTTUNE set to in your build?
> >
> > DEFAULTTUNE="dbfp4"
>
> As I suspected.
>
> Try applying:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=d69f0127b44a5216dd21ad972d6f2b2e4cda6d13
>
> and
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=95aa56ae11852c100be68d13aaffa9c83273b46b

After applying both:
pokyuser@3a9fc37099f7:/workdir/build$ bitbake glibc -e | grep ^RTLDLIST=
RTLDLIST="/lib/ld-linux-x86-64.so.2"

and
ricardo@neopili:~/curro/yocto/europa/build/tmp/work$ cat
dbfp4-poky-linux/glibc/2.27-r0/build-x86_64-poky-linux/elf/ldd | grep
^RTLD
RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
/libx32/ld-linux-x32.so.2 /lib/ld-linux-x86-64.so.2"


So it seems fixed (and more cleanly than with my patch :P)

Thanks!
>
> and then seen if that fixes things.
>
> Cheers,
>
> Richard



-- 
Ricardo Ribalda

