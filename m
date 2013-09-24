Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 44CF26C994
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:37:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8OGbcAb026139; Tue, 24 Sep 2013 17:37:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YdWObrMEcB_m; Tue, 24 Sep 2013 17:37:38 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8OGbY6Q026125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 24 Sep 2013 17:37:35 +0100
Message-ID: <1380040650.18603.295.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Sep 2013 17:37:30 +0100
In-Reply-To: <CAJTo0Lb-kjzX_=zRLc5q67xG3tWM4hn5dztj2XDd1w2md_smJg@mail.gmail.com>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
	<CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
	<523501AC.4010208@linux.intel.com> <5237E49C.7090608@windriver.com>
	<CAMKF1sqDxGyVnrap0=Jsq=iMFGnXkupjuWnTSwxzBv8K4tqzPg@mail.gmail.com>
	<20130917103029.GA7313@jama>
	<CAJTo0LY0yOaFyn0+DiTgag2bJ4qJ5XM0-=Vz7EMN8ajXsseiiw@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF843C5198BB@ALA-MBB.corp.ad.wrs.com>
	<CAJTo0Lb-kjzX_=zRLc5q67xG3tWM4hn5dztj2XDd1w2md_smJg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Tue, 24 Sep 2013 16:37:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-24 at 17:34 +0100, Burton, Ross wrote:
> On 23 September 2013 22:51, Slater, Joseph <joe.slater@windriver.com> wrote:
> >> Anyone else want to add a data point?
> >
> > I am the only user on the machine below.  I compiled twice, each way --
> 
> [snip]
> 
> Unless I'm reading that wrong, it looks like again its actually a
> small win to use -no-keep-memory.  Sounds like we should just add it.

Its in.

Cheers,

Richard


