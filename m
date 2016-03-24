Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id C70FE6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 10:27:43 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 8BD2368A01B; Thu, 24 Mar 2016 10:27:43 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id BF05D68A019;
	Thu, 24 Mar 2016 10:27:42 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 361276740554;
	Thu, 24 Mar 2016 11:27:42 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <56F3B739.3030108@mlbassoc.com>
	<CAJTo0LZWmp7iqE22miPiq2Sp+oNUYzGtU-YR=7ZGiA3QjDaRbg@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56F3C11E.5000204@mlbassoc.com>
Date: Thu, 24 Mar 2016 11:27:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZWmp7iqE22miPiq2Sp+oNUYzGtU-YR=7ZGiA3QjDaRbg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Change in udev
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
X-List-Received-Date: Thu, 24 Mar 2016 10:27:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-24 11:23, Burton, Ross wrote:
>
> On 24 March 2016 at 09:45, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     Is this [somehow] equivalent to the old udev device cache?
>     Does it really belong in /etc/udev?  What about read-only roots?
>
>
> An update to current master will help: the file is generated at build time and in a separate package so if you don't
> need it you can not install it.

More recent than poky:2df514bfe4a911c0dca8828038dd94e6265f50ca?

(I just updated a few hours ago)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

