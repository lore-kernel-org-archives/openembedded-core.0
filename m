Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2C009780B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 13:39:54 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id z62so12657470ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 06:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+iqfaS/8xfwJe3pnfR8+p/RSV72wGXhNhnrbrNCNoMM=;
	b=PK5Ver1Bk3h5nH5m/NbrZGNCsrW7UVIN8oqlTUW9pXGeinCrUvp56QWHkGmiO7LnyL
	IWxVZUt30y6hh0PquSeB5jvAxAHHvAln498HcbXMbIVvSXhBa5EWuPCbq7I3yqXzQ3QM
	NbJWkFwpRUT41Wds8UsW2HyF0EtNVd8B2kI0Mbcqcm6riwCD9cGZjrOZuTTSvo++cLKO
	BwGs+WAKkn1DKp/igM5bOonRijTgy0MegtMD28J1cZ8e8Ytto/zi63uE1vRPwGremKtp
	kSmB6NnN/F6XJXWzdJit0rgrSqk6lFRIZn+xmvHMNmFzvu/BvfXPLdD7EDCkpvQg1KLJ
	+/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+iqfaS/8xfwJe3pnfR8+p/RSV72wGXhNhnrbrNCNoMM=;
	b=I03VE02ToD1up+KfXpy4c3ESduuylqpC0axmu2BelBEIWW0QO/4jK8a4rrdGjPy2Sv
	uImzLmOoGloF+S+BAqXq1y3Rg9UAXhJFctbRC3D/zxh58+7k/zRXkEjpyYQmNnmYLOXA
	hCKMOguZpzf4tIjCerTX+aCUa4r3KeSJ+8SVM1MbXXJ1lRI+kXLtSHmf+eAy5EXujCsJ
	uEPfGz4uY3ZCK0cKD608GowBkLcH+9xm9ASzR2Ljv7X/ZCY93dM9yvYG63Oz5YqY6NEJ
	uQWO1sm9lqDNEDdvFPTx12Mqbr9XpQHmXSy2jZNc/tnpW8iQapV1WlZ8Coz1XEAFrivZ
	vUHw==
X-Gm-Message-State: AIVw112jveb0hCLtwF+Quv6aiy29gxlxyu/6mv1NIkBRlRF1sy1I0H40
	9MzUt5GDgTHxNOCsu7i8ccdWDtmo5jth
X-Received: by 10.107.6.23 with SMTP id 23mr4915386iog.122.1499866796274; Wed,
	12 Jul 2017 06:39:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Wed, 12 Jul 2017 06:39:35 -0700 (PDT)
In-Reply-To: <dcbc00ff-666c-ce9a-9884-42224e2701e8@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<3afb134341c5cfde7c0f72fda35d6d94bad24704.1499854502.git.liezhi.yang@windriver.com>
	<CAJTo0LYUwPxW_0aLGwmwANyNv5sCovXijF-XrMCzTjGSr_V=Nw@mail.gmail.com>
	<dcbc00ff-666c-ce9a-9884-42224e2701e8@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jul 2017 14:39:35 +0100
Message-ID: <CAJTo0LanadueCFtjEZXDrk3-jkv2+Y3kBO6FsSBC-9t-Ey1GWg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>, Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] cryptodev: 1.8 -> 1.9
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
X-List-Received-Date: Wed, 12 Jul 2017 13:39:55 -0000
Content-Type: multipart/alternative; boundary="001a113f8e7e9a4ccb05541ef38d"

--001a113f8e7e9a4ccb05541ef38d
Content-Type: text/plain; charset="UTF-8"

Oh, didn't notice that.  Not sure I want to know why meta-intel has to
patch cryptodev!

CCing Saul for his input.

Ross

On 12 July 2017 at 14:36, Robert Yang <liezhi.yang@windriver.com> wrote:

>
>
> On 07/12/2017 08:32 PM, Burton, Ross wrote:
>
>> ERROR: cryptodev-module-1.9-r0 do_patch: Command Error: 'quilt --quiltrc
>> /data/poky-tmp/master/work/intel_corei7_64-poky-linux/crypto
>> dev-module/1.9-r0/recipe-sysroot-native/etc/quiltrc
>> push' exited with 0  Output:
>> Applying patch 0001-zc-Force-4.10-get_user_pages_remote-API.patch
>> patching file zc.c
>> Hunk #1 FAILED at 67.
>> 1 out of 1 hunk FAILED -- rejects in file zc.c
>> Patch 0001-zc-Force-4.10-get_user_pages_remote-API.patch does not apply
>> (enforce
>> with -f)
>>
>
> This patch is from meta-intel which I didn't build, sorry, I will fix it.
>
> // Robert
>
>
>
>> Ross
>>
>

--001a113f8e7e9a4ccb05541ef38d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh, didn&#39;t notice that.=C2=A0 Not sure I want to know =
why meta-intel has to patch cryptodev!<div><br></div><div>CCing Saul for hi=
s input.</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On 12 July 2017 at 14:36, Robert Yang <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_b=
lank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D""><br>
<br>
On 07/12/2017 08:32 PM, Burton, Ross wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
ERROR: cryptodev-module-1.9-r0 do_patch: Command Error: &#39;quilt --quiltr=
c<br>
/data/poky-tmp/master/work/int<wbr>el_corei7_64-poky-linux/crypto<wbr>dev-m=
odule/1.9-r0/recipe-<wbr>sysroot-native/etc/quiltrc<br>
push&#39; exited with 0=C2=A0 Output:<br>
Applying patch 0001-zc-Force-4.10-get_user_pa<wbr>ges_remote-API.patch<br>
patching file zc.c<br>
Hunk #1 FAILED at 67.<br>
1 out of 1 hunk FAILED -- rejects in file zc.c<br>
Patch 0001-zc-Force-4.10-get_user_pa<wbr>ges_remote-API.patch does not appl=
y (enforce<br>
with -f)<br>
</blockquote>
<br></span>
This patch is from meta-intel which I didn&#39;t build, sorry, I will fix i=
t.<br>
<br>
// Robert<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Ross<br>
</blockquote>
</blockquote></div><br></div>

--001a113f8e7e9a4ccb05541ef38d--
