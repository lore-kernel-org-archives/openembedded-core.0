Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F1A437976D;
	Fri,  7 Sep 2018 05:15:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Sep 2018 22:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,340,1531810800"; d="scan'208";a="78638272"
Received: from sablum-mobl1.amr.corp.intel.com ([10.254.180.208])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Sep 2018 22:13:39 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Message-Id: <2106BCC9-BFE5-4E40-979E-59B3D62022EB@linux.intel.com>
Date: Thu, 6 Sep 2018 22:13:39 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: [WIP] perl upgrade to 5.26.2
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
X-List-Received-Date: Fri, 07 Sep 2018 05:15:03 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

A while ago, I began to work on upgrading perl to 5.26.2. I am sharing =
what I have in case anyone else wants to continue the effort. As I =
remember it, this at least passes do_patch, but fails in do_compile. =
YMMV.

=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dtimo/per=
l-5.26.2&id=3D610991e483d2cf6a6b82322406630ed30547e844=

