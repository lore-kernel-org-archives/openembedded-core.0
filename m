Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 163E66013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 13:09:15 +0000 (UTC)
Received: by qgf60 with SMTP id 60so78691149qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 06:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JILwck2UbDfyE8znzTswHnwTSaVF3ll+ZwkFbpXEPSM=;
	b=ippyFQMSzT8NROuXa8mc5/50DXbj1Dzro+JmqmUrezyzFYVW3aIvK+w9AXy37H+Jsk
	mmt/4F79w005mECuY4hMWWDEukfclCyafWizGDTKYwR37Hb1UorjFNaqw/q0RYBsyF65
	vSkjja6PAy5R6orMXmvLyVwm/7E49KtXOU11PfkNJ7ZVLJuZNZUGqbzf7oq1DXDj9jMp
	5LmSzeVRmFs2Y4luAR5jFUOBK029nUSls8VE08mwFVQDneVepG65u4wxMAFLErh55aK9
	evZjGOpr6XdgwZ+w14vK2cnewtjosXfFFOeM+RUh6TtT8AVBCVBOUItJg59LxQ/a65aK
	rohQ==
X-Gm-Message-State: ALoCoQlsPhoE4dK54Va8gUM71w1pVAgGCEFE5kcKd8gerUqVN+51jH754S54eFnjzpbCiW+ZMhZh
X-Received: by 10.140.165.150 with SMTP id l144mr18388670qhl.39.1427375340674; 
	Thu, 26 Mar 2015 06:09:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Mar 2015 06:08:40 -0700 (PDT)
In-Reply-To: <5514025A.4080004@huawei.com>
References: <1427361482-5775-1-git-send-email-zhengjunling@huawei.com>
	<1427363666.14020.62.camel@linuxfoundation.org>
	<5513EE0B.5070802@huawei.com>
	<5513F450.1010701@communistcode.co.uk> <5514025A.4080004@huawei.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Mar 2015 13:08:40 +0000
Message-ID: <CAJTo0LYk7tA=5Vos6BC4j8cC5V=9TK4BZ9H0j0RQeajQuo=D0A@mail.gmail.com>
To: Junling Zheng <zhengjunling@huawei.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"peifeiyue@huawei.com" <peifeiyue@huawei.com>
Subject: Re: [PATCH] file: remove the original magic.h
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
X-List-Received-Date: Thu, 26 Mar 2015 13:09:20 -0000
Content-Type: multipart/alternative; boundary=001a1134effa2477e0051230b877

--001a1134effa2477e0051230b877
Content-Type: text/plain; charset=UTF-8

On 26 March 2015 at 12:58, Junling Zheng <zhengjunling@huawei.com> wrote:

> This problem is that sometimes the magic.h wouldn't be generated again by
> magic.h.in if there
> is already an original magic.h, and we may get an unexpected header file.
>

libmagic_la_SOURCES = magic.c apprentice.c softmagic.c ascmagic.c \
        encoding.c compress.c is_tar.c readelf.c print.c fsmagic.c \
        funcs.c file.h readelf.h tar.h apptype.c \
        file_opts.h elfclass.h mygetopt.h cdf.c cdf_time.c readcdf.c cdf.h

The problem is that the makefile doesn't actually say that the magic
binaries depend on magic.h, so make is perfectly reasonably to build the
binaries and then re-generate the makefile.

The correct fix here is to add magic.h to libmagic_la_SOURCES.

Ross

--001a1134effa2477e0051230b877
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 March 2015 at 12:58, Junling Zheng <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:zhengjunling@huawei.com" target=3D"_blank">zhengjunling@huawei.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><div id=3D":14o" class=3D"" style=
=3D"overflow:hidden">This problem is that sometimes the magic.h wouldn&#39;=
t be generated again by <a href=3D"http://magic.h.in" target=3D"_blank">mag=
ic.h.in</a> if there<br>
is already an original magic.h, and we may get an unexpected header file.</=
div></blockquote></div><br><div class=3D"gmail_extra">libmagic_la_SOURCES =
=3D magic.c apprentice.c softmagic.c ascmagic.c \</div><div class=3D"gmail_=
extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 encoding.c compress.c is_tar.c readelf.c=
 print.c fsmagic.c \</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 funcs.c file.h readelf.h tar.h apptype.c \</div><div class=3D"gmail_=
extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 file_opts.h elfclass.h mygetopt.h cdf.c =
cdf_time.c readcdf.c cdf.h</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">The problem is that the makefile doesn&#39;t actually =
say that the magic binaries depend on magic.h, so make is perfectly reasona=
bly to build the binaries and then re-generate the makefile.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The correct fix here=
 is to add magic.h to libmagic_la_SOURCES.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a1134effa2477e0051230b877--
