Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BCE06D726
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 14:44:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rALEiY6u029367
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 06:44:34 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 06:44:34 -0800
Message-ID: <528E1C52.2020307@windriver.com>
Date: Thu, 21 Nov 2013 08:44:34 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1385017169-22068-1-git-send-email-mark.hatle@windriver.com>	<1385035973.23724.146.camel@phil-desktop.brightsign>	<528DFB88.5080404@windriver.com>
	<1385037621.23724.149.camel@phil-desktop.brightsign>
In-Reply-To: <1385037621.23724.149.camel@phil-desktop.brightsign>
Subject: Re: [RFC PATCH] bind: add support for read-only rootfs
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
X-List-Received-Date: Thu, 21 Nov 2013 14:44:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/13, 6:40 AM, Phil Blundell wrote:
> On Thu, 2013-11-21 at 20:24 +0800, ChenQi wrote:
>> The purpose is to disable bind in a read-only file system by default.
>> But if user really wants it, they can set this value to 'yes'.
>
> I'm still struggling a bit to understand the reasoning here.  Why would
> you install bind in the first place if you didn't want it to be enabled?

Why do people use core-image-sato, and then try to remove python?

Sorry for the snarkiness, but that's what is being avoided here.

I have to send these patches, due to the YP compliance guidelines, which is why 
this is an RFC and not something I'm suggesting for the actual oe-core.. (since 
the patch it depends on was not accepted.)

--Mark

> p.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


