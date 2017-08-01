Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3E04A782B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 19:06:26 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id m88so11886533iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5s1zaUGZqgOVBKByHF5IW0avLHcnfQY4dQap6x9dgxM=;
	b=LyIms4k0rGvY39MDCjMyHtVDSZH7UZFbDkjY1QUHBXrzqMwbZc9AlRzEvQ244c8VXC
	7BSt4lnOAZzCbmDPbqancK7aTF2Q0J6M6zrwQYMrC5GQOGwAbgxXsF4YfyjbRf8qmn8U
	+KP4FWxZbG4WT1Tqs4hwtLjGcjg1LYQDtlVPA/w3BumDzs99u39VTrliDIzd5rsgWgZD
	QFRjZ481LBM8rZhHXqIw+7sViTKzWwN1rR6eZc6iodN0Jb/qUZz9Nflrc0NGd3h+Ggnd
	fnANnKk1JX+sfv4HkEIRQ44o6DPOxHnYLdGVPyulaMxH0pi0SYxInxhArO1bCKn7v+Lq
	nwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5s1zaUGZqgOVBKByHF5IW0avLHcnfQY4dQap6x9dgxM=;
	b=AWEMI/o1PMKXWNJITgOzU2PlWDisfX14ktmfAai4vGJoRBq2hxzTKMKB60rUYf3ftc
	w38jt2MxQdZ1bcuhYkqS4et5MqhQ1PyYJ2mozpF/UkglY3JW791xotsLGOcpwDD6Phlp
	mGmkewgxuJntEWHagePK3LbZQtGMaWBszh1HYMCbkdgB8LPCMTZfA8WYXiBoxfDWyLWu
	Xf0pBXv9vO6Rd0FlYsa5jzE2FSSjrIXxJch5rjkyRXGBCUkLOpc91GC1H3M3UHj1Glo6
	WSAHZRWgTnmcfs3fr1rqOdrCfIniLUpupG1CFpgW2AF1p0/OVEh6wugy8I3qKuajIEJ1
	leCA==
X-Gm-Message-State: AIVw112oAyks4R37gc+07WKMVbN0E7sZR2VDdImCkyufymBLCV4G/gFN
	x/sHvBqN8Fu91vtiVbg+Y2ANHrGYy5wZ
X-Received: by 10.107.205.72 with SMTP id d69mr24176094iog.224.1501614388355; 
	Tue, 01 Aug 2017 12:06:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 1 Aug 2017 12:06:07 -0700 (PDT)
In-Reply-To: <20170801005647.2162-1-timothy.t.orling@linux.intel.com>
References: <20170801005647.2162-1-timothy.t.orling@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Aug 2017 20:06:07 +0100
Message-ID: <CAJTo0LZq5JZAAQwhbH+kXp1U68gKqZZGWM-tGiVpftVqvj=G0Q@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] powertop: update to v2.9
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
X-List-Received-Date: Tue, 01 Aug 2017 19:06:27 -0000
Content-Type: multipart/alternative; boundary="94eb2c189bae353dce0555b5d803"

--94eb2c189bae353dce0555b5d803
Content-Type: text/plain; charset="UTF-8"

> +S = "${WORKDIR}/${PN}-v${PV}"

ERROR: lib32-powertop-2.9-r0 do_populate_lic: QA Issue: lib32-powertop:
LIC_FILES_CHKSUM points to an invalid file:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-powertop/2.9-r0/lib32-powertop-v2.9/COPYING
[license-checksum]

BPN, not PN.

Ross

--94eb2c189bae353dce0555b5d803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; +S =3D &quot;${WORKDIR}/${PN}-v${PV}&quot;<br><br>ERR=
OR: lib32-powertop-2.9-r0 do_populate_lic: QA Issue: lib32-powertop: LIC_FI=
LES_CHKSUM points to an invalid file: /home/pokybuild/yocto-autobuilder/yoc=
to-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-po=
wertop/2.9-r0/lib32-powertop-v2.9/COPYING [license-checksum]<br><div><br></=
div><div>BPN, not PN.</div><div><br></div><div>Ross</div></div>

--94eb2c189bae353dce0555b5d803--
