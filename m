Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8F07CBBC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 16:07:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f14so5498811wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 08:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=xRba5PwPDDY+2zNEmrPlh0qC6Y/xTGGscCsgMcshykk=;
	b=LWNOaJjbErnyMuGGNPOPYwkFEULM0rMszkC7QBJITNrpNeXuDy+/eIEh9uAlH+RuYQ
	oS+P748CA2vPzcglE4ICYdLyCAsGJF4Pw6d1xvyGbGrTWp5rh1P7ToCb6L835BusIUzi
	GpDTYv0wBSi0apMf9hDOzVhpBGc7NNWCeyT2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xRba5PwPDDY+2zNEmrPlh0qC6Y/xTGGscCsgMcshykk=;
	b=eorGxGyBhmen1FyfcIWOC8qX1GaKWIz9EJdiD2w43CFttmgHYK7Lm6Aes7jWFuqvHI
	Mzl9MhvEo6FzbR0JOyFyxGdr/ijtZMzTVC/ny/UPLHQnmTGBoWpKgEqI93tzGF56gCPe
	Nw12YcPVnFZRkOSp0MXHlQNlMnSYquwxUcroMv1VVnfI/9p9RucLpHz1XecXoSIBisL9
	aiwEjA5kO1NIxpCxLN4MKZPZXFlnlTMw5H4Hu+53ms3EC6w5JSm1nH4kvH1KzuAeptFd
	hzfxpaJwsXWHcZxewD7JSEOltuAKhuS8gtIHwd0hp78ZY2llZxsQ7gND7xEFjAPO56s8
	4szg==
X-Gm-Message-State: AHQUAubAYO5OnK7CNL8yi4I5rAwGk85FfpAhI2m/HUfChqz4MX4j0Meb
	ZQmnWPfvcI1qklh15IsnjNUdqg==
X-Google-Smtp-Source: AHgI3IZh/sqk4jy2igwxeqvTcft0oYu5X8MbGmEXHCdNpB9e11eZemLmSHqLXalwFSvt8YCuFImFTg==
X-Received: by 2002:adf:dc10:: with SMTP id t16mr7048215wri.40.1550938075452; 
	Sat, 23 Feb 2019 08:07:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s3sm2949390wmj.23.2019.02.23.08.07.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Feb 2019 08:07:54 -0800 (PST)
Message-ID: <57b7d2afe13b3038edf9c34f9106f7ea7fcf88f2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel =?ISO-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 16:07:50 +0000
In-Reply-To: <20190221182103.13174-1-daniel.diaz@linaro.org>
References: <20190221182103.13174-1-daniel.diaz@linaro.org>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] ltp: Bump to 20190115
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
X-List-Received-Date: Sat, 23 Feb 2019 16:07:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-02-21 at 12:21 -0600, Daniel Díaz wrote:
> This patch has been refreshed:
> * 0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> 
> These patches have been dropped as they have been merged:
> * 0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
> * 0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> * 0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
> * 0001-statx-fix-compile-errors.patch
> * 0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
> * 0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
> 
> This patch has been added:
> * define-sigrtmin-and-sigrtmax-for-musl.patch
> 
> Added these rdependencies:
> * file: for ld01, file01 and logrotate
> * quota: for quota_remount_test01
> 
> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>

I think there was already a previous version of this upgrade which also
didn't work:

http://errors.yoctoproject.org/Errors/Latest/?filter=480efd388db578106a8a2129c0382b7e56a1ee36&type=commit&limit=150

From the -Wformat-security -Werror=format-security security flags.

Cheers,

Richard


