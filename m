Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 048B165CB2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 10:16:02 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id i8so5009316qcq.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 03:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YI8aayvLCPxwis2gmZTIbBDDSvh01LS4BjAP3RpTq9k=;
	b=f2QEWXp0lOMGIDHr5Q+Alpq1msc0yru09nGjxQrP1gI7oFPFZGMddwAAYg26V9F2UR
	U+U9pjpQxpKNn/0pg7yNeFBohYLc4lHCNlrPIhl6AeGu/12fuKEMEXHxtyWnYb1ca2Rb
	NbJSZ0BGhN/rfXqsQlRiXHRtD5U0sFPqGBUT2LbUknk5aNEz/6MCHji4g4TH58kqnmML
	5fN2y09aqXDDbpnkWE2oBNJO7P5mQsvRbqbbi5IaRLr48eYUYmiPtvsWWsbwJxbdL8q7
	cJ6ON02VMrvlXDSRzVPD8uX67AkxhnR7j+PcnTr39lSSa6YFkfg9xmqUj62wTUEAE9Sx
	N4uQ==
X-Gm-Message-State: ALoCoQlMPYGFDaGe+/1Zy84uM0C8l1R7+fJq1Q64WduzAFHP+fF3URqFxgtPVraDepsS0aE5g+OI
X-Received: by 10.140.48.161 with SMTP id o30mr54629376qga.68.1404814563672;
	Tue, 08 Jul 2014 03:16:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Tue, 8 Jul 2014 03:15:43 -0700 (PDT)
In-Reply-To: <1404768785-24026-2-git-send-email-akuster@mvista.com>
References: <1404768785-24026-1-git-send-email-akuster@mvista.com>
	<1404768785-24026-2-git-send-email-akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jul 2014 11:15:43 +0100
Message-ID: <CAJTo0LYo+VSRkjKrbC3a5SRS0ixGdHXT=Ox0NCU1St7_mSm_9w@mail.gmail.com>
To: Armin Kuster <akuster@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lz4: update to latest version 119
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
X-List-Received-Date: Tue, 08 Jul 2014 10:16:10 -0000
Content-Type: text/plain; charset=UTF-8

On 7 July 2014 22:33, Armin Kuster <akuster@mvista.com> wrote:
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"

Please add a comment in the commit message explaining why the checksum
has changed.

> -SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
> +SRC_URI = "https://github.com/Cyan4973/lz4/archive/${PV}.tar.gz"

Github archives can't be trusted as they can be re-generated at any
time by github (and the checksums will change).  If upstream doesn't
provide static tarballs then use the git fetcher and checkout the
release tag.

> +S = "${WORKDIR}/${BPN}-${PV}"

This is the default value.

Ross

