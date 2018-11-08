Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B7FC26C149
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 22:50:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2018 14:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,481,1534834800"; d="scan'208";a="87797929"
Received: from yngiam-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.68.155])
	by orsmga007.jf.intel.com with ESMTP; 08 Nov 2018 14:50:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Scott Rifenbark <srifenbark@gmail.com>
Date: Fri, 09 Nov 2018 11:50:01 +1300
Message-ID: <1625935.REkM3HMYJn@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <6194709.vnUpm0U1CA@localhost.localdomain>
References: <2829165.0Ht5z2aexs@localhost.localdomain>
	<4820003.uEWOQMMmpA@localhost.localdomain>
	<6194709.vnUpm0U1CA@localhost.localdomain>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [yocto] 2.6 migration guide
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
X-List-Received-Date: Thu, 08 Nov 2018 22:50:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 9 November 2018 11:41:42 AM NZDT Paul Eggleton wrote:
> You could accomplish the latter using PACKAGECONFIG_pn-python3 = "pgo" at
> the configuration level 

Oops, I meant PACKAGECONFIG_remove_pn-python3 = "pgo" here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



