Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R2KQQ-0001rI-IA
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 12:04:38 +0200
Received: from [192.168.2.9] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 52176A6251
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 11:59:31 +0200 (CEST)
Message-ID: <4E6B3502.6020702@eukrea.com>
Date: Sat, 10 Sep 2011 11:59:30 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1315646701-28916-1-git-send-email-eric@eukrea.com>
	<CAP9ODKoUZfRLHDv7p=wJAczZ_nh-7LeETabwzM8X_Hp_EyqN7g@mail.gmail.com>
In-Reply-To: <CAP9ODKoUZfRLHDv7p=wJAczZ_nh-7LeETabwzM8X_Hp_EyqN7g@mail.gmail.com>
Subject: Re: [PATCH] qt4: fix generated sdk
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
X-List-Received-Date: Sat, 10 Sep 2011 10:04:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Le 10/09/2011 11:56, Otavio Salvador a =E9crit :
> On Sat, Sep 10, 2011 at 06:25, Eric B=E9nard<eric@eukrea.com>  wrote:
>> - qt4-tools-nativesdk : actually the qmkae binary which gets installed
>> comes from the native recipe. This patch fix this problem by laucnhing
>> configure twice : once to compile qmake using the right toolchain for
>> nativesdk, and a second time using the native qmake to compile all the
>> other tools for the nativesdk. Then we install the right qmake.
> ...
>> - toolchain_create_sdk_env_script_append : we need to add OE_QMAKE_CFL=
AGS,
>> OE_QMAKE_CXXFLAGS and OE_QMAKE_LDFLAGS else the sdk won't find these
>> variables that are inserted by qmake in the Makefiles.
>>
>> - with this patch, oe-core generates a working meta-toolchain-qte whic=
h
>> can compile a small example and is properly recognized by qtcreator (t=
his
>> brings oe-core's meta-toolchain-qte to oe-dev's functional state).
> ...
>
> In this case we most probably can drop the qt.conf file from the SDK
> directory, don't we?
>
no qt.conf gets installed in the sdk.

Eric


