Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QtDHA-0005oj-Od
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 08:37:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 23:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,378,1309762800"; d="scan'208";a="39929290"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.111])
	by fmsmga002.fm.intel.com with SMTP; 15 Aug 2011 23:32:39 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Tue, 16 Aug 2011 14:32:28 +0800
Date: Tue, 16 Aug 2011 14:32:28 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110816063227.GA19899@edwin-gen>
References: <cover.1313411858.git.edwin.zhai@intel.com>
	<edd51def7cc31eaa3d67f7cc73bf5fded2351f5f.1313411859.git.edwin.zhai@intel.com>
	<1313418349.14274.587.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1313418349.14274.587.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/2] qemu: Make qemu buildable inside qemux86/qemuppc target
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
X-List-Received-Date: Tue, 16 Aug 2011 06:37:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 15, 2011 at 10:25:49PM +0800, Richard Purdie wrote:
> 
> The patch is fine but could we change this to something like:
> 
> # Only use the GL passthrough patches for native/nativesdk versions
> $QEMUGLPATCHES = "\
>     file://qemu-git-qemugl-host.patch \
>     file://fix-nogl.patch \
>     file://qemugl-allow-glxcontext-release.patch \
>     file://init-info.patch \
>     file://enable-i386-linux-user.patch \
>     file://qemugl-fix.patch \
>     file://opengl-sdl-fix.patch \
>     "
> 
> SRC_URI_append_virtclass-native = "\
>     ${QEMUGLPATCHES} \
>     "
> 
> SRC_URI_append_virtclass-nativesdk = "\
>     ${QEMUGLPATCHES} \
>     file://glflags.patch \
>     "
> 
> which is just a little bit neater. Also, no need for the commented out
> line.

RP,
Thanks for your comments. I have modified it. Pls. pull @ same branch:

git://git.pokylinux.org/poky-contrib gzhai/master2
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

BTW, I saw qemugl_git.bb is extended as "nativesdk", and was curious about it as 
qemugl is hacked libgl inside qemu guest, thus should not be related to "native" 
case. Any reason? Meet the dependency requirement?

Thanks,
Edwin


> 
> Cheers,
> 
> Richard
> 
>  
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
best rgds,
edwin


