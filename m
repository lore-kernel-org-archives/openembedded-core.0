Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0F846600EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 10:45:30 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42dtTR5729z1qxQr
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 12:45:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42dtTR51bCz1qql7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 12:45:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024) with ESMTP id 5o-zdxoq9UFV
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 12:45:31 +0200 (CEST)
X-Auth-Info: uEvXsURO13Gc3MTkH9tA+TvsGh3MMYGCU+3vpBOPFJCUsu5oxYrm0OOT7U6scJ+Y
Received: from [10.0.0.72] (host-141-40-253-35.customer.izb-online.de
	[141.40.253.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 12:45:31 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20181019152214.1600-1-o.mandel@menlosystems.com>
	<20181022103314.13840.4113@do.openembedded.org>
From: Olaf Mandel <o.mandel@menlosystems.com>
Openpgp: preference=signencrypt
Autocrypt: addr=o.mandel@menlosystems.com; prefer-encrypt=mutual; keydata=
	xsBNBE9PiqUBCADe0zPq1vIfZFtlkWvV6SYOFo5awT3UejHCmplCUZ55UNW4RV0xXUudDjZs
	kDRYE8u0YaYCIdx2iwpeSSrmTNWgmGyLJHHfmHlsG0OZBLM1nY/NvVEa2R/sgLgzybSRuzNF
	QFxAfOIoZ9+5ygQMQNoOjDdvzrMVqWXSA9O/6rZAv4OMiHY2EnCDnCyBZ+/gI86i/gasY/j6
	J9yX8N08f3yHQ9iAUZbnroWu0DN1B1W7md0omf8Y5xEhsav4BBQGYUoHRg4KCFkRiqB4ypjm
	CTs/2+JMpyQJi3dSBRlEXNWpdtg3r6+Dp3GIg7eoZ7klCRMblhy2k4VVoLiieVV+lx9RABEB
	AAHNJ09sYWYgTWFuZGVsIDxvLm1hbmRlbEBtZW5sb3N5c3RlbXMuY29tPsLAeAQTAQIAIgUC
	T0+KpQIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQVL2dtGJSHf8/rQf/Qs1mVz7F
	r2RwMlbiEa6cEE+ciCt0UTlPXfsF1mHG0/XZoHCOMq14VBuQFcOW9N5c7L05cCuz2tFhbk2+
	LELBnFi9kFZZpi/rpHHbCiTXIM0JXZUmRtNoRoWVZzP9WTKD2BtNc6694bDFEVizK58oivG1
	c1yLmdQeKgJ291inC7x4g+dR/BgBzrgt01iTUjY4s5boXQyySaexg1ME0AyJN/2A+SMxx0SY
	bvOwfOZUurpnX9iO9IXbeHp2cPLRdgfuWqoqdTeOo1K6DleZqgucYBPfEcAzwGbkrlvFFznh
	MWQ1EUkFrolT7TfBKsASnGBRP30+OpMCE74tDOXbP7MwE87ATQRPT4qlAQgA7IoG9IFn8RGr
	x7W5mUhIYVuk1C0ovxzTyKn6kFhSql/V5I92J0pTyN76caqGavNwommnv1S4CB7DXS9ukfg7
	9be8lwT3NQQDRQGsHyPK8ysxQoFVZzo6eHS6oUUXY9Rb66tKmihj22rO96+x46EJ4XJRDTs6
	8NaOEM9PPSe64LmILK/VvAFIBIrlAHhJ2Ldhf0hRU5bQz3doNNo34iUEohaXFj0vP9eZkPIM
	UzS1AKsJ/+3iqzM+14iP0NZRUe+Yb6nW8187gwJBnqBpw8/uT7ioCyM+h1ukXMAbm2+vhHMT
	YzPmYFMfrN4vy3xX2hcq94X6pRM/wRi6mxlJ7Tf4xQARAQABwsBfBBgBAgAJBQJPT4qlAhsM
	AAoJEFS9nbRiUh3/CmwIAIG+eSJ6SU5H75B6Ud9bGenTx5VOqWUQaDPFaxOMUoUI/uSf9vRI
	DQo3vXcn3vDxFuup00BN30L7cKjDU35kuWyhMFA6a/mM1ilHyPlFCv4u0RjZ2S9CWt0l/dy4
	QmZTKZ0Yrxeo6HZOLIvQwvDy8ThZRYdEz0mL9rMM+JXAVraUjqovMGE+8FkmMxmwxcFSLLQK
	0hEZiKLYhJ5DkAtHkkJBNAWpPSx0QJUfZX3fSCDmVOfkI2JitqARhpy9MO6D1Z3gr1hz6fCt
	XspCPlrvsRGRVFzAMfvXGSQOnikwGTtElzrDplsIxo0SpijaPUF/Up0KN65BpBnBchlEnaxU
	0Oc=
Message-ID: <afda4768-3684-ffc6-b054-a58656694d51@menlosystems.com>
Date: Mon, 22 Oct 2018 12:45:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181022103314.13840.4113@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG5wbTogY2hhbmdlIGluc3RhbGwgZGlyZWN0b3J5IHRvIHVwc3RyZWFtIGRlZmF1bHQgKHJldjMp?=
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
X-List-Received-Date: Mon, 22 Oct 2018 10:45:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

Am 22.10.2018 um 12:33 schrieb Patchwork:
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head] Suggested fix    Rebase your series on
> top of targeted branch Targeted branch  master (currently at
> daba6c5a99)
> 
The v2 of the patch does not apply because the master branch already
contains v1 of the patch. I didn't notice this and resubmitted v2 as
v3 after a rebase (to the sumo-branch, not the master branch). So v2
and v3 are identical except for the parent commit hash.

The problem is: v1 does not actually work. What is the procedure to
handle this? Should I make a patch that works on top of the v1 already
in master?

Thanks,
Olaf
- -- 
Olaf Mandel

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEErGOsr28GGMKRE/TmVL2dtGJSHf8FAlvNqj8ACgkQVL2dtGJS
Hf+zIgf9EFUbmTpQXt1J1rTdK5EQM0o4Jewb7UzGE4XmlSYvi74hem8kjGpYGlXu
46Ec5DR7DgvBzPc2lAw5npVxgC+2PXovVOpne/xnZtwvPM6rKd+AzNNYCm6n52aZ
eGz67KF10+ypSFz76yQ5sxFIc7qivwKmJuzLuB89rFtZRv5aPV0sxZz36f+Duyoi
s0hgdgKCB9IUiXvzVgeCbC3kTFGDuYFGTsBL+X/4YAvgeBoABUJSxtmjScgArk+N
h1Ph9frGqS/jK1v4nU2MW76w/vwhooiRHBxRm/fffVkJiJYXmIqedYWLbsL872q9
QRCJM68mEf4e9dLOepNXbNsfhs2e+w==
=VLfd
-----END PGP SIGNATURE-----

