Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTdDZ-00055O-Fb
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 18:36:14 +0100
Received: by iahk25 with SMTP id k25so3276855iah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=xyzTfK4tWlmYDm5AFsrnICyEEPLcwsqkmO42qvZSeXs=;
	b=x2wGN2LQktKJwpTr+RvCNz2OSIikupZOYY5yJHMIQE4+vczGMt/fbHZoyImTVNQsua
	Xm465DyTcqxwD/+pllGDlB1haYtDbc59KvRQEwmCoRoljpZdCPa2Dk+/5BZDIokg4Uwp
	QGHyRpvk/ZjQM7JkxsUY/RZx33KJkwFfVT7qI=
Received: by 10.42.74.74 with SMTP id v10mr8424255icj.33.1322155777698;
	Thu, 24 Nov 2011 09:29:37 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l28sm89596120ibc.3.2011.11.24.09.29.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 09:29:35 -0800 (PST)
Date: Thu, 24 Nov 2011 09:36:21 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Julian Pidancet <julian.pidancet@gmail.com>
Message-ID: <20111124173621.GB28572@sakrah.homelinux.org>
References: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
	<CAMKF1srTUc=V9-AV-+3bw3QrR747cK-kfYU4sYq+A04ASD06wA@mail.gmail.com>
	<CAKZ=5EV8Qwh0gzmW6mS+hZB7HpEgDWuscO7_mhDEVsCffWmP2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKZ=5EV8Qwh0gzmW6mS+hZB7HpEgDWuscO7_mhDEVsCffWmP2A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: B29882@freescale.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Thu, 24 Nov 2011 17:36:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (24/11/11 12:44), Julian Pidancet wrote:
> >> +def get_gcc_multiarch_setting(bb, d):
> >> +    if 'multiarch' in bb.data.getVar('DISTRO_FEATURES',d,1).split() :
> >> +        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'i586', 'i686' ] :
> >> +            return "--enable-targets=all"
> >> +        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'powerpc' ] :
> >> +            return "--enable-targets=powerpc64"
> >> +        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'sparc' ] :
> >> +            return "--enable-targets=all"
> >> +    return ""

looking at above function can this be made into a single if statement
instead of 3

and we also need multiarch support in gdb recipes as well.

> >
> >
> > you forgot mips here
> >
> 
> mips and s390 are not yet supported in the gcc version that OE is using.

yes right forgot about that it will be in 4.7
> 
> -- 
> Julian

-- 
-Khem


