Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 32B3760FE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 15:52:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Sep 2013 08:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,978,1371106800"; d="scan'208";a="400924090"
Received: from pauljbro-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.48])
	by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2013 08:52:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Date: Wed, 25 Sep 2013 16:52:20 +0100
Message-ID: <2149237.RBEObpR8u8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <5242FB37.6030104@mentor.com>
References: <1379595818-6019-1-git-send-email-muhammad_shakeel@mentor.com>
	<5242FB37.6030104@mentor.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Add ca-certificates in RRECOMMENDS
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
X-List-Received-Date: Wed, 25 Sep 2013 15:52:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 September 2013 20:03:19 Muhammad Shakeel wrote:
> On 09/19/2013 06:03 PM, Shakeel, Muhammad wrote:
> > From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> > 
> > In some situations ca-certificates are required along with openssl
> > to communicate securely, i.e. curl trying to fetch contents through https.
> > 
> > Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> > ---
> > 
> >   meta/recipes-connectivity/openssl/openssl.inc |    2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-connectivity/openssl/openssl.inc
> > b/meta/recipes-connectivity/openssl/openssl.inc index 78ff7ae..cf60d4b
> > 100644
> > --- a/meta/recipes-connectivity/openssl/openssl.inc
> > +++ b/meta/recipes-connectivity/openssl/openssl.inc
> > @@ -13,6 +13,8 @@ LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"> 
> >   DEPENDS = "perl-native-runtime"
> > 
> > +RRECOMMENDS_${PN} = "ca-certificates"
> > +
> > 
> >   SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
> >   
> >             "
> >   
> >   S = "${WORKDIR}/openssl-${PV}"
> 
> Any feedback on this?

I could be wrong, but this doesn't seem like the right thing to do. Surely 
individual *applications* that need ca-certificates in conjunction with OpenSSL 
should be adding it to their RRECOMMENDS?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

