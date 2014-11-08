Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B865A65D58
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 02:09:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA829tmm028220
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 18:09:55 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 18:09:54 -0800
Message-ID: <545D7B72.6090909@windriver.com>
Date: Fri, 7 Nov 2014 20:09:54 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1415388117-227154-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LapReh=rJ1t21B-0SqPHZ84r+a-inJFykxsb1Hmuo+y=g@mail.gmail.com>
In-Reply-To: <CAJTo0LapReh=rJ1t21B-0SqPHZ84r+a-inJFykxsb1Hmuo+y=g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix intermittent failures during configure
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
X-List-Received-Date: Sat, 08 Nov 2014 02:10:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/14, 6:18 PM, Burton, Ross wrote:
> Hi Mark,
>
> On 7 November 2014 19:21, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
>
>     If configure or any of the components it uses from the shared work directory
>     change, do_configure may fail.
>
>     An existing do_preconfigure was created to handle these conditions, but
>     a 'sed' operation was missed, and a call to gnu-configize was also missed.
>
>
> This doesn't apply to master, can you rebase?

This was sent from oe-core master, previous commit:

dd93b3a950d063f4e3020362c636006f51fb5782

I have no idea why it wouldn't apply.


On the off chance the mailer ate it:

git.yoctoproject.org/poky-contrib  mhatle/oe-core

--Mark

> Cheers,
> Ross


