Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id E5B426BA0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 09:15:17 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id b23so1473703ios.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YZKVnxH+jma9vJ6nF1qxPzX6wehKyDWfHLaSBOQ8yTY=;
	b=jFXx41ANlXqwiYH9pE/6ctc7KdXE126e3b+QbWCQhmleDYwnS5Nf8wOzPmcT8oGIx1
	JYllQTkFXCQQfO6Qib/3GiGtInWAX/WPXRpbvXJ/ez0QZPPOIbsBKqoAexIcpzl5D9w3
	6o23f7xF/WwrUeTsNRkSOjC6+AqFJ2la3M8PX+IqHh1+PBOXnleoBqJdefDTJClE/9pe
	a6kfCvMXSaPh8V0qKnEDvNVgcS37ICA3x8ZwCNHvsqGDm+BV/mK/UweG5dokrhfcNbhk
	ugRutMXKfqs6xCTBry8+MDt3BAhfEeN8wuQ1KTKfpH9W0It/Gb92/2ZY1JV+i1FLLDWv
	Ey0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YZKVnxH+jma9vJ6nF1qxPzX6wehKyDWfHLaSBOQ8yTY=;
	b=atYDjz1Vh8tWXDQMv+YisTIWN4Vvwbrop60tUprK5Mnq6nKbYsq1Masaptg2Jh71hL
	prJ886yx80GoH0orROuBXFOKWX8hd3qcBSre4efzje0vGwxkoTKHR3cn1wlYqiqM05tS
	3UkeFvU2dRZKpHBmKOgJMK2E+3gDTG9bQX69RHFLQHNo+oxnuhn8m0ySoiJHp846Nr5i
	HPe5bdDMRMsRTYlbiw8MC2F3bD5m84ZkZKafGcz94+a7M0ymxs0cTvybm7FhM0Mkp/3k
	rsN/4WlxvkS79hofPLQGqYMinw6PvdJwV9THgn9GNyFpQX7S2Hb+isQLQyAcmsvFC0Tk
	m3ig==
X-Gm-Message-State: AJcUukcpNm7bqJozXVYB24n0YadrGAjd+okFnnHEzsXS8eOasToj4EHa
	NTIq37q0AZxfof0Nf3s0/SFNdPRQAzeKvutGu/c/8Q==
X-Google-Smtp-Source: ALg8bN5/WGP1MvmWGP8fmKTpOB4XkFyynylr5Oz/ngzIVL9Cy+U216n+4U9iV3i63/uYb2eHgxsjtrEYgbMDgBUet5o=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr1279680iog.270.1547543718876; 
	Tue, 15 Jan 2019 01:15:18 -0800 (PST)
MIME-Version: 1.0
References: <1547530093-50658-1-git-send-email-changqing.li@windriver.com>
	<1547530093-50658-2-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1547530093-50658-2-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jan 2019 09:15:07 +0000
Message-ID: <CAJTo0LZhSh1sWXRkXbQ1VEUbwFv4ihe1J2qgeUO_dDgu_fznhg@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] waffle: supprt build waffle without x11
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
X-List-Received-Date: Tue, 15 Jan 2019 09:15:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jan 2019 at 05:29, <changqing.li@windriver.com> wrote:
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx', 'gbm', d)}"

Should this be:

PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
'glx', '', d)} gbm"

ie always gbm, and glx if X11 is available?

Ross

