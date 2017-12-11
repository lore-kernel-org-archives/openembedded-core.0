Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 860A371B86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 09:51:50 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id OKkXere0VFv8cOKkYeng0V; Mon, 11 Dec 2017 09:51:51 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Ful1xyjq c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=ocR9PWop10UA:10 a=-An2I_7KAAAA:8 a=alK4_DS-AAAA:8
	a=nhz9q0r2Kjt7flofI5EA:9 a=CjuIK1q_8ugA:10 a=Sq34B_EcNBM9_nrAYB9S:22
	a=rOCknGvZllDBBwZ8Yz5I:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1eOKkX-0006id-Ge; Mon, 11 Dec 2017 09:51:49 +0000
Date: Mon, 11 Dec 2017 09:51:49 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20171211095149.ywhejbets5loutnv@mcrowe.com>
References: <20171112163923.19517-1-mac@mcrowe.com>
	<CAP9ODKoxmsvO6ZaSNkYX3_-R234vvFoq3Ce6cWKDg_RE2tvMtg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoxmsvO6ZaSNkYX3_-R234vvFoq3Ce6cWKDg_RE2tvMtg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfFNbMvyTnFjhYmqvyUCLCEJrX3qY05MbDbdurBj3cC/0+sPA1hsCj9VCW3BM4AqMIwSeC1uoNn4VCh1eND2FPSq+zUdPkDV3q7RzI+GEEvxfh3B5gFut
	n9oTb8S/8sTlb7YwombdJlbs34q1wycJxp7chWvaaZ6hZ94gpW/B70fB
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Mon, 11 Dec 2017 09:51:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 13 November 2017 at 15:15:35 -0200, Otavio Salvador wrote:
> On Sun, Nov 12, 2017 at 2:39 PM, Mike Crowe <mac@mcrowe.com> wrote:
> > With meta-micro, ${prefix} is the empty string. This means that
> > CMAKE_INSTALL_BINDIR:PATH and friends end up containing paths starting with
> > many instances of "../", presumably due to os.path.relpath attempting to
> > find its way to the current directory.
> >
> > Let's avoid this by ensuring that the root path always ends in a slash. If
> > it already ends in a slash then adding another one shouldn't cause any
> > problems.
> >
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Patch ID: 145709

It doesn't look like this change has landed, even on master-next. Has it
fallen through the cracks?

Thanks.

Mike.

