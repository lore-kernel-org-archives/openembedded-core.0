Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4852D7BF65
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 10:51:16 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id b23so10326731ios.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 02:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GH/JVHsNkhYHTGEzTpF8D/f3Str6d5AZU/tp464bqxE=;
	b=Dkdo8jjDsuzTrd3edtdqSGWmsMAnSf+8YVWms+L7g5uAOaeN4w3DgRsylhndIkDhXJ
	dLNHHztG4Cf1j0mGjaGOdzbTyd49zfpFQWWPlvKjmg0yzWsxCp7IWC8bnFmGR/Nh8ixI
	cqZVhqfyRS8eow0vx50vlsuy3T/OIXEXhkvL5BE4bxtP2udKdm1cl8Mp1Kb8j9NlmICe
	4tJFg6pc13b5y6EXuHMrPv9sdJGQV2HH7tgjUN4AYRSjCxqalSVDRIgCNisHRkPY4dSp
	nGZWk22FHy+lkWz/5NhDyxBBpTbcpAW2pdoB1Y8tqdgUlQgD7jv89bfTfflVi8enq5Vl
	5N3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GH/JVHsNkhYHTGEzTpF8D/f3Str6d5AZU/tp464bqxE=;
	b=sjeBhTVGA/TDrrxLcWV9ITvBCHxkJiWfI25pgC4RSDWe+qpTwjH76Jn3SNfSlwFp3A
	04HVDIeIHgGHZAeSqoUtD9HlzcvOLNnNroenwr7J2JT0WMCXRscBqeveHbNQp8FzMh5M
	yfQnBFcdssCCJRyZREYFwQvhE+DvpizGL6FlOATYSFn4aNbUIzfq6LGfHo06uVfQVZzQ
	ECuQr4MxWtPht+RjMOtACtveLQhtCXuLv4xW4PN5kt8DEVqIS0aC66V7sdszr96OXSjD
	1UADuKl2R7K2GmMNfhwicIPPcaPlTK/mnDWJtkxm7FfdkXnB0qNHAL7p9Cr14jVbjUKa
	CwEg==
X-Gm-Message-State: AJcUukcIdcYobJoOLKpD60tSR3RWHlZlBP2puFILiodaICjKt+K5CPCs
	8yohF5zG3BVPVz55nzlJtDcyQOeP0OjUWqgJuoD4T59l
X-Google-Smtp-Source: ALg8bN4bYRMU4Y2vj6Pjtb8bvNzkH6J/igqqUHG8WVj/V4MC1okyn4tfS/VXzGUdUyNOI62W4kKFMtHecjqSvICFUu8=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr8838209iog.270.1547808677279; 
	Fri, 18 Jan 2019 02:51:17 -0800 (PST)
MIME-Version: 1.0
References: <1547782346-11763-1-git-send-email-chunrong.guo@nxp.com>
In-Reply-To: <1547782346-11763-1-git-send-email-chunrong.guo@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Jan 2019 10:51:06 +0000
Message-ID: <CAJTo0LYchfYRFiTJJ-f5BnyDosXsV8PYWRcfPYq4FuEMDF_+kQ@mail.gmail.com>
To: "C.r. Guo" <chunrong.guo@nxp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glibc: glibc support powerpc e5500 and e6500
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
X-List-Received-Date: Fri, 18 Jan 2019 10:51:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Jan 2019 at 03:33, C.r. Guo <chunrong.guo@nxp.com> wrote:
> +Upstream-Status: Pending

I prefer not to carry large patches to glibc for a long time if
possible.  Is this going upstream?

Ross

