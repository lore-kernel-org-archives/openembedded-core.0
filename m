Return-Path: <richard.purdie@linuxfoundation.org>
X-Greylist: delayed 417 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Mar 2019 13:11:56 UTC
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 00FAA7CEBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 13:11:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	x27D4vsU011841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 7 Mar 2019 13:04:58 GMT
Message-ID: <533d4de952321163dbcc9115992b21229955191d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4MowcWPK_k5egUx=GY4SEVcSrOwWsey2h66KgvOHKfLOQ@mail.gmail.com>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<088fa1a03d1ff2ec9eb08d419e2a7c7bc1ee3406.camel@linuxfoundation.org>
	<CADkTA4NdgcGNtD2RdFSURG7=t1dUna8CC7uGU+Dv4BcHYD=yTQ@mail.gmail.com>
	<CADkTA4MowcWPK_k5egUx=GY4SEVcSrOwWsey2h66KgvOHKfLOQ@mail.gmail.com>
MIME-Version: 1.0
Date: Thu, 07 Mar 2019 13:04:42 +0000
User-Agent: Evolution 3.31.90-1 
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] linux-yocto: consolidated pull request (5.0 kernel intro)
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
X-List-Received-Date: Thu, 07 Mar 2019 13:11:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-06 at 23:23 -0500, Bruce Ashfield wrote:
> On Wed, Mar 6, 2019 at 11:21 PM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> > On Wed, Mar 6, 2019 at 6:05 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/365/steps/7/logs/step1c
> > >    
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/365/steps/7/logs/step1c
> > >    RESULTS - kernelmodule.KernelModuleTest.test_kernel_module -
> > > Testcase 1541: FAILED
> > 
> > Fixed, patches out shortly.
> > 
> > > d) perf do_compile race seen on qemuarm64 (didn't reproduce
> > > locally):
> > >    
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/366/steps/7/logs/step1b
> > 
> > I can't reproduce this one either.
> 
> I did notice that the AB log seems to show 4.19 being built for this,
> is that just a red herring ?
> 
> NOTE: recipe iptables-1.6.2-r0: task do_package_write_rpm: Succeeded
> NOTE: recipe iptables-1.6.2-r0: task do_package_qa: Succeeded
> NOTE: recipe ofono-1.25-r0: task do_package_write_rpm: Succeeded
> NOTE: recipe linux-yocto-4.19.19+gitAUTOINC+41fe45f7c5_11e0e616ed-r0:
> task do_package_write_deb: Succeeded
> NOTE: recipe ofono-1.25-r0: task do_package_write_deb: Succeeded
> NOTE: recipe linux-yocto-4.19.19+gitAUTOINC+41fe45f7c5_11e0e616ed-r0:
> task do_package_write_rpm: Succeeded

Yes, well spotted, perf is failing to build with the 4.19 kernel.

Thanks for the other fixes, they improve things a lot. This brings us
down to the above perf issue with 4.19 and:

a) KMACHINE_qemuarm = "qemuarma15" not working?

b) qemuarm64 graphics not working with 5.0

Getting there! :)

Cheers,

Richard




