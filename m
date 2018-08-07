Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 5A46A771B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 10:15:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id A155C26643E
Message-ID: <1533636928.8352.5.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 07 Aug 2018 12:15:28 +0200
In-Reply-To: <CAJTo0La6RFY0VKfbsUoPGcV1MB_Z0DuhHKQSAs=a74q0+qRERA@mail.gmail.com>
References: <1533630587.8352.1.camel@collabora.co.uk>
	<CAJTo0La6RFY0VKfbsUoPGcV1MB_Z0DuhHKQSAs=a74q0+qRERA@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Extract GPL sources
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
X-List-Received-Date: Tue, 07 Aug 2018 10:15:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Thanks Ross,

I have an issue when using the archiver:

local.conf:

INHERIT += "archiver"
ARCHIVER_MODE[src] = "patched"
COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'

ERROR: gmp-native-6.1.2-r0 do_unpack_and_patch: Command Error: 'quilt --quiltrc
/home/aragua/src/poky/build2/tmp/work/x86_64-linux/gmp-native/6.1.2-r0/archiver-work//recipe-
sysroot-native/etc/quiltrc push' exited with 0  Output:
/bin/sh: quilt: command not found
ERROR: gmp-native-6.1.2-r0 do_unpack_and_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /home/aragua/src/poky/build2/tmp/work/x86_64-linux/gmp-
native/6.1.2-r0/temp/log.do_unpack_and_patch.8027
ERROR: Task (virtual:native:/home/aragua/src/poky/meta/recipes-
support/gmp/gmp_6.1.2.bb:do_unpack_and_patch) failed with exit code '1'

I tried to drop native from COPYLEFT_RECIPE_TYPES without effect.

Where can I add quilt-native dependency?

For information I use pyro release. Is there any known bug for that release?

Thanks

On Tue, 2018-08-07 at 10:10 +0100, Burton, Ross wrote:
> Have a look at the archiver class.
> 
> Ross
> 
> On 7 August 2018 at 09:29, Fabien Lahoudere
> <fabien.lahoudere@collabora.co.uk> wrote:
> > Hello
> > 
> > I need to extract all *GPL* sources patched related to an image in order to publish them.
> > I want to do it automatically, ie 'bitbake myimage -c extract-gpl-sources'
> > Is there a mechanism to do that?
> > If not do you have any idea how I can implement it?
> > 
> > Thanks
> > 
> > --
> > Fabien
> > --
> > _______________________________________________
> > yocto mailing list
> > yocto@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/yocto
-- 
Fabien

