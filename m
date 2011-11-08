Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RNhPA-0008TO-1Q
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 09:51:40 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 1E3F84B01D6;
	Tue,  8 Nov 2011 09:45:22 +0100 (CET)
Message-ID: <4EB8EC21.9040801@eukrea.com>
Date: Tue, 08 Nov 2011 09:45:21 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>
References: <4EB8225D.6000804@intel.com>
	<1320700315-11952-1-git-send-email-eric@eukrea.com>
	<4EB86E07.5020907@intel.com>
In-Reply-To: <4EB86E07.5020907@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] useradd.bbclass: handle nativesdk case
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
X-List-Received-Date: Tue, 08 Nov 2011 08:51:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Scott,

Le 08/11/2011 00:47, Scott Garman a =C3=A9crit :
> Sorry to throw more churn into this, but can I ask you to submit a new =
pull
> request for this?
>
> In discussions with Richard today, he pointed out a few tricks that wou=
ld
> improve the patchset:
>
> DEPENDS_append =3D "${USERADDDEPENDS}"
> USERADDDEPENDS =3D " base-passwd shadow-native shadow-sysroot"
> USERADDDEPENDS_virtclass-nativesdk =3D ""
>
> do_install[prefuncs] +=3D "${SYSROOTFUNC}"
> SYSROOTFUNC =3D "useradd_sysroot"
> SYSROOTFUNC_virtclass-nativesdk =3D ""
>
that's clean it removes all the python code and ... that works !

> I didn't want to take away credit for your patch, so if you'd be willin=
g to
> make these changes and respin your patch set, we'll take that.
>
well now you have written v2 of the patch so you also get the credits but=
 the=20
most important thing beyond the credits is to have this bug fixed ;-)

> The second thing is to avoid merge conflicts, can you rebase you patchs=
et on
> top of this branch:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dsgarman=
/useradd-rdepends-final
>
>
I just applied this patch and resent the 2 others on top of this one.

Thanks,
Eric


