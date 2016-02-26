Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8129E77476
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:43:27 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id fy10so57056034pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 13:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to:cc;
	bh=1Vyz/BypgoJC9NE35HjqmJe7Ec+jwdMCYDkJAELtPtE=;
	b=PaPk3ZM3zozjOcoT7YFb7Tg9L5rklGt423ulYF5erVfVFHoa/oldAvY9kGOgSDbwbX
	bjqKKD7zFbooULrEM4o9zKivTBN3oVpQ8FqXUDAyhgZNIDFYzyeNAJPu0ctl+dW/fXp1
	nBU6KpiHJ1CQC9ACuAp63mSEDULO9t288xlqezTPvjSY8q2YTTrv+X5y/5EVzNOQmwsG
	daJFXPSIvdD17aXuAq41qvxsmsk8xXSWtoKIax/E9OHG9RuiJ4UWVccmtNNm3w/avThb
	fjr+J++GRJaXIPVeoI9vJUshXnqHGdV2DjPjN6lZ47Tv9vrkEfmyt7cZPhS6cSeRMVRm
	mEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
	bh=1Vyz/BypgoJC9NE35HjqmJe7Ec+jwdMCYDkJAELtPtE=;
	b=CQOVD7eZsntg6NHXycsU4Bw/tY1joKm4EGMtnIBhMpwh3PmNQNBKnjWpZpjewSoIwS
	zLL41Pj8Sm1c8Xo4NmgDYynx+MwQWWsgS7iTbHAUbCcmwFgk6Euivh/rbVH8BAeAnm36
	bxh2zb9ayCIuRAGed+BRDK1YvJhpirf/Uwfj/l5jHec/IBM7vS96W2n4Ir2OcsLOHt6H
	MWqecMr687rbnzsIZFZm46FR1PZnSrtn7AOW2EVTaRoPcF5kOMKeKuxTVFw0sfcodHym
	Yg8Jl6Z+moI83Q6kgGxeIkWTC7D9bcRcBhNGodGceQnNvVmWKv6dlF8ucNB5/e37Itxc
	ctWA==
X-Gm-Message-State: AD7BkJIjdp4k3PTTuuzK2K1E0eoa95Z63WLVLen6ciOckssxH+noS+h1iHf6t1UOlokpRQ==
X-Received: by 10.66.120.202 with SMTP id le10mr5165865pab.155.1456523008578; 
	Fri, 26 Feb 2016 13:43:28 -0800 (PST)
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com.
	[209.85.220.44]) by smtp.gmail.com with ESMTPSA id
	u24sm21405273pfa.94.2016.02.26.13.43.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 13:43:27 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f44.google.com with SMTP id fy10so57055596pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 13:43:26 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.67.6.10 with SMTP id cq10mr5277262pad.120.1456523006153;
	Fri, 26 Feb 2016 13:43:26 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 26 Feb 2016 13:43:26 -0800 (PST)
Date: Fri, 26 Feb 2016 18:43:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqj5hDBi9_cz1qvb3A=QZ-SLipYX=OqjVw+Q5zJx2L7Wg@mail.gmail.com>
Message-ID: <CAP9ODKqj5hDBi9_cz1qvb3A=QZ-SLipYX=OqjVw+Q5zJx2L7Wg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [jethro] 'wic' image support critical fixes
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
X-List-Received-Date: Fri, 26 Feb 2016 21:43:29 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

[Cced Robert Yang]

I would like to propuse the backport of following changes:

Author: Mariano Lopez <mariano.lopez@linux.intel.com>
Date:   Wed Dec 30 06:52:54 2015 +0000

    image_types.bbclass: Rebuild when WICVARS change

    The procces to do a wic image is to save a file with
    variables required by wic and then call wic using this
    file. Because this is external to bitbake if the vars
    change, the image won't be rebuild; an example of such
    is IMAGE_BOOT_FILES.

    This patch adds these variables to vardeps of do_rootfs
    when a wic image is build. This will rebuild the image
    if a variable needed by wic changes.

    [YOCTO #8693]

    Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    (cherry picked from commit 12c54d50ed4c321dc272beb3c6cb770965c979f1)

Author: Christopher Larson <chris_larson@mentor.com>
Date:   Tue Nov 10 14:18:20 2015 -0700

    image_types: improve wks path specification

    Hardcoding a full input path with zero flexibility goes against
everything the
    Yocto Project is about. Rework it to let the user specify the wks base
    filename with WKS_FILE and it'll search the layers for the wks file and use
    it.

    Signed-off-by: Christopher Larson <chris_larson@mentor.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    (cherry picked from commit 8cc7f5229f5447c2183ac319dd52c7ed737ec89b)

Author: Noor Ahsan <noor_ahsan@mentor.com>
Date:   Wed Dec 23 15:50:35 2015 +0200

    wic: rawcopy: Copy source file to build folder

    When a file is given using --sourceparams then wic directly use that file
    instead of copying them to build folder. At time of assembling it os.rename
    is called which renames all the files to name. In that process the original
    file is renamed. When image recipe is rebuilt then wic complains about
    missing file which was renamed in previous build.

    [YOCTO #8854]

    Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    (cherry picked from commit 33c52b1f2d39feb641465bf42e8b16d0ab22a316)

Those improve the 'wic' image support on Jethro and are merged into
master for a while. Could those be backported?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

