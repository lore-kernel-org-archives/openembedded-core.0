Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DFBAF71BF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 20:16:32 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 12:16:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,443,1505804400"; d="scan'208";a="152558495"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga004.jf.intel.com with ESMTP; 23 Nov 2017 12:16:33 -0800
Date: Thu, 23 Nov 2017 14:25:55 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Message-ID: <20171123142555.69a1932d@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <D9EA3C8D-7E13-452D-847E-70A8B45402B7@linux.intel.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
	<20171123183755.2786.77539@do.openembedded.org>
	<51B97520-F81D-4567-A4EB-17D52CE2968A@linux.intel.com>
	<EE6427AE-250D-4EB7-A63A-14AAD7B226FD@linux.intel.com>
	<D9EA3C8D-7E13-452D-847E-70A8B45402B7@linux.intel.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEFkZCBweXBpLmJiY2xhc3M7IHB5dGhvbiBpbXByb3ZlbWVudHM=?=
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
X-List-Received-Date: Thu, 23 Nov 2017 20:16:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Nov 2017 12:48:32 -0700
Tim Orling <timothy.t.orling@linux.intel.com> wrote:

> I stand corrected. When I try to apply the mbox file from patchwork it th=
rows:
>=20
> error: patch fragment without header at line 147: @@ -172,6 +172,10 @@ SU=
MMARY_${PN}-png                                                            =
                      util=3D"Python package extension utility support=E2=
=80=9D
>=20
> My guess is this is because the manifest files have lines that are 2500+ =
characters long.

right, that is the problem.

Did you have any trouble when sending this series through git-send-email? L=
ong patches are truncated (not really sure by who) but at the end patchtest=
 gets the truncated version from patchwork leading to this error.


