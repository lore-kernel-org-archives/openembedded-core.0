Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA8B46D561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 10:12:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8PACEY0020830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Sep 2019 03:12:24 -0700
Received: from [128.224.162.210] (128.224.162.210) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 25 Sep 2019 03:12:02 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1569403775.git.liezhi.yang@windriver.com>
	<604679f4585c656362226770d59f5375861a0335.1569403775.git.liezhi.yang@windriver.com>
	<bad53778-8ba4-7e2e-3e8d-a8f25660e61d@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <ea93b0d2-966e-db48-c273-5e2ccb75ceef@windriver.com>
Date: Wed, 25 Sep 2019 18:11:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bad53778-8ba4-7e2e-3e8d-a8f25660e61d@intel.com>
Subject: Re: [PATCH 2/3] expect: Fix configure error for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 10:12:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 9/25/19 5:47 PM, Ross Burton wrote:
> On 25/09/2019 10:30, Robert Yang wrote:
>>   TCL_INCLUDE_PATH = ""
>>   TCL_INCLUDE_PATH_class-target = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
>> +TCL_INCLUDE_PATH_class-nativesdk = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
> 
> Did you test just always passing --with-tclinclude=... in all classes?

I tried it just now, it didn't work for native, I will make it simpler in V2:

# Apparently the public Tcl headers are only in /usr/include/tcl8.6
# when building for the target and nativesdk.
TCL_INCLUDE_PATH = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
TCL_INCLUDE_PATH_class-native = ""

// Robert

> 
> Ross

