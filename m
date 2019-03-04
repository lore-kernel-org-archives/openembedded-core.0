Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B84167C833
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 20:17:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2019 12:17:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,441,1544515200"; d="scan'208";a="324137565"
Received: from sdhavala-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.73.52])
	by fmsmga006.fm.intel.com with ESMTP; 04 Mar 2019 12:17:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Tue, 05 Mar 2019 09:17:13 +1300
Message-ID: <3413405.x9v3DxCAyA@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
Subject: Re: [master][PATCH] standard.py: Provide an additional option for devtool reset
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
X-List-Received-Date: Mon, 04 Mar 2019 20:17:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 8 February 2019 2:57:32 PM NZDT Sai Hari Chandana Kalluri wrote:
> The devtool reset command cleans the sysroot for a recipe in workspace.
> It also removes the append file but leaves the source code as in
> workspace. The source is not cleaned intentionally and the user has to
> manually remove it before calling devtool modify again.
> 
> Provide the user with an option to remove the source code from workspace
> by adding a flag to the devtool reset command. The --rm-source option for
> the devtool reset command will also clean the source code from the
> workspace along with the sysroot and the append file.
> Ex: devtool reset --rm-source zip or devtool reset -r zip

When I wrote this I made a conscious decision not to delete the source, in 
case the user has unsaved work in the source tree; at least then the user has 
to take an explicit step (an additional rm -rf) in order to delete it. You 
might argue that adding an option is the same as that explicit step, but I am 
still hesitant as you might for example pick a previously used command from 
your command history with -r in it and only realise after you've run it that 
you've just blown away a bunch of your work.

However, I have received the feedback from a number of people that they find 
it annoying that they have to delete the source themselves before being able 
to run devtool on the recipe again. I'd like to hear from the wider community 
on the following two questions:

1) Does the convenience of having this kind of option outweigh the potential 
danger of deleting unsaved work?

2) Are there issues that anyone is experiencing that force you to run devtool 
clean/finish and then re-run devtool modify (or add, or upgrade), making this 
kind of situation come up more frequently? Or is it mostly that the source 
directories end up being left around to stumble over some time later?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



