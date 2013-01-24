Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyLuH-00017t-91
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:27:49 +0100
Received: from mail-pa0-f70.google.com ([209.85.220.70])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 04:12:15 -0800
Received: by mail-pa0-f70.google.com with SMTP id hz11so10885113pad.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 04:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=FS6y9GgdFdBUsbvaiaOD3B6zK1ZN1lFQ7STcvC6VtIM=;
	b=FX07o1Wmyu/RF2TMR+P8MPnnWmCLLGAuz2BsuZDvWKeyQes9zy10wH5PSu+8IxkkXc
	7L2I/U8qJXBeq/4SNApx9vWlw0rkx+a6Ha2j5AJIEb1uxfygGkG+Rk5oUNsXPQTDYV1f
	ui2CwYy0MKE9Pxsc5cZIlr7+Jm1LU3puSabTuR/2BaWws6deSuVsTlTvLREKyq+QOEU5
	IRc9r1ENo7Sc+6a/hA2JBUT96teyEkVe2LbnuRa3x988ohKirLO/DXL2UGutvWR/C09M
	q5aCEUyTc3ySeakswej166N0O3ypC8j1UNhHM6Gy3aDrYCfJTivXKgUq9AK6Efuomc9R
	Bvfw==
X-Received: by 10.66.90.72 with SMTP id bu8mr3984235pab.69.1359029535084;
	Thu, 24 Jan 2013 04:12:15 -0800 (PST)
X-Received: by 10.66.90.72 with SMTP id bu8mr3984215pab.69.1359029534972; Thu,
	24 Jan 2013 04:12:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.253.233 with HTTP; Thu, 24 Jan 2013 04:11:54 -0800 (PST)
In-Reply-To: <510124FE.6040901@intel.com>
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
	<CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
	<510124FE.6040901@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 12:11:54 +0000
Message-ID: <CAJTo0LZFc-daEcuS0gGYsRsL5DfUH3kwkPK49bv+74xTmp30vg@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQlkGLHO15ptz+kLTtr2VhyEAE8xp53P5kCki4WQ6sF49P90s+KvcahnTkJJZp/1eErRImxA9+5m4mbCD8tpccglgNdBLZ256mlJYaq1qD1NhVqQPm0+eLJ7RtTDMd9PFEVroPWT3Ft4wEoL86GvWf2A4KoGZS2Pm2UXXzOwQdWRB1WHLvgq1B42ay44MjLOWFpBgTRS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd: /run directory not created
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 12:27:49 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 12:11, Radu Moisan <radu.moisan@intel.com> wrote:
> This is exactly what I was looking for. /run shouldn't be there, yet somehow
> it is. I was looking into how/where systemd is creating /run but no lead for
> now.

As far as I'm aware systemd will mount a tmpfs on /run itself on
startup, but the directory needs to exist first.

Ross


