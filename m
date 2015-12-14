Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0B6607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:34:08 +0000 (UTC)
Received: by pfnn128 with SMTP id n128so106353003pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=I42QFz47WnvsBD38VdF2fipOuYpWhjn8xKMnj9ToosI=;
	b=HPCz4GxIm4j8Uz9xpJiBvo1xRGRhpvBl1OKwKvkkXBuSW6+BvnZXWw5GVB9LbUa/DH
	4pJBiL47qwrnyZDEcIu0gRkUBC3VY9vlLHf6N5xUR3hZDVHRzG56WTfTturbMqcMguiy
	OcGzHmh+8dKfLwUd4+u7jKRRgU9tY9PgtTn1SwJPkIhUZA5nf0QgCZhw5MyKId08Oo5d
	ygMX7vHOI/6k9KO0RJ1X7G7QGkkwRtGVNTl5fanmZj9KO8+cvRHzFwSjfzC4MaEJkvgG
	yeaT5xBaLJHA7bhC4uecaVZAiKNOlZ/8vjGLO0U4QYuYyjTKERTCikNnltEY7PZxjKFo
	IzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=I42QFz47WnvsBD38VdF2fipOuYpWhjn8xKMnj9ToosI=;
	b=jTmkKPoxgs7viRAwXShCBsg5P32uUrLUfjOeTwu9kTAwYUVr2btNXof8EQ3aPmDWCp
	4sBe0yjA/dJpSvELAR/zkIWKjk6N05HsfSyElqtJrb8KuupZVonw7aYXidfRsOgEkn7J
	hMHeFPx5fCbu9Kgh3kASeHK998fD1yq9E06sGHrrb2UQViTibqR4SsUr3OTGFfw12P2g
	QfpfwoapfHzOtr6axb43LMXjfakmjWUpRnaU317DIpVxTZNWfDlVLEIpZthtPMacFt2h
	BLQpH5xVAh+laVX8EeghRr2CksubzXwDeSjjCRAyIuVt2ffgpdfkOyPcRRSaSOy8WwOf
	YYwA==
X-Gm-Message-State: ALoCoQk4IcQ4cwUpbGQvlGpe9EFx2Q0os5xaQo7MeFbMxnfGFYkrLDWpLSHlC6WQgg1oguLKYROjSu1QohSGcsqT5kEYmcW27A==
X-Received: by 10.98.0.139 with SMTP id 133mr9774927pfa.131.1450103649732;
	Mon, 14 Dec 2015 06:34:09 -0800 (PST)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41]) by smtp.gmail.com with ESMTPSA id
	mj1sm43429816pab.34.2015.12.14.06.34.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 06:34:08 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacdm15 with SMTP id dm15so104452216pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:34:07 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.136.47 with SMTP id px15mr14072146pab.102.1450103647660; 
	Mon, 14 Dec 2015 06:34:07 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Mon, 14 Dec 2015 06:34:07 -0800 (PST)
In-Reply-To: <80f3d12d7eb901a0deb50508d54bd89192b88a8a.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<80f3d12d7eb901a0deb50508d54bd89192b88a8a.1449671297.git.alexander.kanavin@linux.intel.com>
Date: Mon, 14 Dec 2015 12:34:07 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp8nvmTMe-Vu8Y+JyYF7453bV_zMK0GjTqhMk0rQDBsUw@mail.gmail.com>
Message-ID: <CAP9ODKp8nvmTMe-Vu8Y+JyYF7453bV_zMK0GjTqhMk0rQDBsUw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/10] openssl: update to 1.0.2e
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
X-List-Received-Date: Mon, 14 Dec 2015 14:34:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 9, 2015 at 12:40 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> [YOCTO #8765]
> [YOCTO #8758]
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>

This update seems to have break imx53 build[1].

1. http://ci.ossystems.com.br/view/All%20failing%20jobs/job/fsl-community-bsp-master-next_x11-imx53qsb/909/consoleText

Has anyone seen something similar?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

