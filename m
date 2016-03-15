Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC36601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 21:42:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2016 14:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,341,1455004800"; d="scan'208";a="924815312"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2016 14:42:10 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id D48136A4006; Tue, 15 Mar 2016 15:29:55 -0700 (PDT)
Received: from 10.252.1.171 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 16 Mar 2016 00:29:55 +0200 (EET)
Message-ID: <53372.10.252.1.171.1458080995.squirrel@linux.intel.com>
In-Reply-To: <CAMKF1srbyaUBZO0Lu49x0FKoZR+-6CQcMX6h5ze8r4z9Yu6oHw@mail.gmail.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSZXjynMUy2B3Ke9k4g=DwFnhb2eO=xpJj4fGXHT2HBMw@mail.gmail.com>
	<56E8315D.2080906@linux.intel.com>
	<CAMKF1srbyaUBZO0Lu49x0FKoZR+-6CQcMX6h5ze8r4z9Yu6oHw@mail.gmail.com>
Date: Wed, 16 Mar 2016 00:29:55 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Khem Raj" <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 15 Mar 2016 21:42:12 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> This is because python3-config does not contain the version within
>> itself,
>> it reports the version of the python interpreter that it is run with. So
>> NOTABUG.
>
> If its supposed to report the version of python pack its coming with
> and not the interpreter its run with
> then how do you decide its not a behavior change ?

Apologies for being terse. I should've explained that when building
recipes that make use of this script, it will be run with the native
python (instead of host python) because native python will come first in
the PATH, and so the version reported will be correct, because native
python will match target python. This is set up in pythonnative.bbclass
for python 2, and in python3native.bbclass for python 3.

> Lets keep the semantics as they were. I am perfectly fine to revert to
> python 3.4 if thats what it takes.

We *are* keeping semantics as they were with this patch. Python 3.4
defaults to this script, python 3.5 changes python-config to the broken
shell-based rewrite. This patch reverts back to the 3.4 behaviour.


Alex

