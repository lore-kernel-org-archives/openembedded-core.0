Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 455166C894
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 11:13:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8HBE1A1021239
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 04:14:01 -0700 (PDT)
Received: from [128.224.22.106] (128.224.22.106) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 17 Sep 2013 04:14:00 -0700
Message-ID: <52383977.5080009@windriver.com>
Date: Tue, 17 Sep 2013 06:13:59 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-8-git-send-email-jason.wessel@windriver.com>
	<1379354273.1285.169.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1379354273.1285.169.camel@dvhart-mobl4.amr.corp.intel.com>
X-Enigmail-Version: 1.5.2
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 7/7] bootimage.bbclass, zisofs-tools-native: add ability to compress ISO images
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
X-List-Received-Date: Tue, 17 Sep 2013 11:13:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/16/2013 12:57 PM, Darren Hart wrote:
> On Fri, 2013-09-13 at 19:09 -0500, Jason Wessel wrote:
>> +COMPRESSISO ?= ""
> 
> 
> Would an explicit '0' here be better?


That is fine by me.

>> +
>> +do_install() {
>> +	oe_runmake install INSTALLROOT=${D} bindir=${bindir}
>> +}
> 
> Does EXTRA_OEMAKE not work here? I see it isn't listed in the reference
> manual for the install step (just the compile step), so perhaps not.
> Just wanted to check.



It does not work.  I could patch the Makefile to make it work but I don't think it is worth it, vs just leaving things unchanged for future uprev ease.


Cheers,
Jason.

