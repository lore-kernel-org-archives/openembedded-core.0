Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C47772C25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 01:31:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0J1VTgA024145
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 18 Jan 2015 17:31:29 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 18 Jan 2015 17:31:28 -0800
Message-ID: <54BC5E6E.3080703@windriver.com>
Date: Mon, 19 Jan 2015 09:31:26 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1421044647.git.Chong.Lu@windriver.com>
	<b2a5af309a2b2e6b23070ae2f2343e39b12a52df.1421044647.git.Chong.Lu@windriver.com>
	<2031560.2Rc0YuEC5v@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2031560.2Rc0YuEC5v@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] bitbake-layers: add a ability to query layer dependencies from layer index
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
X-List-Received-Date: Mon, 19 Jan 2015 01:31:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/15/2015 10:20 PM, Paul Eggleton wrote:
> Hi Chong,
>
> On Monday 12 January 2015 14:48:42 Chong Lu wrote:
>> It maybe depends on other layers when one layer is added to BBLAYERS. If
>> define LAYERDEPENDS variable in this layer, we will get error from bitbake.
>> But sometimes, we don't have defined. Add a mechanism to extend
>> bitbake-layers and it will query layer dependencies from layer index
>> (http://layers.openembedded.org/layerindex/api/)
>> Use `bitbake-layers show-layer-dependencies' to find out dependencies and
>> update bblayers.conf as appropriate.
> OK, so this is actually a patch against bitbake and thus should be sent to the
> bitbake mailing list instead.
>
> Having said that, I have looked over the code. This is definitely a step in the
> right direction, however I would make the following comments:
>
> 1) Since this is for bitbake we can't really have hardcoded references to the
> OE layer index in the code. I'd suggest we have bitbake-layers query a
> variable e.g. BITBAKE_LAYERINDEX_URL, and then separately patch OE to set that
> from conf/bitbake.conf. (It should also give a sensible error if the variable
> isn't set for some reason.)
>
> 2) I think this could be a bit more practical in terms of usage. As described
> in the bug I was thinking of a command for which you would specify the name of
> a layer you wanted to use, and then bitbake-layers would call the layer index,
> find the specified layer and all of its dependencies, fetch them, then add them
> to bblayers.conf. This kind of does the first part but leaves the rest to the
> user - I think we can go a bit further than that. FWIW as you may have seen I
> did just add some code to make clean modifications to bblayers.conf which may
> be useful for part of this.
>
> For #2 there may be a slight problem to solve, which is that whatever
> equivalent of OE-Core you have on your local disk needs to be considered
> equivalent to the "oe-core" layer in the layer index so you don't end up
> adding that. Toaster has solved this same issue, but in a way that won't work
> here, so we might have to figure out an alternative solution.
>
> Cheers,
> Paul
>

OK. I will modify this and resend one to bitbake mail list.

Best Regards
Chong


