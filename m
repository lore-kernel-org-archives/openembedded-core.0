Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3E37318D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 19:41:36 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id g62so188409137wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 11:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Rn9yjjQAOoFXlu7VKRhm/j/6f4Cuxrmv+BFxhAM55sM=;
	b=WfPCqFLT1UUL+F3u28x9t3Pmh8abL4+Kp7aM7UIyyUsyVAmIXkuHRycz1z8RhU0OIm
	LMirFLoGkRFyy3D+YITePU7tmxDJr2yAXRuGZer3yQ9kZjZqPoijhG284IN0pRtAqEbm
	Ct7Qeda8NovtssQO/MgdIY6gWYqSXqqmC/1P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Rn9yjjQAOoFXlu7VKRhm/j/6f4Cuxrmv+BFxhAM55sM=;
	b=VpjDtWbMHNjjkVL9z9ZoSNoyBuXcmTQR2vji6sieaQJu94lSggJ+avHHP9Nm1F1HWc
	/VFf4zlWjHDA3DRikg9bJpaRyAB7F0JAHhj9Jy2R9fFMqErpmqAlqrmKGz7DCrMB1YLN
	3r0pKN97vy4yQOpESqHX4mwDcc9Mbg/nqesD97c3FAsG3hm7TVhYg2qqavsHpqBLzlAU
	B2vlmJUcmy0myg8MXNUnuh7IZZ7hWGhfj/4Uunv+3o1h7pkK4sjdxn6J5mTBo3DgGi9G
	fkr8b4ZmbPF6ubxSZ7bDcMJ1HFcbj20vfPu09qs6uefLwDkk9z5SfzCtaHxjflUO5za4
	/q1g==
X-Gm-Message-State: AG10YOSBXpL36t5d1mFu5UWBpBK3/L53FhE0J7CUdSsidUWWv0UQPI5cT0DxdpWLjHNacMRCgTNTgsFaEW77++mm
X-Received: by 10.28.10.7 with SMTP id 7mr6512855wmk.57.1455046896978; Tue, 09
	Feb 2016 11:41:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.206.33 with HTTP; Tue, 9 Feb 2016 11:41:17 -0800 (PST)
In-Reply-To: <CAMKF1srP19D1Vg1Nvg5nbcqGp_xGLw=m8XFRiF6x659ixKZJBg@mail.gmail.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
	<aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
	<b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
	<CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
	<4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
	<CAJTo0LaLWz6=kt2D7B4q_9B5atfBEoTt7Og+_HqBoB98ax+RFA@mail.gmail.com>
	<CAMKF1srP19D1Vg1Nvg5nbcqGp_xGLw=m8XFRiF6x659ixKZJBg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 9 Feb 2016 20:41:17 +0100
Message-ID: <CAP71Wjx4UGYsRTCC+PDWrPMeLP8cO+yayvTS3g9p=VBWvtUQJg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] xserver-xorg: Add PACKAGECONFIG for crypto libraries
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
X-List-Received-Date: Tue, 09 Feb 2016 19:41:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 9, 2016 at 8:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Think of crypto policy point of view

why not. this is probably a good thing. But I don't think we should
block the current patches as they are. If we want to add a
DISTRO_FEATURES the patches we did in mesa and xserver are needed
anyways. Once every possible 'crypto' config are available as
PACKAGECONFIG we simply need to add one line to pick the one we need
based on DISTRO_FEATURE content. So I think we should merge them, and
discuss/plan how to add crypto as a distro policy.

