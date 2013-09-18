Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7BE61566
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 21:17:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8ILUVOw025778; Wed, 18 Sep 2013 22:31:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9g3xnTvvRMRy; Wed, 18 Sep 2013 22:31:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8ILV2Gj025810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 18 Sep 2013 22:31:04 +0100
Message-ID: <1379538994.18603.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Wed, 18 Sep 2013 22:16:34 +0100
In-Reply-To: <20130918222803.39fdaaec@e6520eb>
References: <1379522926-22817-1-git-send-email-ross.burton@intel.com>
	<20130918222803.39fdaaec@e6520eb>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qemu: add option to disable X grabs
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
X-List-Received-Date: Wed, 18 Sep 2013 21:17:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2013-09-18 at 22:28 +0200, Eric Bénard wrote:
> Hi Ross,
> 
> Le Wed, 18 Sep 2013 17:48:45 +0100,
> Ross Burton <ross.burton@intel.com> a écrit :
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> > index 97e9b7b..1b861d7 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -17,6 +17,7 @@ SRC_URI = "\
> >      file://powerpc_rom.bin \
> >      file://no-strip.patch \
> >      file://larger_default_ram_size.patch \
> > +    file://disable-grabs.patch \
> >      "
> >  
> >  SRC_URI_append_class-nativesdk = "\
> 
> that seems to break the build here (while building meta-toolchain-qte) :
> ERROR: Command Error: exit status: 1  Output:
> Applying patch disable-grabs.patch
> patching file ui/sdl.c
> Hunk #3 FAILED at 912.
> 1 out of 3 hunks FAILED -- rejects in file ui/sdl.c
> Patch disable-grabs.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored
> in: /scratch/eb/eukrea2/master/setup-scripts/build/tmp-defaultsetup-eglibc-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-qemu/1.5.0-r0/temp/log.do_patch.14821
> ERROR: Task 2313
> (virtual:nativesdk:/scratch/eb/eukrea2/master/setup-scripts/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_1.5.0.bb,
> do_patch) failed with exit code '1'

Thanks for the report. I looked into it and somehow the patch was
corrupted. I've pushed a fix in.

Cheers,

Richard


