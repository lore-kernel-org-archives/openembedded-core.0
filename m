Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqEbG-0006su-22
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 02:58:06 +0100
Received: by lags15 with SMTP id s15so42938lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 17:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=H+u/OhbBQQZ1VoPn/O1a/XXx5rtWbt4kWzOkMu6vR80=;
	b=diVYWr2AcX2pxZluWOH+d0av9w6XQxGHyHConNfpaAe2JKZy2xlyoth2e8N9f2qGf8
	oCdT59Sw8V8BAVdHPh+DZmTTsyECQL1vSpTcYSOSKsRzmQWlcDC4JtPF/tJ+qDaEXnxI
	ksejYzzNvjXvT366jZuZwd12Citm2CScix3YY=
Received: by 10.152.112.41 with SMTP id in9mr34397lab.27.1327542618261; Wed,
	25 Jan 2012 17:50:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 25 Jan 2012 17:49:48 -0800 (PST)
In-Reply-To: <COL120-W40F98EF50F803A1509B3AFDD890@phx.gbl>
References: <COL120-W51BE77DBA9D330FF475952DD880@phx.gbl>
	<20120126003644.GA4973@sakrah.homelinux.org>
	<COL120-W40F98EF50F803A1509B3AFDD890@phx.gbl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2012 17:49:48 -0800
Message-ID: <CAMKF1sotwjeYEqRot=aOiVMq4iGvOXfWcOocqFAXTFH=OTnozw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Net::SSLeay perl extension OpenSSL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2012 01:58:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 25, 2012 at 4:50 PM, simran singh <kyoonn@hotmail.com> wrote:
>
> Hello Raj,
>
> Thanks for the reply.
> I do not have the file named "libnet-ssleay-license". Where can I obtain
> this?
> If I try to build without that file, I get the same error about command.pm.

Did you apply the patch properly ?

save the patch and cd into openembedded-core
and then git am <patchfile>
>
>
> Date: Wed, 25 Jan 2012 16:36:44 -0800
> From: raj.khem@gmail.com
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
>
>
> On (25/01/12 14:50), simran singh wrote:
>>
>> Hello,
>>
>> I am not sure if this is the right list.
>>
>> Trying to add Net::SSLeay perl module, I get the following error.
>>
>
> Please try attached patch. I have not tested it
>
>
>
>>
>>
>>  NOTE: Running task 204 of 315 (ID: 11,
>>
>> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/
>>
>> net-ssleay/net-ssleay_1.36.bb, do_compile)
>>
>> ERROR: TaskFailed event exception, aborting
>>
>> ERROR: Build of
>>
>> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb
>>
>>  do_compile failed
>>
>> ERROR: Task 11
>>
>> (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb,
>>
>>  do_compile) failed with 256
>>
>> ERROR:
>>
>> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb'
>>  failed
>>
>> NOTE: package net-ssleay-1.36-r0: task do_compile: Started
>>
>> ERROR: Function do_compile failed
>>
>> NOTE: Task failed: ('function do_compile failed',
>>
>> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/
>>
>> ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')
>>
>> ERROR: Logfile of failure stored in:
>>
>> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/ppce500mc-
>>
>> linux/net-ssleay-1.36-r0/temp/log.do_compile.22680
>>
>> Log data follows:
>>
>> | NOTE: make -j 2 -e MAKEFLAGS= PASTHRU_INC= -fexpensive-optimizations
>> -frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS= -fexpensive
>>
>> -optimizations -frename-registers -fomit-frame-pointer -O2 -g0
>> LD=powerpc-linux-gnu-gcc -mcpu=e500mc -maix-struct-return
>> --sysroot=/home/Simran/
>>
>>
>> Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sysroots/ppce500mc-linux
>>
>> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
>>
>> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release
>>
>> /sysroots/i686-linux/usr/lib/perl/5.10.1
>>
>> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib
>>
>> /perl/5.10.1
>>
>> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
>>
>>  /home/
>>
>>
>> jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl
>> .).
>>
>> | BEGIN failed--compilation aborted.
>>
>> | make: *** [blib/lib/Net/.exists] Error 2
>>
>> | make: *** Waiting for unfinished jobs....
>>
>> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
>> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/
>>
>> build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
>>
>> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release
>>
>> /sysroots/i686-linux/usr/lib/perl/5.10.1
>>
>> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr
>>
>> /lib/perl/5.10.1
>>
>> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl
>>  .).
>>
>> | BEGIN failed--compilation aborted.
>>
>> | make: *** [blib/arch/.exists] Error 2
>>
>> | FATAL: oe_runmake failed
>>
>> | ERROR: Function do_compile failed
>>
>> NOTE: package net-ssleay-1.36-r0: task do_compile: Failed
>>
>> ERROR: TaskFailed event exception, aborting
>>
>>
>>
>>
>>
>> I used the libnet-ssleay-perl_1.36.bb, I found in the oe-commit archive.
>>
>> Please advice and thanks.
>>
>>
>>
>> Sim Gill 		 	   		   		 	   		
>
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> --
> -Khem
>
>
> _______________________________________________ Openembedded-core mailing
> list Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


