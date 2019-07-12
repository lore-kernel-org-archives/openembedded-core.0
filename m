Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 033497F0F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 11:56:16 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k20so19674370ios.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Tzhp3aGng0J5XHUXb3sLQ8Qg/iMbML21DpJBKkSQUIU=;
	b=VIoeH5fThMaQcicFKnXmznL5rBUxhH8hj7llvPeVnPWl8MvbtLE+VfV7QGwtmc2Amc
	N901b/8yQeOvPgJbeFj1kUGGMJNJTqjcWU0ixz5YrvfehTzuMevsL1AGkHov4jxq6nlR
	wY11JgOIK6F0n4nHEFpGy35Uil8bWYrWEm7aoy6MtKnpMhpIKSQFBqQyWhp9JRcVoDEH
	TtBKNe8puuPmm7nvfj3kaiBClVcFb0OmDt4FNCzanss6tFlP25+m5cgOjVvGsDt2w7aj
	XAl2EjWzxgBBXL/zOm3MGbMn5AUhF7b/B+SXCXtP3bY133t+G23TLLWb/fgRr0S/ON9q
	R/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tzhp3aGng0J5XHUXb3sLQ8Qg/iMbML21DpJBKkSQUIU=;
	b=PRrjlYP/Zf+tKG1uxlBqIVaCtFI5JxpALYDU//8Ua36fEX3v9FfMFDkChCilkBjlvj
	vgZrCLxd87uROPbYEP+Y3j2zm0ZrO8cBzKLOlqjOX/aMY8G+MAINFnl1sHSdsOLD3/OR
	fhodv2l/UrUdGcqjNWeZLT/u1UeqmV54rX3lL657TvE7FTIMObSuKNyKwYG3OGxu1p4/
	7qXQy/9D1OPujqY6nllsrBB9fhVJLMSufKX4KEVhFqgyyasxNkm4HYCuPQyecfsNFyO3
	koiV1BUtEkbhsZNQeU2o4zchvC6+dSRtBuzDF88qUXRkYG69LKLVbps2ywuOH5CbOQYh
	XYIQ==
X-Gm-Message-State: APjAAAVG5AvE94fCqaM2wYAC2d3ASV5fEZSjIYk66VZtgjSp6QwTyi8H
	9LvNQsiX4d/DvGsGB9Oc1ECo+W7VpvZSRT3tomSs/A==
X-Google-Smtp-Source: APXvYqzCSLuzLwotmr8RSjP6Ec9XsSAwk+pafFJtTRLgmLGk6euwMADpvVmpbG9qr+6hURT9QwX7puJbIHHqlPcdYss=
X-Received: by 2002:a02:a90a:: with SMTP id n10mr10716406jam.61.1562932577965; 
	Fri, 12 Jul 2019 04:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <c71ee3805fdb4335ba78791a42ad4257@xbox06.axis.com>
In-Reply-To: <c71ee3805fdb4335ba78791a42ad4257@xbox06.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2019 12:56:07 +0100
Message-ID: <CAJTo0LaHEHmxDcQ+s4QHLNzDqyO7mDV9hp4HhSZmVgrsS5xWtA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: sysstat no longer builds (was: [PATCH 0/1] sysstat: use service file from source codes)
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
X-List-Received-Date: Fri, 12 Jul 2019 11:56:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2019 at 12:21, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

>   ERROR: sysstat-12.1.3-r0 do_package: SYSTEMD_SERVICE_sysstat value sysstat.service does not exist
>   ERROR: sysstat-12.1.3-r0 do_package:
>   ERROR: sysstat-12.1.3-r0 do_package: Function failed: systemd_populate_packages
>
> This is due to that the upstream package only installs the sysstat.service
> file if cron support is enabled, which it isn't by default.
>
> There was another patch by Haiqing Bai sent on July 2 that seemed to handle
> this properly.

So the basic problem is that we don't do enough testing with systemd
enabled on the AB.

Thanks, I'll queue up a revert and pick of the other patch.

Ross

