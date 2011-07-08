Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QfDf5-0002yX-OQ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:12:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2011 09:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="27910330"
Received: from unknown (HELO helios.localnet) ([10.255.17.130])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2011 09:08:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 17:08:20 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<1310138939.20015.883.camel@rex>
	<CAP9ODKpcSZcKOjgBa3LEZTXEtizBUe219dzLNn_tvb6Pk=3K+A@mail.gmail.com>
In-Reply-To: <CAP9ODKpcSZcKOjgBa3LEZTXEtizBUe219dzLNn_tvb6Pk=3K+A@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201107081708.20895.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 6/8] cmake: add nativesdk and target versions
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
X-List-Received-Date: Fri, 08 Jul 2011 16:12:16 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 08 July 2011 16:49:12 Otavio Salvador wrote:
> >> +# FIXME: Hack due gcc-crosssdk not being able to detect those
> >> automatically +CXXFLAGS_virtclass-nativesdk += " \
> >> +   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
> >> +   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++/${TARGET_SYS}
> >> \ +   "
> > 
> > I get worried when I see things like this :(
> > 
> > Has anyone attempted to work out why gcc-crosssdk can't locate c++
> > include files?
> 
> Not sure why but this is the same things as done on qt4-tools-nativesdk.

Yes, and I don't like it there either. Suggestions on fixing this would be 
welcome - in the time I spent trying to figure out why it wasn't working (some 
months ago) I couldn't find the cause.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


