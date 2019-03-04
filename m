Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 110167C85A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 19:41:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2019 11:41:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,441,1544515200"; d="scan'208";a="325342112"
Received: from sdhavala-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.73.52])
	by fmsmga005.fm.intel.com with ESMTP; 04 Mar 2019 11:41:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 05 Mar 2019 08:41:19 +1300
Message-ID: <22822545.NfYV18ESsm@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1544834362-5755-1-git-send-email-jaewon.lee@xilinx.com>
References: <1544834362-5755-1-git-send-email-jaewon.lee@xilinx.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Support kmeta directory usage with devtool modify/finish
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
X-List-Received-Date: Mon, 04 Mar 2019 19:41:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, 15 December 2018 1:39:22 PM NZDT Jaewon Lee wrote:
> When using Kmeta directories, devtool finish will add every single file
> in the directory to the bbappend. This is because in the current
> implementation, the get_recipe_local_files function treats the kmeta
> directory like a file. Modifying the function to loop through the
> provided directories and return all included files instead of just the
> top level directory. This will enable correct file to file comparison
> when determing which files are new/changed and need to be added to the
> bbappend.
> 
> Adding an extra check in devtool-source.bbclass to not copy the cfg file
> if its already included somewhere in the kmeta directory
> 
> Also during 'modify', when moving necessary files in the kmeta directory
> from the workdir to oe-local-files, the dangling parent directories are
> left behind.  This in itself is not an issue as the temporary devtool
> workspace is automatically deleted, but this causes an incorrect include
> directory to be added in kernel-yocto.bbclass.  Changing the order of
> the if statements to catch the correct conditional. This is safe to do
> as when not in the devtool context, there will be no oe-local-files
> directory.

Looks good to me. My apologies for the extreme delay in reviewing.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>


-- 

Paul Eggleton
Intel Open Source Technology Centre



