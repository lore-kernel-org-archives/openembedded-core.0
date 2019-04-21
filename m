Return-Path: <alessioigorbogani@gmail.com>
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3E09A6C10B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Apr 2019 17:32:48 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id n16so2994519uae.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Apr 2019 10:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=F832VkrM0d4eui5Cn2NIELtuSJ2JDY4kGGiYC18oH90=;
	b=DbweJ74jnt/xLXbLrTKpmlLWn0R+6q3vOeOYMCVc59/0PT07eXC5xA5/kt24F8IyOJ
	au615YIE73E07JII7/Ce4N/voerFObSrA26rzlRIJl+kHMdPhfWRaha+cR8ZMWrgZ/7Y
	5G+k5P66y54b++gTi+EKCycFtzGH4j+BWzPCgqEjCuDGrDtDNgCFPrzoa+hj4yqMyQSw
	pSJSr5P+u6tZydq0X+rzTkzRsJGopwVA0YLH3+fBypOuXmhK1ITQZC1w+hjxQASUuHh4
	PDs7c35eergKxqJvfgoQGcm+fnASthrpRz3ooZUSfp8sfpHa9QXT+o7ZgnYT1ecC/15A
	6g0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=F832VkrM0d4eui5Cn2NIELtuSJ2JDY4kGGiYC18oH90=;
	b=dpM/LCPI7geugU07LJExCqRsV2xnlaMQQ7Y18PjG98YRH51jEXUx2O6OGDTtDTr+6F
	KeAtyLPrtvYeOpGwA+KCqPa5j5ILf5zEohPZvLTwqWd9RCz+45uBDX+oUjR4aMbdBHXN
	6UUZjEkrnWQBVhNtdgY2iXH0ANutaHPz6iTtZ+Gk61U7OSOsNV5QG/c+gkVMU7ZYMdbu
	QlCig3UxrFdrQ4Dpd9g7m+zz6o0cpbncDvfczu8G5aRQaxJy/3N4aX88r677X8f+4NCF
	TC5jlvd4SU5jvV12idJ/eUF/HUXH5MwqV/UVddwKDUeegfQwCcddBcfOXEzZDhQDHecs
	j0Rw==
X-Gm-Message-State: APjAAAVYX6Nbq5c9HYVvKAfq2w2NlVh2O7qfMuTW4WKCuBMKX5DOgHmP
	9F1blPM3C4jC0Mxse5LyyhTFwEWeUmRy8YOYLN6q4bO0
X-Google-Smtp-Source: APXvYqzCjtwZ05vRWdffmnKh9hUVDsl1avkdSOYWWEazuXuX9fQefxmNYNe7HOUZfRnBZUz4jqHPZhqNJ+Su85wrV/M=
X-Received: by 2002:ab0:2b98:: with SMTP id q24mr7641767uar.122.1555867968791; 
	Sun, 21 Apr 2019 10:32:48 -0700 (PDT)
MIME-Version: 1.0
From: Alessio Igor Bogani <alessioigorbogani@gmail.com>
Date: Sun, 21 Apr 2019 19:32:12 +0200
Message-ID: <CAPk1OjGgtpjURWqb0hq2GegS-_Q6Ot5_sPgaS6ChbNffUdc12A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Generate an SDK with both 32 and 64 bit versions of the glibc
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
X-List-Received-Date: Sun, 21 Apr 2019 17:32:48 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to install a third parted developed tool (closed source)
into my x86_64 SDK. Unfortunately it is composed by a mix of 32 and 64
bit binaries thus `bitbake myimage -c populate_sdk` fails with:

Error:
 Problem: conflicting requests
  - nothing provides libpthread.so.0 needed by
nativesdk-scw-2019-r0.x86_64_nativesdk

I guess that libpthread.so.0 is the missing 32 bit variant of the glibc library.

How can I make bitbake to install 32 bit version of the glibc
alongside the above mentioned tool?

Thanks in advance!

Ciao,
Alessio

