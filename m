Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id BDB8571AD8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 11:14:11 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id d10so111094305qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u1Z2zU/fD4K90wStZ+sdoi/+BzycvnnAKbOxNhSW0F0=;
	b=Fbwl40mYuzocFP49zUc/M4sfl27sMA8WGkJA2mSbyAt5GETU2Zu0Y3dPFXn2Th/WhO
	+ANTazPkQ1aONUmCb1s175Q7J7QAiVVZNB8GZTF+ewXlG3eestB9+yHR5719Q7nrsi/B
	+f4iO3Unw9DVuM4FQrsj2vF8dxE+NIVJa1V6taG4fuIK2/zlA2FBkANVUGa0R98KJg1s
	zROGIHx2Rqf3AfuZ6VQLSP+3MbF0L7FQLiTijz3Ep93ZE+2pmX2wn+JlNTndOtZSbva5
	hutN5JrUxstNUV19iDs2xRMCH+dFV6lWrhK780OyQi4yTIPy9+JLDMZadQ5dNvGt2fs1
	Yhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u1Z2zU/fD4K90wStZ+sdoi/+BzycvnnAKbOxNhSW0F0=;
	b=lcu9fYWf9FXCRKlCLMx1K5Ush1rBHNrdkDDb0pdbPkTMoHhJbUb1fEBDKgrk7V+dvz
	T3X0pAEtF1CbC3/ZQFRfMNPdT509uuTlTX36PYvkTvuWaKwBHI/79RqXtTddMuos5T2p
	/soykeY/P0eO73T8ra81y+1o6vgtJqchrHqMgGomZfPUjEqbQHNeAaeXGwn0sjBqjL7m
	uAkCBNQuQABXZMnw5BS2UzZzTL85ci7/QJlEHDGxL6jg22pjlWDqPNHEWH0tVYZ4D/pa
	/UJfawRKlvHWpkLfcZDh2vE0Ny0JsGgqPzSbjEmAcHfXa+0l3xaq3IYwRa6yaaqX9Egy
	ZrxA==
X-Gm-Message-State: AFeK/H2Yaj8hLrZbIzjanuaXHT/Rj3H8f1tYt4EmQYqdfxDdWfQ6gHrEALx8chb9t8ejjcGP7IE3ec9kBeLEj6Gx
X-Received: by 10.55.119.134 with SMTP id s128mr14184034qkc.244.1491218052503; 
	Mon, 03 Apr 2017 04:14:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 3 Apr 2017 04:13:52 -0700 (PDT)
In-Reply-To: <CF0C948DE8E2634BB64BF489FF9EF7E7CB120C@PGSMSX105.gar.corp.intel.com>
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
	<1491187907-5752-5-git-send-email-yin.thong.choong@intel.com>
	<CAHiDW_HmcNpGPrmf+oDiKaU8EHS=RoXYZW3XkzPKuZKLFmNauw@mail.gmail.com>
	<CF0C948DE8E2634BB64BF489FF9EF7E7CB114D@PGSMSX105.gar.corp.intel.com>
	<CAHiDW_Ee=0nyBAsHkagd0hfS0orWBDu9ahh4k=2uQHR0tet2Fg@mail.gmail.com>
	<CAJTo0Lb6o=fFerSorzQqJpRtMNB6z1L5ZDqE5AzTE6gCpWNmSA@mail.gmail.com>
	<CF0C948DE8E2634BB64BF489FF9EF7E7CB120C@PGSMSX105.gar.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Apr 2017 12:13:52 +0100
Message-ID: <CAJTo0LZRFsfO7a4Rvp72MwwSQ7Lc3aC+TNDEK2_hm0WaJhtYsg@mail.gmail.com>
To: "Choong, Yin Thong" <yin.thong.choong@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] logrotate: replace fedorahosted.org SRC_URI with yoctoproject.org source
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
X-List-Received-Date: Mon, 03 Apr 2017 11:14:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c05cbd04d7104054c41427d

--94eb2c05cbd04d7104054c41427d
Content-Type: text/plain; charset=UTF-8

On 3 April 2017 at 12:00, Choong, Yin Thong <yin.thong.choong@intel.com>
wrote:

> https://downloads.yoctoproject.org/mirror/sources/logrotate-3.9.1.tar.gz
>
> https://github.com/logrotate/logrotate/archive/r3-9-1.tar.gz
>
>
Annoyingly the /archive/ links on github are generated on demand by 'git
archive' so only contain the exact contents of the git archive and will not
be identical to the tarballs.

As the maintainer has been uploading generated tarballs for new releases
(3.9.2, etc) it's probably work asking him if he'd be willing to upload the
older tarballs too.

Ross

--94eb2c05cbd04d7104054c41427d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 April 2017 at 12:00, Choong, Yin Thong <span dir=3D"ltr">&lt;<a href=
=3D"mailto:yin.thong.choong@intel.com" target=3D"_blank">yin.thong.choong@i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=
=3D"MsoNormal"><a href=3D"https://downloads.yoctoproject.org/mirror/sources=
/logrotate-3.9.1.tar.gz" target=3D"_blank"><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif">https://downloads.yoctoproject<=
wbr>.org/mirror/sources/logrotate-<wbr>3.9.1.tar.gz</span></a><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f49=
7d"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/logrotate/logrotate/ar=
chive/r3-9-1.tar.gz" target=3D"_blank"><span style=3D"font-size:11.0pt;font=
-family:&quot;Calibri&quot;,sans-serif">https://github.com/logrotate/l<wbr>=
ogrotate/archive/r3-9-1.tar.gz</span></a><span style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"></p></blockquote></div><br></div><div class=3D"gmail=
_extra">Annoyingly the /archive/ links on github are generated on demand by=
 &#39;git archive&#39; so only contain the exact contents of the git archiv=
e and will not be identical to the tarballs.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">As the maintainer has been uploading=
 generated tarballs for new releases (3.9.2, etc) it&#39;s probably work as=
king him if he&#39;d be willing to upload the older tarballs too.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--94eb2c05cbd04d7104054c41427d--
