Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB55788B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 17:01:48 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y82so21124886wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 09:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=G02gK3tKgrM7bmKkTCkSutSYTgUsmHHMRPv28J0iH2U=;
	b=WBKKwdql+Yfbv3qV4qzveSuwKD4/BteqwtqUs9eOIaA5zcBQUGxH1DK+EdnK8uK2gm
	43ZlrL1kabPUNMag/Bzy3mw8XlrPQu4MlW2l/dTY7IxUCsFNOrpcNY27wd5eogmFsLTJ
	2EPlqB5J2w1c/dTEWt6jo775MEg1wfkX5GgQbV4Ntybu0k17NahNayvFsgj3f4A0GX8Y
	pJG7qsKrtTI0sjJ9uIi7d+6X6fqPk4sdfbm5/nhxy4YKm+5QaIEb8n1uIAhmbmWxCebq
	+LmGZKb3aGTqSjTS6wGQbIcVXgWxyX0eTC6FPKciXvoMaVmtPYYAm20+Ztm+BGNVadTV
	irgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=G02gK3tKgrM7bmKkTCkSutSYTgUsmHHMRPv28J0iH2U=;
	b=uBayZBiFbX8VX2RcOVnFDSX0X39uW5LRLmegT4gIk0aOpGyhg6I91ZpCEK+jD++QJ8
	QC7I1NYrm2dKEKVvKplcGrGb/cFuXp/Ji4yKG1y3eVsuXGcCYVHuva1V9H1KhSjq0l5V
	9XLwj5gmkE9qeufczNBOcGVO1ccWFzM6IeixAiuRdz7VBUQ+rsxecp7sTlyiYBk2qsjz
	rqk7S4oHO2yJEmsjxS5NCsVd+Pu14X3ng3AklJWX8QjDh7zXjvPKtuK+5nBtDkZPXjq5
	PVsvJ3PfL3wWCSyEEN8cmeokM09chUjB3gf6sObHgtqwzncqGODZHTktYg7ahbHbeohU
	2Z1Q==
X-Gm-Message-State: AKGB3mI+aF+h6NIWUj7s9B8gayGNSLxx9WrWmU/9Un9EPjQctbe5O3nP
	y8AM+EWUPYnVSZUYiz/O4k8W
X-Google-Smtp-Source: ACJfBosaqYkU18J8FfqOcTE4uBkCdLBTfAEvsLaIRtKlOayeUKqyvVe0YNShiFNgZ+/dTC/Nu4aItg==
X-Received: by 10.28.21.66 with SMTP id 63mr13481460wmv.44.1515517309343;
	Tue, 09 Jan 2018 09:01:49 -0800 (PST)
Received: from pohly-mobl1 (p54BD55C5.dip0.t-ipconnect.de. [84.189.85.197])
	by smtp.gmail.com with ESMTPSA id
	x10sm13728382wmf.44.2018.01.09.09.01.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 Jan 2018 09:01:48 -0800 (PST)
Message-ID: <1515517307.6718.17.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Fan, Wenzong" <Wenzong.Fan@windriver.com>, =?ISO-8859-1?Q?Jos=E9?=
	Bollo <jobol@nonadev.net>
Date: Tue, 09 Jan 2018 18:01:47 +0100
In-Reply-To: <7071668FA690C2448AC06FD9CFF240FD014013CF0D@ALA-MBC.corp.ad.wrs.com>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
	<1515062493.10775.21.camel@intel.com>
	<d85e2e6d-e7b1-8ebd-e3ce-01a26bdabbcc@windriver.com>
	,<1515066650.10775.24.camel@intel.com>
	<7071668FA690C2448AC06FD9CFF240FD014013CF0D@ALA-MBC.corp.ad.wrs.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Tue, 09 Jan 2018 17:01:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-01-05 at 01:07 +0000, Fan, Wenzong wrote:
> It works and will override the labels of home dir that SELinux
> applied, that's the issue.
> 
> For SELinux enabled system, the user's home dir should have lavel
> 'user_home_dir_t' instead of 'etc_t', it prevents users from creating
> files in their home dir.

Sounds like the "copy xattr" function needs to become a bit smarter: it
needs to understand some of the semantic involved and skip those
SELinux xattrs that are always meant to be set dynamically by the
running kernel.

Wenzong, which xattrs are those? Do you agree with the proposed
solution?

Jose, can you look into updating your patch accordingly?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



