Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8D13E601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 09:49:39 +0000 (UTC)
Received: by igvg19 with SMTP id g19so114251850igv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 01:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RkF8UDbzSeqT7QdNm6yhnmPA1sMJxKPNNf8vBKJM3N8=;
	b=qo+4+K0blgsGNqHOp+kMTUui1GRNHlzis+79RiSoKDNBO3/N4uo02FZJDkTSA0vbWa
	jwro2vqjFWHcsl5qaw1UMrej41eIfRMm59SeSyvTAeOPKOfHRB8Ia8/b4a3TAk/21KjK
	2NDsowqnTAv+ajFX17v/suBJe4sg1l1tt9YUR1fVz+puE6wRp1XecNp0ny8Lh5o3XUXM
	nhouIZmeQgrDmOPdL1kmVnYySBbcqW9MGI0E/Wgl20iyk0lca+t/7EdzUd/V1fETh9FQ
	1aUIVw1JK/vTpbkSWWarlRJzuGNj9wlfie8iF01fwApEYQndwf2tQz991oj3Lz2pGKrD
	2+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RkF8UDbzSeqT7QdNm6yhnmPA1sMJxKPNNf8vBKJM3N8=;
	b=Z8E4Hwk7VhD6Q8rSTbiUP0K2bAacuAz0Z9oSJ29vlbV8GSU4Zx7HWo0ksXIDAN6gXZ
	yT7++L2p/8eLwDPf5QNz0dQ+JdkKzlC8dOqJZYZWlOehmU8ZtmmWnkdebsikM8MW0MMv
	N7kfmNtPN8PgbuSIEoAb1I0oty5NWRle8xxS2LL/QR4Yc0N/hg++H0VGUUfdmxcNtaRc
	y3/t2Jv3F4eCTgMGEgHk4W/x+/4IAM/oUOa9MVvF5G2p/soatZXVZizPPJq5DZjPRmVq
	9MjSq4KE0+rnWAJBzNuS3tDNsDQQdjBMeivo9lgM3pq5tgZOYH8aG4QgOVq78vtabo2o
	5+1A==
X-Gm-Message-State: ALoCoQnEHRxhffvyQ2ptIYGw1JQ+kPVb1jnXlkiiSDJGQX7CLso54cy/PAyXwjSMbkf2aS33kxHK
X-Received: by 10.50.225.1 with SMTP id rg1mr12254373igc.78.1449049780450;
	Wed, 02 Dec 2015 01:49:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 01:49:21 -0800 (PST)
In-Reply-To: <2CF57A644018A745B8FE029C7223E16E12EC04A8@SHSMSX104.ccr.corp.intel.com>
References: <1448618616-30204-1-git-send-email-wu.zheng@intel.com>
	<CAJTo0LYJCYcDtG1AR3WL-kd8T0=E2nWnhMyucGoZxt-r3JX_0w@mail.gmail.com>
	<2CF57A644018A745B8FE029C7223E16E12EC04A8@SHSMSX104.ccr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 09:49:21 +0000
Message-ID: <CAJTo0LZNZS0ox4usqLW7Q-34rnduFHOcX1cNJktukBcbsQHguA@mail.gmail.com>
To: "Zheng, Wu" <wu.zheng@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez5:upgrade bluez5 to 5.36
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
X-List-Received-Date: Wed, 02 Dec 2015 09:49:40 -0000
Content-Type: multipart/alternative; boundary=001a1132f15e6d176a0525e7311a

--001a1132f15e6d176a0525e7311a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 December 2015 at 09:47, Zheng, Wu <wu.zheng@intel.com> wrote:

> From the log, I can=E2=80=99t find that the issue is related with Bluez-5=
.36.
>
>
With the 5.36 upgrade, bluez segfaults on startup on every qemu image that
we test on the autobuilder.  It's probably related to the machines not
having any bluetooth hardware.  It should be easy to fix, just build a qemu
image and run bluez in gdb.

Ross

--001a1132f15e6d176a0525e7311a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 09:47, Zheng, Wu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:wu.zheng@intel.com" target=3D"_blank">wu.zheng@intel.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><p class=3D"MsoNormal"><span lang=
=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Calibri&quot;,sans-s=
erif;color:#1f497d">From the log, I can=E2=80=99t find that the issue is re=
lated with Bluez-5.36.<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>With the 5.36 upgrade, bl=
uez segfaults on startup on every qemu image that we test on the autobuilde=
r.=C2=A0 It&#39;s probably related to the machines not having any bluetooth=
 hardware.=C2=A0 It should be easy to fix, just build a qemu image and run =
bluez in gdb.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a1132f15e6d176a0525e7311a--
