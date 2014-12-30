Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DD90B65CD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 08:41:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBU8f7MA029887
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 30 Dec 2014 00:41:08 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 30 Dec 2014 00:41:07 -0800
Message-ID: <54A26521.3060509@windriver.com>
Date: Tue, 30 Dec 2014 16:41:05 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1419918611-33216-1-git-send-email-liezhi.yang@windriver.com>
	<20141230083832.GC2469@jama>
In-Reply-To: <20141230083832.GC2469@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-networking] [PATCH 1/2] esmtp: use BPN in SRC_URI
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
X-List-Received-Date: Tue, 30 Dec 2014 08:41:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/30/2014 04:38 PM, Martin Jansa wrote:
> On Mon, Dec 29, 2014 at 09:50:10PM -0800, Robert Yang wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
> Wrong ML

Sorry and thanks for the reminder, sent it to oe-devel just now.

// Robert

>
>> ---
>>   meta-networking/recipes-support/esmtp/esmtp_1.2.bb |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
>> index 46d468c..60d34e1 100644
>> --- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
>> +++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
>> @@ -11,7 +11,7 @@ DEPENDS = "libesmtp"
>>   LICENSE = "GPL-2.0"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>>
>> -SRC_URI = "http://nchc.dl.sourceforge.net/project/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2"
>> +SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.bz2"
>>
>>   # Have to set this or we get -L/lib in LDFLAGS
>>   EXTRA_OECONF = "--with-libesmtp=${STAGING_EXECPREFIXDIR}"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

