Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 698D573281;
	Fri,  5 Aug 2016 02:12:50 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i6so19263426pfe.0;
	Thu, 04 Aug 2016 19:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=fUfAReAS8GjAf0IjZMU/ZLTFy3O3o/AZq8mHdnNVeIM=;
	b=tmfmX7kanZd6D8oVvxa14V0B0djI4M9FCRUbA4v6oMBPA7ran4gSSps01bolZC3j3g
	wQszcnQPlF6EzVQCTOrXFns+m+ONAnV66x2Ah4RX10H425fQO/u5lsxR5vRxH+xuKAcD
	h8GNoNVdd4KovIFmkJQD3FQLLC5Mfgunr2+0+oBh9ecKRMSPzFJBwO6XkP23wTIgBSip
	LkDDZCCy4cyPAoTXipYnUs8qcXt8BVxCiJVsT0n9f/XzieUkVrKZ7Bt3By6FcFB5zAXa
	Zl85sOKktqVRrtIt/WUU92Hi+0sxtMjjIOiZGHKSTyZIgD/l8k0PWcgLmJjzPONPKQcj
	c8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=fUfAReAS8GjAf0IjZMU/ZLTFy3O3o/AZq8mHdnNVeIM=;
	b=FB38L0YUwnFj+lCMM/QNwVlN4XlDKZsJexRwYK67wvc8480qVCUDgOsWIp6hHg1NEN
	+5+WQ9Aywbszas72c3oO4/tI5kEDTZzBicTojg4ChL4ZQtp+0QD/Zabk9fB/o2FhHkdD
	QNrC6aLMYvSIwSBseoKP2x0WOkNBWSapNqPSx2xEIxq2WwyViWLSl8MUHyN+Y1pp1nBy
	NrmBlklzw1TjwqeP1zwLRTtVYX9yTjkokPmjToDgg2CS+vNVUoRkfETT6GZe2asOzxy6
	zMOOB8HbhXGuk704/CI3vn18YgxZxMyD/q5O4hkFnUHM3OAmTak1wBr4EqnbF0m2sne2
	xQOg==
X-Gm-Message-State: AEkoouuj/6aPvOOIvzYMwCAiFP3btUc1PG1Ntj+6lUTz4msyx7rxpgiCmEpLGaBt8FWQKg==
X-Received: by 10.98.159.73 with SMTP id g70mr56976730pfe.121.1470363171640;
	Thu, 04 Aug 2016 19:12:51 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:4ce8:4a2:83d6:3a55])
	by smtp.gmail.com with ESMTPSA id d9sm23311077pan.7.2016.08.04.19.12.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Aug 2016 19:12:50 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org,
	"Maxin B. John" <maxin.john@intel.com>
References: <20160801104924.10815.18743@opal.openembedded.org>
	<20160801104927.C930350170@opal.openembedded.org>
	<20160804143423.a6fyiopqmt6abcq7@jama>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <e0ce6ee5-25e8-e113-0a1c-11e8dc9cc51a@gmail.com>
Date: Thu, 4 Aug 2016 19:13:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160804143423.a6fyiopqmt6abcq7@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 11/43: libtasn1: upgrade to 4.9
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
X-List-Received-Date: Fri, 05 Aug 2016 02:12:52 -0000
X-Groupsio-MsgNum: 85335
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="WbdsMuCPeWlfepMSWSfATEJVFMOLILdNG"

--WbdsMuCPeWlfepMSWSfATEJVFMOLILdNG
Content-Type: multipart/mixed; boundary="2M3cSpKMqFaQWeW0349hlKcqwSbEH7le0"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-core@lists.openembedded.org,
 "Maxin B. John" <maxin.john@intel.com>
Cc: openembedded-commits@lists.openembedded.org
Message-ID: <e0ce6ee5-25e8-e113-0a1c-11e8dc9cc51a@gmail.com>
Subject: Re: [OE-core] [oe-commits] [openembedded-core] 11/43: libtasn1:
 upgrade to 4.9
References: <20160801104924.10815.18743@opal.openembedded.org>
 <20160801104927.C930350170@opal.openembedded.org>
 <20160804143423.a6fyiopqmt6abcq7@jama>
In-Reply-To: <20160804143423.a6fyiopqmt6abcq7@jama>

--2M3cSpKMqFaQWeW0349hlKcqwSbEH7le0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 8/4/16 7:34 AM, Martin Jansa wrote:
> On Mon, Aug 01, 2016 at 10:49:35AM +0000, git@git.openembedded.org wrot=
e:
>> > rpurdie pushed a commit to branch master
>> > in repository openembedded-core.
>> >=20
>> > commit 7ad0009d9282bd2af15b8b5d26a20a321cab0a32
>> > Author: Maxin B. John <maxin.john@intel.com>
>> > AuthorDate: Wed Jul 27 16:02:51 2016 +0300
>> >=20
>> >     libtasn1: upgrade to 4.9
>> >    =20
>> >     4.8 -> 4.9
> This fails to build:
>=20
> | In file included from ../../libtasn1-4.9/lib/structure.c:32:0:
> | ../../libtasn1-4.9/lib/parser_aux.h:97:1: error: inlining failed in
> call to '_asn1_set_down': call is unlikely and code size would grow
> [-Werror=3Dinline]
> |  _asn1_set_down (asn1_node node, asn1_node down)
> |  ^~~~~~~~~~~~~~
>=20
>=20

optimize for size is causing this, you should ignore Werror=3Dinline with=

-Os, its just information at this point.


--2M3cSpKMqFaQWeW0349hlKcqwSbEH7le0--

--WbdsMuCPeWlfepMSWSfATEJVFMOLILdNG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlej9jUACgkQuwUzVZGdMxRSNgCfQhwDQ4naupMm03lMSVXplweR
/ykAnjN9GUuKnuB7+LzC3hRs8Oae55BO
=8Zzn
-----END PGP SIGNATURE-----

--WbdsMuCPeWlfepMSWSfATEJVFMOLILdNG--
