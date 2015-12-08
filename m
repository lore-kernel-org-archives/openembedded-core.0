Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id BAD2960110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 21:13:53 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so104604535igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 13:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=K0JBZG+J7GqzMR8h082XD9D+yrleLqvVWZH5iOlQMdc=;
	b=o5uzMq+B84GjLvPjgB8mSL0/t67gPjE0Eb4YLLHUmWaCzkCrC53SCs0rrj/CvUdzWZ
	xV3NjFux7konZvZRKVgHUx02hlWiJL8BPSDFGejihH/k/vHbI0y435pjnHBhyRE3Tl9G
	zmO7fd/RlaODmqszcc9+hiSaH/bnMMnUrkCToCmIQYftLZNI3xdTh5iOoocfzh6mo2Js
	9uvpqIJ3n8yR58r/x/ShsAcHg2oiDeLlla3PhojsGypY15zL+Wm/XY99hhSDFC13xprp
	goSc89HF1LhB/b9hlKRe7JLz2Bxe+5joFXH+vIXfn5vBJ08sOmKA3RhDfRDxPxYM6AVN
	k2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K0JBZG+J7GqzMR8h082XD9D+yrleLqvVWZH5iOlQMdc=;
	b=JUySco6zVhwylMgbU77Ob+RYxY06Gom8Ap16gUKvF4kiFSJ+Z9sf3mISA4ZjH5Scfd
	1uYyAdfoP7ulwS2CnSSmwbGlBJdugozsxsHatwBV6D18jdiCnYfkINTOb3E0WK95giHR
	eYTUBIAO+UctYmzthQnfYmzd5vbxZRE2ASEJCR+lfX0hbzMLfnZmVOI5a4LLnZmRi8sM
	TgEZftpmh/VhKvx13kTvT7UWQs50DbAMlomLfSNcaC8uVCaq6MyYzgZuBc0ty3TCS8iy
	eGUXdXCrShhasSrDz1rJBKxTKLQ4jo6mEF7JK4orUM9PQjiROXLJENKknabwxWEXPhAi
	j2LQ==
X-Gm-Message-State: ALoCoQlOYWUtM/iPdXjfnMcd5PjHH/7n3jt9jxeX8YyIevomWqRrKS00PWMhXfMBx6t3UpNkn3ptlKcLbpXtLhACuoOaZbZ46viaUqk9YlFK0F+FyyJ/SF4=
X-Received: by 10.50.126.8 with SMTP id mu8mr5851636igb.52.1449609233777; Tue,
	08 Dec 2015 13:13:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 8 Dec 2015 13:13:34 -0800 (PST)
In-Reply-To: <CAJ86T=XJqne2HOGpWo346qncmGaXwkjVVU8RZmxMok4vg7e+kg@mail.gmail.com>
References: <1446813421.15270.168.camel@linuxfoundation.org>
	<CAJ86T=XJqne2HOGpWo346qncmGaXwkjVVU8RZmxMok4vg7e+kg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Dec 2015 21:13:34 +0000
Message-ID: <CAJTo0LZFdg0AqLD_dF5HOreNiQRzVVS5eQtRmUTViCjz2N=6xg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base: Improve handling of switching virtual/x providers
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
X-List-Received-Date: Tue, 08 Dec 2015 21:13:54 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf715f13052669735a

--047d7b1635bf715f13052669735a
Content-Type: text/plain; charset=UTF-8

On 8 December 2015 at 18:58, Andre McCurdy <armccurdy@gmail.com> wrote:

> This change seems to cause problems for musl libc builds (I'm using
> today's oe-core master and Khem's meta-musl layer).
>
>   ERROR: Nothing RPROVIDES 'nativesdk-glibc' (but
> /home/andre/rdk/rdk-master-musl/openembedded-core/meta/recipes-core/meta/
> uninative-tarball.bb
> RDEPENDS on or otherwise requires it)
>   ERROR: nativesdk-glibc was skipped:
> PREFERRED_PROVIDER_virtual/nativesdk-x86_64-rdksdk-linux-libc-for-gcc
> set to nativesdk-musl, not nativesdk-glibc
>   ERROR: Required build target 'rdk-image-wpe' has no buildable providers.
>   Missing or unbuildable dependency chain was: ['rdk-image-wpe',
> 'uninative-tarball', 'nativesdk-glibc']
>
> Reverting this one commit (oe-core 9a3b992) gets the builds working again.
>

It's breaking universe fetch too:

ERROR: Nothing PROVIDES 'linux-yocto-rt' (but
/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-rt/images/
core-image-rt-sdk.bb,
/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-rt/images/
core-image-rt.bb DEPENDS on or otherwise requires it)
ERROR: linux-yocto-rt was skipped: PREFERRED_PROVIDER_virtual/kernel set to
linux-yocto, not linux-yocto-rt
ERROR: linux-yocto-rt was skipped: PREFERRED_PROVIDER_virtual/kernel set to
linux-yocto, not linux-yocto-rt
ERROR: Nothing RPROVIDES 'core-image-rt-sdk'
ERROR: No eligible RPROVIDERs exist for 'core-image-rt-sdk'

Ross

--047d7b1635bf715f13052669735a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 December 2015 at 18:58, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div id=3D":2uq" class=3D"" style=3D"over=
flow:hidden">This change seems to cause problems for musl libc builds (I&#3=
9;m using<br>
today&#39;s oe-core master and Khem&#39;s meta-musl layer).<br>
<br>
=C2=A0 ERROR: Nothing RPROVIDES &#39;nativesdk-glibc&#39; (but<br>
/home/andre/rdk/rdk-master-musl/openembedded-core/meta/recipes-core/meta/<a=
 href=3D"http://uninative-tarball.bb" rel=3D"noreferrer" target=3D"_blank">=
uninative-tarball.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
=C2=A0 ERROR: nativesdk-glibc was skipped:<br>
PREFERRED_PROVIDER_virtual/nativesdk-x86_64-rdksdk-linux-libc-for-gcc<br>
set to nativesdk-musl, not nativesdk-glibc<br>
=C2=A0 ERROR: Required build target &#39;rdk-image-wpe&#39; has no buildabl=
e providers.<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;rdk-image-wpe&#39=
;,<br>
&#39;uninative-tarball&#39;, &#39;nativesdk-glibc&#39;]<br>
<br>
Reverting this one commit (oe-core 9a3b992) gets the builds working again.<=
/div></blockquote></div><br>It&#39;s breaking universe fetch too:</div><div=
 class=3D"gmail_extra"><br>ERROR: Nothing PROVIDES &#39;linux-yocto-rt&#39;=
 (but /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/=
meta/recipes-rt/images/<a href=3D"http://core-image-rt-sdk.bb">core-image-r=
t-sdk.bb</a>, /home/pokybuild/yocto-autobuilder/yocto-worker/build-applianc=
e/build/meta/recipes-rt/images/<a href=3D"http://core-image-rt.bb">core-ima=
ge-rt.bb</a> DEPENDS on or otherwise requires it)<br>ERROR: linux-yocto-rt =
was skipped: PREFERRED_PROVIDER_virtual/kernel set to linux-yocto, not linu=
x-yocto-rt<br>ERROR: linux-yocto-rt was skipped: PREFERRED_PROVIDER_virtual=
/kernel set to linux-yocto, not linux-yocto-rt<br>ERROR: Nothing RPROVIDES =
&#39;core-image-rt-sdk&#39;<br>ERROR: No eligible RPROVIDERs exist for &#39=
;core-image-rt-sdk&#39;</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--047d7b1635bf715f13052669735a--
