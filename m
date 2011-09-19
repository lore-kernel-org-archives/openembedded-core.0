Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R5dat-0003ti-Hw for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 15:09:07 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8JD9tli019791; Mon, 19 Sep 2011 14:09:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ItkFst-Ld4oZ; Mon, 19 Sep 2011 14:09:55 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8JD9jQW019785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 19 Sep 2011 14:09:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 19 Sep 2011 14:03:33 +0100
In-Reply-To: <CAP9ODKpbVD-2AyXEMQG9D=6=F1n2kC-J=jOU7EPc2hWa_bjq6A@mail.gmail.com>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
	<CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
	<DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
	<CAP9ODKoemW81Sob3uUe-1LedWXcoJqEdkUGTj-+ZjgrUsytb_Q@mail.gmail.com>
	<49A59D49-5FF1-4F8D-A259-F6F8CA42ADC9@dominion.thruhere.net>
	<CAP9ODKpbVD-2AyXEMQG9D=6=F1n2kC-J=jOU7EPc2hWa_bjq6A@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316437421.14488.13.camel@ted>
Mime-Version: 1.0
Cc: Patches, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Sep 2011 13:09:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-19 at 09:25 -0300, Otavio Salvador wrote:
> On Mon, Sep 19, 2011 at 09:09, Koen Kooi <koen@dominion.thruhere.net> wrote:
> ...
> > I'd like to see 4.7.4 go in. Richard and Saul have made it clear that removing 4.7.3 isn't going to happen before the release, so I'm trying make a compromise here. Are you saying you would find it unacceptable for both 4.7.3 and 4.7.4 to be in OE-core for a short while?
> 
> Sure not. I can live with that and this is better then nothing but I
> think Richard and Saul might rethink this assortment as 4.7.4 is in
> use by us and proved stable too.

The fact remains nobody has collected up the patches and presented
Saul/I with a pull request collecting up these pieces. I've not even
seen the patch addressing the regression posted, people just seem to
agree one exists.

So various people has tested varying combinations of patches with
varying success. This isn't the kind of patchset I like to take at -rc3
time. If it breaks the build in any way on any of the four architectures
the release gets delayed by at least a couple of weeks. I don't think
people realise how long proper QA cycles take :( I really do want to
take it but people aren't helping make this easy for me and it does
carry significant risk which I don't think people realise.

Cheers,

Richard (@Shanghai)



