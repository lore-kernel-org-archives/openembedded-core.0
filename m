Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id E752065D00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 01:37:02 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id r18-v6so1915339ual.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 18:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=3ESbngNs2UB5oQsxgIT93tzO40FDexy6gvEs5v870A4=;
	b=hfpVMqS4ECB+UvIdV+m4RXQlxGsqZRidM0i9c4lveZkGgBP9Tw6zc2d4ITtZgWRieI
	oR3ISZ6MXYEMMBwgTdVbOqIonnVGtfP7jTC87u7tsBj+zxmqx5pIbdrHXwRBB67b5bY7
	w55PtbbEy+ShIjK3Dnx9M50A7YoX0/f8/5JzluKQJxMf468Kk8pHGKehxPxZRUL+yvH0
	gZuhpNrJTTqjlAyBuvfLZ61hDsDpG3dvdDrIPSM/hLAHSHMfjD7CNakRHaFEVxRtBlH0
	oKCEs2yC64dbgrVUlPubvnlOxLIRNv4JYNtekOxp0IH+wotaa2M4LfVLU9gotEQmY6Xd
	AFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=3ESbngNs2UB5oQsxgIT93tzO40FDexy6gvEs5v870A4=;
	b=V3lcQeiUGMZl3qNPC1pAaiubnuWb8Rctbbn76YN3jh2wDyv+jTarAyNqvbKk61/bcW
	Nj/xudGM6+nsantslqVWtiKFp5AYwn9M5Ui4DSdQK1qLE+tiMYhK6umuUi55V+YhMMmi
	DOgmPY8wT5BajFoBn8Im4PaHSDZn6FUWbrq/GIJ57Lmm2+raObgqM/SQFN4HZxgeK7N1
	cvAi2eo/HVuHV4xz49gjD5/jQGup/hlwjxAGBXvNr6lhHpCYSkBtVqKej7koXRiT3kir
	ehDSNWIeB4UBIJcGOJklbZNcuYuqftuckSdZPCsvAEKrqF2EtRBU24AIE1cvHPW7S4TO
	c50A==
X-Gm-Message-State: AOUpUlFJXn4jsmlUfeTk00juJnQA0oQyLz2HfQeP8Ht5OhvR2Dtms89S
	FKSi+EdD/X0aC1jhSmvsSKnIeR168CY7DHzJOwqOug==
X-Google-Smtp-Source: AAOMgper7ssdlYJfY/3RCqFotPEyH7BteZtDjQoV1R1FcIlf5QlWfhscHF0fuQlrzax985HNmjBUkpDoR2SzA2K6bnQ=
X-Received: by 2002:ab0:15ac:: with SMTP id
	i41-v6mr2816160uae.150.1531877822093; 
	Tue, 17 Jul 2018 18:37:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 17 Jul 2018 18:37:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 17 Jul 2018 18:37:01 -0700
Message-ID: <CAJ86T=VZtnKx4HuQt=czPQ4Qfy9DY93xYjmduOh694rEDedBWQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Why don't uninative tarfile filenames include a version?
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
X-List-Received-Date: Wed, 18 Jul 2018 01:37:03 -0000
Content-Type: text/plain; charset="UTF-8"

If fetching the correct uninative tar file fails, it looks like the
fallback is to fetch a random version from MIRRORS ? (OK, it's
probably not random, but it's not the one I wanted!).

 | NOTE: Fetching uninative binary shim from
http://downloads.yoctoproject.org/releases/uninative/1.7/x86_64-nativesdk-libc.tar.bz2;sha256sum=ed033c868b87852b07957a4400f3b744c00aef5d6470346ea1a59b6d3e03075e
 | --2018-07-17 16:31:20--
http://downloads.yoctoproject.org/releases/uninative/1.7/x86_64-nativesdk-libc.tar.bz2
 | Resolving downloads.yoctoproject.org
(downloads.yoctoproject.org)... 198.145.29.63
 | Connecting to downloads.yoctoproject.org
(downloads.yoctoproject.org)|198.145.29.63|:80... connected.
 | HTTP request sent, awaiting response... Read error (Connection
timed out) in headers.
 | Retrying.
 |
 | --2018-07-17 16:31:51--  (try: 2)
http://downloads.yoctoproject.org/releases/uninative/1.7/x86_64-nativesdk-libc.tar.bz2
 | Connecting to downloads.yoctoproject.org
(downloads.yoctoproject.org)|198.145.29.63|:80... connected.
 | HTTP request sent, awaiting response... Read error (Connection
timed out) in headers.
 | Giving up.
 |
 | WARNING: Failed to fetch URL
http://downloads.yoctoproject.org/releases/uninative/1.7/x86_64-nativesdk-libc.tar.bz2;sha256sum=ed033c868b87852b07957a4400f3b744c00aef5d6470346ea1a59b6d3e03075e,
attempting MIRRORS if available
 | --2018-07-17 16:32:22--
http://downloads.yoctoproject.org/mirror/sources/x86_64-nativesdk-libc.tar.bz2
 | Resolving downloads.yoctoproject.org
(downloads.yoctoproject.org)... 198.145.29.63
 | Connecting to downloads.yoctoproject.org
(downloads.yoctoproject.org)|198.145.29.63|:80... connected.
 | HTTP request sent, awaiting response... Read error (Connection
timed out) in headers.
 | Retrying.
 |
 | --2018-07-17 16:32:53--  (try: 2)
http://downloads.yoctoproject.org/mirror/sources/x86_64-nativesdk-libc.tar.bz2
 | Connecting to downloads.yoctoproject.org
(downloads.yoctoproject.org)|198.145.29.63|:80... connected.
 | HTTP request sent, awaiting response... 200 OK
 | Length: 2516573 (2.4M) [application/octet-stream]
 | Saving to: .../setup/build/downloads/uninative/ed033c868b87852b07957a4400f3b744c00aef5d6470346ea1a59b6d3e03075e/x86_64-nativesdk-libc.tar.bz2
 |
 | ERROR: Checksum failure fetching
http://downloads.yoctoproject.org/releases/uninative/1.7/x86_64-nativesdk-libc.tar.bz2;sha256sum=ed033c868b87852b07957a4400f3b744c00aef5d6470346ea1a59b6d3e03075e
 | WARNING: Disabling uninative as unable to fetch uninative tarball:
Fetcher failure for URL:
'http://downloads.yoctoproject.org/releases/uninative/1.7/x86_64-nativesdk-libc.tar.bz2;sha256sum=ed033c868b87852b07957a4400f3b744c00aef5d6470346ea1a59b6d3e03075e'.
Checksum mismatch!

