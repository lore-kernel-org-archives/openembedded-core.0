Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1F89B71AB7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 15:30:41 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3A6HMR0xDUkFLG6Qr6w4I5UyQJP3N1i/DPJgcQr6Af?=
	=?us-ascii?q?oPdwSP37p86wAkXT6L1XgUPTWs2DsrQf2rSQ7vGrCTNIyK3CmUhKSIZLWR4BhJ?=
	=?us-ascii?q?detC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBxrwKxd+?=
	=?us-ascii?q?KPjrFY7OlcS30P2594HObwlSijewZbJ/IA+2oAjVucUbgolvIbstxxXUpXdFZ/?=
	=?us-ascii?q?5Yzn5yK1KJmBb86Maw/Jp9/ClVpvks6c1OX7jkcqohVbBXAygoPG4z5M3wqBnM?=
	=?us-ascii?q?VhCP6WcGUmUXiRVHHQ7I5wznU5jrsyv6su192DSGPcDzULs5Vyiu47ttRRT1ji?=
	=?us-ascii?q?oMKjw3/3zNisFojKxVvg+vpwBxzYDXboGaNvRxfqLBct0VSmVMRdpRVzVbD4+g?=
	=?us-ascii?q?c4cCAe4MMOBFpIf9vVsOqh6+CBGrCePpyz9IhXj20bc/0+s7DAHG2gsgEskQsH?=
	=?us-ascii?q?vOrdX1L70dUeSvw6XS0TrDaPZW1C775YPVfB4hpvSMUqhxccrX0UQgCwTFjlOe?=
	=?us-ascii?q?qYD/PjOVzfwBs2ea7+p8VeKvlnUopxttrTiow8chjJTCiIENyl3c6Cl0wpg5Kc?=
	=?us-ascii?q?emREN0e9KoDYFcuiKbOoduX88vQX9ktDwkxrAJo5K2fScHxI46yxLBaPGLa4aI?=
	=?us-ascii?q?7QzgWeqNJDp1gXJodbaiiBqv9EWs1/fzW8ux3VlUsyVIkNfMu3UT2xPO98SKSP?=
	=?us-ascii?q?1w9Vq71zmVzQDc8ORELFgxlarcNpEu3KY9loEWsUTfBi/2n1j2jLOOekUk5Oeo?=
	=?us-ascii?q?7+Pnb63kqJGTMYF4kw7wPaUwl8K9GOg0LgYDU3KH9uS7zr3j5Vf1QKtQgf03ia?=
	=?us-ascii?q?nWqpTaKt4BqqGlBA9V154v6xe5Dzi4zNQVhWQLIVBbdB6dkYTkNEvCLO3iAfq8?=
	=?us-ascii?q?glmgiDJryOrHPr3lDJXNNH/DkLL5cLZ76k5cyw0zwcpa551OF7EBJvXzV1TvtN?=
	=?us-ascii?q?PCDx85KBa7w+L9B9lnyoweXmePDreDMKzOqV+I+v4vI+6UaY8Rpjn9LP4l6OT0?=
	=?us-ascii?q?jXAknl8RZ7Kp0oERaH+lGfRmPV+WYX72jtcOFmcKuAs/Q/buiFKcUD9efHKyX6?=
	=?us-ascii?q?M65jEmB4OqF4bDRoaxgLOf2Ce3BIFZZmdDClqUC3fna52EW+sQaCKVOsJhlSQE?=
	=?us-ascii?q?WqanS4A/0BGhrxH1xKd6IeXK5yIUrI7s1N9v5+LNjhwy8T10D9+B02GWVW10mX?=
	=?us-ascii?q?sISCEw3K9hpExy0UmM3rVljPNGCNNf/fRJUh01Nc2U8+svX9T/XQTIZNuODk2v?=
	=?us-ascii?q?RNmhHzg1CN02xc0HZ0tvM9GjiA3TmSusH7IR0beMAcpn3Ljb2i2lIcd+zDDD3b?=
	=?us-ascii?q?QniHE4S8pUPGmvwKV48l6AVMbyj0yFmvPyJuwn1ynX+TLbwA=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2E+AwBk9wlZ/1YBGKxcGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBFQEBAQECAQEBAQgBAQEBhAyBDAefLCGVboFMQy6FdgKFAxcBAQEBAQE?=
	=?us-ascii?q?BAQEBAQKBEIIzIAsERikvAQEBAQEBAQEBAQEBAQEBGgINXgEFeRACAQgYFRkyJ?=
	=?us-ascii?q?QIEDQEFAgKKK7MxinIBAQEBAQEBAQEBAQEBAQEBAQEBGgWIPSsLgmWEPw4WPw2?=
	=?us-ascii?q?FGQWdXIcbnVmUNCEDgT5vh0p2hiEqgQaBDQEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2E+AwBk9wlZ/1YBGKxcGgEBAQECAQEBAQgBAQEBFQEBAQE?=
	=?us-ascii?q?CAQEBAQgBAQEBhAyBDAefLCGVboFMQy6FdgKFAxcBAQEBAQEBAQEBAQKBEIIzI?=
	=?us-ascii?q?AsERikvAQEBAQEBAQEBAQEBAQEBGgINXgEFeRACAQgYFRkyJQIEDQEFAgKKK7M?=
	=?us-ascii?q?xinIBAQEBAQEBAQEBAQEBAQEBAQEBGgWIPSsLgmWEPw4WPw2FGQWdXIcbnVmUN?=
	=?us-ascii?q?CEDgT5vh0p2hiEqgQaBDQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.38,284,1491253200"; d="scan'208";a="40545121"
