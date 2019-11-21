Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0F19975E80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A11AD9C01AD;
	Thu, 21 Nov 2019 08:21:58 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id EXh2zZ191oU5; Thu, 21 Nov 2019 08:21:57 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 680139C02B1;
	Thu, 21 Nov 2019 08:21:57 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id RyPbcYf8DQsA; Thu, 21 Nov 2019 08:21:57 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3BC319C01AD;
	Thu, 21 Nov 2019 08:21:57 -0500 (EST)
Date: Thu, 21 Nov 2019 08:21:57 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Message-ID: <1501877168.602363.1574342517198.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <315444F4-D824-4698-B0EB-B20309CD6809@linux.intel.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
	<549C1F29-84E4-43A3-9DD2-FBED13A92C37@linux.intel.com>
	<315444F4-D824-4698-B0EB-B20309CD6809@linux.intel.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC78 (Linux)/8.8.11_GA_3737)
Thread-Topic: NPM refactoring
Thread-Index: 2j77hP2Hrpo8IAbjyI+T1+eYEkn2HQ==
Cc: paul eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	bunk@stusta.de, Jonas Andersson <jonaskgandersson@gmail.com>
Subject: Re: [PATCH v3 00/17] NPM refactoring
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
X-List-Received-Date: Thu, 21 Nov 2019 13:21:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Tim,

On Nov 21, 2019, at 7:36 AM, Tim Orling timothy.t.orling@linux.intel.com wr=
ote:
>> On Nov 20, 2019, at 10:27 PM, Tim Orling <timothy.t.orling@linux.intel.c=
om>
>> wrote:
>>> On Nov 20, 2019, at 1:33 AM, Jean-Marie LEMETAYER
>>> <jean-marie.lemetayer@savoirfairelinux.com
>>> <mailto:jean-marie.lemetayer@savoirfairelinux.com>> wrote:
>>>=20
>>> The test steps are these ones:
>>>  $ source poky/oe-init-build-env
>>>  $ bitbake-layers add-layer ../meta-openembedded/meta-oe
>>>  $ devtool add
>>>  "npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-example=
;version=3Dlatest
>>>  <npm://registry.npmjs.org%3Bname%3D@savoirfairelinux/node-server-examp=
le;version=3Dlatest>=E2=80=9D
>>=20
>> I noticed this before but forgot to report it:
>>=20
>> ERROR: Nothing PROVIDES 'c-ares-native' (but
>> virtual:native:/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/=
nodejs_10.17.0.bb
>> DEPENDS on or otherwise requires it). ...
>> http://layers.openembedded.org/layerindex/recipe/50318/
>> <http://layers.openembedded.org/layerindex/recipe/50318/>
>> $ bitbake-layers add-layer ../meta-openembedded/meta-networking
>> Which requires
>> $ bitbake-layers add-layer ../meta-openembedded/meta-python
>>=20
>>=20
>> Using tip of bitbake with V3, openembedded-core with V3 and meta-openemb=
edded
>> master, somehow nodejs-native do_compile broke (at least on qemux86-64) =
since
>> the last time I built it shortly after ELC-E=E2=80=A6
>> So now I=E2=80=99ll have to git bisect that=E2=80=A6more to come=E2=80=
=A6
>=20
> See https://errors.yoctoproject.org/Errors/Details/274939/
> <https://errors.yoctoproject.org/Errors/Details/274939/>
> The same error I am seeing.
>=20
>>=20
>> FWIW I had previously successfully run your instructions and the tests f=
or both
>> bitbake and oe-selftest for V2 (distroless, e.g. not with poky). Somethi=
ng
>> unrelated has broken I suspect.

Thanks for your feedback.

Since ELCE the nodejs recipe have received some patches including this one:
http://lists.openembedded.org/pipermail/openembedded-devel/2019-October/202=
636.html

And was updated to 10.17.0:
http://lists.openembedded.org/pipermail/openembedded-devel/2019-October/202=
639.html

But since it is concerning the nodejs recipe and not the npm fetcher/class
do you think it should block the patchset ?

>>>  $ devtool build savoirfairelinux-node-server-example
>>>  $ bitbake-layers create-layer ../meta-test
>>>  $ bitbake-layers add-layer ../meta-test
>>>  $ devtool finish savoirfairelinux-node-server-example ../meta-test
>>>  $ echo IMAGE_INSTALL_append =3D '" savoirfairelinux-node-server-exampl=
e"' >>
>>>  conf/local.conf
>>>  $ bitbake core-image-minimal
>>>=20
>>> --- V2
>>>=20
>>> - Add a 'recipetool.RecipetoolTests.test_recipetool_create_npm' test ca=
se for
>>>   'oe-selftest' to test the npm recipe creation.
>>>=20
>>> --- V3
>>>=20
>>> - Add a test regarding the 'devtool add' and 'devtool build' command:
>>>     - devtool.DevtoolAddTests.test_devtool_add_npm

I had a lot of requests about tests. What do you think about these ?
FYI some fetcher tests have also been posted in the bitbake mailing list.

Regards,
Jean-Marie





