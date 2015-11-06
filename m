Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id A945360124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 10:38:29 +0000 (UTC)
Received: by qkcl124 with SMTP id l124so43392870qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 02:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aAQHeFoOKTOaXHL76efWgFa0PXiO45lOPbRed2CazJc=;
	b=0xyAgWD67V6TnibXB/SYB3uSBrBoDrJTEqi+7FHls95u3g2dTjoDSzWsX1QtsHSSa2
	pOUhxoLkCxH407hnF3dCNbMaOoy8kZia+LyfJijiIm6Hv5xKRDbPhd/2wPjm+HDV5Ihj
	vDTgrWP2xPYMxmR12aTyoA4jnJ1Q+/oYErRVHSRwCszVMkaVt1aflWPu7CKj8fdNYFqA
	ZJW1l5AU+Tr6G/LzhE4ZMXm/kJlsgeSKTTHOE719DRpoV721e7hEc1Dju1yPMzFY5PJq
	Wk5AmI8jwNrsL+3uMO6jUSU21E1cfDqd/sWaHs85vCsyuG2Im0TTsw26sgzmae9sjIAi
	6JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aAQHeFoOKTOaXHL76efWgFa0PXiO45lOPbRed2CazJc=;
	b=c6u83eygVJ3p37eYkD+4QJnwQGFNJnpjOFjq+d+sNoqCPX6AIwc9fHbuS//aBB6sDR
	OnnV7ArwJFU/6vY3cnDD91ggW2xJi1s/wBOAzp5rFuumpuPDgKtzoxeH6H9/JS4egZ5h
	bHNkz/BiQCLw2i3GPwc6k3qAclK0GomjkxpGtcMWJ0vwCaida2HenjLv6gHNheUjBBq8
	T5mFS6dS1Wxv/NZQVMJW1jVPrBYIlM3majhS8OlPScIKvr6fUdelSRkxpVg3V4ZL1OFT
	VolEaGy/rPmP1GwtPvpw3VAokA5Qi3lGdfUwiS53ayYcZGZ1OJ6+ih2Wnubx2slog5XX
	FqFg==
X-Gm-Message-State: ALoCoQmYRz8nYNjE4WG+DjSUjMc3HoZ/NSMn/bzWQWJRvz1N1J4p7RYPtwGdo3bhV7a+8T+VhYNY
X-Received: by 10.55.73.144 with SMTP id w138mr12587062qka.104.1446806309375; 
	Fri, 06 Nov 2015 02:38:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Fri, 6 Nov 2015 02:38:10 -0800 (PST)
In-Reply-To: <6de991e55463cce5bac0bcc3d9af46cbd044b062.1444974811.git.wenzong.fan@windriver.com>
References: <cover.1444974811.git.wenzong.fan@windriver.com>
	<6de991e55463cce5bac0bcc3d9af46cbd044b062.1444974811.git.wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Nov 2015 10:38:10 +0000
Message-ID: <CAJTo0LaeZWRHqL6r5e0qWT9oLehe+Uv5B3t2mYyzG-7TxRwvhg@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1 v2] mdadm: fix CFLAGS and ptest issue
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
X-List-Received-Date: Fri, 06 Nov 2015 10:38:29 -0000
Content-Type: multipart/alternative; boundary=001a114a9f44214a210523dcd8d9

--001a114a9f44214a210523dcd8d9
Content-Type: text/plain; charset=UTF-8

On 16 October 2015 at 06:57, <wenzong.fan@windriver.com> wrote:

> * Also fix ptest build error caused by global CFLAGS:
>
>   raid6check.c: In function 'check_stripes':
>   raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized \
>   in this function [-Werror=maybe-uninitialized]
>

We're now seeing this instead when building the ptest part on poky-lsb
(which turns on more security flags):

raid6check.c: In function 'check_stripes':
raid6check.c:352:2: error: ignoring return value of 'posix_memalign',
declared with attribute warn_unused_result [-Werror=unused-result]
  posix_memalign((void**)&stripe_buf, 4096, raid_disks * chunk_size);
  ^

(http://errors.yoctoproject.org/Errors/Details/21490/)

Ross

--001a114a9f44214a210523dcd8d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 October 2015 at 06:57,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzo=
ng.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div id=3D":2b1" class=3D"" style=3D"overf=
low:hidden">* Also fix ptest build error caused by global CFLAGS:<br>
<br>
=C2=A0 raid6check.c: In function &#39;check_stripes&#39;:<br>
=C2=A0 raid6check.c:315:8: error: &#39;stripe_buf&#39; may be used uninitia=
lized \<br>
=C2=A0 in this function [-Werror=3Dmaybe-uninitialized]</div></blockquote><=
/div><br>We&#39;re now seeing this instead when building the ptest part on =
poky-lsb (which turns on more security flags):</div><br>raid6check.c: In fu=
nction &#39;check_stripes&#39;:<br>raid6check.c:352:2: error: ignoring retu=
rn value of &#39;posix_memalign&#39;, declared with attribute warn_unused_r=
esult [-Werror=3Dunused-result]<br>=C2=A0 posix_memalign((void**)&amp;strip=
e_buf, 4096, raid_disks * chunk_size);<br>=C2=A0 ^<div><br></div><div>(<a h=
ref=3D"http://errors.yoctoproject.org/Errors/Details/21490/">http://errors.=
yoctoproject.org/Errors/Details/21490/</a>)</div><div><br></div><div>Ross</=
div></div>

--001a114a9f44214a210523dcd8d9--
