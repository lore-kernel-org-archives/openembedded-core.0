Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC8F6018C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 13:35:39 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id zm5so14018158pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to:cc;
	bh=jL1eH7VwRZj9LnydF4bAySAsk9PtLaFhnrrvzfmH70k=;
	b=t9CHkamGTvr4lc/nyUXcmDKS8U8Oz9F/VgHtAW9f5xslgg2SiaEbFWm6ubRtjMOA/0
	wSinDbsxWsEeGRoOvQXo7ui9LaEkCLAeNBtpHUZFI12nTRxK0Tcv8HXJo04EqKhqC1Bc
	IN9SGRor6oXgw7kUw5v3aKB7wQg+fhbKGO6IF0eOy4opAxlHb6KMNAO622rt/PrAIcyF
	SF6tMcL8uAzZeQLShKF8KpmNK87si9akSVEemroqz0dgSOZ3RoF5wgkMRxrEAYeG9JEo
	mAdbdx4DDnZwTXFOkfyz6rwEw/4pC/KMJdU+RDLh39R7z1pPasJ57BgPaajKo8eSjN9u
	tgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
	bh=jL1eH7VwRZj9LnydF4bAySAsk9PtLaFhnrrvzfmH70k=;
	b=W0/w+Cm5VSu3eXWowRD1vn0n61IITywXIW6sPeNcmqoP1OG9AfdR0kfwF7iC9OgojZ
	LEnME0IrygWv2YIMQErn3bMz+eDJxH0dkHO+EWus1QfaB/foeQhzvWJkoIFB7LzLLxxL
	C+MjzCp+cjYUn34P+UPzE78pdcYcIit9LmBRZLfGxHZval2TGkFL8k9Vi8K1dAeuyxr9
	5IT8j8YIJDdnzHKt8mRmXyB5KI6oooOlm0r1hxB0gwBwDlh8AdLFvtHSsHl7YGE4hwEx
	tad6BIzhRU/q9+b1dRMjEFRstPDp7chZqU9zIqWpDnVOWCcD7c1Uueub1lqHP0d+odhA
	jf2w==
X-Gm-Message-State: AD7BkJIUnq1xrsgQEydLkpAkqtvaUwQQzmq/n7rLfmpK8I14Z3ZlumeZR1/2FJsVnSwV+g==
X-Received: by 10.67.1.65 with SMTP id be1mr3536198pad.46.1459258540148;
	Tue, 29 Mar 2016 06:35:40 -0700 (PDT)
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com.
	[209.85.192.171]) by smtp.gmail.com with ESMTPSA id
	q4sm43391910pfi.94.2016.03.29.06.35.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Mar 2016 06:35:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f171.google.com with SMTP id x3so14579231pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 06:35:38 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.93.155 with SMTP id n27mr3536626pfj.88.1459258538325;
	Tue, 29 Mar 2016 06:35:38 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Tue, 29 Mar 2016 06:35:38 -0700 (PDT)
Date: Tue, 29 Mar 2016 10:35:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoNk=TFALAKGbaAo20z-3GKKg=6NEVAMoHqGmzx-VSdqQ@mail.gmail.com>
Message-ID: <CAP9ODKoNk=TFALAKGbaAo20z-3GKKg=6NEVAMoHqGmzx-VSdqQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [Jethro][Backport] Fixes for 2.0
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
X-List-Received-Date: Tue, 29 Mar 2016 13:35:43 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

At O.S. Systems, we are backporting some important fixes for Jethro which are:

Author: Christopher Larson <chris_larson@mentor.com>
Date:   Tue Nov 10 22:34:01 2015 -0700

    systemd: chown hwdb.bin to root:root for do_rootfs

    This is created by qemu for the do_rootfs case, which bypasses pseudo, so we
    need to correct the ownership. This fixes a warning issued by
    rootfs_check_host_user_contaminated.

    Signed-off-by: Christopher Larson <chris_larson@mentor.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

Author: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
Date:   Tue Jan 5 10:32:40 2016 +0100

    boost: ensure boost to remain an empty metapackage

    To ensure that boost remains an empty metapackage after version
    updates, we explicitly require boost files to be empty. If new
    libraries exist after a version update of the boost recipe,
    bitbake will emit a warning at the do_package task. For example,
    at the version update from 1.58.0 to 1.59.0, the new timer
    library is indicated with:

    WARNING: QA Issue: boost: Files/directories were installed but not
shipped in any package:
      /usr/lib/libboost_timer.so.1.59.0
    Please set FILES such that these items are packaged. Alternatively
if they are unneeded, avoid installing them or delete them within
do_install.
    boost: 1 installed and not shipped files. [installed-vs-shipped]

    Ross Burton suggested this improvement on the openembedded-core
    mailing list during review of the boost recipe version update [1].

    [1] http://lists.openembedded.org/pipermail/openembedded-core/2015-December/114314.html

    Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

Could those be queued for testing and backport?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

