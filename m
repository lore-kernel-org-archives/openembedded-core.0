Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8C26265D19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 23:47:35 +0000 (UTC)
Received: by qcblr10 with SMTP id lr10so1358259qcb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 16:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fqECU/+k03LWdGMh8l9rk3e57u2omE2aYveVJWMF0yw=;
	b=dLHmk7cc0WmqgMPYbR8b1ieegByYOYxYTBgBHzkX2lWLI49NC168a/lA04hAVJCaTc
	VOpNlFw8xlTENR7F5UGDAhoVWkcvrghCP5r5fUo6pPiQX2TJeSqdVP0AwIpNQK7inRei
	3OooK9rcVJoUiQK9vphszCw0H2asTh4+nzTJrufT4Hw/SfYVXg2RcdxCfbPp3pA4oVlt
	vrXT52nm8UbzHYCZ2xRRKauZkEyvKvAtj/is004Lt/y3xjk6z+Qi5GZVerdz+fOzkY4W
	Tf13i7/QPXV0I57EHJ4FRAAjenRoN+Yi5YEpi4CD/LCT5Iy9QHPdB5kac4hOUJ94EjEk
	ebeQ==
X-Gm-Message-State: ALoCoQk/LMaZScc/WKE/+Iiep3pml6j2y5g+MSqpYVs3Ieab/L3/c9C+pIDpV4pOfH+HdCv4YAxu
X-Received: by 10.55.40.18 with SMTP id o18mr12275394qkh.58.1432252056159;
	Thu, 21 May 2015 16:47:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 21 May 2015 16:47:15 -0700 (PDT)
In-Reply-To: <ba1bfb4332910bd53dd08bfa81e8c240dbc1e617.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
	<ba1bfb4332910bd53dd08bfa81e8c240dbc1e617.1432199284.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 00:47:15 +0100
Message-ID: <CAJTo0Lb+0izLpS5TOevHAa0QtzxnKzz60uzEGPfobp68v3t8Qw@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] python3-distribute: Upgrade to python3-setuptools 15.2
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
X-List-Received-Date: Thu, 21 May 2015 23:47:39 -0000
Content-Type: multipart/alternative; boundary=001a11440fb80953990516a02b98

--001a11440fb80953990516a02b98
Content-Type: text/plain; charset=UTF-8

On 21 May 2015 at 10:15, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> python3-distribute was merged back to python3-setuptools in 2013,
> and it is no longer being maintained, this upgrade also provides
> functionality that will be needed for python3-pip.
>

ERROR: The recipe python3-setuptools is trying to install files into a
shared area when those files already exist. Those files and their manifest
location are:

 /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/site.py
 Matched in manifest-intel-corei7-64-python3-distribute.populate_sysroot
 /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/setuptools.pth
 Matched in manifest-intel-corei7-64-python3-distribute.populate_sysroot
 /data/poky-master/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/__pycache__/site.cpython-34.pyc
 Matched in manifest-intel-corei7-64-python3-distribute.populate_sysroot

Urgh, this again.  We either live with this and tell people to delete their
tmp/, or bump the tmp ABI and provide a migration path.  Or improve bitbake
to handle files moving between recipes in the sysroot and doing the right
thing...

Ross

--001a11440fb80953990516a02b98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 May 2015 at 10:15, Alejandro Hernandez <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro=
.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div i=
d=3D":22y" class=3D"" style=3D"overflow:hidden">python3-distribute was merg=
ed back to python3-setuptools in 2013,<br>
and it is no longer being maintained, this upgrade also provides<br>
functionality that will be needed for python3-<span class=3D"">pip</span>.<=
/div></blockquote></div><br><div class=3D"gmail_extra">ERROR: The recipe py=
thon3-setuptools is trying to install files into a shared area when those f=
iles already exist. Those files and their manifest location are:</div><div =
class=3D"gmail_extra">=C2=A0 =C2=A0/data/poky-master/tmp/sysroots/intel-cor=
ei7-64/usr/lib/python3.4/site-packages/site.py</div><div class=3D"gmail_ext=
ra">=C2=A0Matched in manifest-intel-corei7-64-python3-distribute.populate_s=
ysroot</div><div class=3D"gmail_extra">=C2=A0/data/poky-master/tmp/sysroots=
/intel-corei7-64/usr/lib/python3.4/site-packages/setuptools.pth</div><div c=
lass=3D"gmail_extra">=C2=A0Matched in manifest-intel-corei7-64-python3-dist=
ribute.populate_sysroot</div><div class=3D"gmail_extra">=C2=A0/data/poky-ma=
ster/tmp/sysroots/intel-corei7-64/usr/lib/python3.4/site-packages/__pycache=
__/site.cpython-34.pyc</div><div class=3D"gmail_extra">=C2=A0Matched in man=
ifest-intel-corei7-64-python3-distribute.populate_sysroot</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Urgh, this again.=C2=
=A0 We either live with this and tell people to delete their tmp/, or bump =
the tmp ABI and provide a migration path.=C2=A0 Or improve bitbake to handl=
e files moving between recipes in the sysroot and doing the right thing...<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></d=
iv></div></div>

--001a11440fb80953990516a02b98--
