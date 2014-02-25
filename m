Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id CA2FC6E7A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 12:39:10 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id o15so289014qap.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 04:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=w9KoQXV1YujX96mmld6frZvQp28SzzFwScL8pXmk5FQ=;
	b=EortHCespMY/4b/Gk76Ax5uUuGOCo0/jry4BN+oTgZieM5vHdFsDtmCOh5D8YMjcOm
	lfBaOXftBoOT2zunx4WRtz7mkIRYRMA0RiNOmt+tC1Nx/M/LI6kkvoaGAV5sE6HcgDKK
	STOnS+QyfzWc6yV2C2iVyl5gt6UMufIVL/snvI79OCKw/tP6A1r7wrX4+EZnrSPbyPxH
	kHW5SiFlbVQ4A5k31CKiuIEnwn0ctnX/5vMkIAGFp2b5NMFADnJaLq0V3FUvqk49uzsp
	d9YEnLnCUxXajs8QnOpIMmrNcrvaw7KTHFW3weSR8bwMvMMSp1efjAAO9DXtutVlTGBA
	EYbw==
X-Gm-Message-State: ALoCoQlXRBngbbQ5mmAI+s1xDv9fqs/Nhv4QTMKbzVkllepgEq3f/njRPpscRq3dHLEYU2YTJfuU
X-Received: by 10.140.42.54 with SMTP id b51mr35119882qga.87.1393331950857;
	Tue, 25 Feb 2014 04:39:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 25 Feb 2014 04:38:50 -0800 (PST)
In-Reply-To: <1026f63b88e1781645e49bec5a1c53a4cd686adb.1393256563.git.liezhi.yang@windriver.com>
References: <cover.1393256563.git.liezhi.yang@windriver.com>
	<1026f63b88e1781645e49bec5a1c53a4cd686adb.1393256563.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Feb 2014 12:38:50 +0000
Message-ID: <CAJTo0LaOaN-wMhKPn2AgHyXvrUe5GJNTremFR2pQCGDOxp3Epg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] archiver.bbclass: refactor it
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
X-List-Received-Date: Tue, 25 Feb 2014 12:39:12 -0000
Content-Type: text/plain; charset=UTF-8

On 24 February 2014 15:56, Robert Yang <liezhi.yang@windriver.com> wrote:
> 1) unpacked source: ARCHIVER_MODE[src] = "unpacked"

Why does this re-archive the unpacked sources?  When the source is a
tarball, there's already a tarball in DL_DIR.  Only if the source
isn't a tarball does it need to be packed up.

Ross

