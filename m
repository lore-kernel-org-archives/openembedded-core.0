Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 88AC06F1A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 18:04:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2014 09:59:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,549,1389772800"; d="scan'208";a="490244864"
Received: from jgkenna-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.171])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2014 10:03:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 26 Feb 2014 18:03:57 +0000
Message-ID: <7374845.RWAFydePVA@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <CAMCfZKHM_RsfEOw64nXTc56WJZXAsgzeSBj3xyia81OgB=aeiQ@mail.gmail.com>
References: <1393419467-6018-1-git-send-email-diego.sueiro@gmail.com>
	<2631264.Ll8XlRBBiZ@peggleto-mobl5.ger.corp.intel.com>
	<CAMCfZKHM_RsfEOw64nXTc56WJZXAsgzeSBj3xyia81OgB=aeiQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Wed, 26 Feb 2014 18:04:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 26 February 2014 14:45:26 Diego Sueiro wrote:
> On Wed, Feb 26, 2014 at 11:42 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> > I know there's already been a bit of discussion about this patch already,
> > so I apologise if this has already been covered, but the commit message
> > doesn't completely justify this addition. Most people don't statically
> > link to Qt, which is why we haven't included any static libraries in the
> > SDK (and as a rule we typically don't include any static libraries in our
> > SDKs). Why is this individual library out of all of the libraries that Qt
> > ships special?
> 
> I did a research on internet and just found static library for uitools. I
> could not found anything that explains the reasons for not generating a
> shared library.
> People will not be able to use uitools If this library is not shipped with
> SDK.
> 
> I tried to explain this dependency on commit message:
> > libQtUiTools.a and libQtUiToolsE.a needs to be installed on
> > meta-toolchain-qt
> > and meta-toolchain-qte respectively.
> > Whitout this static library, compiling qt apps which needs uitools will
> > fail.

The missing part is that libQtUiTools is only built as a static library (by 
upstream intentionally). I did some quick checking and it does appear that is 
the case, but if you could add that to the commit message that would be great. 
(I can only assume that not many people need to use the uitools module, hence 
why this hasn't come up before.)

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

