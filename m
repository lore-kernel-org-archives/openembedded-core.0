Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BB27F60B33
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 10:26:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q9so15163870wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 02:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=1V+kMK0zsgPBEYitkKaL7QRZValMOgqBAof9GU9Ysjo=;
	b=b7IokAFhh2gVNc+KQqZpsSE3OI/P3psYCxoXsOXGL6kDmPwczKZGI9o8NFmwPmOE53
	hAMUo7Y/2r6KeWBVsQvhIuEcjeo4AjVTbTv33KGfsMOB9TuNpvykom5RhvCngw6UahQ6
	3qaSg3kbrnV3MmLyq5M4c1t7zmTnpBt5mmBU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1V+kMK0zsgPBEYitkKaL7QRZValMOgqBAof9GU9Ysjo=;
	b=XeXGB6OQegBOwoi2WewSP7euPNfoEQtEmtQIxoBlbYApdJl0ljsLkXtvdYI9vQiQps
	wMDoyoZsq7Y5BTqhEtUrgm7C6IT57v+yHuUSvZ/t403IhpwaD7l3/Kf9kdEJT03LuL9n
	MD+YT97crtaF98A2jJ9ycHJM5LkjdQOPNd/FyeGJE0lrIj9WNgWtYjhEkKlRzFTIbA1j
	jnJd5aYkDDqBhrkOqTmvml67WOuLC1fEQyUBLy3/uBJpCljol/EwJA1xVAshNAPTtXgl
	NnM24O2ajSXqH+ejN888XWeua6NrZ5zHrNgaJ3qtwIbwvCsdlUGWdPMOtwKbY+5ApD20
	/+HQ==
X-Gm-Message-State: APjAAAV11iozIRm6BTKWZU3Ec06x5/CCZhxz/eFs2mm9OvcM9KFsFZ1V
	qqW045al/kdeZj2GWqsSrq1afw==
X-Google-Smtp-Source: APXvYqya/1yz55ce3Fwvpuh0cFtjW8ze2gjDs1ivT/Y7v7RKobVZoZtcxYJfQw2UMtEhsJ2VRFzlvw==
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr27170605wme.125.1580725574077;
	Mon, 03 Feb 2020 02:26:14 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id i3sm12056613wrc.6.2020.02.03.02.26.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 02:26:13 -0800 (PST)
Message-ID: <b672e48f8e33b9ea75b9772321f2db0951b38942.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Feb 2020 10:26:12 +0000
In-Reply-To: <20200127231306.46105-1-alex.kiernan@gmail.com>
References: <20200127231306.46105-1-alex.kiernan@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] systemd: Upgrade 243.2 -> 243.4-latest
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
X-List-Received-Date: Mon, 03 Feb 2020 10:26:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-01-27 at 23:13 +0000, Alex Kiernan wrote:
> Update to latest on the 243 stable branch. This includes (amongst other
> fixes) seccomp filter changes which fix failures with glibc 2.31, e.g.
> 
>   systemd-journald[543]: Assertion 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at src/basic/time-util.c:55, function now(). Aborting.
> 
> Rebase 0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> 
> Drop 0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch,
> fixed in 5c0224c7bf3c ("Handle d_type == DT_UNKNOWN correctly").
> 
> Drop 0001-seccomp-more-comprehensive-protection-against-libsec.patch,
> fixed in 70e8c1978a9a ("seccomp: real syscall numbers are >= 0").

Unfortunately something in this causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/412
https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/413
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1545

I've been blaming Trevor's patches until now but its this one (sorry
Trevor!).

Cheers,

Richard




