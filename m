Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B58FD745AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 18:41:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q4-v6so25359078wmq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 11:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=zK/MC7dTXfagfUL++VqdByKUqLm/7WYIZhFAnNaiODw=;
	b=f/Zs761OtSHbRak+7QpObRQC2RoTyQ/JIk05PytJQty7pujYOP44mXqJg/rpJTPL3K
	dr3dOXfK+On+h2543R4Mowi6LYJmaodDOoLqztDcBtWHS+MyHg0y2Qrd388xlU7eL8pN
	3ZkYPtAaOt6B7oAnKv59g3onRMTHYz7VsPTNgAN981zTEcIiq4YrNN6xMPA3wtuvCorO
	odgGbpjBWrKqzK5IzbbsL2mnYXwE30K+sIXjPCSwS9gr4/o7WD5yvOzEm7uuyGt2kypp
	6zG0DDk9UvQXJs9uptmwNZfy0h1MXUkGkFf/0JnR2B4HKVb7VujK7xRKwVgyb+x/cRxH
	iXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=zK/MC7dTXfagfUL++VqdByKUqLm/7WYIZhFAnNaiODw=;
	b=CTFJ1hoFpi/2OZpIV1dno1YtUBZKhJtZ3nWNIeYIXnUTk+q0zUffyaoKhhjzhwf/95
	2P/7PqtuCqKuZ2+5XGRzcF9Eis74ssMiAdO0pAonO1ono4cKRzjagE41VGS5IgHa2Pyj
	itBr72udaPgxiJ+NfdZThPgfSbuX5sVn9yDh6jHwZPgT74RWMa4uym14OFrj2l2Zr68b
	JjQVzd34u5PEJvWBiZfLQyZauVVlVJQN1Eg0NDKnTWbIV9uXe77l11MKh9xBAQo09Qdt
	tkLFPgWtBK/1MKaUcSMfWWQoZUpDWdf0YtVDglZDhE1KfkMoC0AU+aRyQBHCbJdUnh79
	P90A==
X-Gm-Message-State: ALKqPwecdZYoolrtctxjt1MrBCUlL2mC37itqTnhi1tPA/bH0HGXVeON
	JBBVic1GYzIJ70kJAOLLnTK93tWO
X-Google-Smtp-Source: ADUXVKJ7WjItPw8oVqxvYRpbWG5ZK4WXegqPDiDqTA1/YVQYctoQ8ElKdgSAEexrHZXKFZmrSkDdrw==
X-Received: by 2002:a1c:b45:: with SMTP id 66-v6mr8398957wml.155.1527532874811;
	Mon, 28 May 2018 11:41:14 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	p7-v6sm28181840wrj.85.2018.05.28.11.41.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 11:41:13 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <70B5B287-3F28-4055-9AEF-FF23C60FF6F9@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Date: Mon, 28 May 2018 20:41:11 +0200
In-Reply-To: <44b3165e-42fa-6cfc-ca9b-cc11892db157@linux.intel.com>
To: openembedded-core@lists.openembedded.org
References: <613380E3-73CD-4A50-B8E3-337912D28A93@gmail.com>
	<44b3165e-42fa-6cfc-ca9b-cc11892db157@linux.intel.com>
X-Mailer: Apple Mail (2.3445.6.18)
Subject: Re: [PATCH] scripts/oe-init-bashrc: add more user-friendly oe-setup utility
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
X-List-Received-Date: Mon, 28 May 2018 18:41:14 -0000
X-Groupsio-MsgNum: 111810
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A214E605-716F-4732-B506-152E501A8666";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_A214E605-716F-4732-B506-152E501A8666
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 21.05.2018 um 21:04 schrieb Alexander Kanavin =
<alexander.kanavin@linux.intel.com>:
>=20
> On 05/21/2018 06:55 PM, Jens Rehsack wrote:
>> Move scripts/bashrc from meta-jens/scripts to oe-core to share =
user-friendly
>> oe builddir management with community. Using this script will help =
manage
>> multiple BSPs and targets like perl developers using perlbrew.
>=20
> Please explain in detail what this does, and why is it superior to =
existing tools. What are the typical usage scenarios? Where and how this =
should be documented and tested? It is not a good idea to just add =
something into scripts/, as no one will know or use it, and so it will =
just quietly bitrot.

Yes, the commit message is a bit ... weird.
Anyway - what it does should not be part of the commit message in =
detail, but maybe the help and the tool itself should be a bit reworked =
for being up-to-date.

