Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B118065C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 20:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4HKOVUK012403; Tue, 17 May 2016 21:24:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id n-yCv0ixnafQ; Tue, 17 May 2016 21:24:31 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4HKOPos012400
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 17 May 2016 21:24:26 +0100
Message-ID: <1463516665.4578.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Tue, 17 May 2016 21:24:25 +0100
In-Reply-To: <CAP9ODKqSG31qa3Au7g04DMjQmn+B4Xzz2Rtm2Ym0xYs55Mc-PA@mail.gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
	<CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
	<314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
	<CAHiDW_GzrvqCkkcUMtNQTtgoit9JdJ5Y-pBP2vHsiC67+7JB-Q@mail.gmail.com>
	<CAJTo0LbN+7V1iZ5u77EZbJxtF4ou2p40+ka-aJaQx=Fk4znSzg@mail.gmail.com>
	<CAP9ODKqSG31qa3Au7g04DMjQmn+B4Xzz2Rtm2Ym0xYs55Mc-PA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 17 May 2016 20:24:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-05-17 at 11:00 -0300, Otavio Salvador wrote:
> On Tue, May 17, 2016 at 5:38 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > 
> > On 17 May 2016 at 08:31, Jussi Kukkonen <jussi.kukkonen@intel.com>
> > wrote:
> > > 
> > > There's not much to work on as far as I can tell: 1.11 should be
> > > a
> > > simple upgrade with trivial patch changes.
> > > As I said, I'm totally fine with waiting a couple of weeks until
> > > 1.11.
> > > On the other hand I haven't seen any reasons to start packaging a
> > > pre-release -- why this one if we normally don't do it?
> > 
> > 
> > Agreed, if we want an upgrade now then 1.10 is good, otherwise wait
> > for
> > 1.11.  There's no urgent need for a prerelease is there?
> 
> So please do 1.10 now, as the XWayland rework was done basing on that
> ... we can handle 1.11 upgrade once it happens.

I fixed up the selftest failure the original patch as proposed caused
and have merged that. Anything further can be based on that...

Cheers,

Richard

