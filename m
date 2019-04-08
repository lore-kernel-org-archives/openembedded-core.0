Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3387D53D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 19:20:42 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id 139so966808ita.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZU7lN6/RJwdaM9TyuEmedwopEhLO4UY/vPqjfBBJ7vI=;
	b=JZqTwXJH4ltY4Wj9vvfNS7ZBXh8UEv56CFWZOV+3zbbzSsVpf55iCFekgqpLzZ0gf5
	f0XsqK01xZVSXLGznPNW18MpX2RrjBmFc3OZig3hzpFLajI/pUNLXHr01E9R/v4WvfMS
	ZF6cLHnc+gZBzPvzeVowhohJuM2aia1dbQ5jxqc3oXYD/yMR9O1jupiyqQ1KEFaBQ1ha
	eTorm0HNhc371LuUYC815H8cyWfxgEZwQ0qlFoGo/o80eD6oTB3w/wdBMmE9xDlT87qp
	V2H4CRGsSoZYF607fvkKuWhDpq6NUbGxfzJUDS7YnweCxmwQScYkJ9L2xwBtoBPTR3Nd
	f7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZU7lN6/RJwdaM9TyuEmedwopEhLO4UY/vPqjfBBJ7vI=;
	b=o2B/eDJRUnIYtmKKu7qkqzxpaMqcJOjcu+HATeam5Itn6HUWAV+IfvIpA9R1QrafpF
	RTiP8QIrx/gWiNFw7VdNZxVrET6gZusk0e8oQgJJq5XLvrhgfBhU6JyO+NxW6lu4TqQJ
	Yy5GlwFoqWS3SOb6GsGBvnGBEg8T1mq8E2o4iyFWh8sdte60p21Rt/evS/N2NxOv/bWg
	4KF6lbBZ4PjhQU8G3vxBtN7wRbS+gjSHAdCkz3UF2KtF7UvjvlmskM+Jba/9n4LDUhgf
	QaR69xMHBPb0aXZAjTgeKcoiG/Tt8PxThtC/aXwVSeY6TEbDE7QOXEgk29YXXWK7oLKq
	7Hbg==
X-Gm-Message-State: APjAAAVp7HrYqsK9catLpBQteWoe/KolzkVwiGc3A2VMTV5kFmwvm/Pp
	ahRAH7T+UHhlw+xebHpGVsRy+dvjf1EsLySEsBq2Rg==
X-Google-Smtp-Source: APXvYqwZS1JtACSb9e2VlrgcYeIMpFWuMXT5p0aF3s2IrHTyCOOmGwFU2TB8be0hR+JIUx+SuqahVTFy0QNbTc5a+Sc=
X-Received: by 2002:a24:ad2:: with SMTP id 201mr20947726itw.26.1554751244073; 
	Mon, 08 Apr 2019 12:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190408170152.13583-1-alejandro.delcastillo@ni.com>
In-Reply-To: <20190408170152.13583-1-alejandro.delcastillo@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Apr 2019 20:20:33 +0100
Message-ID: <CAJTo0Lb=jVx++oA6GAdF3-ARSkZb=grkZ8r3Urx-a9btTBvK=g@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: add ptest
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
X-List-Received-Date: Mon, 08 Apr 2019 19:20:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2019 at 20:03, Alejandro del Castillo
<alejandro.delcastillo@ni.com> wrote:
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}
> +       install -m 755 ${WORKDIR}/run-ptest ${D}/${PTEST_PATH}/run-ptest
> +       install -m 755 ${B}/Makefile ${D}${PTEST_PATH}/Makefile
> +       sed -i -e 's,^Makefile:,_Makefile:,' ${D}/${PTEST_PATH}/Makefile
> +       cp -r ${S}/tests ${D}${PTEST_PATH}
> +       sed -i -e 's,^opkgcl = os.path.realpath("../src/opkg"),opkgcl="${bindir}/opkg",' ${D}/${PTEST_PATH}/tests/cfg.py
> +}

You're the maintainer of opkg, just add an install target for the test suite ;)

Ross

