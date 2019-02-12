Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA0FC6D6EA;
	Tue, 12 Feb 2019 18:06:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1CI6Jnl015279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Feb 2019 10:06:19 -0800 (PST)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 12 Feb 2019 10:06:18 -0800
To: Felix Snow <fsnow@phoenixcontact.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <AM6PR05MB6357644B9FBDB2505BE9F0D3DB650@AM6PR05MB6357.eurprd05.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <89277db3-0af7-419d-6b49-66a8f42434e8@windriver.com>
Date: Tue, 12 Feb 2019 13:06:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <AM6PR05MB6357644B9FBDB2505BE9F0D3DB650@AM6PR05MB6357.eurprd05.prod.outlook.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: version upgrade to python-click
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
X-List-Received-Date: Tue, 12 Feb 2019 18:06:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2/12/19 5:02 AM, Felix Snow wrote:
> Hello,
> 
> it seems that the latest version of python-click in open-embedded is 6.7 :
> 
> https://layers.openembedded.org/layerindex/recipe/52136/
> 
> This was released in January 2017, but 7.0 came out in September 2018:
> 
> https://pypi.org/project/click/#history
> 
> I have had a considerable struggle with click on our embedded linux 
> around locale.
> 
> It was a hard requirement and there are were a lot of complaints prior 
> to version 7.0
> 
> Here are a few examples:
> 
> https://github.com/NixOS/nixpkgs/pull/41843
> 
> https://github.com/NixOS/nixpkgs/issues/40146
> 
> https://github.com/NixOS/nixpkgs/issues/38991
> 
> I believe they removed the hard dependency in this pull request - 
> https://github.com/pallets/click/pull/880
> 
> which went into version 7.0
> 
> If you look at the code of that request there is very little which fixes 
> this, but it would probably still be cleaner at least long term to have 
> the newer version of click than to patch that in our system.  The locale 
> issue is one of a long list of changes in 7.0 
> http://click.palletsprojects.com/en/7.x/changelog/

Thanks for pointing that out.

Can you update the recipe, test it and send a patch to:
    openembedded-devel@lists.openembedded.org
as per:
    https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

../Randy

> 
> Actually, click is not explicitly mentioned in the bb file, but 
> python-flask is, and that somehow installs click with it, I think as 
> there is another recipe for python-flask which includes click.
> 
> Cheers,
> 
> Felix
> 
> .......................................................................................
> 
> PHOENIX CONTACT Cyber Security GmbH　
> 
> Richard-Willstätter-Straße 6 　
> 
> D-12489 Berlin 　
> 
> 　
> 
> Register Court: AG Charlottenburg, HR B 202908　
> 
> Geschäftsführer/General Manager: Kilian Golm
> 
> //
> 


-- 
# Randy MacLeod
# Wind River Linux

