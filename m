Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id BEE8E60079
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 10:28:23 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id RbbqeyhIF2du7Rbbre02cD; Wed, 20 Dec 2017 10:28:24 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=a6FAzQaF c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=ocR9PWop10UA:10 a=g4rX16vBREq7J-sRCDUA:9
	a=CjuIK1q_8ugA:10 a=8387nF9mEzIA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1eRbbq-00079o-Hz; Wed, 20 Dec 2017 10:28:22 +0000
Date: Wed, 20 Dec 2017 10:28:22 +0000
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171220102822.4ohufxtgcu3lg3r5@mcrowe.com>
References: <20171112163923.19517-1-mac@mcrowe.com>
	<CAP9ODKoxmsvO6ZaSNkYX3_-R234vvFoq3Ce6cWKDg_RE2tvMtg@mail.gmail.com>
	<20171211095149.ywhejbets5loutnv@mcrowe.com>
	<CAJTo0Lbp+4hmDE69Wrc5z-EvwPytweozmxBWemrbTXhN5DHwRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbp+4hmDE69Wrc5z-EvwPytweozmxBWemrbTXhN5DHwRg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfBfA1L76xIElkWr5JPa2nCQb69fEEQ63xMH+Ty0QQJxWonvC8KtRqj5j4rMPtGeLDTd9480EwNNVUv9JAPjWSa8NKH4NrrPT1o0p9o2PkPH3nbxkGpkI
	482t6H7M0IQfmA4FCsXTVVfjc6dASMR2svchG9WkN+1Fa2xRAN0uGe3T
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] cmake: Avoid passing empty prefix to os.path.relpath
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
X-List-Received-Date: Wed, 20 Dec 2017 10:28:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 11 December 2017 at 13:45:26 +0000, Burton, Ross wrote:
> It was implicated in some build failures.  I'll re-add it and try again.

Thanks. Are the new results in? I had a poke about on autobuilder.yocto.io
but couldn't work out how to tell which builds this commit was included in.
Build 719 did not appear to include it.

Thanks.

Mike.

