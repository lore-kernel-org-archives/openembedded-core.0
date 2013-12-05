Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8B82A61634
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 15:10:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5F94ei013226; Thu, 5 Dec 2013 15:09:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RVlRjoH8HykH; Thu,  5 Dec 2013 15:09:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5F9pMd013245
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Dec 2013 15:09:53 GMT
Message-ID: <1386256186.25847.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 05 Dec 2013 15:09:46 +0000
In-Reply-To: <52A0892D.3090400@mlbassoc.com>
References: <52A06F24.1060009@mlbassoc.com> <1386251419.25847.19.camel@ted>
	<52A0892D.3090400@mlbassoc.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: BB_NO_NETWORK broken for git
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
X-List-Received-Date: Thu, 05 Dec 2013 15:10:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-12-05 at 07:09 -0700, Gary Thomas wrote:
> On 2013-12-05 06:50, Richard Purdie wrote:
> > On Thu, 2013-12-05 at 05:18 -0700, Gary Thomas wrote:
> >> I try to use a local source mirror, fully populated with packages, so I
> >> can deliver a complete (no network required) bundle to my customers.  This
> >> has recently been broken.
> >>
> >> I can no longer use BB_NO_NETWORK=1 for git recipes, since this revision:
> >> commit 2354250a95eab484459f41f8715ae112295c2174
> >> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Date:   Mon Nov 18 17:17:16 2013 +0000
> >
> > Its actually the metadata that has the issue. The commit specified is
> > not on the master branch, its on the cross_prelink branch so the fetcher
> > is justifiably getting upset.
> >
> > When the network is present it does a complete reset to upstream and
> > then assumes the revision is present though which is something we might
> > want to fix too.
> >
> > For now we can at least correct the metadata to point at the right
> > branch. I've sent out a patch accordingly.
> 
> Does this work for other git based repositories?  My example was for
> prelink, but it seems to fail for me for any SRC_URI that uses git.
> For example, matchbox-keyboard also fails under the same test scenario.

Its the same problem. The commit referenced is not on master but on a
different branch. The URL needs fixing to point at the right branch.

Cheers,

Richard



