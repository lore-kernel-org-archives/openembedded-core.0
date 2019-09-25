Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD357E6B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 19:17:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8PJHAto003566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Sep 2019 12:17:25 -0700
Received: from [128.224.56.209] (128.224.56.209) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 25 Sep 2019 12:17:04 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190924140118.6651-1-Trevor.Gamblin@windriver.com>
	<0807ede6-ed1e-2068-6004-22fd947a51ef@intel.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <bc706caa-9fd8-faf9-b0a4-26d3f4d1fbf9@windriver.com>
Date: Wed, 25 Sep 2019 15:17:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0807ede6-ed1e-2068-6004-22fd947a51ef@intel.com>
Subject: Re: [PATCH] nativesdk-dnf: ensure installed systemd files are shipped
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
X-List-Received-Date: Wed, 25 Sep 2019 19:17:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 9/24/19 12:15 PM, Ross Burton wrote:

> On 24/09/2019 15:01, Trevor Gamblin wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> "bitbake nativesdk-dnf" throws a QA warning if the contents of
>> ${base_libdir}/systemd/system/ are not shipped, so add them.
>
> Looks like a bug in systemd.bbclass, not this recipe.  For example if 
> I enable nativesdk for acpid:

Can you clarify what you meant? Did you mean that the class should be 
doing the cleanup of the systemd service files?

>
> ERROR: nativesdk-acpid-2.0.32-r0 do_package: QA Issue: 
> nativesdk-acpid: Files/directories were installed but not shipped in 
> any package:
>   /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux/lib
>   /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux/lib/systemd
> /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux/lib/systemd/system
>
> /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux/lib/systemd/system/acpid.service 
>
>
> Ross

