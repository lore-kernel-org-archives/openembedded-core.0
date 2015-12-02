Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7BC6014E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 09:20:08 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so106326168igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 01:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DwlzmCuCYjxkJRDMD1TZHYDLYubYTn1m6Aj4D4A9VfE=;
	b=1sUB/Kdmuih9eLy7ZRsiMj0uMIsU6CTVK7v5c2/shjyuvutmBgghO4svTjKlaxUtJ4
	kTf0wuZJO1y94yb9L2mT7lkS14/9TOLeNVgdLFYJmDpkpOjehKVea74Fs5pedbDqHbH1
	5OnhQsnY/WCyuGohoTdQ+1ST1JdaSyeghiFsegdRK+0Mc3Y0p9RpypRKFvALlbbpKvzf
	VwZs3xtBkzQ0i8woHip9JANIU2x223ixhhuvZzUf1sL2/EyCCysLJdMthbmRqqmLbM6P
	0ApdKBwnzSBOSCXuTdUU6Rkw/4ZC+vcsOFiAq6fFoXWYVtCbJJZijflfXmyVqHTTqBjN
	sftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DwlzmCuCYjxkJRDMD1TZHYDLYubYTn1m6Aj4D4A9VfE=;
	b=RNaZWXuQtdQ4fuqbcp3qZyIM64U1bqIUDa/U92oKDfxOpPo067phagRx/rMXqSVzwZ
	ojch2xm9LaxMDs7u2f0kIh/VwIVxEpJcLlMCh9U4c1+103h3yqz42iVmdaTI4bR727CM
	YprDfSU9Jhgq1swWYv28WpI0E6pefoSsn7Z8+oa0DTvQW9eG2P2LcyrwHqkUpGr2+hzl
	igYF9fB6pJmNP5iDmNsHv8x81hn7bxiEEuxElLOsOUYTFHJ2HjReSiX5SpyjaMzljXQ0
	bnPI1eaarO63G5O1u0bVZGQYjEA++KHMp/MmKhwpsJlE+IQUHTUOlKWOaSPRYmyrl3ey
	77dQ==
X-Gm-Message-State: ALoCoQnb6mppovWqyyx73ClcmLqoFMUbRxPWH1xCv/ZyvbW/T0b2jwM4GuRPQl6mkWlcgc+F/kKq
X-Received: by 10.50.60.2 with SMTP id d2mr7529828igr.52.1449048008909; Wed,
	02 Dec 2015 01:20:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 01:19:49 -0800 (PST)
In-Reply-To: <8e3c76d86f19c59b63908de6d7d9c2cc24858858.1449032673.git.hongxu.jia@windriver.com>
References: <cover.1449032673.git.hongxu.jia@windriver.com>
	<8e3c76d86f19c59b63908de6d7d9c2cc24858858.1449032673.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 09:19:49 +0000
Message-ID: <CAJTo0LaqebZA8akpdnAtFU2rJHsFX=1AxxtHWbq3JuEe5vBVyg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python: gcc optimization level 2
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
X-List-Received-Date: Wed, 02 Dec 2015 09:20:10 -0000
Content-Type: multipart/alternative; boundary=047d7b15b117d582890525e6c700

--047d7b15b117d582890525e6c700
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 05:06, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> The qemu didn't support '-march=corei7 -mtune=corei7' and
> gcc optimization level 3 '-O3' very well, in which the
> /usr/lib64/python2.7/test/test_md5.py and
> /usr/lib64/python2.7/test/test_sha.py failed.
>
> So we use gcc optimization level 2 to instead.
>
> YOCTO [# 8747]
>

Has anyone decided if this is a bug in the compiler, or the Python code
making assumptions that don't hold at -O3?

Ross

--047d7b15b117d582890525e6c700
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 05:06, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6gr" cla=
ss=3D"a3s" style=3D"overflow:hidden">The qemu didn&#39;t support &#39;-marc=
h=3Dcorei7 -mtune=3Dcorei7&#39; and<br>
gcc optimization level 3 &#39;-O3&#39; very well, in which the<br>
/usr/lib64/python2.7/test/test_md5.py and<br>
/usr/lib64/python2.7/test/test_sha.py failed.<br>
<br>
So we use gcc optimization level 2 to instead.<br>
<br>
YOCTO [# 8747]</div></blockquote></div><br>Has anyone decided if this is a =
bug in the compiler, or the Python code making assumptions that don&#39;t h=
old at -O3?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--047d7b15b117d582890525e6c700--
