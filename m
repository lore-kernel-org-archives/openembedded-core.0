Return-Path: <contact@jgueytat.fr>
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF0E60621
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 22:55:56 +0000 (UTC)
Received: from mfilter26-d.gandi.net (mfilter26-d.gandi.net [217.70.178.154])
	by relay5-d.mail.gandi.net (Postfix) with ESMTP id 30A0D41C07F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 00:55:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter26-d.gandi.net
Received: from relay5-d.mail.gandi.net ([IPv6:::ffff:217.70.183.197])
	by mfilter26-d.gandi.net (mfilter26-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024) with ESMTP id zKQnWutOAQYF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 00:55:55 +0200 (CEST)
X-Originating-IP: 176.159.68.128
Received: from [192.168.1.1] (static-176-159-68-128.ftth.abo.bbox.fr
	[176.159.68.128]) (Authenticated sender: contact@jgueytat.fr)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E7DE641C088
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 00:55:54 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20160928172641.ABBC660017@mail.openembedded.org>
From: Julien Gueytat <contact@jgueytat.fr>
Message-ID: <81364209-102c-a1d5-8964-dc654f26cfd8@jgueytat.fr>
Date: Thu, 29 Sep 2016 00:55:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160928172641.ABBC660017@mail.openembedded.org>
Subject: Re: [PATCHv2] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 22:55:59 -0000
Content-Type: multipart/alternative;
	boundary="------------74B1DC4355A1EFFBDDDAB84E"

--------------74B1DC4355A1EFFBDDDAB84E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

$ bitbake -c patch db-native

WARNING: Host distribution "Ubuntu-16.04" has not been validated with 
this version of the build system; you may possibly experience unexpected 
failures. It is recommended that you use a tested distribution.

Loading cache: 100% 
|#############################################################################################################| 
ETA:  00:00:00
Loaded 2112 entries from dependency cache.
Parsing recipes: 100% 
|###########################################################################################################| 
Time: 00:00:03
Parsing of 1584 .bb files complete (1581 cached, 3 parsed). 2113 
targets, 348 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.30.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "lightpixels"
DISTRO            = "poky"
DISTRO_VERSION    = "2.1.1"
TUNE_FEATURES     = "arm armv7ve vfp thumb neon vfpv4 
callconvention-hard cortexa7"
TARGET_FPU        = "hard"
meta
meta-poky
meta-yocto-bsp    = "krogoth:d8582b7a00129175ab11f6f813552ce1a56fc7d7"
meta-raspberrypi  = "master:4817e2c087097c02755d6309304878e42cf61d3c"
meta-qt5          = "krogoth:1ec776771f5f09c97917d3839d8140f9a7668c4a"
meta-oe           = "krogoth:895b25b387cae428c38990f4d2747603ee9dc92d"
meta-lightpixels  = "krogoth:9574f1a4f48c6d057e56e6b471dd65567102de2e"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks

ERROR: db-native-6.0.30-r0 do_patch: Command Error: 'quilt --quiltrc 
/media/jgueytat/Projects/LightPixels/LightPixels-OperatingSystem/build/tmp/sysroots/x86_64-linux/etc/quiltrc 
push' exited with 1  Output:

Applying patch fix-parallel-build.patch

patching file Makefile.in
Hunk #1 FAILED at 1034.
1 out of 1 hunk FAILED -- rejects in file Makefile.in

Patch fix-parallel-build.patch can be reverse-applied
ERROR: db-native-6.0.30-r0 do_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: 
/media/jgueytat/Projects/LightPixels/LightPixels-OperatingSystem/build/tmp/work/x86_64-linux/db-native/6.0.30-r0/temp/log.do_patch.17684
ERROR: Task 1 
(virtual:native:/media/jgueytat/Projects/LightPixels/LightPixels-OperatingSystem/poky/meta/recipes-support/db/db_6.0.30.bb, 
do_patch) failed with exit code '1'

***********

