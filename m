Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id D3464731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 08:02:30 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id f89so39291282ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xzY107jOBTLu9LSJhH41o1pUGJuuyJozMAbT+OT/Jo4=;
	b=wpzQDB7KDjLicsSEDCPULhYN6dLGevMl67xPdHICD1EIJOrCPaLt/Xw8BiU2QIptsw
	35KD1B25ogH+MWU5pykEFfWOAJFM3mpmncZqUPenLOqlWC88vFnozVN+h2vPjFlW8sO3
	QixCcJlC02woh4oLGclnAsEWWuA6lkh6N6gv9Fel1oxdpljPu0aOjlArqhugMqmKsNg8
	+o9xG3Yatu05f6uz6J38mt65fuLj0XJL3avotvqZsOIskxAB4rquhyxM/rDyWnsioOXT
	rLD1mxJvGWqzuGoeIpvgno0VEeXZHwFgfvcEkWb72uF/fKYIAhYtg9wpXYsVYX7w50Rb
	XV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xzY107jOBTLu9LSJhH41o1pUGJuuyJozMAbT+OT/Jo4=;
	b=Gz2Evr25mlKnF8oQwHm+HnxDkeHh0PF4c9SZg8xFO2Tfydo7G6FnXEi3SLoCUMxmF9
	dkY3mpcaPEoV2jZXWgb9HUjnK/eghStjFowDeWCse+XXAsTD3PjYD2PbqTbyaCJrMXIe
	5NPVPzlfWGijLTvojGxAwGf7PIrXtxB/mtyczr4eC+1v/qA9fKBQgDtW15e7aH4Op8ov
	EnoM5uRS18eKChrYaZsZlmbPCpOHZsZ3WX5RFZEHPXSdACvYdR74Q0ebzVFDhGblyvU1
	gJU87Yin0Q44TnnKxa/dcqvSy5P8vTaWsuC1NCwYbkRRDL50Xn1dwEZ1c5VIZnmAkqFp
	/9DA==
X-Gm-Message-State: AOPr4FVMFL7K8ftomPIyPidkQB1xHIi67HpVbCuHAw3oRAn9QnA4Jy5TGQOCjyC3pDNR7vx0fLIoggwxnmcTj1Pe
X-Received: by 10.107.179.136 with SMTP id c130mr8274655iof.99.1461744151369; 
	Wed, 27 Apr 2016 01:02:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Wed, 27 Apr 2016 01:02:11 -0700 (PDT)
In-Reply-To: <CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Apr 2016 09:02:11 +0100
Message-ID: <CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Wed, 27 Apr 2016 08:02:32 -0000
Content-Type: multipart/alternative; boundary=001a1148578ce52413053172d4b0

--001a1148578ce52413053172d4b0
Content-Type: text/plain; charset=UTF-8

On 21 April 2016 at 04:06, Khem Raj <raj.khem@gmail.com> wrote:

> I have updated
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-6
>
> With few more patches added now. Most of packages in OE-Core are
> building fine except linux-yocto on mips and ppc
>

I threw this at the autobuilder.  Lots of c++ failures on various
architectures.

https://autobuilder.yoctoproject.org/main/tgrid, the row for SHA 91ef.

Ross

--001a1148578ce52413053172d4b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 April 2016 at 04:06, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style=
:solid;padding-left:1ex"><div id=3D":3tq" class=3D"">I have updated<br>
<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dk=
raj/gcc-6" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org=
/openembedded-core-contrib/log/?h=3Dkraj/gcc-6</a><br>
<br>
With few more patches added now. Most of packages in OE-Core are<br>
building fine except linux-yocto on mips and ppc</div></blockquote></div><b=
r>I threw this at the autobuilder.=C2=A0 Lots of c++ failures on various ar=
chitectures.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra"><a href=3D"https://autobuilder.yoctoproject.org/main/tgrid">https://=
autobuilder.yoctoproject.org/main/tgrid</a>, the row for SHA 91ef.<br></div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a1148578ce52413053172d4b0--
