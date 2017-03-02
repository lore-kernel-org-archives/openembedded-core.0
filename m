Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id D59D077552
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 20:11:51 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id m67so27504419qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 12:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HyPyihsBlKWfopyEpYOExyB1eV+RaJi8NGfw5Z9ggM4=;
	b=xx+JkQGYvK8Zyx0ZgbYAZU1gyhuL6NPrw3plGqh/ArAd7QBihrfyyHE0tlfvANFqic
	9Epjd8DaBs1XJMLX5mHleWCjgAAvv5c5N4DiBWWREpxdkD8/j6HjJZ0ikMjBXA//Sar/
	opTHys1vT4kv+ioSiyRZtLC9CL6LhXIaPDU17CLSdfsPVU6gbJ/uXa9h+NqDUhGnnqtG
	No4vzZnY1BBApzKGh/Za+WTA63WXH8Midx9EMaLkjtFCCajO7WaffXHDtj70FEzI8YGn
	YxqKjg9iL/iMGsYsjNj1J2iroi/cktXONEj3+GJd3OfsUzc2g83KQwrX5wsF//+4Zijr
	hSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HyPyihsBlKWfopyEpYOExyB1eV+RaJi8NGfw5Z9ggM4=;
	b=N6pFVkj0kb8FPW7C+V3UWTcrHE8VuOMvswADPatZiqDZaAg62nJMv/1i+/059PTDz4
	LIO4J87hrWMpYjBt+99OgMtaqqOuKamwS5w6x7E7dOxEBuz8W2ttTey++iwnAKFObLRS
	mk0ocQRx5FqjwutPdE0+525Db1twLl6UvsKE+PSZJMgaiwtegLkWe8kb7op5DVDqFVKB
	pJ+dyRqZJ87691Aqgl/P5VGIclVDl0EcSIpzo0zxm25UW9UnpA80MW1DRKZX0XS86soF
	JX2MyEUmn89VeKksHNQmOvX2jEiBZBM1LN5GQCNf0iJfw+3MhohGgqPEJotTkNc022G0
	oztg==
X-Gm-Message-State: AMke39m4G1leFEUoMY+6ocjEh0HoJbA8VOHHexu6anZF1aRNKuty1KDz69NDc6cydI19Q4JgWutbyRFgFPV2JpQW
X-Received: by 10.55.1.134 with SMTP id u6mr20149809qkg.36.1488485513079; Thu,
	02 Mar 2017 12:11:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Mar 2017 12:11:32 -0800 (PST)
In-Reply-To: <1487752042-19804-45-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
	<1487752042-19804-45-git-send-email-amarnath.valluri@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Mar 2017 20:11:32 +0000
Message-ID: <CAJTo0LYgAGvTa5s1cBigazXo9edrXcF6XNpbx=NmBR=D-zjkSw@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 19/25] mdadm: Avoid using hardocded udev, sbin paths
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
X-List-Received-Date: Thu, 02 Mar 2017 20:11:55 -0000
Content-Type: multipart/alternative; boundary=001a114046c44303090549c50a75

--001a114046c44303090549c50a75
Content-Type: text/plain; charset=UTF-8

On 22 February 2017 at 08:27, Amarnath Valluri <amarnath.valluri@intel.com>
wrote:

> Use appropriate bitbake variables inplace of below hardcoded locations:
>   /sbin -> ${base_sbindir}
>   /lib/udev -> ${nonarch_base_libdir}/udev
>

Something went wrong:

packages/corei7-64-poky-linux/mdadm/mdadm-dbg: PKGSIZE changed from 5000047
to 416785 (-91%)
packages/corei7-64-poky-linux/mdadm/mdadm-ptest: RDEPENDS: removed "mdadm"
packages/corei7-64-poky-linux/mdadm/mdadm: PKGSIZE changed from 889228 to
3524 (-99%)
  * FILELIST: removed "/sbin/mdadm /sbin/mdmon"
packages/corei7-64-poky-linux/mdadm/mdadm: RDEPENDS: removed all items
"glibc (['>= 2.25'])"
packages/corei7-64-poky-linux/mdadm/mdadm: FILELIST: removed "/sbin/mdadm
/sbin/mdmon"

$ bb contents mdadm
mdadm:
/lib/udev/rules.d/63-md-raid-arrays.rules
/lib/udev/rules.d/64-md-raid-assembly.rules

Ross

--001a114046c44303090549c50a75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2017 at 08:27, Amarnath Valluri <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:amarnath.valluri@intel.com" target=3D"_blank">amarnath.valluri@=
intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div class=3D"gmail-">=
Use appropriate bitbake variables inplace of below hardcoded locations:<br>
=C2=A0 /sbin -&gt; ${base_sbindir}<br>
=C2=A0 /lib/udev -&gt; ${nonarch_base_libdir}/udev</div></blockquote></div>=
<br>Something went wrong:</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_extra">packages/corei7-64-poky-linu=
x/mdadm/mdadm-dbg: PKGSIZE changed from 5000047 to 416785 (-91%)</div><div =
class=3D"gmail_extra">packages/corei7-64-poky-linux/mdadm/mdadm-ptest: RDEP=
ENDS: removed &quot;mdadm&quot;</div><div class=3D"gmail_extra">packages/co=
rei7-64-poky-linux/mdadm/mdadm: PKGSIZE changed from 889228 to 3524 (-99%)<=
/div><div class=3D"gmail_extra">=C2=A0 * FILELIST: removed &quot;/sbin/mdad=
m /sbin/mdmon&quot;</div><div class=3D"gmail_extra">packages/corei7-64-poky=
-linux/mdadm/mdadm: RDEPENDS: removed all items &quot;glibc ([&#39;&gt;=3D =
2.25&#39;])&quot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-l=
inux/mdadm/mdadm: FILELIST: removed &quot;/sbin/mdadm /sbin/mdmon&quot;</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div clas=
s=3D"gmail_extra">$ bb contents mdadm</div><div class=3D"gmail_extra">mdadm=
:<br></div><div class=3D"gmail_extra"><span class=3D"gmail-Apple-tab-span" =
style=3D"white-space:pre">	</span>/lib/udev/rules.d/63-md-raid-arrays.rules=
</div><div class=3D"gmail_extra"><span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>/lib/udev/rules.d/64-md-raid-assembly.rules</d=
iv></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div></div>

--001a114046c44303090549c50a75--
