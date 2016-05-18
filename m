Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 18C376FF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:34:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2016 00:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,327,1459839600"; d="scan'208";a="983507941"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.30.141])
	by fmsmga002.fm.intel.com with ESMTP; 18 May 2016 00:34:11 -0700
Message-ID: <1463556849.3966.3.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 08:34:09 +0100
In-Reply-To: <573C0726.3040402@windriver.com>
References: <573C0726.3040402@windriver.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Cc: "Cetola, Stephano" <stephano.cetola@intel.com>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Wed, 18 May 2016 07:34:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Robert,

On Wed, 2016-05-18 at 14:09 +0800, Robert Yang wrote:
> The PRServer bumps PR according to do_package's task hash, that
> causes it bumps *all* packages' PR when recipes like pseudo-native
> and rpm-native is changed. It is a very bad user experience when we
> run "smart/opkg upgrade" on running target, for example, when we
> apply
> a CVE patch to pseudo-native or rpm-native, or do some slight changes
> in their do_compile, "smart/opkg upgrade" will download/install *all*
> the packages since all of the packages' PR are bumped.

Paul began working to address the package feed churn issue some time
back using the tool build-compare from the openSUSE project.

You can find links to various trees and a summary of the progress so
far in this bugzilla entry:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=8318

It still needs some more work; most notably I'd like to see some tests
that validates the functionality.

Regards,

Joshua

