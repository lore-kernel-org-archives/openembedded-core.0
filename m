Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rs0q5-000341-OS
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 00:40:45 +0100
Received: by lbol12 with SMTP id l12so368417lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 15:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sTpZZnYtlsj2thpy2ZaoPYCkibbbPQuQ8zUu54uSF+c=;
	b=D+jv/OooAJ/DJZOawznul5BYDvsHTX9u8Fr9j6Fieo2y3ZC72m6vz6GYVPAK75Eyvn
	HeKzv06NALIsztpkKtUn3CMJhJAdzvFtLHyCUE+TADLvR5PeDqw+AzwGghfOeixq64Gb
	IzARad1ThFW3aWIQOJlLpESYaB4CaJcVVKF/Y=
Received: by 10.112.101.34 with SMTP id fd2mr4994277lbb.16.1327966372275; Mon,
	30 Jan 2012 15:32:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 15:32:22 -0800 (PST)
In-Reply-To: <COL120-W2242EEE7B2D3ED864B5FBDDD8D0@phx.gbl>
References: <COL120-W51BE77DBA9D330FF475952DD880@phx.gbl>
	<20120126003644.GA4973@sakrah.homelinux.org>
	<COL120-W40F98EF50F803A1509B3AFDD890@phx.gbl>
	<CAMKF1sotwjeYEqRot=aOiVMq4iGvOXfWcOocqFAXTFH=OTnozw@mail.gmail.com>
	<COL120-W5491D70C591B2839B06CF3DD8E0@phx.gbl>
	<20120128201145.GB22106@sakrah.homelinux.org>
	<COL120-W1F0FB4D7EDB043B22BB17DD8D0@phx.gbl>
	<CAMKF1spe1G7Um=XEe44936tn4GEHiAeheSx7LE-mbS9fukLo-Q@mail.gmail.com>
	<COL120-W2242EEE7B2D3ED864B5FBDDD8D0@phx.gbl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 15:32:22 -0800
Message-ID: <CAMKF1sp0jh1ZuGqQmunK0vQJ3npnep5+7WsFGw6PL4-pSh=22w@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 Jan 2012 23:40:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2012 at 1:30 PM, simran singh <kyoonn@hotmail.com> wrote:
> Hello Raj,
>
> I am getting the exact same error as before. Any ideas. I did
>
> IMAGE_INSTALL_append_pn-devel-image = "libnet-ssleay-perl"
>
> #bitbake devel-image
>
> Gets stuck at the same Cant' locate ExtUtils.

