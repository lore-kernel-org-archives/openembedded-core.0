Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2B52B65CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 23:49:04 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id i50so3242087qgf.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 15:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ciW+DObtA150qRhHEFSlZhg0BB9OdSGOfD+dHDMrrX4=;
	b=KAzFkfUjEnnxM/H7GXHm6gAwHJhxO5NcXW5Z05vNnQ1jc0fimaSkyAljxuqbeuBvjG
	tufxSNq1skC5hjzruwPyBlGTX/RWUqNZ1QZ+FUCSrTfHpQ9i53ZggSEGCdE8fQtuD6Ym
	84oc+hQI+ZDHEE0QeRBV2JKS42YkSVpmIyfce02i7MeRd3+p16Cr8m21k80c/9/AoF8K
	xHJNHYf/4mRVQctfNAZlml2FNCl7Ly7kkfbrdU7DbUc2zc/NmFSWRR71ziGmarV2c1SV
	AstIR1Y2k77A6PSnuKi7xq6+VR28bvn3m1IFdg5YbR7DzRMEKoM6eXw7SCH3zx/EXXp8
	BJWA==
X-Gm-Message-State: ALoCoQl0RT0/L0nmzgrtZAY9NKexnxfyGVrQ0HETGTv6lhz6KkEV8WOvPacjem+enioYY/1sJtRe
X-Received: by 10.224.160.83 with SMTP id m19mr15796170qax.17.1415404144817;
	Fri, 07 Nov 2014 15:49:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 15:48:44 -0800 (PST)
In-Reply-To: <CAMKF1so1Bv-1EuDHGhLOmQ_XBhm38i-vu=m3fERN4ztgw573pQ@mail.gmail.com>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
	<CAMKF1sqUOM=FrvXkhoEkFpxMd0=GZ4deAoJnKDdCQkhesRuc0g@mail.gmail.com>
	<CAMKF1so1Bv-1EuDHGhLOmQ_XBhm38i-vu=m3fERN4ztgw573pQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 23:48:44 +0000
Message-ID: <CAJTo0LZeqimJ5CX7Fg_3qEDo=-ihyh2pZ+vMOftoYR0MMc2uAw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Moving llvm to oe-core?
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
X-List-Received-Date: Fri, 07 Nov 2014 23:49:09 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aa442a3605074d7545

--047d7bacb2aa442a3605074d7545
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 7 November 2014 15:58, Khem Raj <raj.khem@gmail.com> wrote:

> I have been creating copies of it in meta-clang where I was trying to
> get clang based
> cross compiler working.
>

I've not looked into detail as to how llvm/clang/etc are built, would a
branch importing meta-clang into oe-core be a suitable starting point?  Or
is the llvm recipe in meta-oe more current/usable?

(let's cut to the chase: would you be interested in and able to help merge
LLVM into oe-core?)

Thanks,
Ross

--047d7bacb2aa442a3605074d7545
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hi K=
hem,</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">O=
n 7 November 2014 15:58, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":l4" class=3D"a3s" style=3D=
"overflow:hidden">I have been creating copies of it in meta-clang where I w=
as trying to<br>
get clang based<br>
cross compiler working.</div></blockquote></div><br>I&#39;ve not looked int=
o detail as to how llvm/clang/etc are built, would a branch importing meta-=
clang into oe-core be a suitable starting point?=C2=A0 Or is the llvm recip=
e in meta-oe more current/usable?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">(let&#39;s cut to the chase: would you be inter=
ested in and able to help merge LLVM into oe-core?)</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Thanks,</div><div class=3D"gm=
ail_extra">Ross</div></div>

--047d7bacb2aa442a3605074d7545--
