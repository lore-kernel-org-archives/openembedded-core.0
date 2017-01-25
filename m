Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id DDBC871E10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:01:40 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id l7so24062516qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 08:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HDqGAK6di2g2FEukBLw94vh6cj9zY27wm5l7cvYhtGc=;
	b=eHQsXYptjXYzqoDU7jcO88EyTouESVTyjwW/X96tFvexHDekTqHVweQo8bP2EgKKVi
	42NZG7NPvA/PP1l1/W1ZlWP4eN27bmm4YeaKrEiCDiQYChp/Q9ofKaDoHV+6xEV9jaU1
	c7Qja8VZTSzhsnLRWmPhwk4WaIIpUtLCnvbdeqZXstZBgcFUrLHNJgvbJD74j0MwKhQx
	o390GI9/MAoGrDkR+D9IZvSOD+4kOd3en4M7MHUd9668DpxeujMoYfVsilONHbdKwruM
	LSMC4w1LRD4FI+Fjkk0mAN/QKtMdNPTf0mWQ+vDIm1tbFndl763xLkV60RNzfJm/XikP
	WVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HDqGAK6di2g2FEukBLw94vh6cj9zY27wm5l7cvYhtGc=;
	b=szmfcKne9K604tacd+68wWH+8P36VIq5eyv7HwyfyzZAN81Y8XRakyBeZsCXVSPbgg
	KaYhfRN/yYouCM+tMrgH29tMC9Vh1prUikoz+0w7fe90E8nUTwXSSFvAj0A/d585sHrp
	emNLLZ7ErkcG6xTAlh2T+sWzBPU2aMclA/yLDangDapxHmHQUrDUREtxhls3GJIRHaNq
	YAXp4QyLJG0j18u0CnRGh0rM0M/76BCHvQ/+o2te+7HpIL6PtKA8tySVfDmRvOpqRpuH
	VfPs7Sl6EqJnQh8+PqogGoEGnaBxVfIlfEpNLuTLsY+eN3jqXpUuccPyJFoV5qLpdBMh
	KRWg==
X-Gm-Message-State: AIkVDXL0pPfvfxsD71rajwNrAowybWYuN2d46BpA1xwZdfM5O6eL8StE4ymi5DLC1Bz1YNgbPPoizclhh4bAFmCJ
X-Received: by 10.237.54.1 with SMTP id e1mr33368718qtb.68.1485360100413; Wed,
	25 Jan 2017 08:01:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 25 Jan 2017 08:01:19 -0800 (PST)
In-Reply-To: <e7c31049-618c-9edb-5c3a-d2093fd43d24@phytec.de>
References: <1485356957-6760-1-git-send-email-d.schultz@phytec.de>
	<20170125152332.4466.81544@do.openembedded.org>
	<e7c31049-618c-9edb-5c3a-d2093fd43d24@phytec.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jan 2017 16:01:19 +0000
Message-ID: <CAJTo0Lb1xY0fDwA_2PGaE76hksSTa5QL=8T4yV80zTjO_JnS-g@mail.gmail.com>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGNyeXB0b2RldjogRml4IGNoYW5nZWQgbW0gaW50ZXJmYWNlIGluIEtlcm5lbCA0Ljk=?=
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
X-List-Received-Date: Wed, 25 Jan 2017 16:01:42 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf02636f50546ed5918

--001a1142dcf02636f50546ed5918
Content-Type: text/plain; charset=UTF-8

On 25 January 2017 at 15:38, Daniel Schultz <d.schultz@phytec.de> wrote:

> I have backported this patch and I won't add the signed-off by myself.
>

The patch header should also contain your signed-off-by (so in the future
we know who was responsible for bringing this patch into OE) and an
Upstream-Status tag (Backport in this case).

Ross

--001a1142dcf02636f50546ed5918
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 January 2017 at 15:38, Daniel Schultz <span dir=3D"ltr">&lt;<a href=
=3D"mailto:d.schultz@phytec.de" target=3D"_blank">d.schultz@phytec.de</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_49949269555=
42152972:3mw" class=3D"m_4994926955542152972a3s m_4994926955542152972aXjCH =
m_4994926955542152972m159d647b2fa85b6f">I have backported this patch and I =
won&#39;t add the signed-off by myself.<br></div></blockquote></div><br>The=
 patch header should also contain your signed-off-by (so in the future we k=
now who was responsible for bringing this patch into OE) and an Upstream-St=
atus tag (Backport in this case).</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a1142dcf02636f50546ed5918--
