Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD81171D42
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 17:26:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB9HQCmS017165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Dec 2016 09:26:12 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Dec 2016 09:26:11 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20161208190327.221469-1-mark.hatle@windriver.com>
	<CAMKF1sphGgZP8-3DoPi+1Wv3DV6yDOAQW0Z5dNX=QFy16deLXA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a429c8fc-8e0c-971b-9295-4056c09a614a@windriver.com>
Date: Fri, 9 Dec 2016 11:26:10 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sphGgZP8-3DoPi+1Wv3DV6yDOAQW0Z5dNX=QFy16deLXA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Enable backtrace from abort on ARM
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
X-List-Received-Date: Fri, 09 Dec 2016 17:26:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 12/9/16 12:48 AM, Khem Raj wrote:
> On Thu, Dec 8, 2016 at 11:03 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> +do_configure_append_arm () {
>> +       echo "CFLAGS-abort.c = -funwind-tables" >> ${B}/configparms
>> +       echo "CFLAGS-raise.c = -funwind-tables" >> ${B}/configparms
>> +}
> 
> perhaps using  -fasynchronous-unwind-tables is better. can you try that out ?
> 

This passed my internal test with the same results.

So either one is fine with me.  What is the difference between the options?

--Mark

