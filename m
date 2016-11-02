Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 04B436093D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 02:43:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 01 Nov 2016 19:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,582,1473145200"; d="scan'208";a="186571654"
Received: from kgonza2-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.24])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2016 19:43:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 02 Nov 2016 15:43:35 +1300
Message-ID: <2120354.nuZ31vuIN4@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.9-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <E9D64287-7893-4199-8439-F065E146E6AE@gmail.com>
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<cfa1b8cc-7134-fccf-2033-08f4e6c40104@linux.intel.com>
	<E9D64287-7893-4199-8439-F065E146E6AE@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Fix SRC_URI checksums
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
X-List-Received-Date: Wed, 02 Nov 2016 02:43:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 01 Nov 2016 09:45:48 Khem Raj wrote:
> > On Nov 1, 2016, at 9:33 AM, Alexander Kanavin
> > <alexander.kanavin@linux.intel.com> wrote:> 
> > On 11/01/2016 06:06 PM, Khem Raj wrote:
> >>>> we should specify boost/boost/1.62.0/boost_1_62_0.tar.bz2 instead of
> >>>> boost/boost/boost_1_62_0.tar.bz2>>> 
> >>> Incorrect. That will still download a master snapshot tarball. Only if
> >>> the 'project/' is prefixed, SF will give you the release tarball.>> 
> >> if we need projects/ then it should be encoded into SOURCEFORGE_MIRROR
> >> variable in bitbake.conf. Since that required for every sf.net project.
> > 
> > Would you then also fix the remaining recipe-specific part of the URI in
> > all those recipes? I don't have the bandwidth for that right now, and
> > it's a problem that is unlikely to happen in other recipes.
>
> I wonder if same problem would not happen for other sf.net packages.
> probably we never run into it probably because it gets backed up on yp
> download mirror and then used. I am not expecting you to fix it, don't
> worry.

I think it's less likely to happen elsewhere because most projects don't 
release snapshot tarballs with the exact same name as the latest stable 
release ones. Someone really ought to explain to the boost folks why that is a 
bad idea.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