By applying the patches manually with the patch command it's getting 
better but still:

jgueytat@Happy:~/Sandbox-db/db-6.0.35$ patch -p1 < 
arm-thumb-mutex_db5.patch
patching file src/dbinc/mutex_int.h
jgueytat@Happy:~/Sandbox-db/db-6.0.35$ patch -p0 < fix-parallel-build.patch
patching file dist/Makefile.in
Hunk #1 succeeded at 1041 (offset 7 lines).

#######

It's seems like the patch command accepts the patch even if the offset 
is not respected but not the way it is done during the bitbake -c patch 
db-native command.


=> I thought that two set of patches were needed to respect more 
carefully the line numbers where the changes have to be done.



Le 28/09/2016 à 19:26, Julien Gueytat a écrit :
> Alright! I'm giving you that quickly.
>
> Sent from my WIKO RAINBOW LITE 4GLe 28 sept. 2016 18:58, Aníbal Limón <anibal.limon@linux.intel.com> a écrit :
>>
>>
>> On 09/28/2016 11:30 AM, Julien Gueytat wrote:
>>> Related to the db recipe. There are also the patches that needs to be
>>> regenerated as the same patches are applied for the two current versions.
>>> At least on Ubuntu 16.06 the same patch can't be applied anymore on the
>>> two versions as the lines where to apply the patches differs too much.
>> This is a quite strange, i'm wondering why can't be applied, i expect if
>> a patch fails in configure/compile stages not at patch apply.
>>
>> Could you put here the error log please?
>>
>> alimon
>>
>>>
>>> Le 28/09/2016 18:24, Burton, Ross a écrit :
>>>> On 28 September 2016 at 17:06, Aníbal Limón
>>>> <anibal.limon@linux.intel.com <mailto:anibal.limon@linux.intel.com>>
>>>> wrote:
>>>>
>>>>       @@ -18,16 +18,15 @@ RCONFLICTS_${PN} = "db3"
>>>>        PR = "r1"
>>>>
>>>>
>>>> Remove this PR please.
>>>>
>>>>        # Note, when upgraded to 6.1.x, a patch in RPM will need to be
>>>>       removed to activate db 6.1 support.
>>>>       -
>>>>       -SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz
>>>>       <http://download.oracle.com/berkeley-db/db-$%7BPV%7D.tar.gz> \
>>>>       +SRC_URI = "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz
>>>>       <http://distfiles.gentoo.org/distfiles/db-$%7BPV%7D.tar.gz> \
>>>>
>>>>
>>>> What is distfiles.gentoo.org <http://distfiles.gentoo.org>'s policy
>>>> when db-6.0.36 is released?  Could the tarball be deleted the day
>>>> after we release?  In general we've been either using
>>>> snapshot.debian.org <http://snapshot.debian.org> or pointing directly
>>>> at the yoctoproject.org <http://yoctoproject.org> source mirror for
>>>> tarballs we can't rely upon over time.
>>>>
>>>> Ross
>>>>
>>>>
>>>


--------------74B1DC4355A1EFFBDDDAB84E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>$ bitbake -c patch db-native<br>
    </p>
    <p><font color="#993399">WARNING: Host distribution "Ubuntu-16.04"
        has not been validated with this version of the build system;
        you may possibly experience unexpected failures. It is
        recommended that you use a tested distribution.</font></p>
    <p>Loading cache: 100%
|#############################################################################################################|
      ETA:  00:00:00<br>
      Loaded 2112 entries from dependency cache.<br>
      Parsing recipes: 100%
