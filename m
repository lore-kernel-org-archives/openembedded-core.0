Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJ0VQ-000868-Cc for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 13:19:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92B6FtQ015011;
	Tue, 2 Oct 2012 12:06:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14190-05; Tue,  2 Oct 2012 12:06:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92B68gl015005
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 2 Oct 2012 12:06:08 +0100
Message-ID: <1349175971.15753.137.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 02 Oct 2012 12:06:11 +0100
In-Reply-To: <CAJTo0LbApnmy7GRhp1wf=YNiLCFnrQHLTxL0-zf+wW3RLitjWA@mail.gmail.com>
References: <1349092569-26895-1-git-send-email-ross.burton@intel.com>
	<20121001120203.GC3454@jama.jama.net>
	<CAJTo0LZogROfi=ShqZCCA+2mbOVm-iBS3NfSoLX=eC9CZEU2BQ@mail.gmail.com>
	<1349175360.15753.134.camel@ted>
	<CAJTo0LbApnmy7GRhp1wf=YNiLCFnrQHLTxL0-zf+wW3RLitjWA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libdrm: Remove Cairo dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 11:19:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 11:58 +0100, Burton, Ross wrote:
> On 2 October 2012 11:56, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Shouldn't we just disable the things to gain a small bit of build speed
> > if they don't matter? :)
> 
> That means carrying a patch and the maintenance burden when upgrading.
>  I'm not entirely sure you'll notice all ten lines of Cairo code being
> compiled if cairo happens to be installed when libdrm2 builds.

I don't feel strongly about it but it sounds like the kind of thing it
would be useful to switch off and upstream would probably take such a
patch?

Cheers,

Richard



