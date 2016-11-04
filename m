Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycard.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 89EA27199D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 11:06:09 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id A35B7A001F1;
	Fri,  4 Nov 2016 12:06:44 +0100 (CET)
Received: from [172.16.25.207] ([172.16.25.207])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016110412060965-28016 ;
	Fri, 4 Nov 2016 12:06:09 +0100 
To: "Burton, Ross" <ross.burton@intel.com>, Marek Vasut <marex@denx.de>
References: <20161102120724.30063-1-marex@denx.de>
	<CAJTo0LaoMkEMaB8LC=w_DUFcZE4AVr4ARZMWTVZNGKJu=X=dAQ@mail.gmail.com>
	<ac4a3766-6dee-2e89-141f-1eab2e4b9fa6@denx.de>
	<CAJTo0LaXYexn4cwQasj2gWvUpdO3uQFE2b81-soEnFoeM5ZdgQ@mail.gmail.com>
From: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>
Organization: PHYTEC Messtechnik GmbH
Message-ID: <581C6BBB.1040407@phytec.de>
Date: Fri, 4 Nov 2016 12:06:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaXYexn4cwQasj2gWvUpdO3uQFE2b81-soEnFoeM5ZdgQ@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.11.2016 12:06:09,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.11.2016 12:06:09,
	Serialize complete at 04.11.2016 12:06:09
X-TNEFEvaluated: 1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Fri, 04 Nov 2016 11:06:10 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252

On 03.11.2016 00:06, Burton, Ross wrote:
> On 2 November 2016 at 19:40, Marek Vasut <marex@denx.de> wrote:
> 
>>> But u-boot-common doesn't set EXTRA_OEMAKE...
>>
>> Should be u-boot.inc , sorry.
>>
> 
> Yes, but u-book-mkimage doesn't include that file. :)
> 
> Ross

I am seeing a different problem, but I guess my solution would fix this case
here, too. So I am sending it as a new thread. I hope it helps the case and
I get some discussion about the solution.

Regards, Stefan

