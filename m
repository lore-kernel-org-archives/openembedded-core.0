Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8Afu-0004q3-8h for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 14:52:46 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QCrWAh021168 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 13:53:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W2tljkpbg2b9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 13:53:32 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QCrTvL021164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 13:53:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 13:47:05 +0100
In-Reply-To: <CAP9ODKqGJ+VxCf8kFcbeaMNwgneLpb-HU2eTpu8w_UM1p-5A6g@mail.gmail.com>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
	<CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
	<1316799031.3125.3.camel@ted>
	<CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
	<1317029042.26109.29.camel@ted>
	<CAP9ODKqGJ+VxCf8kFcbeaMNwgneLpb-HU2eTpu8w_UM1p-5A6g@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317041232.26109.38.camel@ted>
Mime-Version: 1.0
Subject: Re: Branch management for OE-Core release
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
X-List-Received-Date: Mon, 26 Sep 2011 12:52:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-26 at 09:27 -0300, Otavio Salvador wrote:
> On Mon, Sep 26, 2011 at 06:23, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
> > FWIW, something like git cherry can identify your local changes so you
> > could apply them on top of master so there are other ways to make your
> > usecase work...
> 
> This breaks the value of using a SCM since you won't have a common parent.
> 
> As Chris, I'd prefer to have it merged.
> 
> The only way it can complicate issue is if fixes are cherry-picked
> into the stable branch. If they're are done into the stable and merged
> into master this works wonderfully.

No, this just just plain wrong. Changes go into master which is where
development happens. They can then filter into other branches (there may
be more than one) as needed.

To illustate the problem, if a change is needed in two different release
branches you'd commit to both and then cherry-pick both into master?

Cheers,

Richard






