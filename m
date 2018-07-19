Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 1715F745F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 06:48:16 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 8631115CB;
	Thu, 19 Jul 2018 08:48:16 +0200 (CEST)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180717093523.5582-1-dv@pseudoterminal.org>
	<461ba09d-eb1e-7278-9b44-e42732e11df4@intel.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <59c23314-c471-a22e-7c1c-3ba7f0ef39a4@pseudoterminal.org>
Date: Thu, 19 Jul 2018 08:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <461ba09d-eb1e-7278-9b44-e42732e11df4@intel.com>
Subject: Re: [PATCH 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 06:48:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Back when I first wrote meta-gstreamer1.0, I made the decision to 
include packageconfigs for the two most used and most important set of 
layers, oe-core and meta-openembedded. Packageconfigs whose dependencies 
are in oe-core are enabled by default, those who aren't in oe-core but 
in meta-openembedded are disabled by default.

I did that because including packageconfigs for all sorts of layers made 
things complicated very fast. Plus, these two layers are kept up to date 
and are reviewed, which is not necessarily true for other layers. And, 
other layers may be much more specific to certain distros, BSPs, 
frameworks than these two.

Here's an example. libvisual is in meta-debian and meta-qt5-extra. Why 
should I have to include these much more specific layers to use a 
packageconfig that isn't specific to debian or qt5?

I'd actually prefer a libvisual recipe in meta-openembedded, with 
bbappens in these two layers to customize it for their needs.


On 2018-07-19 03:38, Anuj Mittal wrote:
> On 07/17/2018 05:35 PM, Carlos Rafael Giani wrote:
>> * There is no libvisual recipe in oe-core or in meta-openembedded, so
>>    the visual packageconfig needs to go
> What is the benefit of removing it as compared to just letting it be
> present as a configurable option which isn't enabled by default and is
> still valid? It might be needed by layers outside of
> oe-core/meta-openembedded ...
>
> It was added specifically in a commit and I see a recipe present when I
> search on layers.openembedded.org.
>
> Thanks,
>
> Anuj


