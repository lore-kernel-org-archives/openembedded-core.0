Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DCA0E783F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 23:37:41 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b189so2233649wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 16:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vqtt/jQmO2aWB2SRb4GeDSHLm1DWuaiBGxyTSxmSR+A=;
	b=F5Du8ExLr+xKoRY4bLUk2Vwz79HfLyu7n78FBXSMzOSoLeg4HfdZMVrPUMe5k3Bjjr
	Wgla294hgRbRqImSmb3JZUoRNCHs9TJPn1GXzyiUYBmrfoRiLAWii8q7JZzIx131/sxX
	yVI1ZkvcQQYned3kMeSmAjoszf0c4GeiRNKPQx6/P5RBIyjMtavodBNM2F5OZLpcWEJ7
	8bc6s0QQ26iV14kJCIbbBQCJJ1N1g1Hl++w8P0dPBPYjncU8SG15WCacXSHasz79t/0N
	2uvNqdmp72P5L1Fx9bvlmTPU4O0nYm9BFXS1sWvmGQ8P3Ynx0+wDmfK4aeE4/fZ4y7+W
	hb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vqtt/jQmO2aWB2SRb4GeDSHLm1DWuaiBGxyTSxmSR+A=;
	b=oQweO+J9++a5Ur1rhTfPnvdDHCswZ92vJPLpOkBYBaJTCmYbaYUUghfuoLhOglavFn
	wqR91cFmyJ0XoAqJ9iA/XGWMKHEf5uCh7SJK7iDvqBkDZ2Sv+pg0FtQZF50VmEI37gOz
	JpYHyozX3JEJAFVwnNHYt5uo6orgNWXtcLNud0BL4WYub1Ypr8CauOjFVmSf8kIshFxt
	Y12Z+9hf0kYcGrKSz0jPnDkx0IVPIbpK5gkN+XbnG7n5nyTYz4w+Yw4m4Mjfb3Z1HbuJ
	IGUSR9OSEv6OxSDc+N+Ztj3Zi9eHnEiYHTVpHlyyLfItW5CMOPmYI0iQJ/Coj+uyfq6i
	mwkA==
X-Gm-Message-State: AHYfb5h5Ff5ekKLftU3AjeLoiZxB1X5QCMeflwB4f8KgNNkjvJo8HPM8
	c1Dz7S6s9C/Hg3a6eBNNkZvC10SbvA==
X-Received: by 10.28.232.71 with SMTP id f68mr25615wmh.100.1503704262551; Fri,
	25 Aug 2017 16:37:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Fri, 25 Aug 2017 16:37:42 -0700 (PDT)
In-Reply-To: <CAMKF1sos=AR9916RZgoDMjNYTrOyo8uka6cKfPB2wLujjg3n5Q@mail.gmail.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
	<17938e56-c1d0-5316-0263-b954006f9015@ge.com>
	<CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
	<1a320d13-7d4a-7412-5377-e64a728afdfc@windriver.com>
	<CA+chaQcvg_rktq4iOazbzJzWGa6m6EdDA=RM-x8yg=4_aMtqyg@mail.gmail.com>
	<CAMKF1sos=AR9916RZgoDMjNYTrOyo8uka6cKfPB2wLujjg3n5Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 25 Aug 2017 16:37:42 -0700
Message-ID: <CAJ86T=Xrtt5xn+DKO1=aC76cWDgMmpqmXbaArSjemU2rC14-dA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Fri, 25 Aug 2017 23:37:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2017 at 3:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> OE-core minimal kernel has been bumped to 4.4
> so at this point I think its fine to remove it since there
> is no reliable way for OE-Core to test out validity of
> this patch

If that's the official policy then let's bump OLDEST_KERNEL and make
the point clear to everyone.

