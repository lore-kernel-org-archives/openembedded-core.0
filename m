Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id C58766C0EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 22:36:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Sep 2019 15:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,568,1559545200"; d="scan'208";a="274811257"
Received: from hanshuan-mobl1.gar.corp.intel.com (HELO linux.fritz.box)
	([10.249.65.161])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2019 15:36:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dmitry Kargin <dmitry.n.kargin@gmail.com>,
	Chandana Kalluri <ckalluri@xilinx.com>,
	Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Date: Tue, 01 Oct 2019 11:36:42 +1300
Message-ID: <2678038.QAzkJJSIsR@linux.fritz.box>
Organization: Intel Corporation
In-Reply-To: <CAFCaPfyh14v2HPZ8vNDoeVM18XtAiK9zOCJT3_1Wrh5BHOpH-w@mail.gmail.com>
References: <MWHPR02MB2576ADF2408BAAF0BF27D82BB0810@MWHPR02MB2576.namprd02.prod.outlook.com>
	<CAFCaPfyh14v2HPZ8vNDoeVM18XtAiK9zOCJT3_1Wrh5BHOpH-w@mail.gmail.com>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Xilinx/meta-jupyter layer
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
X-List-Received-Date: Mon, 30 Sep 2019 22:36:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

FYI I've just changed the layer index entry to point to the new repo. New 
content should be indexed in a few hours.

Thanks for working this out!

Dmitry: sorry, for clarity did you mean a separate mailing list or one of the 
YP / OE ones ?

Cheers,
Paul

On Saturday, 28 September 2019 9:52:26 AM NZDT Dmitry Kargin wrote:
> Nice job!
> 
> You have my permission, if it is needed to change
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-jupyter/
> links to your repository.
> 
> >Would you recommend maintaining this layer separately or...
> I'd like to keep it separately from meta- and openembedded.
> 
> >Would you suggest having a separate mailing list
> meta-jupyter mailing list is fine.
> 
> On Fri, 27 Sep 2019 at 23:12, Chandana Kalluri <ckalluri@xilinx.com> wrote:
> 
> > Hello all,
> >
> > https://github.com/Xilinx/meta-jupyter is a meta-jupyter layer containing
> > recipes for jupyter notebook. The initial recipes are based of Dmitry
> > Kargin's meta-jupyter layer
> > https://layers.openembedded.org/layerindex/branch/master/layer/meta-jupyter/.
> > This layer has not been updated for a while.
> >
> > The Xilinx/meta-jupyter layer also adds recipes for python3 based
> > notebooks apart from existing python2 based notebooks.
> > This layer has been tested using Yocto thud layer and  by running jupyter
> > notebooks on Ultra96 community boards.
> > We would like to maintain Xilinx/meta-jupyter  layer actively and welcome
> > contributions to this layer either through pull requests or via patches
> > sent to meta-xilinx mailing list until a mailing list for meta-jupyter is
> > in place. In the next cycle we will deprecate python2 recipes.
> >
> > A question to community,
> >  - Would you recommend maintaining this layer separately in the current
> > github.com/Xilinx location or be included under meta- openembedded layers.
> > - Would you suggest having a separate mailing list ?
> >
> > Thanks,
> > Chandana
> >
> >
> 


-- 

Paul Eggleton
Intel Open Source Technology Centre



