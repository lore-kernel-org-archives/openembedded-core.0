Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 870BA7CB01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:31:57 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m1so7726801wml.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=T1ygYKg2PJT9auMZukVf7OTALGijlg5bCu9bDlUb02Y=;
	b=gnbbXoo9GVEL7X/oMYRM2nokXfLVOGczEnt4xITZviU6QKc/q/ayGtbScYkS1Pi2+0
	LOtHUCZEVHm+oooDnfukmOv4H3IYgs8qJqDhBka+ZRCTOSNid+wbZY5hJixViDrFNpSk
	Ug1Jt1IZ+yEavz0a6QuKak39PnlLQBi1n7C1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=T1ygYKg2PJT9auMZukVf7OTALGijlg5bCu9bDlUb02Y=;
	b=rycTDrCcC+yMkjFd6EfBUjP1FXbOCaJxB1PnYPd6U+vGwcGRf3lvUPdOfXec1Roqhu
	+MM2xbmLfNd/FquBvvhfvyPW6/yEz2YOiMxsQ9SgUx3Kj48UVJQ3PCtONPkhPNIKMlOZ
	A1F1UnPn4/fwq2ynSawCKIC884QSiKrKZtxbuSq3BWBr+G3xHS+Atb/HUU/wIb9pp7vP
	lrmjQNOr7rcX1qZF8jUxVhRx2iwZmGCI0xgZz6Xwpptbr3u9zCvqAEmpp06pWOaR+UH2
	aWUyewwSkWrhcIQwKafUCEU/+dKakJUxepPBxzVENX8d+aKveH0mbXlGc2BO5f6LGXIs
	Eqvg==
X-Gm-Message-State: AHQUAuYj7v0caH8WUQf9giiQ04ctiIzFfuX53rXqXbbMnJqBCrFo1FrU
	Y483UkBA1cSdzOvf/rySXSTkbw==
X-Google-Smtp-Source: AHgI3Iahm9+bzo0EO8UO/6KLtajmSsvhAjbCiYLyBcWNNBrgg5FaxiZXKIqqzOqLI+gGZOZxKFkTUw==
X-Received: by 2002:a1c:f509:: with SMTP id t9mr10837772wmh.76.1551094318088; 
	Mon, 25 Feb 2019 03:31:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e193sm10354598wmg.18.2019.02.25.03.31.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Feb 2019 03:31:57 -0800 (PST)
Message-ID: <1552f387e9f5bce0305457416945634f5f546f1d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Feb 2019 11:31:55 +0000
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: "Lehtonen, Markus" <markus.lehtonen@intel.com>
Subject: New QA process/tooling
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
X-List-Received-Date: Mon, 25 Feb 2019 11:31:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I wanted to mention we now have a few developments working in our QA
process/tooling workflow. 

-----------------------------------------------------------------------
In summary:

We have buildhistory data comparing -next/mut builds to master:

https://autobuilder.yocto.io/pub/non-release/20190223-15/testresults/qemux86/buildhistory.txt

We have a summary of the test results (including ptest):

https://autobuilder.yocto.io/pub/non-release/20190223-15/testresults/testresult-report.txt

We have build performance reports:

https://autobuilder.yocto.io/pub/non-release/20190224-3/testresults/buildperf-centos7/perf-centos7.yoctoproject.org_master_20190224030033_47eb3d0.html

All this data is stored into git repos:
http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/
http://git.yoctoproject.org/cgit.cgi/yocto-buildstats/
http://git.yoctoproject.org/cgit.cgi/yocto-testresults/

-----------------------------------------------------------------------
In detail:

Non-release builds publish some data to 
https://autobuilder.yocto.io/pub/non-release/YYYYMMDD-NN

e.g. https://autobuilder.yocto.io/pub/non-release/20190223-15

where NN is an incremented number for each build.

For the qemu machines, buildhistory is generated, stored in a git repo
and buildhistory-diff is run against it. For -next/mut builds this is
against master:

https://autobuilder.yocto.io/pub/non-release/20190223-15/testresults/qemux86/buildhistory.txt
https://autobuilder.yocto.io/pub/non-release/20190223-15/testresults/qemuarm/buildhistory.txt

(for master it would be against the last master build)

Historical data is saved into a git repo:

http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/

(master-next and mut branches there will be force pushed)

The structure also contains various testresults.json files. resulttool
is used to find them all and import them into 
http://git.yoctoproject.org/cgit.cgi/yocto-testresults/ 

We then run resulttool report to generate:

https://autobuilder.yocto.io/pub/non-release/20190223-15/testresults/testresult-report.txt

and we also generate the regression report:

https://autobuilder.yocto.io/pub/non-release/20190223-15/testresults/testresult-regressions-report.txt

although right now this isn't working as well as I'd like (since the
previous build was a-quick, not an a-full and therefore there are missing components.

The test results report includes ptest data and includes data on how
long the ptests take to run and whether they timed out (a T in the time
column).

The build performance measurements are being run every 6 hours on two
performance measurement workers (ubuntu1604 and centos7) triggered from
the autobuilder. These generate the reports mentioned above as well as
pushing the results data into:

http://git.yoctoproject.org/cgit.cgi/yocto-buildstats/

build performance tests can be run against custom branches to test code
changes and then the report will be against the nearest commit in
master.

In a release build, the same data is generated but its published into:

https://autobuilder.yocto.io/pub/releases/

The hope is that these reports and data storage allow us to much more
accurately and easily figure out what was tested and whether/where we
have regressions.

It sounds relatively simple when put like this but there is a lot of
work that has gone into this by many people both past (Markus' work on
build performance or Paul on buildhistory) and present (Ee Peng on
resulttool). It is great to finally see it being pulled together into
something which is part of every build!

There are no doubt bugs and things to improve but believe this to be in
a good state for our 2.7 feature freeze.

Cheers,

Richard



