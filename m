Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA16A60601
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 09:18:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t089ICj2025182
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 8 Jan 2015 01:18:12 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 8 Jan 2015 01:18:11 -0800
Message-ID: <54AE4B50.6010505@windriver.com>
Date: Thu, 8 Jan 2015 17:18:08 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1420610929.git.Chong.Lu@windriver.com>
	<15bba8b20b0419737801a6c495d379afb8ed67b2.1420610929.git.Chong.Lu@windriver.com>
	<1458514.BbQ6jzxGvE@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1458514.BbQ6jzxGvE@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] layerindex.bbclass: Add ability to fetch layers from layer index
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
X-List-Received-Date: Thu, 08 Jan 2015 09:18:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/07/2015 05:20 PM, Paul Eggleton wrote:
> Hi Chong,
>
> On Wednesday 07 January 2015 14:35:42 Chong Lu wrote:
>> It maybe depends on other layers when one layer is added to BBLAYERS. If
>> define LAYERDEPENDS variable in this layer, we will get error from bitbake.
>> But sometimes, we don't have defined. Add a mechanism to fetch layers from
>> layer index and update bblayers.conf as appropriate. The layer index stores
>> dependencies of all layers. Query dependency from layer index and fetch
>> layer repo, then add this layer to BBLAYERS.
> Hmm, this is certainly interesting but not quite what I had in mind - I was
> thinking rather that bitbake-layers would be extended and it would be an
> explicit operation to add a layer from the layer index + all of its
> dependencies. We can of course also have something semi-automatic like this
> class, but the manual tool ought to come first IMHO (which the class could then
> make use of).
>
> Cheers,
> Paul

Hi Paul,

Thanks for your reply. I will try to extend bitbake-layers.

Best Regards
Chong

>


