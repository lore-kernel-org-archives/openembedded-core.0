Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R5kuB-0006f5-Of
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 22:57:31 +0200
Received: from mail188.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id AE154FFC567
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 21:37:49 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 19 Sep 2011 21:33:32 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.9?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 19 Sep 2011 21:33:30 +0200
Message-ID: <4E77990A.5080504@eukrea.com>
Date: Mon, 19 Sep 2011 21:33:30 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
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
	<1316437421.14488.13.camel@ted>
In-Reply-To: <1316437421.14488.13.camel@ted>
X-Ovh-Tracer-Id: 11027345163698744722
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -200
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmneculddquddttddm
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 19 Sep 2011 20:57:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 19/09/2011 15:03, Richard Purdie a =C3=A9crit :
> On Mon, 2011-09-19 at 09:25 -0300, Otavio Salvador wrote:
>> On Mon, Sep 19, 2011 at 09:09, Koen Kooi<koen@dominion.thruhere.net>
>> wrote: ...
>>> I'd like to see 4.7.4 go in. Richard and Saul have made it clear that
>>> removing 4.7.3 isn't going to happen before the release, so I'm tryin=
g
>>> make a compromise here. Are you saying you would find it unacceptable
>>> for both 4.7.3 and 4.7.4 to be in OE-core for a short while?
>>
>> Sure not. I can live with that and this is better then nothing but I
>> think Richard and Saul might rethink this assortment as 4.7.4 is in us=
e
>> by us and proved stable too.
>
> The fact remains nobody has collected up the patches and presented Saul=
/I
> with a pull request collecting up these pieces. I've not even seen the
> patch addressing the regression posted, people just seem to agree one
> exists.
>
as said last weekend I'm working on such a patch collection (including th=
e fix
for the regression).
I hope that to be ready tomorrow (tuesday 20) as I was afk since saturday=
.

Thanks,
Eric


