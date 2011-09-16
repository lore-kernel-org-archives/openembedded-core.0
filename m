Received: from 9.mo5.mail-out.ovh.net ([178.32.96.204]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R4eem-0006Dm-6c
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 22:05:04 +0200
Received: from mail183.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 11D2E102CE13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 21:53:21 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Sep 2011 21:52:53 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.9?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 16 Sep 2011 21:52:52 +0200
Message-ID: <4E73A913.50101@eukrea.com>
Date: Fri, 16 Sep 2011 21:52:51 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
References: <CAP9ODKqCg-GOR-HLcuXzrgCVM2tt0anUCTeAEVoqGVFVG4YkEQ@mail.gmail.com>
	<1315925099-9259-1-git-send-email-eric@eukrea.com>
	<1316192238.20858.45.camel@ted>
In-Reply-To: <1316192238.20858.45.camel@ted>
X-Ovh-Tracer-Id: 12183362893329378754
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -200
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmneculddquddttddm
Subject: Re: [PATCH v2] qt4: fix generated sdk
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
X-List-Received-Date: Fri, 16 Sep 2011 20:05:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Le 16/09/2011 18:57, Richard Purdie a =C3=A9crit :
> On Tue, 2011-09-13 at 16:44 +0200, Eric B=C3=A9nard wrote:
>> - qt4-tools-nativesdk : actually the qmake binary which gets installed
>> comes from the native recipe. This patch fix this problem by laucnhing
>> configure twice : once to compile qmake using the right toolchain for
>> nativesdk, and a second time using the native qmake to compile all the
>> other tools for the nativesdk. Then we install the right qmake.
>
> I was reading through this and wondered why we can't this use the qmake
> from the qt4-tools-native recipe?
>
Path are not properly set in the native one and the actual meta-toolchain=
=20
doesn't compile a simple hello world in qt (because path are the one of t=
he=20
buildir of OE instead of the path where is installed the sdk).

Also (maybe I'm wrong here), isn't it possible to have the nativesdk gene=
rated=20
binaries being compiled for an architecture (SDK_ARCH) different than the=
=20
native one (BUILD_ARCH) ?

In one case I see -nativesdk are compiled using=20
CC=3Dx86_64-angstromsdk-linux-gcc when -native are compiled using CC=3Dgc=
c so I=20
was assuming this change makes the binaries more consistent in the native=
sdk=20
package.

Eric


