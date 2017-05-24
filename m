Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 73FC5780E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 13:52:35 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id QDsY1v00B0BmcFC01Dsaqr; Wed, 24 May 2017 14:52:35 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Iav3YSia c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=tJ8p9aeEuA8A:10 a=-An2I_7KAAAA:8
	a=bAwrwCN1QAidHzep_DEA:9
	a=CjuIK1q_8ugA:10 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1dDWiG-0003ZF-Hg; Wed, 24 May 2017 14:52:32 +0100
Date: Wed, 24 May 2017 14:52:32 +0100
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170524135232.GA13067@mcrowe.com>
References: <20170524132336.4259-1-mac@mcrowe.com>
	<CAJTo0LY85HYy_CdROAJMdPVXehNYMs=mDAsuT-RmLr-QK-Ezjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY85HYy_CdROAJMdPVXehNYMs=mDAsuT-RmLr-QK-Ezjg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Revert to inheriting from binconfig
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
X-List-Received-Date: Wed, 24 May 2017 13:52:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 24 May 2017 at 14:28:11 +0100, Burton, Ross wrote:
> On 24 May 2017 at 14:23, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > If libgcrypt upstream doesn't generate a .pc file by default, then we
> > shouldn't expect other upstreams to make use of one. So, I think it makes
> > most sense to go back to installing a working libgcrypt-config binary until
> > that situation changes.
> >
> 
> The flip side of this being that we disabled the script because those sort
> of scripts have terrible failure modes when cross-compiling...

Oh, I thought that binconfig.bbclass swung through hoops in order to make
the scripts work well enough. Is that not true?

Many other recipes are still inheriting binconfig rather than
binconfig-disabled: apr, curl, gnutls, libtasn1.

Mike.

