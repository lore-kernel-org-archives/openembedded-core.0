Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 126C66FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 08:42:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0L8g2iJ000609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jan 2016 00:42:02 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jan 2016 00:42:02 -0800
To: Olof Johansson <olof.johansson@axis.com>
References: <cover.1453363852.git.liezhi.yang@windriver.com>
	<39e5a62da63a29ebd513bc2e926bd11f4b250227.1453363852.git.liezhi.yang@windriver.com>
	<20160121081654.GD31212@axis.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56A099D8.4020908@windriver.com>
Date: Thu, 21 Jan 2016 16:42:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160121081654.GD31212@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: do_package_qa depends on WARN_QA and ERROR_QA
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
X-List-Received-Date: Thu, 21 Jan 2016 08:42:11 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/21/2016 04:16 PM, Olof Johansson wrote:
> On 16-01-21 00:11 -0800, Robert Yang wrote:
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -1098,6 +1098,7 @@ python do_package_qa () {
>>
>>   do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
>>   do_package_qa[rdeptask] = "do_packagedata"
>> +do_package_qa[vardeps] += "${WARN_QA} ${ERROR_QA}"
>
> Shouldn't this be "WARN_QA ERROR_QA"? Or you'll get the expanded
> values of the variables.

Sorry, please drop this patch, need more work it.

// Robert

>

