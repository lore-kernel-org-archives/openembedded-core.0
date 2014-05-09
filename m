Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7E78160196
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 10:16:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s49AGLwJ024032; Fri, 9 May 2014 11:16:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DxQlkfl77FJT; Fri,  9 May 2014 11:16:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s49AGEf5024018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 9 May 2014 11:16:15 +0100
Message-ID: <1399630567.31891.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 09 May 2014 11:16:07 +0100
In-Reply-To: <51490BD6-0BCB-4422-9620-8D4FFAD3791F@dominion.thruhere.net>
References: <1399019818-4767-1-git-send-email-koen.kooi@linaro.org>
	<536BB2C0.60903@linux.intel.com>
	<7A042294-2122-4EA0-BE1F-68E0BB65512D@dominion.thruhere.net>
	<916F5AEB-85EC-4CE0-8771-79F7467D6A86@dominion.thruhere.net>
	<536C77D5.6040205@linux.intel.com>
	<6B7D9F99-5867-416B-9A97-426E3B495A52@dominion.thruhere.net>
	<51490BD6-0BCB-4422-9620-8D4FFAD3791F@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCHv4] git: fix perl binding installation
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
X-List-Received-Date: Fri, 09 May 2014 10:16:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-05-09 at 11:16 +0200, Koen Kooi wrote:
> Op 9 mei 2014, om 10:50 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
> 
> > 
> > Op 9 mei 2014, om 08:38 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
> > 
> >> On 05/08/2014 10:59 PM, Koen Kooi wrote:
> >>> 
> >>> Op 8 mei 2014, om 19:30 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
> >>> 
> >>>> 
> >>>> Op 8 mei 2014, om 18:37 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
> >>>> 
> >>>>> On 05/02/2014 01:36 AM, Koen Kooi wrote:
> >>>>>> Git.pm wasn't ending up in the package because do_install removed it
> >>>>>> with a misleading comment about multilib. Workaround the problem so
> >>>>>> that Git.pm ends up in the correct dir *and* doesn't get deleted.
> >>>>>> 
> >>>>> 
> >>>>> Seems to be a problem as RP was concerned with:
> >>>>> 
> >>>>> 
> >>>>>> /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/bin/git difftool
> >>>>>> Can't locate Error.pm in @INC (@INC contains: /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3 /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl//5.14.3 /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/ /srv/ssd/machines/meta-intel-iot-devkit/build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3 .) at /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-difftool line 17.
> >>>>>> BEGIN failed--compilation aborted at /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/git/git-core/git-difftool line 17.
> >>>>> 
> >>>>> Doing a find in my sysroot:
> >>>>> 
> >>>>> /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/CPANPLUS/Error.pm
> >>>>> /srv/ssd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/perl/5.14.3/Error.pm
> >>>> 
> >>>> Drat, I checked for buildpaths and didn't find anything. I'll retest and send a new version hopefully tomorrow.
> >>> 
> >>> I need to read errors better :) Do you have http://patches.openembedded.org/patch/70635/ applied? And did 'difftool' work before this? None of the perl tools worked for me due to error.pm missing.
> >>> 
> >> Apparently not, this must have gotten lost during the release crazies.
> >> 
> >> Can you please resend a rebased patch set against master with both of these tested using the ' target.
> > 
> > What is 'git-replacement-native' and how do I test it?
> 
> OK, I figured it out, I remove TMPDIR and sstate-cache, then did:
> 
> bitbake git-replacement-native
> bitbake linaro-image-minimal
> 
> That blew up with:
> 
> RROR: Function failed: Fetcher failure: Fetch command failed with exit code 128, output:
> Cloning into '/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0+gitAUTOINC+6822ec76aa-r0/git'...
> git-upload-pack: error while loading shared libraries: libcrypto.so.1.0.0: cannot open shared object file: No such file or directory
> fatal: Could not read from remote repository.
> 
> Please make sure you have the correct access rights
> and the repository exists.
> 
> ERROR: Logfile of failure stored in: /build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0+gitAUTOINC+6822ec76aa-r0/temp/log.do_unpack.23257
> Log data follows:
> | DEBUG: Executing python function do_unpack
> | DEBUG: Executing python function base_do_unpack
> | DEBUG: Running export PATH="/build/linaro/build/openembedded-core/scripts/native-intercept:/build/linaro/build/openembedded-core/scripts:/build/linaro/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/x86_64-linux:/build/linaro/build
> ld/linaro/build/build/tmp-eglibc/sysroots/x86_64-linux/sbin:/build/linaro/build/build/tmp-eglibc/sysroots/x86_64-linux/bin:/build/linaro/build/openembedded-core/scripts:/build/linaro/build/openembedded-core/bitbake/bin:/usr/lib64/qt-3.3/b
>  -s -n /build/linaro/build/build/downloads/git2/git.yoctoproject.org.prelink-cross.git/ /build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0+gitAUTOINC+6822ec76aa-r0/git/
> | DEBUG: Python function base_do_unpack finished
> | DEBUG: Python function do_unpack finished
> | ERROR: Function failed: Fetcher failure: Fetch command failed with exit code 128, output:
> | Cloning into '/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0+gitAUTOINC+6822ec76aa-r0/git'...
> | git-upload-pack: error while loading shared libraries: libcrypto.so.1.0.0: cannot open shared object file: No such file or directory
> | fatal: Could not read from remote repository.
> |
> | Please make sure you have the correct access rights
> | and the repository exists.
> |
> ERROR: Task 117 (virtual:native:/build/linaro/build/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_unpack) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 265 tasks of which 124 didn't need to be rerun and 1 failed.
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   virtual:native:/build/linaro/build/openembedded-core/meta/recipes-devtools/prelink/prelink_git.bb, do_unpack
> Summary: There were 3 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> real    4m49.390s
> user    8m30.627s
> sys     1m37.368s
> 
> Libcrypto does seem to be in sysroot:
> 
> [koen@thinkpad build]$ find build/ -name "libcrypto.so.1.0.0"
> build/tmp-eglibc/sysroots/x86_64-linux/lib/libcrypto.so.1.0.0
> 
> I don't think this is due to my perl changes, though.

With the native binaries, we encode relative paths to libdir into RPATH.
I'm guessing but I think your "mv xxx" in do_install messes up the
RPATHs in the binaries/libraries.

The fix is probably to make that only happen in target builds
(${CLASS_OVERRIDE} == "class-target" or something like that).

but like I said, I'm guessing.

Cheers,

Richard


