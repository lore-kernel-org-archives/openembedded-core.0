Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 59B566B5AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 06:53:35 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VBfot-00010N-MK from Muhammad_Shakeel@mentor.com ;
	Mon, 19 Aug 2013 23:53:35 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 19 Aug 2013 23:53:35 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Tue, 20 Aug 2013 07:53:32 +0100
Message-ID: <521312AF.3010504@mentor.com>
Date: Tue, 20 Aug 2013 11:54:39 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAMKF1srCL2f+Cxb+2xvLY4_+oikJgXtj0vcR3=9h0tbDf1jGSg@mail.gmail.com>
	<5211B8C4.7070601@mentor.com>
	<CAMKF1srikv98W6EQ0Jk7_3FbKaPppaG1sBW-=A6YyD-eR-aj+Q@mail.gmail.com>
	<5212876C.7080806@linux.intel.com>
In-Reply-To: <5212876C.7080806@linux.intel.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 20 Aug 2013 06:53:35.0008 (UTC)
	FILETIME=[FD7DFA00:01CE9D71]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] [v3] openssh: Add systemd support
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
X-List-Received-Date: Tue, 20 Aug 2013 06:53:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2013 02:00 AM, Saul Wold wrote:
> On 08/18/2013 11:40 PM, Khem Raj wrote:
>> On Sun, Aug 18, 2013 at 11:18 PM, Muhammad Shakeel
>> <muhammad_shakeel@mentor.com> wrote:
>>> /usr/sbin/ is being sed'ed with ${sbindir} in do_install_append of the
>>> respective recipe file. /usr/bin/ and /bin/ is also taken care of.
>>
>> i see, thats better. however I do see a need to have  a generalized
>> way of specifying service files and a generic
>> processing engine which then takes care of it. Otherwise we have the
>> same code replicated in multiple recipes
>
> Agreed, I think there should be a generalized solution here, 
> implemented in the systemd.bbclass.
This is not required for all of the systemd unit files. Packages which 
have upstream systemd support, e.g. avahi, ofono they install service 
file theirselves.
I have already discussed to move this 'sed' part into systemd.bbclass 
but Ross Burton had other ideas. 
http://patches.openembedded.org/patch/53489/

So what is your final recommendation here?

> It also appears that this set is also creating a /lib dir that should 
> not be there for non-systemd builds.
>
>> ERROR: Task 25 
>> (/home/sgw/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb, 
>> do_package) failed with exit code '1'
>> ERROR: QA Issue: nfs-utils: Files/directories were installed but not 
>> shipped
>>   /lib
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in: 
>> /home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/nfs-utils/1.2.8-r0/temp/log.do_package.17558
Sorry about this error, I will fix this in next version.

Regards
--Shakeel

