Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SeOEF-0006FX-SK for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 12:21:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CAB5d7003104
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 11:11:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30915-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 11:11:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CAAv0L003092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 11:10:59 +0100
Message-ID: <1339495860.28854.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2012 11:11:00 +0100
In-Reply-To: <cover.1339438568.git.mark.hatle@windriver.com>
References: <cover.1339438568.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/9 v7] Uprev RPM to 5.4.9
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
X-List-Received-Date: Tue, 12 Jun 2012 10:21:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-06-11 at 13:18 -0500, Mark Hatle wrote:
> Fix a regression in rpm dependency generated caused by default settings
> changing.  This has been fixed (and verified on the yocto project build
> servers.)  This should be the final version....
> 
> This has been rebased, and patches 1 and 2 were changed to deal with the
> fix for the macros files.
> 
> v6 message follows:
> 
> Patch 6/8 was reworked to remove the manifest size check.
> Patch 8/8 is new and includes the manifest check removed from 6/8 as well as
> one that was missed in previous testing.
> 
> v5 message follows:
> 
> Only 7/7 is new in the version.  Due to the removal of the RPMVSF_NOSIGNATURES
> flag in RPM5 5.4.9, createrepo also needed to have this flag removed.
> 
> v4 message follows:
> 
> Only 6/6 is new in this version.  RPM 5.4.9 appears to be more demanding
> for both the DB_CONFIG file and empty manifest files.  The new patch resolves
> this issue by ensuring that the DB_CONFIG is always generated, and empty
> manifest files do not get installed.
> 
> Patches 1-5 are identical to the v3 versions.
> 
> v3 messages follows:
> 
> Rebase of the v2 changes.
> 
> Re-disabled the "test" chunk..  this should resolve the hang problem a
> few people have observed.
> 
> v2 message follows:
> 
> Berkley DB also gets upreved, and a new package ossp-uuid gets added to
> the system.
> 
> This was -heavily- tested with and without zypper on IA, and PPC.
> 
> In addition a minor performance enhancement with a query operation was added.
> 
> The uprev also adds the capability of using PACKAGECONFIG settings to tailor
> the behavior of RPM.
> 
> V2 changes:
> 
> Fix a problem with libuuid.so from util-linux would sometimes be linked into
> the binary.
> 
> Also force libzypp, sat-solver and zypper to refresh via a PR bump.
> 
> The following changes since commit ba22e4fcf07eb8007f6d500908d503f1d3dbdd16:
> 
>   nasm: updated to 2.10.01 (2012-06-11 13:55:46 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/rpm
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm
> 
> Mark Hatle (9):
>   rpm: Upgrade RPM to 5.4.8  (db to 5.3.15)
>   rpm: Upgrade RPM to 5.4.9
>   ossp-uuid: Add oss-uuid package and RPM 5.4.9 integration
>   package_rpm: Add capability to directly query packageorigin
>   rpm: Bump PR numbers on componets that require RPM
>   rootfs_rpm.bbclass: Update database configuration file
>   createrepo: For compatibility w/ RPM 5.4.9 remove RPMVSF_NOSIGNATURES
>     flag
>   package_rpm: Verify that the package manifests are not empty
>   rpm: Ensure pkgconfig deps don't stray from the package being built

Merged to master, thanks.

Richard



