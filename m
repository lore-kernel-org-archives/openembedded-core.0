Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7C22662062
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 11:36:48 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id ld11so6190556pab.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 04:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type;
	bh=dx1rp886bMYjafwOPi1fgthcnVb0SmYKAh3oOLAvfy0=;
	b=mPNRTB3lGKD3QpE60H9U+wZWJEIqOr45gET6OlsLD6c7B9gOSEyjzR4dhyJxGVhxEd
	fJGBCljxaC3EHWl1FRbiCS7kVpYEboX3kq4qZaIffSYqoXdwoUNJU/tfbCBgCM8rAIVw
	Oz5zg22D9PKhSs+aj6Ts0VX+la8vUTAkcT4Ztfni2mdnxs2HGXkMVCv81qBaDgvgtGR9
	xv0VIUCnj868a3KT4NUWxsotYHog7tFd2khUJGXDxU2SuEGdOFK2MJC4YwtqzPG+4Xdx
	x66g+QUkm17zyxOI6SM9+vUY3Woa7ddC7ncdiCJDqMbFlqj5p8GI2My6m6VsjxonnsJQ
	IjjA==
X-Received: by 10.68.209.196 with SMTP id mo4mr1432209pbc.114.1372765009205;
	Tue, 02 Jul 2013 04:36:49 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.229.144.129])
	by mx.google.com with ESMTPSA id
	tq8sm27036184pbc.30.2013.07.02.04.36.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 04:36:48 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Jul 2013 19:32:11 +0800
Message-ID: <76265365.T9HIcf7Yx3@yiqingliang-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.6-1-ARCH; KDE/4.10.4; x86_64; ; )
In-Reply-To: <4783685.hnM3VA9Ozj@yiqingliang-pc>
References: <4783685.hnM3VA9Ozj@yiqingliang-pc>
MIME-Version: 1.0
Subject: Re: systemd
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
X-List-Received-Date: Tue, 02 Jul 2013 11:36:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, July 02, 2013 09:35:20 AM Yi Qingliang wrote:
> Hi, All:
> 
> I want use systemd, add following into my own distro.conf
>      DISTRO_FEATURES_append = " systemd"
>      VIRTUAL-RUNTIME_init_manager = "systemd"
>      DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
> 
> but when do_rootfs for my own image, I got error:
>      error: package update-rc.d is not installed
>      error: package base-passwd is not installed
>      error: package run-postinsts is not installed
> 
> Any idea? Thanks!

I have restored to use default sysvinit, but got the same error!


-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

