Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 739FE731E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 13:36:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 07 Jan 2016 05:36:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,533,1444719600"; d="scan'208";a="25148140"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 07 Jan 2016 05:36:44 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id 9FFCA6A4006; Thu,  7 Jan 2016 06:24:42 -0800 (PST)
Received: from 10.252.19.48 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 7 Jan 2016 16:24:42 +0200 (EET)
Message-ID: <52109.10.252.19.48.1452176682.squirrel@linux.intel.com>
In-Reply-To: <CAJTo0LZKb6T8xPMJfeVc=0AkFkr2ZV91f5AydZrqMqeym9XRDQ@mail.gmail.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJTo0LZKb6T8xPMJfeVc=0AkFkr2ZV91f5AydZrqMqeym9XRDQ@mail.gmail.com>
Date: Thu, 7 Jan 2016 16:24:42 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Burton, Ross" <ross.burton@intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update to 3.11.0
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
X-List-Received-Date: Thu, 07 Jan 2016 13:36:44 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> This fails to build on real PPC hardware such as p1022ds or mpc8315e-rdb:
>
> Any ideas?  Of interest is that it's always the ptest compilation that
> breaks.


I guess this patch should not have been dropped:

>> remove-ppc-tests-failing-build.patch removed because it no longer
>> applies,
>> and rebasing it
>> requires building with special ppc32 machine configurations; qemuppc
>> build
>> is fine without it.

I can bring it back, but where can I find the latest versions of the
commits (there's been additional fixes since my initial patch), so I can
base off that?

Alex

