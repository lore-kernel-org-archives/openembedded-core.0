Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B18D86E666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 14:17:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 17 Oct 2017 07:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,391,1503385200"; d="scan'208";a="1231749721"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga002.fm.intel.com with SMTP; 17 Oct 2017 07:17:07 -0700
Date: Tue, 17 Oct 2017 09:26:56 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-Id: <20171017092656.cceee18b5f601655e0ed547c@linux.intel.com>
In-Reply-To: <20171017124339.3966-1-alexander.kanavin@linux.intel.com>
References: <20171017124339.3966-1-alexander.kanavin@linux.intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/send-recipe-update-reminders: send recipe version update reminders by email
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
X-List-Received-Date: Tue, 17 Oct 2017 14:17:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


> 
> YP used to have a much more sophisticated system called Automated
> Upgrade Helper for this, but it hasn't been heard from in several months
> and so I quickly rolled my own cheap and cheery replacement.

AUH is the system that send emails with upgrade statistics (basically the system tries to upgrade and prepare the patch if possible) and RRS is the system that sends emails reporting upgradable recipes (just those recipes that needs to upgrade). I know, a bit confusing but in your context you are referring to the RRS.

