Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1311565CA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 19:17:04 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id rl12so5442986iec.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 11:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/XfZPPboiJqviRzII4NY9BcncwlTwc0Xrp6XH8cXaQM=;
	b=JZtN1G1q/BprPqREj407NINTO0veLssjhea3vDiDVqR54FuV3VWA3G+E59QkSzvPSO
	N2XHYoqkSm2vbamaJLOHXgGX974p7sB8wBWfjlbQgGZja/MV3c2RmOmUwxmbxGcDZVmt
	DoGqK2dyQEapAR4lOTQ1wS/ImPi2fLCVoJ/++9q1EysKetyvgvHxdnHTYDl2Dtsc+kL3
	3FcmCJofwHWC3QEgjYtDekquMj0Xk9M4KEi4J9hTFkFGN5ccXMSs3ZsgvoH9NEdNrvh8
	rLHX+TrP/DnbM2aQhyn5HNGZAGUNnzaTKWspyf4niDs3QO+0Sh5HFgXZueqJe5J49g5c
	5p2Q==
X-Gm-Message-State: ALoCoQnin+MX8r0Ehlgid0AIYG33Vd6q0B5GwY3O5YtXEJwnqXpxKf+MRBlsJ3mEi18yWWoBbTEq
X-Received: by 10.50.112.98 with SMTP id ip2mr4168201igb.1.1418325424565;
	Thu, 11 Dec 2014 11:17:04 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id la3sm167541igb.0.2014.12.11.11.16.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 11:17:04 -0800 (PST)
Message-ID: <5489EDA6.1000709@linaro.org>
Date: Thu, 11 Dec 2014 14:16:54 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<4747988.F41N2UaoOI@peggleto-mobl5.ger.corp.intel.com>
	<5489E2A9.3060709@linaro.org>
	<2731996.o7KRurrPZW@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2731996.o7KRurrPZW@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Thu, 11 Dec 2014 19:17:10 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Oops! (this worked before the "git pull")

    $ devtool add xannounce ~/devel/yocto/build/workflow/xannounce/
    NOTE: Creating workspace layer in
    /home/trevor/devel/yocto/build/workflow/build/workspace
    NOTE: Recipe
    /home/trevor/devel/yocto/build/workflow/build/workspace/recipes/xannounce/xannounce.bb
    has been automatically created; further editing may be required to
    make it fully functional
    Traceback (most recent call last):
      File
    "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/devtool",
    line 274, in <module>
        ret = main()
      File
    "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/devtool",
    line 267, in main
        ret = args.func(args, config, basepath, workspace)
      File
    "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/lib/devtool/standard.py",
    line 68, in add
        _add_md5(config, args.recipename, recipefile)
      File
    "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/lib/devtool/standard.py",
    line 218, in _add_md5
        md5 = bb.utils.md5_file(filename)
      File
    "/home/trevor/devel/yocto/build/workflow/meta-poky/bitbake/lib/bb/utils.py",
    line 463, in md5_file
        with open(filename, "rb") as f:
    IOError: [Errno 2] No such file or directory:
    '/home/trevor/devel/yocto/build/workflow/build/workspace/recipes/xannounce/xannounce.bb'

Sure enough...

    $ devtool-workflow> tree workspace/
    workspace/
    |-- appends
    |-- conf
    |   `-- layer.conf
    `-- recipes
        `-- xannounce

    4 directories, 1 file


whereas before it was:

    $ tree workspace/
    workspace/
    |-- appends
    |   `-- xannounce.bbappend
    |-- conf
    |   `-- layer.conf
    `-- recipes
        `-- xannounce
            `-- xannounce.bb

    4 directories, 3 files

For some reason my recipe and bbappends are not getting created :-(

