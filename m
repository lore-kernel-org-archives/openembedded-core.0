Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 344637797E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 13:03:14 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id A7CA868A01A; Mon, 20 Mar 2017 13:03:15 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 4660C68A019;
	Mon, 20 Mar 2017 13:03:13 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id F1AE567402A4;
	Mon, 20 Mar 2017 14:03:12 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <597a60bd-e1a7-c832-3f95-13464ca8ebd2@mlbassoc.com>
	<1490012507.6396.173.camel@intel.com>
	<6355a5b0-7381-332c-1d0c-765da860b695@mlbassoc.com>
	<CAJTo0LaXNHKyTSBBaOdMvywPUE1iER=NNrown=pB7SLf0U3HKg@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <7c9db05c-d034-4354-e234-88a7fd55111d@mlbassoc.com>
Date: Mon, 20 Mar 2017 14:03:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaXNHKyTSBBaOdMvywPUE1iER=NNrown=pB7SLf0U3HKg@mail.gmail.com>
Subject: Re: Error after updating Poky
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
X-List-Received-Date: Mon, 20 Mar 2017 13:03:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-20 13:58, Burton, Ross wrote:
>
> On 20 March 2017 at 12:50, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     Thanks, that did fix it.
>
>     I see that those recipe-sysroot* trees are kept around (I don't run rm_work)
>     For one of my builds which has ~475 packages in tmp/work, they amount to 7GB
>     Is there any way to prune them?
>
>
> It's all hardlinks, so be careful how you count.

I didn't realize that!  Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

