Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5746A593
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:12:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4VFC8ru014710
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:12:08 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 31 May 2013 08:12:07 -0700
Message-ID: <51A8BDC8.4050002@windriver.com>
Date: Fri, 31 May 2013 10:12:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1369932321.14887.320.camel@ted>
	<51A78ADA.2060308@juszkiewicz.com.pl>
In-Reply-To: <51A78ADA.2060308@juszkiewicz.com.pl>
Subject: Re: Issues with gcc 4.8 sstate "contamination" on the autobuilder
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
X-List-Received-Date: Fri, 31 May 2013 15:12:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/13 12:22 PM, Marcin Juszkiewicz wrote:
> W dniu 30.05.2013 18:45, Richard Purdie pisze:
>> I want to make people aware we're seeing some issues with gcc 4.8 on the
>> autobuilder.
>
> When we are at sstate and gcc...
>
> I noticed recently that libunwind may break gcc builds:
>
> https://bugs.launchpad.net/linaro-oe/+bug/1183087
>
> The issue exists only when libunwind was built before gcc was started.
>
> To reproduce:
>
> bitbake -ccleansstate gcc libunwind
> bitbake libunwind
> bitbake gcc
>
> Did not yet found proper working solution.

Just an FYI -- I've reproduced the same issue here for an qemux86_64 machine 
using stock oe-core.

(Similarly, I don't have a solution either.)

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