thats another perl module. I guess your perl is not
building this module. So either enable perl to do it
or create a new recipe to build it like libnet-ssleay-perl
>
> Thanks for your help so far.
>
>
>
>
>> From: raj.khem@gmail.com
>> Date: Mon, 30 Jan 2012 12:30:27 -0800
>
>> To: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
>>
>> On Mon, Jan 30, 2012 at 12:22 PM, simran singh <kyoonn@hotmail.com> wrote:
>> > Hello,
>> >
>> > I was able to successfully add the patch to the core. Thanks to your
>> > instructions.
>> > Even though a recipe was created, It is not being built with either perl
>> > or
>> > openssl.
>> > Do I need to add a dependency somewhere for the libnet-ssleay recipe to
>> > be
>> > recognized?
>>
>> it needs to get to the image either via some RDEPENDS or IMAGE_INSTALL
>> variable. You can try to add it through
>> your local.conf by adding
>>
>>
>> IMAGE_INSTALL_append_pn-<your_image_name_here> = " libnet-ssleay"
>>
>>
>> > Thanks.
>> >
>> >
>> >> Date: Sat, 28 Jan 2012 12:11:45 -0800
>> >
>> >> From: raj.khem@gmail.com
>> >> To: openembedded-core@lists.openembedded.org
>> >> Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
>> >>
>> >> On (27/01/12 08:41), simran singh wrote:
>> >> >
>> >> > Hello Raj,
>> >> >
>> >> > I am using open embedded provided through a company instead of
>> >> > downloading from the git repository. Is there a way
>> >> > to apply this patch manually without going through git?.
>> >> > I tried 'bitbake patch filename' but that did not work.
>> >>
>> >> if you dont use git then just patch -p1 < <patchfilename> from
>> >> openembedded-core directory should work.
>> >>
>> >> btw. learn about patch(man patch) it should really help you
>> >>
>> >> > Thanks a bunch for your help.
>> >> >
>> >> > Sim
>> >> >
>> >> > > From: raj.khem@gmail.com
>> >> > > Date: Wed, 25 Jan 2012 17:49:48 -0800
>> >> > > To: openembedded-core@lists.openembedded.org
>> >> > > Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
>> >> > >
>> >> > > On Wed, Jan 25, 2012 at 4:50 PM, simran singh <kyoonn@hotmail.com>
>> >> > > wrote:
>> >> > > >
>> >> > > > Hello Raj,
>> >> > > >
>> >> > > > Thanks for the reply.
>> >> > > > I do not have the file named "libnet-ssleay-license". Where can I
>> >> > > > obtain
>> >> > > > this?
>> >> > > > If I try to build without that file, I get the same error about
>> >> > > > command.pm.
>> >> > >
>> >> > > Did you apply the patch properly ?
>> >> > >
>> >> > > save the patch and cd into openembedded-core
>> >> > > and then git am <patchfile>
>> >> > > >
>> >> > > >
>> >> > > > Date: Wed, 25 Jan 2012 16:36:44 -0800
>> >> > > > From: raj.khem@gmail.com
>> >> > > > To: openembedded-core@lists.openembedded.org
>> >> > > > Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
>> >> > > >
>> >> > > >
>> >> > > > On (25/01/12 14:50), simran singh wrote:
>> >> > > >>
>> >> > > >> Hello,
>> >> > > >>
>> >> > > >> I am not sure if this is the right list.
>> >> > > >>
>> >> > > >> Trying to add Net::SSLeay perl module, I get the following
>> >> > > >> error.
>> >> > > >>
>> >> > > >
>> >> > > > Please try attached patch. I have not tested it
>> >> > > >
>> >> > > >
>> >> > > >
>> >> > > >>
>> >> > > >>
>> >> > > >> NOTE: Running task 204 of 315 (ID: 11,
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/
>> >> > > >>
>> >> > > >> net-ssleay/net-ssleay_1.36.bb, do_compile)
>> >> > > >>
>> >> > > >> ERROR: TaskFailed event exception, aborting
>> >> > > >>
>> >> > > >> ERROR: Build of
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb
>> >> > > >>
>> >> > > >> do_compile failed
>> >> > > >>
>> >> > > >> ERROR: Task 11
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb,
>> >> > > >>
>> >> > > >> do_compile) failed with 256
>> >> > > >>
>> >> > > >> ERROR:
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb'
>> >> > > >> failed
>> >> > > >>
>> >> > > >> NOTE: package net-ssleay-1.36-r0: task do_compile: Started
>> >> > > >>
>> >> > > >> ERROR: Function do_compile failed
>> >> > > >>
>> >> > > >> NOTE: Task failed: ('function do_compile failed',
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/
>> >> > > >>
>> >> > > >> ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')
>> >> > > >>
>> >> > > >> ERROR: Logfile of failure stored in:
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/ppce500mc-
>> >> > > >>
>> >> > > >> linux/net-ssleay-1.36-r0/temp/log.do_compile.22680
>> >> > > >>
>> >> > > >> Log data follows:
>> >> > > >>
>> >> > > >> | NOTE: make -j 2 -e MAKEFLAGS= PASTHRU_INC=
>> >> > > >> -fexpensive-optimizations
>> >> > > >> -frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS=
>> >> > > >> -fexpensive
>> >> > > >>
>> >> > > >> -optimizations -frename-registers -fomit-frame-pointer -O2 -g0
>> >> > > >> LD=powerpc-linux-gnu-gcc -mcpu=e500mc -maix-struct-return
>> >> > > >> --sysroot=/home/Simran/
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sysroots/ppce500mc-linux
>> >> > > >>
>> >> > > >> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release
>> >> > > >>
>> >> > > >> /sysroots/i686-linux/usr/lib/perl/5.10.1
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib
>> >> > > >>
>> >> > > >> /perl/5.10.1
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
>> >> > > >>
>> >> > > >> /home/
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl
>> >> > > >> .).
>> >> > > >>
>> >> > > >> | BEGIN failed--compilation aborted.
>> >> > > >>
>> >> > > >> | make: *** [blib/lib/Net/.exists] Error 2
>> >> > > >>
>> >> > > >> | make: *** Waiting for unfinished jobs....
>> >> > > >>
>> >> > > >> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/
>> >> > > >>
>> >> > > >> build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release
>> >> > > >>
>> >> > > >> /sysroots/i686-linux/usr/lib/perl/5.10.1
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr
>> >> > > >>
>> >> > > >> /lib/perl/5.10.1
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl
>> >> > > >> .).
>> >> > > >>
>> >> > > >> | BEGIN failed--compilation aborted.
>> >> > > >>
>> >> > > >> | make: *** [blib/arch/.exists] Error 2
>> >> > > >>
>> >> > > >> | FATAL: oe_runmake failed
>> >> > > >>
>> >> > > >> | ERROR: Function do_compile failed
>> >> > > >>
>> >> > > >> NOTE: package net-ssleay-1.36-r0: task do_compile: Failed
>> >> > > >>
>> >> > > >> ERROR: TaskFailed event exception, aborting
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> I used the libnet-ssleay-perl_1.36.bb, I found in the oe-commit
>> >> > > >> archive.
>> >> > > >>
>> >> > > >> Please advice and thanks.
>> >> > > >>
>> >> > > >>
>> >> > > >>
>> >> > > >> Sim Gill
>> >> > > >
>> >> > > >
>> >> > > >> _______________________________________________
>> >> > > >> Openembedded-core mailing list
>> >> > > >> Openembedded-core@lists.openembedded.org
>> >> > > >>
>> >> > > >>
>> >> > > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >> > > >
>> >> > > >
>> >> > > > --
>> >> > > > -Khem
>> >> > > >
>> >> > > >
>> >> > > > _______________________________________________ Openembedded-core
>> >> > > > mailing
>> >> > > > list Openembedded-core@lists.openembedded.org
>> >> > > >
>> >> > > >
>> >> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >> > > >
>> >> > > > _______________________________________________
>> >> > > > Openembedded-core mailing list
>> >> > > > Openembedded-core@lists.openembedded.org
>> >> > > >
>> >> > > >
>> >> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >> > > >
>> >> > >
>> >> > > _______________________________________________
>> >> > > Openembedded-core mailing list
>> >> > > Openembedded-core@lists.openembedded.org
>> >> > >
>> >> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >> >
>> >>
>> >> > _______________________________________________
>> >> > Openembedded-core mailing list
>> >> > Openembedded-core@lists.openembedded.org
>> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >>
>> >>
>> >> --
>> >> -Khem
>> >>
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