Received: from hel-exch-03.corp.vaisala.com ([172.24.1.86])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	03 May 2017 18:30:22 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-03.corp.vaisala.com (172.24.1.86) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Wed, 3 May 2017 18:30:22 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Wed, 3 May 2017 18:30:22 +0300
From: <niko.mauno@vaisala.com>
To: <leonardo.sandoval.gonzalez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] Allow overriding environment specific SPDX
	variables
Thread-Index: AQHSw/mWLE6QUEh+wUW6n2xCpu4qSKHihEYAgAAF1wA=
Date: Wed, 3 May 2017 15:30:22 +0000
Message-ID: <968159e5-5987-e42c-54e6-e2ac43d033dd@vaisala.com>
References: <1493807968-4697-1-git-send-email-niko.mauno@vaisala.com>
	<1493824168.1761.12.camel@linux.intel.com>
In-Reply-To: <1493824168.1761.12.camel@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.3.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.64.128]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Allow overriding environment specific SPDX variables
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
X-List-Received-Date: Wed, 03 May 2017 15:30:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <61F372C2A832304EB341332198B62501@exch.vaisala.com>
Content-Transfer-Encoding: quoted-printable



On 03.05.2017 18:09, Leonardo Sandoval wrote:
> On Wed, 2017-05-03 at 10:39 +0000, niko.mauno@vaisala.com wrote:
>> Change certain variable assignments from 'hard' (=3D) to 'soft' (?=3D) s=
o that
>> suitable permutations of values for these variables can be assigned eg. =
in
>> custom meta layers. Otherwise eg. fossology server is limited to run on =
same
>> machine as bitbake, and generated SPDX files are placed into home direct=
ory
>> path of a custom luser account.
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>  meta/conf/licenses.conf | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
>> index d210a0e..fcaec1b 100644
>> --- a/meta/conf/licenses.conf
>> +++ b/meta/conf/licenses.conf
>> @@ -123,7 +123,9 @@ SPDXLICENSEMAP[SGIv1] =3D "SGI-1"
>>
>>  ## SPDX temporary directory
>>  SPDX_TEMP_DIR =3D "${WORKDIR}/spdx_temp"
>> -SPDX_MANIFEST_DIR =3D "/home/yocto/fossology_scans"
>> +
>> +## Output directory for generated SPDX files
>> +SPDX_MANIFEST_DIR ?=3D "/home/yocto/fossology_scans"
>
> not sure if this is right, but shouldn't be SPDX_MANIFEST_DIR ?=3D
> "${SPDX_TEMP_DIR}/fossology_scans' so this way we do not rely on a
> yocto's home folder?
>
> Leo
>

That would seem like a more feasible default. Is this something that=20
should be addressed now in this patch, or in another (later) changeset?

>>
>>  ## SPDX Format info
>>  SPDX_VERSION =3D "SPDX-1.1"
>> @@ -142,7 +144,7 @@ DATA_LICENSE =3D "CC0-1.0"
>>  #   information.
>>  #
>>
>> -FOSS_NO_COPYRIGHT =3D "true"
>> +FOSS_NO_COPYRIGHT ?=3D "true"
>>
>>  # A option defined as[FOSS_RECURSIVE_UNPACK] in ./meta/conf/licenses.co=
nf. is
>>  # used to control if FOSSology server need recursively unpack tar.gz fi=
le which
>> @@ -156,7 +158,7 @@ FOSS_NO_COPYRIGHT =3D "true"
>>  #    FOSSology server recursively unpack components.
>>  #
>>
>> -FOSS_RECURSIVE_UNPACK =3D "false"
>> +FOSS_RECURSIVE_UNPACK ?=3D "false"
>>
>>  # An option defined as [FOSS_FULL_SPDX] in ./meta/conf/licenses.conf is=
 used to
>>  # control what kind of SPDX output to get from the FOSSology server.
>> @@ -171,7 +173,7 @@ FOSS_RECURSIVE_UNPACK =3D "false"
>>  #   license tags in the report will be "NOASSERTION"
>>  #
>>
>> -FOSS_FULL_SPDX =3D "true"
>> +FOSS_FULL_SPDX ?=3D "true"
>>
>>  # FOSSologySPDX instance server. http://localhost/repo is the default
>>  # installation location for FOSSology.
>> @@ -180,7 +182,7 @@ FOSS_FULL_SPDX =3D "true"
>>  #   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-We=
b-API
>>  #
>>
>> -FOSS_BASE_URL =3D "http://localhost/repo/?mod=3Dspdx_license_once"
>> +FOSS_BASE_URL ?=3D "http://localhost/repo/?mod=3Dspdx_license_once"
>>  FOSS_SERVER =3D "${FOSS_BASE_URL}&fullSPDXFlag=3D${FOSS_FULL_SPDX}&noCo=
pyright=3D${FOSS_NO_COPYRIGHT}&recursiveUnpack=3D${FOSS_RECURSIVE_UNPACK}"
>>
>>  FOSS_WGET_FLAGS =3D "-qO - --no-check-certificate --timeout=3D0"
>> --
>> 2.1.4
>
>=