However - let's prove the interest first, fixing the stuff a little bit =
later (I reserved the upcoming long weekend for Open-Source...)

When I log into my build machine, I just do

$ oe_builddir use ~/gpw-community-bsp/gpw-yocto-platform/

and I'm in the right location and have all environment settings prepared =
to start a bitbake immediately.

$ oe_builddir help
oe_builddir <command> [argument]
Available commands:
    use         use specified build-dir, setup when local.conf and/or =
bblayers.conf are missing
    setup       create default builddir
    avail       list possible build-dir's
    layers      list layers used in BSP
    repos       list repositories used in BSP
    prune       prune old builds
    off         remove all settings from oe from shell environment

Tells you, what could be expected (very short).

It's all plain shell - so everyone can adopt it easily to local =
requirements. Further, it supports setting flags and tools within =
''oe_builddir use''.
When you have a look at my layers I use for =
https://www.slideshare.net/JensRehsack/perl-onembeddeddevices - I need a =
special bitbake wrapper to build root and recoveryfs, and I have and =
additional environment variable I need to inject into recipes through =
bitbake.

$ cat ../sources/meta-jens/.oe-init
__oe_prepend_path "$(readlink -f $OEROOT/..)/meta-jens/scripts"
__oe_append_extrawhite "VLAN_GRP"
$ cat ../sources/meta-gpw/.oe-init
__oe_append_extrawhite "WANTED_ROOT_DEV"

When I set up the workshop environment after 2 years of abstinence - I =
realized that there are some cool improvements available, like updating =
all repos from upstream and some of the utility routines can be =
simplified. But this effort isn't sanely spent when the entire idea of a =
https://perlbrew.pl look-and-feel-alike is rejected.

>> +__oe_check_py () {
>> +    # Make sure we're not using python v3.x. This check can't go =
into
>> +    # sanity.bbclass because bitbake's source code doesn't even pass
>> +    # parsing stage when used with python v3, so we catch it here so =
we
>> +    # can offer a meaningful error message.
>> +    py_v3_check=3D`/usr/bin/env python --version 2>&1 | grep "Python =
3"`
>> +    if [ "$py_v3_check" !=3D "" ]; then
>> +        echo >&2 "Bitbake is not compatible with python v3"
>> +        echo >&2 "Please set up python v2 as your default python =
interpreter"
>> +        return 1
>> +    fi
>=20
> Bitbake has in fact been compatible with Python 3.x for several =
releases. The above check is not particularly useful, as /usr/bin/python =
nearly always points to a 2.x version.

True, with many other details. I will happily fix this and all other =
quirks once we agree on above ;)

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_A214E605-716F-4732-B506-152E501A8666
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsMTUcACgkQRJmWrtzl
Cp18Kw/9HgJDKoQR8FBjZmd4CwqL8jzo5XyyDw9uUaMRT5/pmLETVUzOy3kl1t7b
0ubLbyCiqH9mF+nQPIfLuwXvMAl5PK4rYVhrY/czCD8jPRGdKAAoGC1qAWv/pmOu
WDuqW8VKVUuCfV1S1Qg2OwdKUk6Mupw4B+el6o3XbwX8+wspjoLJZFRyKLYm5/uU
czCkgMgcmqXRSSXf504xOWZHu/OVGqJ7bacSuwgVKlxB6A6rtug1wlvWRrCRTFD7
bPpvXDPu6UBuqcmdJFNH1GoJa+mPKHmFZ+lA1BgJ4e5T6sSwxGziE4Dj2z/tA7l1
ND867nl9TPwf2y1s8YLUb9dCLxUurS0gTlFKhb3fWsK1yYRdcE+Sjt6dCcTg9wi1
46Lc4gBSNjNMCT33OoA4RSnzYqfUSIbOf9LRg4sDcyOVJcS4b/4sbw6YETtwHvOn
Pej8RTZVRMnGt93YG1VWrV/DKFyGZ2u5O98lOfb/E/7lBc0DBvJb1zKawEsTYTGl
58+KpAp4pRvp2NuKixMvCTQfrwxjXRC7l9v03oEZQ3UFV7ncv6QS4GS6VlN+RRna
FXul4JSMkXj9qUJ7o1ShgR200jBO4nNRyZpvXb53Tzx/ZZEYEGXXHtyHBCWbxRFj
00Ah1GWeP/7UgCcLiDTpIVFSiZBC8xxAbcJuVrtsSR9heUWQZ7w=
=riRs
-----END PGP SIGNATURE-----

--Apple-Mail=_A214E605-716F-4732-B506-152E501A8666--
