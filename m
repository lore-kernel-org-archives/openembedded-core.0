Received: from 9.mo5.mail-out.ovh.net ([178.32.96.204]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R4exV-0006iH-6u
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 22:24:25 +0200
Received: from mail183.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 5928C1000D6C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 22:01:06 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Sep 2011 22:00:38 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.9?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 16 Sep 2011 22:00:38 +0200
Message-ID: <4E73AAE5.2040005@eukrea.com>
Date: Fri, 16 Sep 2011 22:00:37 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
References: <1316193195.20858.55.camel@ted>
In-Reply-To: <1316193195.20858.55.camel@ted>
X-Ovh-Tracer-Id: 12314530232966426002
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: QT4 patches
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
X-List-Received-Date: Fri, 16 Sep 2011 20:24:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Le 16/09/2011 19:13, Richard Purdie a =C3=A9crit :
> There is also a qt4 demo split patch that looks like its been through a
> couple of iterations and also some armv6 patch with feedback that there
> are futher issues so I'm not sure what the status is there.
>
One thing that would be great is to have the possibility to change the
status of patches on patchwork which would allow us to mark patches
as superseded which would make the thing clearer on patchwork.

> Firstly, I love the patches, its great to see these issues getting
> sorted out. I am however getting very confused between all the patches
> and their versions and its taken me a while to figure out what I'm
> likely being expected to merge.
>
> Could someone therefore please put together a combined pull request for
> these pieces from a git branch? I will take them into master (assuming
> some details get ironed out) but I'm not sure they can make the release
> branch at this point (the fun with the .bbappend files isn't helping my
> confidence there).
>
I'm preparing this, I hope I'll manage to provide the branches by tuesday
(tested for armv5, armv6 & armv7 hardware for qtdemo embedded images and
also for the meta-toolchain-qte on a x86-64 host for each of this target)=
.

Eric


