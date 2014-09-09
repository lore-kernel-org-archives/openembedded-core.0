Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E0179713BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:23:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Sep 2014 09:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,492,1406617200"; d="scan'208";a="588657529"
Received: from unknown (HELO [10.255.12.151]) ([10.255.12.151])
	by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2014 09:23:03 -0700
Message-ID: <1410279782.2217.14.camel@empanada.home.network>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Ola X Nilsson <ola.x.nilsson@axis.com>
Date: Tue, 09 Sep 2014 11:23:02 -0500
In-Reply-To: <4BEA3FF3CAA35E408EA55C7BE2E61D058A282B7855@xmail3.se.axis.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
	<c1491f211598384c7c659589da2c2bd90232e0af.1407533201.git.tom.zanussi@linux.intel.com>
	<4BEA3FF3CAA35E408EA55C7BE2E61D058A282B7855@xmail3.se.axis.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/35] wic: Remove 3rdparty/urlgrabber
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
X-List-Received-Date: Tue, 09 Sep 2014 16:23:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-09 at 13:48 +0200, Ola X Nilsson wrote:
> This commit breaks wic for me. 
> Urlgrabber is imported from pykickstart/version.py and pykickstart/parser.py.
> 
> Having python-urlgrabber installed in your distro hides this problem.
> 

Thanks for the report - I just posted a patch to fix this to the list -
please try it out.

Thanks,

Tom


