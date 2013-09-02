Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 946C96BD18
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 10:26:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r82Acsvc011479; Mon, 2 Sep 2013 11:38:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G4YLJrg5p9Yi; Mon,  2 Sep 2013 11:38:53 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r82AcmaT011471
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 2 Sep 2013 11:38:50 +0100
Message-ID: <1378117550.1059.172.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>
Date: Mon, 02 Sep 2013 11:25:50 +0100
In-Reply-To: <1378115831.1059.169.camel@ted>
References: <CAP9ODKqj3M+rxAK20=xU2RfJAAFO4JZyH0nWO9PVRt_exO6Q-A@mail.gmail.com>
	<5223FB7E.6070306@windriver.com> <1378115831.1059.169.camel@ted>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Failure
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
X-List-Received-Date: Mon, 02 Sep 2013 10:26:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-02 at 10:57 +0100, Richard Purdie wrote:
> On Mon, 2013-09-02 at 10:44 +0800, ChenQi wrote:
> > On 09/02/2013 10:08 AM, Otavio Salvador wrote:
> > > Hello,
> > >
> > > I got this build failure today; I am about to leave so I removed the
> > > tmpdir and will let it running during night. I post more info if/when
> > > I reproduce it again:
> > >
> > > Patch redhat-portability.diff does not apply (enforce with -f)
> > > ERROR: Function failed: patch_do_patch
> > > ERROR: Logfile of failure stored in:
> > > /home/otavio/hacking/freescale/fsl-community-bsp-mx6/build/tmp/work/x86_64-linux/elfutils-native/0.155-r0/temp/log.do_patch.20173
> > > ERROR: Task 662
> > > (virtual:native:/home/otavio/hacking/freescale/fsl-community-bsp-mx6/sources/poky/meta/recipes-devtools/elfutils/elfutils_0.155.bb,
> > > do_patch) failed with exit code '1'
> > >
> > > Regards,
> > >
> > 
> > I got the same error now and then when building native-elfutils. Every 
> > time the error appears, I have to clean the sstate cache for elfutils.
> 
> No, you don't, you need to *clean* elfutils, sstate is just fine.
> 
> I suspect the issue is that there is some patch to the source code and
> then further modifications happen at do_configure/do_compile time. If we
> try and rerun do_patch (due to the patch.bbclass change recently), it
> can no longer unapply the patch and things fail.

It turned out to be due to patching of generated files. I've sent out a
patch to remove the patches we don't need.

Cheers,

Richard


