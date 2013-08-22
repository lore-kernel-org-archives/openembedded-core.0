Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D6CE3608A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:30:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2013 10:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="366922424"
Received: from dvhart-mobl3.amr.corp.intel.com (HELO [10.7.201.147])
	([10.7.201.147])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2013 10:29:58 -0700
Message-ID: <1377192596.5259.8.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 22 Aug 2013 10:29:56 -0700
In-Reply-To: <0fdd588a60edecc0aa11bfbb3ac8eb3d56a2b940.1377175027.git.liezhi.yang@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
	<0fdd588a60edecc0aa11bfbb3ac8eb3d56a2b940.1377175027.git.liezhi.yang@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] e2fsprogs: add populate-extfs.sh
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
X-List-Received-Date: Thu, 22 Aug 2013 17:30:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-22 at 09:13 -0400, Robert Yang wrote:
> This script is originally from Darren Hart, it will be used for creating
> the ext* filesystem from a given directory, which will replace the
> genext2fs in image_types.bbclass at the moment, we may use the mke2fs to
> replace this script again when it has the initial directory support.
> 
> Changes of the script:
> * Rename it from mkdebugfs.sh to populate-extfs.sh
> * Add a simple usage
> * Add checking for the number of the parameters
> * Add the "regular empty file" and "fifo" file type
> * Set mode, uid and gid for the file
> * Save the command lines to a file and batch run them
> * Change the error message
> * Improve the performance
> * Add the support for hardlink
> 
> [YOCTO #3848]

> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>


Ted has offered to add this to the contrib dir for the ext2 tools. This
is fine to add to yocto, but we should contribute this back upstream as
well.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



