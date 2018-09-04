Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7C26678D56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 14:39:05 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 8-v6so7189278oip.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xwhqcM/iarGAV11nyA/oGeoq+NtLEF2IaRqVBXjtpL0=;
	b=VnA4A47nRaE2qhQuIWJCSN/N31ZCM5VMOhwpreG7/ag92FUqvXkxRONhdGMDQYmubJ
	QcxB9iXJhm0LYEAd779LAb3mByL8xUkpGC7zJ+AUrEXDNrNq9l62NXZNEiTgtX6Ic72X
	t9mtSUK5fP9OxXLf4aMSOfD94hpWPZweSLPX9KnurLKJxzZ6uIwSBIKB23QG/u47GnOz
	sh8Um6m6SxHFsA4y55UsNov4DkL82NVAex4yV+yai6iVmGi05fHAAyCU500U/Up8idob
	nZg3tf8o2UEXE776q0bm1uXIcPGWf1NQl5L7gzlYhUudP0nTQ0ryoaeGWXvJKCpsTG+j
	CJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xwhqcM/iarGAV11nyA/oGeoq+NtLEF2IaRqVBXjtpL0=;
	b=aqzzAoDuJYhKhaVM2oy7taIJYQaNCeopnzr5LhGXtuyOSYYtGk/05Ps7BbGyz64HJi
	4pnOUuT0BQLq+JS79ql8MsjbaW7yAe6o4mAvNVInF4tAIuZz2OkXMUhI++hvz+jNEkj2
	qD8ussQRKWlK5t9IbggcPHAf/zvYaLRqLedG/p50DJZ1Y+jJ3y1VhGkxUb5hCp7diXLh
	Nit3foeXNz1Aze2aruZzIOHl9YSiIEfZtJ487/CbziTR+8Y1wD39bitb2VKEUWvUFQxP
	CIXyw9nbu3AX3f2U6gQyuawg77LS3dw44iv/JAznvtglcuBlLubIUels5pM4hwik9fHT
	lGYw==
X-Gm-Message-State: APzg51DHrIHndHqOyZcUeckbGk1t2r1CkXTV+TpWFEZHJYMasaqo+K5R
	4CMo5eIKDBIG374p9PcDuHpERFi8fuK/TYnrCgo=
X-Google-Smtp-Source: ANB0VdYlt9KsyVJYXUfzSiG5qG4e1Zp9p44mSF2xb9txKQz4dDNpv8/6v7Ep/qeTivoIKgOZ5do2hXcXzDW/Ol/UpDM=
X-Received: by 2002:aca:e80c:: with SMTP id
	f12-v6mr22876239oih.38.1536071946554; 
	Tue, 04 Sep 2018 07:39:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:1650:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 07:39:06 -0700 (PDT)
In-Reply-To: <3b83ec3a-af68-928e-6fae-ef71fbca77f6@windriver.com>
References: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj-4XNrwM4xEnnPrdgdobecJa3e+5RQYzoRWYYum=WRyoQ@mail.gmail.com>
	<3b83ec3a-af68-928e-6fae-ef71fbca77f6@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Sep 2018 16:39:06 +0200
Message-ID: <CANNYZj9wvHuQs3aNabMBcgV2gqY3_kSSmwA9cJ3W+0vdrC5xyQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] webkitgtk: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 04 Sep 2018 14:39:05 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-04 15:29 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
>>> They can't be built without opengl in DISTRO_FEATURES.
>>> [snip]

> I am afraid whether opengl or not, it always requires virtual/libql
> just like Ubuntu/Fedora does.
>
> [Fedora webkitgtk.spec]
> BuildRequires:  mesa-libGL-devel
> [Fedora webkitgtk.spec]
>
> [Ubuntu debian/control]
> Build-Depends: libgl1-mesa-dev [!armel !armhf !arm64]
> [Ubuntu debian/control]

Fedora and Ubuntu have elected to enable opengl in their distros, that
does not in itself mean it cannot be disabled. So please disable it,
and inspect the source code for reasons it breaks the build. That
header file you cited  in particular is guarded by ENABLE_OPENGL
conditional, which should be false when opengl is switched off.


Alex

