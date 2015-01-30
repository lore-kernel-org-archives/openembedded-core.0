Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 56BA260034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 10:37:12 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id v8so19191781qal.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 02:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iyA3XRWUHfGPoTaqpq9AFT9csvACFZFk+6AxDGTa5+Y=;
	b=XM3rEVVPRL/cg30IVCVwyydYsS8FI1UNVjO/ZlnFGvQa3FBiqxCXytlkx/oPgY+P4/
	V5Q3IGLtGsnDNT/T8ndsZrakVTwjMT1DmNnATv6knC6KC65jO58vMnhJPHdtYcfug3Su
	TnxgmpakrSSDcfQkT83lKqGfEKiJKrA3j1IN2K6Wh9s4U3EXAppx5if/pvGfotSibWqK
	IbKNOxRujAeDgWiyVayP9ahrZTs+y1dqw5IBElrr+hZlY6Bi6Q16QICOPm0sMzGQBO35
	kq8m1REScvLzKb++5d8fISgH6TBVWS3J5zcGHQVtwaE+1y/iUezhYPp0UyyZmURD1+jJ
	kALQ==
X-Gm-Message-State: ALoCoQnvJTV4qF610jC+J61kCG5bxsAjJxlHr6Phf7axcW/AR7pNTQ3w52BwA8Q7X/NPuLdlU56N
X-Received: by 10.224.7.197 with SMTP id e5mr11092359qae.64.1422614233405;
	Fri, 30 Jan 2015 02:37:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 30 Jan 2015 02:36:52 -0800 (PST)
In-Reply-To: <1422610395-2581-1-git-send-email-pengyu.ma@windriver.com>
References: <1422610395-2581-1-git-send-email-pengyu.ma@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 30 Jan 2015 10:36:52 +0000
Message-ID: <CAJTo0Lbf8OJ5R_JSymiYY8=q+xyM-+5fEzmCfwVoPoh7+=cyPQ@mail.gmail.com>
To: Pengyu Ma <pengyu.ma@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 10.4.3
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
X-List-Received-Date: Fri, 30 Jan 2015 10:37:16 -0000
Content-Type: multipart/alternative; boundary=001a11c223f408f0a0050ddc30d3

--001a11c223f408f0a0050ddc30d3
Content-Type: text/plain; charset=UTF-8

Hi,

This results in the following warnings:

WARNING: QA Issue: mesa: configure was passed unrecognised options:
--disable-gallium-egl --disable-gallium-gbm [unknown-configure-option]

Presumably they changed the configure options, so can you verify all of
these please.

Ross

--001a11c223f408f0a0050ddc30d3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">This results in the following war=
nings:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>WARNING: QA Issue: mesa: configure was passed unrecognised options: --disa=
ble-gallium-egl --disable-gallium-gbm [unknown-configure-option]<br></div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Presumably t=
hey changed the configure options, so can you verify all of these please.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a11c223f408f0a0050ddc30d3--
