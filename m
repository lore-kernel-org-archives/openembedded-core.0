Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EA23075D69
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 13:58:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 06 Jul 2015 06:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,415,1432623600"; d="scan'208";a="756869578"
Received: from tgsmith2-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.6.176])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2015 06:58:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 06 Jul 2015 14:58:15 +0100
Message-ID: <2433609.uH57bnQbKA@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.6-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAJTo0LYcEcQfGQTKhq9tkRJNLJTw=LQHEp65e9NqMf7xtPCgMQ@mail.gmail.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<1548004.RNEmCtHdiu@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LYcEcQfGQTKhq9tkRJNLJTw=LQHEp65e9NqMf7xtPCgMQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Mon, 06 Jul 2015 13:58:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 06 July 2015 14:04:46 Burton, Ross wrote:
> On 4 July 2015 at 12:38, Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> wrote:
> > Well, at minimum for our purposes LGPLv3 (or LGPLv3+?) needs to be added
> > to
> > LICENSE in the nettle recipe (with &). Whether or not someone chooses to
> > exclude that license in their configuration through INCOMPATIBLE_LICENSE
> > is a
> > completely separate matter (and that is, as you allude to, a distinct
> > license
> > from GPLv3).
> 
> FWIW the YP documentation states to mark GPL LGPL and AGPL v3 in
> INCOMPATIBLE_LICENSE to build a GPLv3 image, on the rationale that the
> usual clauses that upset people are not specific to the GPL variation.  The
> autobuilder just excludes GPL right now, but there's a bug to fix this.
> 
> Of course IANAL and the opinion of someone who actually does use
> INCOMPATIBLE_LICENSE to remove GPLv3 software would be appreciated!

I'm also not a lawyer, but for that exact reason I don't think we want to get 
into any question of license equivalence or similarity - INCOMPATIBLE_LICENSE, 
if used, needs to list all of the licenses you wish to exclude, so if you want 
LGPLv3 excluded then you need to state that in addition to GPLv3 (and 
naturally any recipe that builds LGPLv3-licensed source needs to state as such 
in the LICENSE value).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

