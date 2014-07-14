Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B97970394
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 20:04:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6EK4n4j005354
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 13:04:50 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Jul 2014 13:04:49 -0700
Message-ID: <53C437E1.1020600@windriver.com>
Date: Mon, 14 Jul 2014 15:04:49 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1405330780.git.liezhi.yang@windriver.com>	<965b510cf2d609b1fac50901312b3372d4e063a5.1405330780.git.liezhi.yang@windriver.com>	<CAJTo0LYg5msYt02t9a6xaOtW0opqvgrC1YZesCb3FjOL7WSFDA@mail.gmail.com>
	<53C4048D.7090006@windriver.com>
In-Reply-To: <53C4048D.7090006@windriver.com>
Subject: Re: [PATCH 2/2] package.bbclass: convert file depends into pkg depends
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
X-List-Received-Date: Mon, 14 Jul 2014 20:04:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/14, 11:25 AM, Robert Yang wrote:
>
> Hello,
>
> Found that eglibc-utils/usr/bin/tzselect is a bash script, should we
> add:
>
> RDEPENDS_eglibc-utils += "bash" ?
>
> The problem is that this would cause bash installed to meta-toolchain,
> the dependencies chain is:
>
> meta-toolchain -> eglibc-utils -> bash
>
> Maybe we should only warn rather than add the RDEPENDS atm, please ?

Hmm at one point I thought someone has re-written tzselect as posix sh, to avoid 
the bash dependency.

I'd actually suggest this be a defect and we try to find someone who can fix it. 
  (I'd like to eliminate bash dependencies in anything core to a tiny system.)

--Mark

> // Robert
>
> On 07/14/2014 06:29 PM, Burton, Ross wrote:
>> On 14 July 2014 10:41, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> +    prog_maps = {"/bin/bash": "bash", "/usr/bin/perl": "perl", "/usr/bin/python": "python"}
>>
>> Use something like d.expand("${bindir}/perl") instead of hard-coding paths.
>>
>> Ross
>>
>>


