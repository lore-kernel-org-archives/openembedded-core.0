Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7A36C13D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 09:58:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x8R9wsYe004270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Sep 2019 02:58:54 -0700 (PDT)
Received: from [128.224.158.233] (128.224.158.233) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 27 Sep 2019 02:58:42 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1569569493.git.liezhi.yang@windriver.com>
	<240614c649cb0804b49efc464106399a6a9c7086.1569569493.git.liezhi.yang@windriver.com>
	<b3c4ae73-4446-a476-a22a-4c580168231d@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <c369e654-3567-35e4-8486-db5ae2306f97@windriver.com>
Date: Fri, 27 Sep 2019 17:58:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b3c4ae73-4446-a476-a22a-4c580168231d@intel.com>
Subject: Re: [PATCH 1/1] apr: Check for libtoolize rather than libtool
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
X-List-Received-Date: Fri, 27 Sep 2019 09:58:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 9/27/19 5:30 PM, Ross Burton wrote:
> Much neater, but:
>> -    libtool='${HOST_SYS}-libtool' ./buildconf
>> +    ./buildconf 2
> 
> Where did this 2 come from and what does it mean?

Sorry that I didn't add a comment for it, there is no document or help message
for it, I read the code and thought it meant libtool version 2, another option
is 1 (version 1).

I have updated it in the PULL:

         cd ${S}
-       libtool='${HOST_SYS}-libtool' ./buildconf
+       # The "2" means libtool version 2.
+       ./buildconf 2


// Robert

> 
> Ross

