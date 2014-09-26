Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 588 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Sep 2014 08:58:22 UTC
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD791601A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 08:58:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Sep 2014 01:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,603,1406617200"; d="scan'208";a="579362026"
Received: from tmediriw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.182])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2014 01:48:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Fri, 26 Sep 2014 09:48:33 +0100
Message-ID: <1995466.kcCmvSr1XA@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <9C24F433-394B-4682-B921-7BD865351E64@dominion.thruhere.net>
References: <1411686803-13274-1-git-send-email-ross.burton@intel.com>
	<9C24F433-394B-4682-B921-7BD865351E64@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] curl: add a PACKAGECONFIG for librtmp
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
X-List-Received-Date: Fri, 26 Sep 2014 08:58:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 26 September 2014 08:55:03 Koen Kooi wrote:
> Op 26 sep. 2014, om 01:13 heeft Ross Burton <ross.burton@intel.com> het
> volgende geschreven:
> > Otherwise this is a non-deterministic build dependency.
> > 
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> > meta/recipes-support/curl/curl_7.37.1.bb |    1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/recipes-support/curl/curl_7.37.1.bb
> > b/meta/recipes-support/curl/curl_7.37.1.bb index 8bcd9ba..e2852e3 100644
> > --- a/meta/recipes-support/curl/curl_7.37.1.bb
> > +++ b/meta/recipes-support/curl/curl_7.37.1.bb
> > @@ -27,6 +27,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> > PACKAGECONFIG[ssl] = "--with-ssl
> > --with-random=/dev/urandom,--without-ssl,openssl" PACKAGECONFIG[gnutls] =
> > "--with-gnutls,--without-gnutls,gnutls"
> > PACKAGECONFIG[zlib] =
> > "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
> > +PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
>
> Using librtmp has nasty legal consequences in various countries, is there a
> way to express that risk? Something analogous to the commercial license
> protection we have.

Maybe set LICENSE_FLAGS conditionally upon rtmpdump being in PACKAGECONFIG?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

