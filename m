Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 087417749A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 20:05:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 13:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,408,1459839600"; d="scan'208";a="115073617"
Received: from ahmadjaz-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.128])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 13:05:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 03 Jun 2016 08:05:53 +1200
Message-ID: <9768316.XeEkP5KyxQ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAP9ODKr3Wt9EYUQEbJHyh4sBSkYb5k=r0egUPpv_RodFnPy2Sg@mail.gmail.com>
References: <20160527102831.24166-1-otavio@ossystems.com.br>
	<3646067.LvorxU5kj3@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKr3Wt9EYUQEbJHyh4sBSkYb5k=r0egUPpv_RodFnPy2Sg@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: Add openssl as a runtime dependency
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
X-List-Received-Date: Thu, 02 Jun 2016 20:05:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 02 Jun 2016 12:00:57 Otavio Salvador wrote:
> On Wed, Jun 1, 2016 at 8:31 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Mon, 30 May 2016 22:57:52 Richard Purdie wrote:
> >> On Fri, 2016-05-27 at 07:28 -0300, Otavio Salvador wrote:
> >> > The update-ca-certificates script uses the c_rehash utility which is
> >> > installed by openssl. Add openssl as a runtime dependency to fulfill
> >> > the utility requirement.
> >> > 
> >> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> > ---
> >> > 
> >> >  meta/recipes-support/ca-certificates/ca-certificates_20160104.bb | 2
> >> > 
> >> > ++
> >> > 
> >> >  1 file changed, 2 insertions(+)
> >> 
> >> This broke allarch machine signature invariance however I merged a
> >> patch to resolve that.
> > 
> > I think we may still be missing a build-time dependency for
> 
> > ca-certificates-native:
> Indeed; do you handle it or want me to send a patch for this?

I can do it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

