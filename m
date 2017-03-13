Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B7E2E776D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 14:29:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2DETLgm027176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Mar 2017 07:29:21 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 07:29:21 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<fbae88fe04c9ca949e0b3a021c4cf015c666da9d.1489144807.git.alexander.kanavin@linux.intel.com>
	<e8c2ff30-fe00-5413-6ce7-4182f6e53e49@windriver.com>
	<3d49bfd1-97a4-f8c3-1394-73c3754b0d03@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <226c7e76-3283-481a-a486-bc80d8ab78bf@windriver.com>
Date: Mon, 13 Mar 2017 09:29:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <3d49bfd1-97a4-f8c3-1394-73c3754b0d03@linux.intel.com>
Subject: Re: [PATCH 36/44] package_rpm.bbclass: do not set the OS dynamically when building rpms
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
X-List-Received-Date: Mon, 13 Mar 2017 14:29:24 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/13/17 9:24 AM, Alexander Kanavin wrote:
> On 03/10/2017 06:57 PM, Mark Hatle wrote:
>> On 3/10/17 5:24 AM, Alexander Kanavin wrote:
>>> Packages need to contain just one value for the os field, otherwise
>>> rpm will refuse to install them if they don't match what is in
>>> /etc/rpm/platform.
>>
>> How will this work with nativesdk for things like targeting mingw (windows),
>> darwin, or even alternative OS like Zephyr?
>>
>> I'm thinking if 'linux-gnu' is invalid, then a simple conversion to 'linux'
>> would be better then hard coding everything to 'linux'.
> 
> I don't believe that the OS name embedded into packages is actually used 
> anywhere to make decisions about which package to install. It's just 
> that some packages have one value for it, others have another, and rpm 4 
> does not allow that (rpm 5 does, and so several OS values gets written 
> into /etc). So I bring them all to a common value.

In the past there was both a (Smart/YUM/DNF) and RPM check for OS to prevent
packages for one OS to be installed onto another OS.

While out mingw SDK does not contain RPM (not IMHO should it ever), I'd hate to
accidentally try to install one of the mingw packages onto a Linux system.

Darwin (OS X) as well.

This is likely something we need to look into and understand.

--Mark

> Alex
> 


