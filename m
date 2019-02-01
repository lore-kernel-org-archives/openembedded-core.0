Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7750B60596
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 07:32:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m1so4981913wml.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 23:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=t3X/IplAq35cLP2kQx2h/UHQzC+h/NLCtzEBmQlEPiw=;
	b=hXNK5w2QxpVGXtU0L7Czg3VI5sVGQi41nk/RQCA4zS80c5Eu4JaWNLkfmAO6nscJTf
	HK8eSCMdOmi+cf7sKxrvpcMSQ6YfcJeVQdsDpD3xMhVqFN7LRxb+IBlkIdUtb7kCmPnd
	1NYycIHIOd5Pjt1DRxOqtdhvF7jtSXbuBRfjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=t3X/IplAq35cLP2kQx2h/UHQzC+h/NLCtzEBmQlEPiw=;
	b=pWzxXyav3bc7graZl0V1so/uHlqkaCkzV44qARtKUze96zhBvpJQUo47/EwHdexqZ7
	kCiGwKx9aD/YiSLTXsRSFw08HsHQHeowx3fn7pBHrK/aFkSWR/qC+lnafE40br5J8wO3
	3RX++fpeoBfyKsllB9sfwzd8dZavgUVRjLBDGlTvgiYaQMO7+PQcCEh8/iOA+KH3aEEs
	VsPDR4F/gtodVkjal1b4O2k1324VDcvRTA85ZojVh/NGqeAp6/w10/pzlfHzqljvtBeo
	AvrQL4vgkUSE6cEfzQsjoUM0ETfXhm0gCsvtVRfaCMCq+HoW5hTv5RFs1Pu8PrcyBczq
	jUjg==
X-Gm-Message-State: AHQUAuavdNxRaHrOlMT9w+coRWevXAr/gj1vR6tiH3bd3G5FJ8H4yd7Z
	BjKTzWjMN0hT15Y23eCvgJ8daN+jWAM=
X-Google-Smtp-Source: AHgI3IZgH+PDrADBk9ZZRNGE6AbTazd+upSDeFJwjxVYpJ2ShF8gljX49e7Zxoza0tnFbm9QB8+o7A==
X-Received: by 2002:a1c:e242:: with SMTP id z63mr1149892wmg.2.1549006339913;
	Thu, 31 Jan 2019 23:32:19 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s1sm15938769wro.9.2019.01.31.23.32.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 31 Jan 2019 23:32:18 -0800 (PST)
Message-ID: <6a968439b13cc6e02c74c75f4441fc7918443794.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Feb 2019 07:32:17 +0000
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 00/12] util-linux: one package per binary
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
X-List-Received-Date: Fri, 01 Feb 2019 07:32:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-01-16 at 12:51 +0000, André Draszik wrote:
> v4:
> * update patch 06/15
>   * unconditionally assign PACKAGE_PREPROCESS_FUNCS
> * update patch 07/15
>   * introduce update_files() helper function

Ran this in -next but we saw things like:

ERROR: util-linux-2.32.1-r0 do_package: QA Issue: util-linux:
Files/directories were installed but not shipped in any package:
  /usr/bin/x86_64
  /usr/bin/i386
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install

(from
https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267662/raw
)
qemuarm was similar:
https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267853/raw

so something isn't quite right :(

I'll retry with a small subset of the series of patches until we figure
this out.

Cheers,

Richard


