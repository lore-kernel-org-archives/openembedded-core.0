Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 957A860089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:15:38 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so47136082igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 12:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=urQiett0oRop4Lrd/uaCPlXAU9zW7bjnXGB76rqmF+8=;
	b=RYxUrhxWp9KCnSLUOfYfooaRZ0442sVAH2EAUc4xtI3RzkDEdkEUZmfNlTlVTo8NRu
	5FiUmEvC1Wt8f+b60AYL87G1H4MeRStCCTDorVfRA36V0fBGqkeV7kIf0jMekz0gB0EV
	Fr55J1t3nK6qvHjzZMSkN//euiND0pRd7InwK8zE1I5h6rO3uFWXMHHr+X/oAvjhlLkl
	E0YqJ/EH6wRwHlwZlAy+QlMfHCTRzqLAZPxg2I/Ss+vfNaef5rTiVPspDRIluGRSaWpQ
	6MAOpI6VvLbquHjVCyILUp287v8n/NAtrnX2Vy07OnLJSCCkg6cvFsp/VneT20RIf9z4
	fhOA==
X-Received: by 10.107.155.131 with SMTP id d125mr41291788ioe.17.1428520540132; 
	Wed, 08 Apr 2015 12:15:40 -0700 (PDT)
Received: from [192.168.34.210] (static-66-11-92-234.ptr.terago.net.
	[66.11.92.234])
	by mx.google.com with ESMTPSA id v14sm5181622igd.12.2015.04.08.12.15.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 12:15:39 -0700 (PDT)
Message-ID: <55257E5A.2030604@gmail.com>
Date: Wed, 08 Apr 2015 15:15:38 -0400
From: trevor <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	Cliff Brake <cbrake@bec-systems.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	angstrom-distro-devel <Angstrom-distro-devel@linuxtogo.org>
References: <CAOd_LFx8=tqK64c=Xyq3Yqk+LX2aGeZfpGOmpgpk-hvkb_2Cww@mail.gmail.com>
	<551D41A7.1050409@windriver.com>
In-Reply-To: <551D41A7.1050409@windriver.com>
Subject: Re: failure in gcc-crosssdk-initial was populate_sdk error
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
X-List-Received-Date: Wed, 08 Apr 2015 19:15:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 15-04-02 09:18 AM, Mark Hatle wrote:
> On 4/1/15 5:17 PM, Cliff Brake wrote:
>> Hi,
>>
>> I'm getting the following when running populate_sdk with a dizzy build.
>>
>> Angstrom distro
>> workstation OS is debian wheezy
>> gcc (Debian 4.7.2-5) 4.7.2
>>
>> Any thoughts what I'm doing wrong?
>>
>> Thanks,
>> Cliff
>>
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> ERROR: Function failed: do_configure (log file is located at
>> /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/log.do_configure.23863)
>> ERROR: Logfile of failure stored in:
>> /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/log.do_configure.23863
>> Log data follows:
>> | DEBUG: Executing python function sysroot_cleansstate
>> | DEBUG: Python function sysroot_cleansstate finished
>> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
>> 'bit-64', 'x86_64-linux', 'common']
>> | DEBUG: Executing shell function autotools_preconfigure
>> | DEBUG: Shell function autotools_preconfigure finished
>> | DEBUG: Executing python function autotools_copy_aclocals
>> | DEBUG: Python function autotools_copy_aclocals finished
>> | DEBUG: Executing python function gcc_multilib_setup
>> | DEBUG: Python function gcc_multilib_setup finished
>> | DEBUG: Executing shell function do_configure
>> | cat: /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work-shared/gcc-4.9.1-r0/gcc-4.9.1/gcc/defaults.h:
>> No such file or directory
>> | WARNING: /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/run.do_configure.23863:1
>> exit 1 from
>> |   grep -v "\#endif.*GCC_DEFAULTS_H" >
>> /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/gcc-4.9.1/build.x86_64-linux.x86_64-angstromsdk-linux/gcc/defaults.h.new
>> | ERROR: Function failed: do_configure (log file is located at
> The above lines are the actual failure.  The failure was in configuring the
> recipe 'gcc-cross-initial-x86_64'.
>
> I do not know the caue of the failure, but the issue is obvious enough, it was
> trying to load the 'defaults.h' file and modify a few settings in it.
>
> The code in question is in 'meta/recipes-devtools/gcc/gcc-configure-common.inc':
>

I noted the exact same problem/error over on the Angstrom mailing list, 
I'll know next time to check here too :-)

What I noticed is that I don't see the problem when my DISTRO is "poky" 
or "nodistro", it also doesn't seem to be affected by using the Linaro 
toolchain or not. I believe it is "angstrom-next" and 
"angstrom-v2013.12" related.

