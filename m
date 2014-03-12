Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C2B086F86E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 00:11:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2014 17:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,634,1389772800"; d="scan'208";a="496583590"
Received: from unknown (HELO [10.255.12.212]) ([10.255.12.212])
	by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2014 17:10:58 -0700
Message-ID: <531FA612.4080006@linux.intel.com>
Date: Tue, 11 Mar 2014 17:10:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Purdie, Richard" <richard.purdie@intel.com>, 
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Latest Status of MUT Build
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
X-List-Received-Date: Wed, 12 Mar 2014 00:11:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Folks,

To follow-up on RP's status email, many may have noticed that we have 
been building the stage/master_under_test the last couple of days 
leading up to M4-rc1.  I think that we have a good set, the Autobuilder 
is just finishing up now.

There seems to be 2 Fedora20 related issues with the arm-lsb and ppc-lsb 
builds, these might be SELinux related based on the failures.

There was also a failure in the FSL-Arm related to qt3, that might be a 
parallel make related issue.

If I get an otherwise clean build we will likely pull the remainder of 
what's in MUT into master and fire the rc1.  This means we are about 12 
hours behind.

For the QA teams, the release will be available later tonight or on the 
morning.

I hope that the extra work going into MUT will provide us with a good RC1.

Thanks your patience

Sau!

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