|###########################################################################################################|
      Time: 00:00:03<br>
      Parsing of 1584 .bb files complete (1581 cached, 3 parsed). 2113
      targets, 348 skipped, 0 masked, 0 errors.<br>
      NOTE: Resolving any missing task queue dependencies<br>
      <br>
      Build Configuration:<br>
      BB_VERSION        = "1.30.0"<br>
      BUILD_SYS         = "x86_64-linux"<br>
      NATIVELSBSTRING   = "universal"<br>
      TARGET_SYS        = "arm-poky-linux-gnueabi"<br>
      MACHINE           = "lightpixels"<br>
      DISTRO            = "poky"<br>
      DISTRO_VERSION    = "2.1.1"<br>
      TUNE_FEATURES     = "arm armv7ve vfp thumb neon vfpv4
      callconvention-hard cortexa7"<br>
      TARGET_FPU        = "hard"<br>
      meta              <br>
      meta-poky         <br>
      meta-yocto-bsp    =
      "krogoth:d8582b7a00129175ab11f6f813552ce1a56fc7d7"<br>
      meta-raspberrypi  =
      "master:4817e2c087097c02755d6309304878e42cf61d3c"<br>
      meta-qt5          =
      "krogoth:1ec776771f5f09c97917d3839d8140f9a7668c4a"<br>
      meta-oe           =
      "krogoth:895b25b387cae428c38990f4d2747603ee9dc92d"<br>
      meta-lightpixels  =
      "krogoth:9574f1a4f48c6d057e56e6b471dd65567102de2e"<br>
      <br>
      NOTE: Preparing RunQueue<br>
      NOTE: Executing SetScene Tasks<br>
      NOTE: Executing RunQueue Tasks<br>
    </p>
    <p>ERROR: db-native-6.0.30-r0 do_patch: Command Error: 'quilt
      --quiltrc
/media/jgueytat/Projects/LightPixels/LightPixels-OperatingSystem/build/tmp/sysroots/x86_64-linux/etc/quiltrc
      push' exited with 1  Output:<br>
    </p>
    <p>Applying patch fix-parallel-build.patch<br>
    </p>
    <p><font color="#cc0000">patching file Makefile.in<br>
        Hunk #1 FAILED at 1034.<br>
        1 out of 1 hunk FAILED -- rejects in file Makefile.in</font><br>
    </p>
    <p>Patch fix-parallel-build.patch can be reverse-applied<br>
      ERROR: db-native-6.0.30-r0 do_patch: Function failed:
      patch_do_patch<br>
      ERROR: Logfile of failure stored in:
/media/jgueytat/Projects/LightPixels/LightPixels-OperatingSystem/build/tmp/work/x86_64-linux/db-native/6.0.30-r0/temp/log.do_patch.17684<br>
      ERROR: Task 1
(virtual:native:/media/jgueytat/Projects/LightPixels/LightPixels-OperatingSystem/poky/meta/recipes-support/db/db_6.0.30.bb,
      do_patch) failed with exit code '1'<br>
    </p>
    <p>***********</p>
    <p>By applying the patches manually with the patch command it's
      getting better but still:</p>
    <p><a class="moz-txt-link-abbreviated" href="mailto:jgueytat@Happy:~/Sandbox-db/db-6.0.35$">jgueytat@Happy:~/Sandbox-db/db-6.0.35$</a> patch -p1 &lt;
      arm-thumb-mutex_db5.patch <br>
      patching file src/dbinc/mutex_int.h<br>
      <a class="moz-txt-link-abbreviated" href="mailto:jgueytat@Happy:~/Sandbox-db/db-6.0.35$">jgueytat@Happy:~/Sandbox-db/db-6.0.35$</a> patch -p0 &lt;
      fix-parallel-build.patch <br>
      patching file dist/Makefile.in<br>
      <font color="#ff6600">Hunk #1 succeeded at 1041 (offset 7 lines).</font><br>
    </p>
    <p>#######</p>
    <p>It's seems like the patch command accepts the patch even if the
      offset is not respected but not the way it is done during the
      bitbake -c patch db-native command.</p>
    <p><br>
    </p>
    <p>=&gt; I thought that two set of patches were needed to respect
      more carefully the line numbers where the changes have to be done.<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Le 28/09/2016 à 19:26, Julien Gueytat a
      écrit :<br>
    </div>
    <blockquote
      cite="mid:20160928172641.ABBC660017@mail.openembedded.org"
      type="cite">
      <pre wrap="">Alright! I'm giving you that quickly.

