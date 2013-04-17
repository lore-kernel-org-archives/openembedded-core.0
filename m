Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1USXFz-0002zt-Mr
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 20:39:04 +0200
Received: by mail-pb0-f46.google.com with SMTP id uo1so309354pbc.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 11:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=l4AInmNHfgk55AucZdRayAiDXcldrrjgubLlBjjO0Xk=;
	b=bb0YXaIMHb2a1Uy3fAdvmRkQJvE11FaT0i8GKS6Ydo2S6mDNtKbeGgovyuSE7/nVWw
	vFznc+6A/b2nkh+rOYVQmFTuv4NQ82POnvYxz0WUIXA7NnwhWIpwTXVGlFI1xPg/v7B1
	k+ArIFNwphMO6yytoeEEKzdTIoh6tANAKSyoIBTQhBEYWvzdFyWXAX9uzDll+g9woDD3
	TfmyG5HkPhjPjTVJsli4Tl4Z7ajPXzlhxW0SMeeFrHfc43u2h3zPmvKpfA5FuCATzx22
	ycCF32nv7NWAr/i1UUgJz/sYx4auN1EgrDp9qYrc3jZQ0XtkxLdWAk5FCy3BU45QztxF
	iYEQ==
X-Received: by 10.66.75.98 with SMTP id b2mr2491164paw.112.1366222886657;
	Wed, 17 Apr 2013 11:21:26 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id ce16sm7959148pac.5.2013.04.17.11.21.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 11:21:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1366186370.25282.20.camel@ted>
Date: Wed, 17 Apr 2013 11:21:22 -0700
Message-Id: <0D810573-C1DD-4EF7-8AFF-8E836A046213@gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
	<D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
	<CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
	<1364824441.24754.20.camel@localhost>
	<CALbNGRSqEdebP4WsrH9xrW30k+MuxfaXousVfNfjdufS4yCfSw@mail.gmail.com>
	<CAJTo0LZGADsne_bKyDDTX2Vt4QX=pfv+Vr27Xi93B8C_S3WJkg@mail.gmail.com>
	<CALbNGRRCFyiD+6eY1xMe6o8dqtpuyf6YAEa7xKZ=f8wBv262uA@mail.gmail.com>
	<CAJTo0Ladru_hAgyL32SX8bDet3euSFz9Jf=jiJxBJqiNv8eseQ@mail.gmail.com>
	<CALbNGRQ+BqGarZWxmtj50S4rJbDtNPGqB=eWvotBVdVAcviedQ@mail.gmail.com>
	<CALbNGRTMUkavk8669XUPf+YMEBTibUPhpnHh35xYG4eENO-ktw@mail.gmail.com>
	<1366186370.25282.20.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 18:39:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Apr 17, 2013, at 1:12 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2013-04-17 at 09:47 +0200, Andreas M=FCller wrote:
>> On Fri, Apr 12, 2013 at 1:01 PM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Fri, Apr 12, 2013 at 12:53 PM, Burton, Ross =
<ross.burton@intel.com> wrote:
>>>> Hi Andreas,
>>>>=20
>>>> On 12 April 2013 11:46, Andreas M=FCller =
<schnitzeltony@googlemail.com> wrote:
>>>>> It is Fedora 14 and I don't have the time to update the machine.
>>>>=20
>>>> Genuinely shocked that they shipped GNU make 3.82 without the =
patches
>>>> to make it work.
>>>>=20
>>>>> Since there seems no support for little poor old-fashioned people =
like
>>>>> me: Is there a configuration option so I can force to build
>>>>> make-native on that machine (checked local.conf.sample /
>>>>> site.conf.sample / yocto reference manual but did not find a =
hint)?
>>>>=20
>>>> =46rom a quick look, BASEDEPENDS_append =3D " make-native" might do =
the trick.
>>>>=20
>>> Thanks
>>>=20
>> This came too early because - before I tested it. I get
>>=20
>> NOTE: multiple providers are available for make-native (make-native,
>> remake-native)
>> NOTE: consider defining a PREFERRED_PROVIDER entry to match =
make-native
>> NOTE: Preparing runqueue
>> ERROR: Unbuildable tasks were found.
>> These are usually caused by circular dependencies and any circular
>> dependency chains found will be printed below. Increase the debug
>> level to see a list of unbuildable tasks.
>>=20
>> Identifying dependency loops (this may take a short while)...
>>=20
>> ERROR: An uncaught exception occured in runqueue, please see the =
failure below:
>> ERROR: Running idle function
>> Traceback (most recent call last):
>>  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
>> line 300, in find_chains(taskid=3D175, prev_chain=3D[14, 15, 19, 20, =
16,
>> 17, 174, 178, 179, 175]):
>>                     if scan:
>>>                   find_chains(revdep, copy.deepcopy(prev_chain))
>>                     for dep in explored_deps[revdep]:
>>  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
>> line 300, in find_chains(taskid=3D176, prev_chain=3D[14, 15, 19, 20, =
16,
>> 17, 174, 178, 179, 175, 176]):
>>                     if scan:
>>>                   find_chains(revdep, copy.deepcopy(prev_chain))
>>                     for dep in explored_deps[revdep]:
>>  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
>> line 300, in find_chains(taskid=3D1142, prev_chain=3D[14, 15, 19, 20, =
16,
>> 17, 174, 178, 179, 175, 176, 1142]):
>>                     if scan:
>>>                   find_chains(revdep, copy.deepcopy(prev_chain))
>>                     for dep in explored_deps[revdep]:
>>  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
>> line 300, in find_chains(taskid=3D1143, prev_chain=3D[14, 15, 19, 20, =
16,
>> 17, 174, 178, 179, 175, 176, 1142, 1143]):
>>                     if scan:
>>>                   find_chains(revdep, copy.deepcopy(prev_chain))
>>                     for dep in explored_deps[revdep]:
>>  File "/home/andreas/oe-core/sources/bitbake/lib/bb/runqueue.py",
>> line 301, in find_chains(taskid=3D1139, prev_chain=3D[14, 15, 19, 20, =
16,
>> 17, 174, 178, 179, 175, 176, 1142, 1143, 1139]):
>>                         find_chains(revdep, =
copy.deepcopy(prev_chain))
>>>               for dep in explored_deps[revdep]:
>>                         if dep not in total_deps:
>> KeyError: 1140
>>=20
>> NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be
>> rerun and all succeeded.
>>=20
>> Summary: There was 1 WARNING message shown.
>> Summary: There were 3 ERROR messages shown, returning a non-zero exit =
code.
>>=20
>>=20
>> bitbake make-native works fine.
>>=20
>> What other options do I have to force build of make-native. Why I
>> insist: On both of my machines (Fedora 14 / 15) build of systemd
>> fails.
>=20
> In local.conf do something like:
>=20
> DEPENDS_append_pn-systemd =3D " make-native"

this would then suddenly shift the rest of unbuilt packages to use =
make-native whenever its staged
so we will have weird issues if components own build systems are =
sensitive to make versions.
so either we recommend a version of make or we don't


>=20
> By adding make-native to the base dependencies you've introduced
> circular dependencies and the circular dependency handling code in
> bitbake is breaking for unknown reasons. That code is fairly broken at
> this point unfortunately (someone should file a bug) but its beyond =
what
> we can fix in 1.4 at this point.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



