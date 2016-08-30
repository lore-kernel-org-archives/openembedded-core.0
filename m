Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46AF260017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 06:27:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7U6RQSI025032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Aug 2016 23:27:26 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 29 Aug 2016 23:27:26 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
	<c88973ed-e7e3-e808-f57a-78dcc1dc53fb@linux.intel.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57C52669.3000505@windriver.com>
Date: Tue, 30 Aug 2016 14:23:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <c88973ed-e7e3-e808-f57a-78dcc1dc53fb@linux.intel.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: Review request 0/21: ltp: add libwww-perl-perl to RDEPENDS
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
X-List-Received-Date: Tue, 30 Aug 2016 06:27:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年08月29日 19:52, Alexander Kanavin wrote:
> On 08/29/2016 05:16 AM, mingli.yu@windriver.com wrote:
>> The series add libwww-perl-perl to RDEPENDS for ltp as
>> STPfailure_report.pl provided by ltp depends
>> on LWP/Simple.pm which is provided by libwww-perl-perl
>
> You are adding 20 new recipes, just to support something in a single
> perl script in a single project. Please investigate, what is that
> something, is it truly needed in oe-core context, and can it be
> disabled, patched out or rewritten so that it doesn't pull in this
> massive list of dependencies.

Thanks Alex for your comments!
1, Have double checked the script STPfailure_report.pl history from the 
ltp repo(git://github.com/linux-test-project/ltp.git), it is added as
a tool to analyze failures from LTP runs on the OSDL's Scaleable Test 
Platform (STP) as below:

commit f0573facbbbf14798cc5b7d4653a5e46b4b95fa5
Author: robbiew <robbiew>
Date:   Wed Apr 28 19:21:39 2004 +0000

     Added tool for analyzing failures from LTP runs on the OSDL's 
Scaleable Test Platform (STP)

2, And go through the contents of the script STPfailure_report.pl and it 
mainly needs to access http://khack.osdl.org to retrieve ltp test 
results run on OSDL's Scaleable Test Platform (STP) and print the 
reports, and now the website http://khack.osdl.org not accessible.

So we don't need to add so many new recipes for dependencies for this 
script STPfailure_report.pl.

Sorry for noise, please ignore it.

And will reorganize the logic to resend another patch not deploy this 
script to our system to avoid confusing about this script fails to run.

Thanks,
Grace

>
> Alex
>

