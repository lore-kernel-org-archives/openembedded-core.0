Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDBDE7ED41
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 19:31:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x94JVPd2007637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Oct 2019 12:31:25 -0700 (PDT)
Received: from [128.224.21.8] (128.224.21.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 4 Oct 2019 12:31:25 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191002182824.38571-1-Trevor.Gamblin@windriver.com>
	<e8e82f8c-b0a1-f662-0c4f-a93840e638c0@intel.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <484457c9-8536-cd17-defc-2c0051955aba@windriver.com>
Date: Fri, 4 Oct 2019 15:31:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e8e82f8c-b0a1-f662-0c4f-a93840e638c0@intel.com>
Subject: Re: [PATCH] watchdog: fix service PIDFile in do_install_append
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
X-List-Received-Date: Fri, 04 Oct 2019 19:31:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10/4/19 11:47 AM, Ross Burton wrote:
> On 02/10/2019 19:28, Trevor Gamblin wrote:
>> +    # watchdog is of type "forking", so fix PIDFile to avoid 
>> warnings from
>> +    # systemd
>> +    sed -i 's@/var/run@/run@g' 
>> ${D}${systemd_system_unitdir}/watchdog.service
>
> I dislike seds in the recipe because it's impossible to tell if they 
> stop working or are not needed anymore.   A patch (sent upstream) 
> would be preferable.
>
> Ross
Alright, I'll make a patch and get it submitted.

