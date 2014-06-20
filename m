Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E11C7020E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 01:33:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5K1XR48001916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 18:33:27 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 19 Jun 2014 18:33:26 -0700
Message-ID: <53A38F65.4060005@windriver.com>
Date: Thu, 19 Jun 2014 20:33:25 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <12874293.qmlQjDjeXe@yiqingliang-pc>
In-Reply-To: <12874293.qmlQjDjeXe@yiqingliang-pc>
Subject: Re: eglib is dead?
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
X-List-Received-Date: Fri, 20 Jun 2014 01:33:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/14, 7:35 PM, Yi Qingliang wrote:
> Hello,
>
> 	this morning I have seen that:
> http://www.phoronix.com/scan.php?page=news_item&px=MTcyNDY
>
> 	it said that the "eglibc" is a "dead project", and most feature had
> been merged into "glibc" at version 2.19.
>
> 	so maybe we should drop "eglibc", and switch back to "glibc"?

eglibc and glibc have been in sync since the beginning.  The only remaining 
difference between glibc and eglibc is the configurable libc interface. 
(Ability to change the configuration.)  Last time we discussed this, we were 
still trying to determine if we (OE) were going to try to keep that 
configuration active, or if were were going to go to a different libc for 'tiny' 
systems.

I don't believe a final decision has been made, but one way or another we will 
be moving to 'glibc' in the future.

My understanding is that eglibc 2.19 is still 'alive' and maintained, but will 
be the last version.

--Mark

> Yi Qingliang
> 20140620
>


