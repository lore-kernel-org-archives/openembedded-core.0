Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 58A23719D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 20:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2LKqnlR007407; Tue, 21 Mar 2017 20:52:49 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ki64dVAOa10c; Tue, 21 Mar 2017 20:52:49 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2LKqi26007402
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Mar 2017 20:52:45 GMT
Message-ID: <1490129564.13980.160.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leonardo.sandoval.gonzalez@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 20:52:44 +0000
In-Reply-To: <20170314093726.24891-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170314093726.24891-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] subversion: remove useless comment
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
X-List-Received-Date: Tue, 21 Mar 2017 20:52:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-03-14 at 09:37 +0000,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Remove auto-builder comment shown on the recipe because it does not
> add something
> useful.

I disagree, it explains the error seen which caused parallel make
install to be disabled in the first place. I suggest wrapping the
comment rather than branding it "useless". You could also replace out
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
logrotate/build/build/tmp" with TMPDIR.

All too often we see things like parallel make disabled with no idea
why.

Cheers,

Richard

> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> tel.com>
> ---
>  meta/recipes-devtools/subversion/subversion_1.9.5.bb | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/subversion/subversion_1.9.5.bb
> b/meta/recipes-devtools/subversion/subversion_1.9.5.bb
> index 05fba67..5871b84 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.9.5.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.9.5.bb
> @@ -47,9 +47,4 @@ do_configure_prepend () {
>  	sed -i -e
> 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-
> macros/sasl.m4
>  }
>  
> -#| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-qa-
> logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.la' has not
> been installed in `/home/pokybuild/yocto-autobuilder/yocto-
> worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-
> linux/usr/lib'| x86_64-linux-libtool: install: warning:
> `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
> logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not been
> installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
> qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'|
> /usr/bin/ld: cannot find -lsvn_delta-1| collect2: ld returned 1 exit
> status| x86_64-linux-libtool: install: warning:
> `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
> logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> r0/build/sub
>  version/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been installed in
> `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
> logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-
> linux-libtool: install: warning: `/home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-qa-
> logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> r0/build/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been
> installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
> qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
> -#| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-
> 1.la' with the above command before installing it
> -#| x86_64-linux-libtool: install: warning:
> `../../subversion/libsvn_repos/libsvn_repos-1.la' has not been
> installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
> qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
> -#| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
> logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> r0/subversion-1.8.9/build-outputs.mk:1090: recipe for target
> 'install-serf-lib' failed
> -#| make: *** [install-serf-lib] Error 1
>  PARALLEL_MAKEINST = ""
> -- 
> 2.10.2
> 

