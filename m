Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 984B07563B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 16:10:38 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so56874127pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=pDtiCWwfCKY7USlRn83ftVctQup1AbYwNoGftD82Gw8=;
	b=Vk4bYFf1bO6g8ZOYMRUNn0QqVrqS9aMGEy1GwkxYqrRVmqvk+1hyQhKxKNveKOTioC
	IbWcb78eKB3fSn08yVFEEbvo0VXHROc8bStRKIiRWojLxAjr/TpK377cHyiVS8BFcENk
	BAe2xOKH1ISk+UR5NzfmOkA0Ul8Ph09AdlaZlBwATpYfPFz8BfXTdvE8P6uBGH65SSPP
	PKsf5eIMmaMsqxuk9rU4rriccVzL45jBY2GRuWxKaSnplirdlumKiri4i7Smm/z8cgg5
	Dt0sZwJseA8Ae6B2EHS3uY6+0uOCDthybt7PcP1jQYo9yTgpKnq/RWg0yN0LcO0I/Ubv
	mVeQ==
X-Received: by 10.66.155.36 with SMTP id vt4mr15620452pab.32.1432915839476;
	Fri, 29 May 2015 09:10:39 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:a964:56d9:f8d1:90dd?
	([2601:9:3580:84c:a964:56d9:f8d1:90dd])
	by mx.google.com with ESMTPSA id
	ng13sm6021755pdb.82.2015.05.29.09.10.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 May 2015 09:10:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHiDW_EPNdW-cqbe7x_Uw5ThwJ72PjsxT44qjHED7JAR0-h-uw@mail.gmail.com>
Date: Fri, 29 May 2015 09:10:32 -0700
Message-Id: <D0380129-5D1B-4E8B-B6FB-227E32DE117C@gmail.com>
References: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
	<73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
	<CAHiDW_F3w8FTR7Z_AWOMfCJfMy9sMpQofRB9uDuHErReAMJZyQ@mail.gmail.com>
	<CAMKF1sqHevjfEVQUBA_SsRFz1Aku+n8Q9tNdCGei=Uvuwsh=9g@mail.gmail.com>
	<CAHiDW_EPNdW-cqbe7x_Uw5ThwJ72PjsxT44qjHED7JAR0-h-uw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][RFT] cogl/clutter/libinput/wayland/weston updates
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
X-List-Received-Date: Fri, 29 May 2015 16:10:38 -0000
X-Groupsio-MsgNum: 66129
Content-Type: multipart/signed;
	boundary="Apple-Mail=_76B5697F-1A9E-44B2-BDC1-F816461FBAE0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_76B5697F-1A9E-44B2-BDC1-F816461FBAE0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 29, 2015, at 8:01 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> =
wrote:
>=20
> On 28 May 2015 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thursday, May 28, 2015, Jussi Kukkonen <jussi.kukkonen@intel.com> =
wrote:
>>> On 28 April 2015 at 18:46, Khem Raj <raj.khem@gmail.com> wrote:
>>>> I have had wayland/weston updates lying on my tree for some time =
now
>>>>=20
>>>>=20
>>>> =
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b
>>>>=20
>>>> tried git versions too
>>>>=20
>>>> =
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3D992c13dcd4b79fe64f4f9b8122627f918257ccef
>>>>=20
>>>> There are problem with emulator with 1.7 and libinput I guess where =
the
>>>> mouse does not work
>>>> in qemux86 as well as qemux86-64, it works fine with 1.6, I have =
tested
>>>> all
>>>> versions 0.8 and newer of lib input
>>>> for no success. That was the reason I did not propose those =
patches.
>>>=20
>>> I've been testing this and it looks like mouse does not work even on
>>> our current version of weston on QEMU, _if_ it's using libinput.
>>> Current Weston recipe happens to work because we default to "
>>> --disable-libinput-backend".
>>=20
>> On my contrib branch I have a patch for runqemu script to not use =
tablet USB
>> device then it works. Also 1.8 release is coming out in couple of =
days the
>> patches on that branch are tracking that too. Please test it out
>=20
> I've tested with weston 1.7: the runqemu patch does indeed fix the
> mouse problem (both with libinput 0.7 and 0.15). I think 1.7 is good
> to go (at least on i965 it certainly 'feels' much better and
> responsive), but if you feel like waiting for 1.8 that's fine too.

yes, its due this weekend. So lets wait.

>=20
> As for cogl: On QEMU cogl seems to fail regardless of weston/wayland
> version, meaning anything using cogl fails to initialize EGL even on
> current master.
> On i965 everything cogl related seems to work on master, but the
> clutter examples segfault after upgrading cogl and clutter to most
> recent (Fedora 22 seems to have similar problems with clutter apps:
> e.g. https://bugzilla.redhat.com/show_bug.cgi?id=3D1210992). I'll
> continue looking at this but don't think it should prevent the wayland
> upgrades.

right.

>=20
> Jussi


--Apple-Mail=_76B5697F-1A9E-44B2-BDC1-F816461FBAE0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVoj3wACgkQuwUzVZGdMxQoZQCfcR5Lp+RmlXjoY0Xpud+ZeQlz
680AnjF4oR/OxO8eNjlCuviMwIWFQ6gY
=Y6UZ
-----END PGP SIGNATURE-----

--Apple-Mail=_76B5697F-1A9E-44B2-BDC1-F816461FBAE0--