Sent from my WIKO RAINBOW LITE 4GLe 28 sept. 2016 18:58, Aníbal Limón <a class="moz-txt-link-rfc2396E" href="mailto:anibal.limon@linux.intel.com">&lt;anibal.limon@linux.intel.com&gt;</a> a écrit :
</pre>
      <blockquote type="cite">
        <pre wrap="">


On 09/28/2016 11:30 AM, Julien Gueytat wrote: 
</pre>
        <blockquote type="cite">
          <pre wrap="">Related to the db recipe. There are also the patches that needs to be 
regenerated as the same patches are applied for the two current versions. 
At least on Ubuntu 16.06 the same patch can't be applied anymore on the 
two versions as the lines where to apply the patches differs too much. 
</pre>
        </blockquote>
        <pre wrap="">
This is a quite strange, i'm wondering why can't be applied, i expect if 
a patch fails in configure/compile stages not at patch apply. 

Could you put here the error log please? 

alimon 

</pre>
        <blockquote type="cite">
          <pre wrap="">

Le 28/09/2016 18:24, Burton, Ross a écrit : 
</pre>
          <blockquote type="cite">
            <pre wrap="">
On 28 September 2016 at 17:06, Aníbal Limón 
&lt;<a class="moz-txt-link-abbreviated" href="mailto:anibal.limon@linux.intel.com">anibal.limon@linux.intel.com</a> <a class="moz-txt-link-rfc2396E" href="mailto:anibal.limon@linux.intel.com">&lt;mailto:anibal.limon@linux.intel.com&gt;</a>&gt; 
wrote: 

     @@ -18,16 +18,15 @@ RCONFLICTS_${PN} = "db3" 
      PR = "r1" 


Remove this PR please. 

      # Note, when upgraded to 6.1.x, a patch in RPM will need to be 
     removed to activate db 6.1 support. 
     - 
     -SRC_URI = "<a class="moz-txt-link-freetext" href="http://download.oracle.com/berkeley-db/db-$">http://download.oracle.com/berkeley-db/db-$</a>{PV}.tar.gz 
     <a class="moz-txt-link-rfc2396E" href="http://download.oracle.com/berkeley-db/db-$%7BPV%7D.tar.gz">&lt;http://download.oracle.com/berkeley-db/db-$%7BPV%7D.tar.gz&gt;</a> \ 
     +SRC_URI = "<a class="moz-txt-link-freetext" href="http://distfiles.gentoo.org/distfiles/db-$">http://distfiles.gentoo.org/distfiles/db-$</a>{PV}.tar.gz 
     <a class="moz-txt-link-rfc2396E" href="http://distfiles.gentoo.org/distfiles/db-$%7BPV%7D.tar.gz">&lt;http://distfiles.gentoo.org/distfiles/db-$%7BPV%7D.tar.gz&gt;</a> \ 


What is distfiles.gentoo.org <a class="moz-txt-link-rfc2396E" href="http://distfiles.gentoo.org">&lt;http://distfiles.gentoo.org&gt;</a>'s policy 
when db-6.0.36 is released?  Could the tarball be deleted the day 
after we release?  In general we've been either using 
snapshot.debian.org <a class="moz-txt-link-rfc2396E" href="http://snapshot.debian.org">&lt;http://snapshot.debian.org&gt;</a> or pointing directly 
at the yoctoproject.org <a class="moz-txt-link-rfc2396E" href="http://yoctoproject.org">&lt;http://yoctoproject.org&gt;</a> source mirror for 
tarballs we can't rely upon over time. 

Ross 


</pre>
          </blockquote>
          <pre wrap="">

</pre>
        </blockquote>
        <pre wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------74B1DC4355A1EFFBDDDAB84E--
