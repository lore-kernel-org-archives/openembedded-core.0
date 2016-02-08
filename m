Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id EF258731A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 23:20:18 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id mw1so594214igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 15:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=Ar3AHETNdfqq1LcVzlYZVq0NILdTVnh/QdaBAtekM5I=;
	b=GDwhbqgFu1CKr4fsm5qDl9tgso+Rp6l22/BL1Kix8YqBMsnRQzXdi5ViiFuottail1
	KSllfCoOrVZKGbjNfAL4TCDChnlKXcu8PrKLA4Lkfo/1F0YMMlzHOqCaAsplx9p/q1Nb
	7J2k4Sm8fxfsVzo/C7uGrXy2oujvehkcUZLMkxg68tbgEoe4pL+Xm1J1d1CQZzgxo6Mv
	L3yIYeoHl1D2VsG8baKuaXG+PTOMiHefD89KPogtMlU6qTxY42od8uPSMG4DJJtDq56M
	NxPhcTPwdtsACBHOPvIwVfUE+wLFMEGJnyt7C70d/CoTLnQRB+0iL9W6zTMc3ghVCk7+
	mZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=Ar3AHETNdfqq1LcVzlYZVq0NILdTVnh/QdaBAtekM5I=;
	b=MRMHX788ORRNs8mcjsvOERWU9dPtHHiHH34dsbr0eWDPt80kzTKxhiOrxjMsHaKJP8
	YxENPxSnvd36viUYnvzrGSGhGBOS0VZJOjVHH1e8y1FdV8PzOcDETvR9EX5UVkAUz9fr
	/KK5LYnPGkaSVtf6PEU/BFcy0GZavsH3/Pr+3KmfcHrp6T7OsUaIUmHl5J/gYCHt4EBQ
	CCUssywlzZ0P69M5461k3k9d6HHBP7LI9P+yO5wP2BopEZ6XXkrrhc4ZUIl0bQrBylGm
	MS/lCdWdg01mEBRuSubQJx5TqkI9mr9ms1DbL7F8ZO/qoeMXoEiFMuw5+9X7SWKlT2bQ
	jvGA==
X-Gm-Message-State: AG10YOTBnwGSRQfHAtiaCVIVHA9zEHhww1Zm4lZyM647khxXWm6argEDi96TsKgrhHdWyQ==
X-Received: by 10.50.155.40 with SMTP id vt8mr1388424igb.56.1454973618980;
	Mon, 08 Feb 2016 15:20:18 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	wl7sm11804igb.12.2016.02.08.15.20.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 15:20:17 -0800 (PST)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56B922B3.9070604@gmail.com>
Date: Mon, 8 Feb 2016 18:20:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Mon, 08 Feb 2016 23:20:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This is more of a "FYI", but I've noticed that the build time of my 
chromium recipe has gone from ~45 minutes to ~2h15m when the only thing 
that changes is to move openembedded-core from the commit just before 
upgrading binutils to version 2.26 ([fd75637] native.bbclass: Set 
CXXFLAGS from BUILD_CXXFLAGS not BUILD_CFLAGS) to the one immediately 
after ([86ade2c] binutils: Upgrade to 2.26).

Oddly enough I don't see this same behaviour when building, for example, 
core-image-minimal, so I have no idea what makes chromium so special 
and, therefore, whether other recipes might be similarly affected.

Also, it seems as though a lot of the added time is coming from the 
linking stage, but I don't have (or know how to get) hard numbers for 
that. Is there a way to get build times for each task within one recipe?

I've repeated this test 6 times (build just before binutils-2.26, build 
just after binutils-2.26) and the results are always within a couple 
minutes of each other. So I doubt this is some random occurrence.

