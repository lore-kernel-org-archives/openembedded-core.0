Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 716FB601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 13:35:57 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id t74so152305538ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2016 06:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g5oPPW5b9DrTYzp5XenKeVQn+150tQm9a6sijlbhGzc=;
	b=rnMXYfy+IWSreSWiuo4zvgE8UOXiwoRwCrAX0b2Jc7JsFmX5ZX87Zva/P5BnoLqyeK
	1byOHcePNiLnM0drocCU1bRNMovNzjhj0jOGdiyENKfaDmMzoqDP71hIHOclRtTut0IF
	b3BKiepurmI68BvTIWyTgvqKKMLvLzlj+GQ7A/cINkYAJH7q492AcUVSLzI7Bw5bHcBG
	N8KuIdo/WkJ246xNHJy9SAzqiiMA4HhdbeFrDdBwEzQesFjcAEnBDSvy5iWEquKnjbX4
	gD8epltM/haS2gxm+h1De/gMfzRUCECNBtir+m5+u9tmH/JlxX8MifJTpmACEsyzIOHm
	0ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g5oPPW5b9DrTYzp5XenKeVQn+150tQm9a6sijlbhGzc=;
	b=hzbl32S1keWxPOhQhQN7xM36+OyZxXvAR/ForWOwHPJht1UgRm3bdYYWsXcAZkNcR/
	p7CcED0q+HEyScqtc+bz/qKMlIv7BHpSwCfWSQURicpt3nF2UxHlbgv/w8Jpuf487ga4
	FiGRIJAX0dB7c2X1l3s5YG6P7fGDo0Ba60Sa0mX2lmZ2j/bUrhwkJz9Qv0NIuOIGaOtl
	v4+qbq3dOebB2+kJSXSsJTVqSxoFgPQvLxWAOXn69MYehJZvpkA+GFkeyrpRQxZjX6MV
	9HcJcsMu4VRcsBio/miGv0We5o1Pb2S7D3k3GZ9wojnhhoXA2OhgGAXEzrq/jpeG+Gdo
	6/jA==
X-Gm-Message-State: ALyK8tJKVh44ognJUbR68LA7kF3juKDqMTzjlTP6tIx04XEDCfzVtFprjEWXf2IYddAvloFu4Nmn4spuennmZGsT
X-Received: by 10.107.135.137 with SMTP id r9mr10120029ioi.133.1467639358398; 
	Mon, 04 Jul 2016 06:35:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Mon, 4 Jul 2016 06:35:39 -0700 (PDT)
In-Reply-To: <CAMKF1sr-kDvBVC7swKrDHCqW+ojvtDNxEifL-91gMazoj7NuEg@mail.gmail.com>
References: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
	<1467637324-16642-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LZUvOTA9X=SE=GrK4PkFvO-F4S556zEUjdSK2yBhZkShA@mail.gmail.com>
	<CAMKF1sr-kDvBVC7swKrDHCqW+ojvtDNxEifL-91gMazoj7NuEg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jul 2016 14:35:39 +0100
Message-ID: <CAJTo0LYdAVqHZ8h1tAMo5HELqL-2SkkOk-iFT9n06s6C7ufytQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libsolv: upgrade to 0.6.22
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
X-List-Received-Date: Mon, 04 Jul 2016 13:35:59 -0000
Content-Type: multipart/alternative; boundary=001a113ec8429dad370536cf6a34

--001a113ec8429dad370536cf6a34
Content-Type: text/plain; charset=UTF-8

On 4 July 2016 at 14:18, Khem Raj <raj.khem@gmail.com> wrote:

> we do not do that for recipes with git fetchers usually. PV is encoded
> as PV+git{SRCPV}
>

For recipes which are tracking releases, it's fairly common - and I feel
clearer - use have the PV in the filename and thus PV instead of spreading
the SHA everywhere for no reason. It's version 0.6.22, nobody cares what
the SHA is.

*If* it was a SHA beyond 0.6.22 then PV+SHA makes perfect sense.

Ross

--001a113ec8429dad370536cf6a34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 July 2016 at 14:18, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":grl" class=3D"a3s aXjCH m1=
55b610313e8dd7f">we do not do that for recipes with git fetchers usually. P=
V is encoded<br>
as PV+git{SRCPV}</div></blockquote></div><br>For recipes which are tracking=
 releases, it&#39;s fairly common - and I feel clearer - use have the PV in=
 the filename and thus PV instead of spreading the SHA everywhere for no re=
ason. It&#39;s version 0.6.22, nobody cares what the SHA is.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">*If* it was a SHA be=
yond 0.6.22 then PV+SHA makes perfect sense.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec8429dad370536cf6a34--
