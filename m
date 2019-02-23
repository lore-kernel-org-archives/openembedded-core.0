Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 358117CC74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 12:43:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o17so5169779wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=zbeRhyzCGC/vpQ+86mrrp2bhcZIo8Sfes0diaPlRrWg=;
	b=ZgySXb4XkztXlhGwrf8FlpfgzKxxR++qKI9tR/IN9SG3YyAMtXU1tQG8dTSj0q1KH7
	ST5pTsK2z5dQhwLnSpgHwLnsXxp79HgBtHfxsqYEn5tWvekWcihh6M0SFdEXjPfUI495
	Jut+CRI7PL5LjZcYZrwYoAGr2F9x6WTSylwvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zbeRhyzCGC/vpQ+86mrrp2bhcZIo8Sfes0diaPlRrWg=;
	b=Jkjn9Ortb3+IwU0/aTFrR5/2+7HRHQp2GsTRg2OEgkILhh1oMuTkY+Y8qVmcXYiMIm
	E4mc0beTf9NzJtINNa7vUhPb7JGXoac+cfxozbAul2MbJAD8oSaeF6M7/3j7D9tu6R0+
	dn7sU5lJM9lQnIA8NZ7TQIYfw0szjD/h3XPSwkgjj/m9ckS2MEvQYYOayAwlKFYD4Ix5
	tt605pv0pJhtqzB0cnFOj/xWMoFi9blOx6tuTZOeUkwDT4dyh8SCgufU4gZFq48nTc1A
	Kg4jMRWkDDrkSDOhBDyUciaUKEtY6/g8VBz7Wle+TXSJf7Ie+gwkngcvZ0lWJmjKYmIT
	MQJw==
X-Gm-Message-State: AHQUAuYVlws0kreyZftjAvbg+z9jd4OssKSMHNK7a80D/DHMfn3A9hcd
	7/fONIOBDa+MSvxwR8mXJ9RF0w==
X-Google-Smtp-Source: AHgI3IYlJVvYvY9TX7MPvJ8LMEE4WyutB9+Uy/Cq1/BuJIvt8OP1Yks6YSV1s1HbX8ntkNyt5ekNnQ==
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr6242230wrw.314.1550925780890; 
	Sat, 23 Feb 2019 04:43:00 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a1sm5921725wrq.96.2019.02.23.04.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Feb 2019 04:43:00 -0800 (PST)
Message-ID: <10aa3afa4b558884e16f600954422435aa8a6023.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 12:42:59 +0000
In-Reply-To: <6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
	<6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] gdk-pixbuf: convert from autotools to meson
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
X-List-Received-Date: Sat, 23 Feb 2019 12:43:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-23 at 12:29 +0000, Richard Purdie wrote:
> On Wed, 2019-02-20 at 21:10 +0100, Alexander Kanavin wrote:
> > Drop autotools-specific patches.
> > 
> > Rework jku's thumbnailer patch into meson configuration.
> > 
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> We've seen it before but its happened again:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/326
> 
> I went into the failed build directory and ran "bitbake core-image-
> sato -c testsdkext" and it succeeded so I'm not sure sure how we're
> going to debug this one...

From staring at the log, I think do_build_target_sysroot in build-
sysroots.bb may need to depend on do_build_native_sysroot.

They're both running at the same time and potentially racing?

Cheers,

Richard


