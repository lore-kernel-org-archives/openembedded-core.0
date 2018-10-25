Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 091A178E62
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 23:02:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f1-v6so2924260wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 16:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XnRpdZYOl1kAezFHxzKSEI2rBNVVHnoWP9Sjz+rKUYA=;
	b=OlMK0YZf1jcJ0loRLUi+QUVftTU377dlnW2ujav5XCQWcNh4YwojPGCnOlV6dRZ1IZ
	8IdPHRE398je5y9CCRrTt2JCTcjh30SmJhfZO/zcY2rNvWExw46Smp4fgFfj2IdRu9S6
	kF97JbHj5tJOrL5Rhqos5nXvGpFI5jWfsVqV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XnRpdZYOl1kAezFHxzKSEI2rBNVVHnoWP9Sjz+rKUYA=;
	b=YAv/HqI5iyFbCXqNlDnOO8P5+x3eyimlEgd15eM+1kKgLWwwOI7CUzTzlPC6AvW/6u
	HwvTH5nBL6IMj14wwwycYoMExQjZtsWbPovC2aZd7USir6W1Hjo/U9wt2uYSTfh0en2N
	NDSlJn7uUlDaADgC1ZbncHjHLsuHegOE3KedbBgqMYS7aIpK7uf99qyrEopa+wK9YfMt
	DMpH4EYLUFI152p/pDQDEcjSNp3a5qgeiOwkqcSM26YwZfzeA98+pJh46fYAK4fciVOo
	iyBSj7nP5CjMElGtFJqizjevvXZqIirkxa9MWr5NYpdJdu/sjj04J3wQds281LCdb3lI
	Pp6Q==
X-Gm-Message-State: AGRZ1gJNhRVtPl0J6y3FGWQ87P77GQO218ZLkvE4AK96AiT6Qg6927kY
	BwczrqThZX9O5ucAqMmR9Zaxtg==
X-Google-Smtp-Source: AJdET5dLDgbSoVXIj1ha8UIlIRrIMGnjgz59hLYJpGRA1fCAbEDesquAFpQ7peAa2XQ5Xt+EAzBGEw==
X-Received: by 2002:a1c:9753:: with SMTP id z80-v6mr3598393wmd.1.1540508537548;
	Thu, 25 Oct 2018 16:02:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b81-v6sm1797433wmh.47.2018.10.25.16.02.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Oct 2018 16:02:16 -0700 (PDT)
Message-ID: <bd280bb76c034d8654a18a35655fd0548541a7ff.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2018 00:02:15 +0100
In-Reply-To: <0dd8f9ff-1a40-615f-962e-b5fb60f7f57e@windriver.com>
References: <cover.1540191752.git.Qi.Chen@windriver.com>
	<a2bd44ad10ae076b40b11a1a2c8d0007817b17af.1540191752.git.Qi.Chen@windriver.com>
	<ae8c420e68e7027797576f48f414cbd3bdbaa5a5.camel@linuxfoundation.org>
	<0dd8f9ff-1a40-615f-962e-b5fb60f7f57e@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] systemd: add back alternatives for init utitilies
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
X-List-Received-Date: Thu, 25 Oct 2018 23:02:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-24 at 14:16 +0800, ChenQi wrote:
> The failure is revealed by Kevin's patches regarding udev-extraconf. 
> More particularly, it's the following patch that reveals the problem.
> "udev-extraconf: Use the canonical file name of systemd"
> 
> I've sent out a patch to remove udev-extraconf from 
> packagegroup-core-lsb/-x11-sato to fix this failure.
> I tested 'testimage + core-image-sato/lsb' with the following 5
> patches 
> (3 from Kevin which are now on master-next, 2 from me) with master 
> branch, and the tests passed.
>   packagegroup-core-lsb/-x11-sato: no udev-extraconf in case of
> systemd
>   systemd: add back alternatives for init utitilies
>   udev-extraconf: Skip the entry in /etc/fstab when using the
> systemd-mount
>   udev-extraconf: Fix the recursively dependency for the systemd-
> mount
>   udev-extraconf: Use the canonical file name of systemd
> 
> P.S.
> I chose to remove udev-extraconf from these two packagegroups
> because:
> 1) udev-extraconf is needed in live image, so the automount rule
> needs 
> to be there in the final package, regardless of the init manager of
> the 
> real rootfs.
> 2) It's not clear whether users need the automount feature in case
> of 
> systemd. So I didn't choose to modify the mount.sh script to exit 
> directly if init manager is systemd.
> 3) I think it's not easy to make mount.sh reliable in systemd.
> Kevin's 
> patches are good and helpful, but still not solve all problems. e.g.
> The 
> mount.sh still doesn't take into consideration of .mount and
> .automount 
> units; and it does not consider this failure case, i.e. no medium
> found 
> on /dev/hdc.

Thanks for this, with travelling for ELC-E its been a week of
distractions so I appreciate someone looking into and figuring this
out!

Cheers,

Richard


