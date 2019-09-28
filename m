Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 033207DD6C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:00:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x8SM0aCR028041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 28 Sep 2019 15:00:36 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 28 Sep 2019 15:00:36 -0700
To: Chandana Kalluri <ckalluri@xilinx.com>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <MWHPR02MB2576ADF2408BAAF0BF27D82BB0810@MWHPR02MB2576.namprd02.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b02b2cf7-cd9c-5ff5-d3f6-a09f4cdf2b4b@windriver.com>
Date: Sat, 28 Sep 2019 18:00:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <MWHPR02MB2576ADF2408BAAF0BF27D82BB0810@MWHPR02MB2576.namprd02.prod.outlook.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: Xilinx/meta-jupyter layer
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
X-List-Received-Date: Sat, 28 Sep 2019 22:00:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/27/19 4:12 PM, Chandana Kalluri wrote:
> Hello all,
> 
> https://github.com/Xilinx/meta-jupyter is a meta-jupyter layer containing recipes for jupyter notebook. The initial recipes are based of Dmitry Kargin's meta-jupyter layer https://layers.openembedded.org/layerindex/branch/master/layer/meta-jupyter/. This layer has not been updated for a while.
> 
> The Xilinx/meta-jupyter layer also adds recipes for python3 based notebooks apart from existing python2 based notebooks.
> This layer has been tested using Yocto thud layer and  by running jupyter notebooks on Ultra96 community boards.
> We would like to maintain Xilinx/meta-jupyter  layer actively and welcome contributions to this layer either through pull requests or via patches sent to meta-xilinx mailing list until a mailing list for meta-jupyter is in place. In the next cycle we will deprecate python2 recipes.
> 
> A question to community,
>   - Would you recommend maintaining this layer separately in the current github.com/Xilinx location or be included under meta- openembedded layers.
I suppose a seperate layer since jupyter isn't typically used
but I don't have a strong opinion either way.

> - Would you suggest having a separate mailing list ?

Using the Yocto email list would be my preference.
That way, I'd keep on eye on Jupyter from time to time
whereas if it's a separate list, I likely would not subscribe.
I'm assuming that there will be less than few 100 emails per year.

../Randy


> 
> Thanks,
> Chandana
> 


-- 
# Randy MacLeod
# Wind River Linux

