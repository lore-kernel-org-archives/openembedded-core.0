Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 043F9719E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 16:03:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 03 Nov 2016 09:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,587,1473145200"; d="scan'208";a="897350093"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 03 Nov 2016 09:03:52 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
Date: Thu, 3 Nov 2016 18:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
Subject: using devtool for rebasing patches
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
X-List-Received-Date: Thu, 03 Nov 2016 16:03:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Paul,

it would be very useful if devtool offered support for rebasing source 
patches when they fail to apply, but currently there does not seem to be 
any such feature:

ak@kanavin-desktop:~/development/poky/build$ devtool modify libksba
Parsing recipes..done.
NOTE: Fetching libksba...
NOTE: Unpacking...
NOTE: Patching...
ERROR: Applying 'ksba-add-pkgconfig-support.patch' failed:
checking file Makefile.am
Hunk #1 FAILED at 21.
1 out of 1 hunk FAILED
checking file configure.ac
Hunk #1 succeeded at 414 (offset 14 lines).
checking file ksba.pc.in
checking file src/ksba.m4
ERROR: Function failed: patch_do_patch
ak@kanavin-desktop:~/development/poky/build$

What devtool could do here is apply the patches that can be applied and 
then partially apply the patches that fail. Then give the developer some 
kind of UI for dealing with the rejected hunks (which typically means 
finding the place in the target file where the changes should go and 
then manually editing them in, while looking at the original patch).

Without this feature devtool is half as useful as it could be 
particularly for recipe version updates.

Thanks,
Alex

