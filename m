Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFC7771FE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 23:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1SNDUru005886; Sun, 28 Feb 2016 23:13:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eCjgS5jhKKey; Sun, 28 Feb 2016 23:13:30 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1SNDQk4005883
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 28 Feb 2016 23:13:27 GMT
Message-ID: <1456701206.11498.174.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, brendan.le.foll@intel.com, Patches
	and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 28 Feb 2016 23:13:26 +0000
In-Reply-To: <56D33008.9010306@gmail.com>
References: <1456412817-12106-1-git-send-email-brendan.le.foll@intel.com>
	<56D24503.9010803@gmail.com>
	<1456648351.11498.130.camel@linuxfoundation.org>
	<56D329B5.5090101@gmail.com> <56D33008.9010306@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] npm.bbclass: Add npm class to match fetcher
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
X-List-Received-Date: Sun, 28 Feb 2016 23:13:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-02-28 at 12:36 -0500, Trevor Woerner wrote:
> On 02/28/16 12:09, Trevor Woerner wrote:
> > On 02/28/16 03:32, Richard Purdie wrote:
> > > On Sat, 2016-02-27 at 19:53 -0500, Trevor Woerner wrote:
> > > > On 02/25/16 10:06, brendan.le.foll@intel.com wrote:
> > > > > npm class supports the npm fetcher, helping doing the basic
> > > > > compile/install
> > > > > stages of an npm package
> > > > Any chance you might have an npm recipe example? Maybe
> > > > something like
> > > > express?
> > > Not express but there are some in:
> > > 
> > > https://github.com/arfoll/meta-brendan-nodepkgs/tree/master/recip
> > > es-node
> > 
> > Thanks!
> > 
> > I guess I don't have enough "plumbing" quite yet. I have all the 
> > master branches of everything I need and I cherry picked Brendan's 
> > npm.bbclass but I still get:
> 
> Ah sorry. I needed bitbake's master-next.

There was a patch missing, bitbake master should be good now.

Cheers,

Richard

