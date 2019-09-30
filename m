Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 753A37CDAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 14:39:17 +0000 (UTC)
Received: from Marks-MacBook-Pro.local ([76.164.61.198]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id x8UEd6dK023880
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Mon, 30 Sep 2019 09:39:14 -0500
To: Chandana Kalluri <ckalluri@xilinx.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <MWHPR02MB2576ADF2408BAAF0BF27D82BB0810@MWHPR02MB2576.namprd02.prod.outlook.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <29d6d028-16a8-b958-83ab-23e9ec581947@kernel.crashing.org>
Date: Mon, 30 Sep 2019 09:39:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <MWHPR02MB2576ADF2408BAAF0BF27D82BB0810@MWHPR02MB2576.namprd02.prod.outlook.com>
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
X-List-Received-Date: Mon, 30 Sep 2019 14:39:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/27/19 3:12 PM, Chandana Kalluri wrote:
> Hello all,
> 
> https://github.com/Xilinx/meta-jupyter is a meta-jupyter layer containing recipes for jupyter notebook. The initial recipes are based of Dmitry Kargin's meta-jupyter layer https://layers.openembedded.org/layerindex/branch/master/layer/meta-jupyter/. This layer has not been updated for a while. 
> 
> The Xilinx/meta-jupyter layer also adds recipes for python3 based notebooks apart from existing python2 based notebooks.
> This layer has been tested using Yocto thud layer and  by running jupyter notebooks on Ultra96 community boards. 
> We would like to maintain Xilinx/meta-jupyter  layer actively and welcome contributions to this layer either through pull requests or via patches sent to meta-xilinx mailing list until a mailing list for meta-jupyter is in place. In the next cycle we will deprecate python2 recipes. 
> 
> A question to community,
>  - Would you recommend maintaining this layer separately in the current github.com/Xilinx location or be included under meta- openembedded layers.
> - Would you suggest having a separate mailing list ?

I'd suggest that you should consider either keeping it on github, or offering it
to the git.yoctoproject.org.  I can assist with this if you need.

Since this is pretty targeted to a specific use-case, either would make sense to me.

--Mark

> Thanks,
> Chandana
> 

