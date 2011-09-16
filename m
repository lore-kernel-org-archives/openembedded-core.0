Received: from 1.mo1.mail-out.ovh.net ([178.32.127.22]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R4Xbw-0002c3-T0
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 14:33:41 +0200
Received: from mail194.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id F31AD100CD56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 14:23:10 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Sep 2011 14:22:24 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Sep 2011 14:22:22 +0200
Message-ID: <4E733F7D.6090109@eukrea.com>
Date: Fri, 16 Sep 2011 14:22:21 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
In-Reply-To: <201109161212.19780.paul.eggleton@linux.intel.com>
X-Ovh-Tracer-Id: 4575094272098872765
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -200
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrfeeiucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmneculddquddttddm
Cc: Koen Kooi <koen@dominion.thruhere.net>,
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
X-List-Received-Date: Fri, 16 Sep 2011 12:33:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 16/09/2011 13:12, Paul Eggleton a =E9crit :
> On Thursday 15 September 2011 21:06:22 Otavio Salvador wrote:
>> On Thu, Sep 15, 2011 at 15:41, Eric B=E9nard<eric@eukrea.com>  wrote:
>> ...
>>
>>> Btw, this patch is only a minor update of qt so this would be interes=
ting
>>> to have it into the 1.1 release imho.
>>
>> I agree with Eric that this is important to have into the release; rc
>> is OK to skip it but for final seems good to have it in.
>
> Considering there is at least one reported regression in 4.7.4, I'm not=
 sure
> it would be a good idea to rush into it right now:
>
> https://bugreports.qt.nokia.com/browse/QTBUG-20925
>
We could also say that qt 4.7.4 fix many qt 4.7.3 bugs and integrate the =
patch=20
fixing this one and in the end get an improvement.

I don't understand why oe-core's development has to be stopped by yocto's=
=20
releases process but I may not have found the right page on the wiki=20
explaining all the details : may you please give me some links concerning=
 this=20
policy ?

Maybe yocto could consider oe-core as an incubator instead of a follower =
else=20
I don't really see why we need to have the same project managed by the sa=
me=20
peoples with 2 different names.

Eric


