Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C41460667
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 18:42:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 18 Mar 2016 11:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,356,1455004800"; d="scan'208";a="672030670"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2016 11:42:04 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 92BC16A4007; Fri, 18 Mar 2016 12:29:49 -0700 (PDT)
Received: from 10.252.7.138 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 18 Mar 2016 21:29:49 +0200 (EET)
Message-ID: <51561.10.252.7.138.1458329389.squirrel@linux.intel.com>
In-Reply-To: <CALbNGRQJGWRmXdBnCDVa9X=S5n_VrtycaKrWa=UpBf_mJOt3RA@mail.gmail.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSZXjynMUy2B3Ke9k4g=DwFnhb2eO=xpJj4fGXHT2HBMw@mail.gmail.com>
	<56E8315D.2080906@linux.intel.com>
	<CAMKF1srbyaUBZO0Lu49x0FKoZR+-6CQcMX6h5ze8r4z9Yu6oHw@mail.gmail.com>
	<53372.10.252.1.171.1458080995.squirrel@linux.intel.com>
	<CALbNGRQwKQpougA7Jus51MKUsC=TmAiqf0mptLUebeodsB6_yA@mail.gmail.com>
	<56781.10.252.1.171.1458145410.squirrel@linux.intel.com>
	<CALbNGRQJGWRmXdBnCDVa9X=S5n_VrtycaKrWa=UpBf_mJOt3RA@mail.gmail.com>
Date: Fri, 18 Mar 2016 21:29:49 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: Andreas =?iso-8859-1?Q?M=C3=BCller?= <schnitzeltony@googlemail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/24] python3-native: use the previous version of python-config script
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
X-List-Received-Date: Fri, 18 Mar 2016 18:42:05 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Thanks for explanation and sorry for shouting out - I'll rework that
> recipe to use pkg-config as it is interested in version of python's
> libraries - not the interpreter scripts are running on.

You're welcome. Changing to use pkg-config is really the best way out -
the python-config stuff and support for python runtimes in general in
oe-core is a very old pile of kludges that nobody understands very well.
We have an open issue to refactor/tidy it up:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9212

Alex

