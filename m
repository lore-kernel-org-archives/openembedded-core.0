Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3007DE5E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 11:55:00 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m186so3443534itd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2KVeMXDyZDcLRN9VPfxP8P3DSaHU2zXbhHzMUNvSuKQ=;
	b=HR78AkvUGjBGBJZ0No9u/Szgr5RH2iuSwIOpD45v1Omdamg1KXU5gkMXdi5G4O42Yh
	CUlJnwzNyXe256OpuBw+S1e+tg915kTRza6JtYzI5W7Sxv6GOVaAa8eMFwoPLw6/Nghr
	8DCcYthi6YDzbOcwNeF8HqF/m1Vc1clwjpAJescWjlrIbzU/DAopfs8YImx705inJFKO
	4CNZTVgWMK4B21V8J3iakUAExuMbyTXajovwwoEK0zMgKsCx3TkWRqoDpwr0vb1vnJu9
	QK+vx+GgHjIMRTjUE+w4yydh+eQmnYH0nBXIO7WfmjdnCqlX8Lyn++HQzJW10L19HbN5
	PfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2KVeMXDyZDcLRN9VPfxP8P3DSaHU2zXbhHzMUNvSuKQ=;
	b=tejCVjph0E2OztkVI+lhhXvcChYo/fPAdyKofa/Ti6sdMGdheJuL9tnDkKwZugPaEu
	W84y04Fr3sPvZb7vBioTslbDfnN7Og/PbJyiqz6H22z7DS+Sc53h7camJpbVvFq+igxu
	41lPhiLm3s0TbCV0AX8sp6YCit/vHloygBhnMmKFqNV3f2FiYfkoyVp/SiDrFLui2z4Y
	P0qt2RxYMc1PUOsMzWCPGej4k8xnaS/7hv+jZGd5KM7PD6pn02jT8VEtfhsK3w5kBIiZ
	lwr07saPv/JtMfOMIZPX0o8VSUUfk4vY5Ii/6riRWLtJuY5ooD4EVs7b9xs3N9Rr/j+K
	bNBA==
X-Gm-Message-State: APjAAAUzFGB+l7J5m3a4AkOlOyqzE0eb37oN2+dH27FolmRTcEj6o1EF
	grPELFpLnzUH0X/6UU0+d7fj02tqHjRjG5D21+ma9pWr
X-Google-Smtp-Source: APXvYqzB2tkQbe1XHTupfTAfdOYu84lMr8yfadYgk2IrbhJ9q1bjJs5hOflb5fCz+MCd5w/cB4Lx+OpMmbEAitIS1Uw=
X-Received: by 2002:a24:4cd2:: with SMTP id a201mr2958634itb.26.1557316501886; 
	Wed, 08 May 2019 04:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <5CD13414.9060408@windriver.com>
	<20190508030539.448075-1-mingli.yu@windriver.com>
In-Reply-To: <20190508030539.448075-1-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 May 2019 12:54:51 +0100
Message-ID: <CAJTo0LbWzug_9N5eZwaaWNX3w6wRfOCNx379DYkpODf=t71KbA@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] glib-2.0: fix ptest failures
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
X-List-Received-Date: Wed, 08 May 2019 11:55:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2019 at 04:06, <mingli.yu@windriver.com> wrote:
> * Increase the timeout to 15 minutes as the default
>   timeout which is 5 minutes is not enough to fix below error:
>   | Executing: glib/actions.test
>   | Test timed out after 300 seconds
>   | cleaning up pid 13050
>   | FAIL: glib/actions.test (Child process killed by signal 9)

My Debian machine runs that test in 20 seconds.

Maybe we're missing dependencies to get a working session dbus up?

Ross

