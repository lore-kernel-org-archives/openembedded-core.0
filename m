Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2EF78495
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=5CAFzl4WKtDJsteACpyB8/g8bOW6zn5VjD6eis4zRIk=; 
	b=SPxjridz6HbN3VvDTVsgAbZuT/87y7W+g5oSoAxOiyBETWoS+fzyoBnjYO+5QG2RafwaMKPh9Jw8fYs5m8az+ALP8vFwwXt7Ht8skulX60F1xRdRbW93Kr5iYbc3+NBbvzadutvqCOkVIGaW8sJRNBfpPtiYH1iiX2Tr9ed6WOBA2T5sLcQZpwJIN63E6ZqyCaPy8hArkagyGThglPjmc9WjF0dkTY2uKw6CLtaHiCXv3pn/ENj2jlz9XI6zVCYRR24eU0dPOGg29YLdhIe7e1Wb2ePkGiRu+pV661L9N8JwWNFg7BScOW2KvWZquAmVwYxcazlu2+QOMJpiUaBvrg==;
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=[192.168.0.23]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dimXv-0008MK-Jn; Fri, 18 Aug 2017 21:03:03 +0200
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <20170817182603.20588-1-clopez@igalia.com>
	<CAHiDW_EkLn1G9Ofs7doaPfScqmUwmRxrQzgNKT_9VZAUbkj6JQ@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <9db2ee69-1550-a8ba-2f4c-a3aa77f84b94@igalia.com>
Date: Fri, 18 Aug 2017 21:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAHiDW_EkLn1G9Ofs7doaPfScqmUwmRxrQzgNKT_9VZAUbkj6JQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Add a recommends on shared-mime-info.
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
X-List-Received-Date: Fri, 18 Aug 2017 19:03:10 -0000
X-Groupsio-MsgNum: 101653
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="A7saLIGU7JLQBdOMlbtFTS4JXJVo1JO9R"

--A7saLIGU7JLQBdOMlbtFTS4JXJVo1JO9R
Content-Type: multipart/mixed; boundary="B4qr6qJANTP5R37P8Eig7gR7KMdDhXKAm";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <9db2ee69-1550-a8ba-2f4c-a3aa77f84b94@igalia.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Add a recommends on
 shared-mime-info.
References: <20170817182603.20588-1-clopez@igalia.com>
 <CAHiDW_EkLn1G9Ofs7doaPfScqmUwmRxrQzgNKT_9VZAUbkj6JQ@mail.gmail.com>
In-Reply-To: <CAHiDW_EkLn1G9Ofs7doaPfScqmUwmRxrQzgNKT_9VZAUbkj6JQ@mail.gmail.com>

--B4qr6qJANTP5R37P8Eig7gR7KMdDhXKAm
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 18/08/17 08:38, Jussi Kukkonen wrote:
> There's also https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11792 =
about
> whether glib should bring in shared-mime-info so GIO file sniffing woul=
dn't
> be broken (the database is 3.6MB which is not a big number in a webkit
> context but can be for others).

This looks to me the best option.





--B4qr6qJANTP5R37P8Eig7gR7KMdDhXKAm--

--A7saLIGU7JLQBdOMlbtFTS4JXJVo1JO9R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlmXOd4ACgkQllCJzmuV
+IKFYQ//SmH8ysx8tJrNBvRPmanYoIeAKekk4tGjVyEA1SbWu4Id/cMlYkCLAjSL
chqxgBNxck/yEGfT98e7IfHXi74mKYVxfVDOL1pFKq6MYVmGAA/IVlN/kDjtUlv+
WYhb5Jf2q/4IE4ytUoj5oJfwKvv35Bx+yScU9o1KvUShV+cpNN3+6i5BGYGxD9md
NtcGll4NqUDJm2L8L6q11Z+6k5U4EOIFM6lqV/sSVDGeJKzE+tRyWoaWXh5njiL0
HBdKIhKj9hWM9G3AutPikJtz+5tL4JpS90hjEWgItpru2LO9i2v9pRVlvN5KBvR2
KG+EKOxjVMfcYnLAtPyguZedcFRfbxc7JR3Y4f8AKgEEaqwJs/ZVVLjGZ8QcTRwz
yoQ+cx3HTERewsjNjBxHYPJyGm00kHsSfFDQJFQH7oN1tiFJlujBwPAcaixh8PYK
MdQCZLYtsaUm5vlgaI/uhSILjeQczNlqaVmfR6N79U1GqIbS1DUhrg48JfBF/oAm
QBkqVqSep34bEXrYqQ0qosbkkqmqK876omQVSRA7I19lNG0Pn+bnq59Ho66iu1LY
EtVt1Mw9UbS91HjTscmv3T+J6iHmIa8V/rbKpmq5V6JsyXhdo7KnGtMjQJN2mK88
lChtLk6KqcNrbjuWSxkjpmcpSheheC6dChSBDxVNRGg7585Dkn4=
=J9QF
-----END PGP SIGNATURE-----

--A7saLIGU7JLQBdOMlbtFTS4JXJVo1JO9R--
