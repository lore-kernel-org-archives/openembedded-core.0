Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id BF5FD601F6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jul 2016 06:32:58 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 28CD268A01A; Sat,  2 Jul 2016 07:32:58 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 70A6068A019;
	Sat,  2 Jul 2016 07:32:58 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 1CEC567400DB;
	Sat,  2 Jul 2016 08:32:58 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1467376136-19506-1-git-send-email-ross.burton@intel.com>
	<1467376136-19506-2-git-send-email-ross.burton@intel.com>
	<CAMKF1spyK+oAN03A6FNM-nqjoU53wDDYnQiVr6J4+956xUmsBQ@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5777601A.8040409@mlbassoc.com>
Date: Sat, 2 Jul 2016 08:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spyK+oAN03A6FNM-nqjoU53wDDYnQiVr6J4+956xUmsBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gcc: remove GCC 4.9
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
X-List-Received-Date: Sat, 02 Jul 2016 06:32:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-01 16:36, Khem Raj wrote:
> I am ok with this patch. If someone intends to keep using gcc 4.9 with
> 2.2, please speak up.

I am still [very much] using 4.9.  I'm happy to use my own layer to
support this - what file(s) do I need to have to clone this?

>
> On Fri, Jul 1, 2016 at 5:28 AM, Ross Burton <ross.burton@intel.com> wrote:
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-4.9.inc              |  141 -
   ...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

