Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A12A97228D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 09:27:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAP9RDC8015326
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 25 Nov 2014 01:27:14 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 25 Nov 2014 01:27:13 -0800
Message-ID: <54744B6E.5040607@windriver.com>
Date: Tue, 25 Nov 2014 17:27:10 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1416295260.git.Chong.Lu@windriver.com>
	<6d00e71e0db5fd70243f69bbd6894a296620a41c.1416295260.git.Chong.Lu@windriver.com>
	<CAJTo0Lb48t-x82qYKAmOY5TmvbWmNvSHV2tSkT+JqyLXcDjxtw@mail.gmail.com>
	<5472BFFE.4090600@windriver.com>
	<CAJTo0LYaXhKUPNm8U6o9LJ+kP863M9Q548sjoyQTkMoz0hSyYg@mail.gmail.com>
In-Reply-To: <CAJTo0LYaXhKUPNm8U6o9LJ+kP863M9Q548sjoyQTkMoz0hSyYg@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bison: update to 3.0.2
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
X-List-Received-Date: Tue, 25 Nov 2014 09:27:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/24/2014 07:26 PM, Burton, Ross wrote:
>
> On 24 November 2014 at 05:19, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>     After I upgrade bison, I test world on qemuppc and qemux86, that's ok.
>     Can you tell me, which arch will build failure or how to reproduce
>     this failure?
>     I will try to fix it.
>
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/104/steps/BuildImages/logs/stdio
>
> That's PPC with poky-lsb.  It may be unrelated but the failures 
> involve bison.  I see that glibc doesn't depend on bison-native so if 
> it is running the tool at build time there could be problems with 
> bison being replaced during a build.
>
> Ross

Hi Ross,

I try to reproduce this issue in my environment. But I can't get build 
failure about glibc.
glibc depends on bison-native:
"glibc" -> "kconfig-frontends-native" -> "bison-native"
I checked glibc source code. In intl/plural.c file, The bison version is 
defined:
#define YYBISON_VERSION "2.7"
Does this issue related with sstate?
I build world on some arch, no build failure appear.:-)

Best Regards
Chong

