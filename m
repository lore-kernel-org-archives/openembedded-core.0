Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id E5E3F77DAD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 11:30:27 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3APUzSbROCc3VbIHwAw2gl6mtUPXoX/o7sNwtQ0KIM?=
	=?us-ascii?q?zox0K/z4ocbcNUDSrc9gkEXOFd2CrakV1ayI7+u7CSQp2tWoiDg6aptCVhsI24?=
	=?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
	=?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9GiTe5YL5+NhS7oAreusQYgoZpN7o8xAbOrnZUYe?=
	=?us-ascii?q?pd2HlmJUiUnxby58ew+IBs/iFNsP8/9MBOTLv3cb0gQbNXEDopPWY15Nb2tRbY?=
	=?us-ascii?q?VguA+mEcUmQNnRVWBQXO8Qz3UY3wsiv+sep9xTWaMMjrRr06RTiu86FmQwLuhS?=
	=?us-ascii?q?waNTA27XvXh9RwgqxFvRyhuxJxzY3aYI6XOvV+f7/Sc9wVSmdaQsZRTjZMDp+g?=
	=?us-ascii?q?Y4YBC+cMO/tToYnnp1sJqBuzHQ6hBOXuyj9LgX/6x6g63P48EQHA2wwtBMwOv2?=
	=?us-ascii?q?7VrNXuLqgSVfq6wLPUwjXEavNbwDHw45XGfBAmpPGDR7NwcczJxEYzEAPFiFuQ?=
	=?us-ascii?q?pZbkPzOOzugNvGmb7/ZgVeKykGErsR1+oj+qxss0jYnJnpwaylba+iV824k6O8?=
	=?us-ascii?q?C3R1NlbtG5CpdQsDuaN4RwT8g/QG9ooD43xqAEtJKlZiQG1psqywTCZ/Cdd4WE?=
	=?us-ascii?q?/wrvWPuTLDtmnn5pZr2yiwyz/EWv0OHwS9e43VVSoipLjNbBtWwB2hnW58WHTv?=
	=?us-ascii?q?Zy41qt1DOS2w/J6OxJJF47mrfZJp4vx7M8iIccvVnBEyLwhU74lrWZdl8+9eit?=
	=?us-ascii?q?8+nnZ7LmqYKCOIJskQH+N7gumtS4AeQlLggCR2ib9vq41L3k5UD3QrpEgPsvnq?=
	=?us-ascii?q?fWsZ/XO8YVqrelDwNIyIos9xG/Dy2+0NgCg3kINlNFeAmdgIjtIV7COuz3DfC6?=
	=?us-ascii?q?g1i0kTdrwe7JPqH5D5nQLHXPjq3tcahy5kJG1QY/19RS649MBrEEOv3zW0vxtN?=
	=?us-ascii?q?LCDh8+Ngy52+DnCNR+1oMZQ26PB7WWML7UsV+P/e8vPfODZI4OuDnnL/gq/eTi?=
	=?us-ascii?q?gmM+mV8YZaWpx4cYaGikHvR6JEWUeX7sjckGEWcMpAU+VvHliFqYXT5IfXmyWb?=
	=?us-ascii?q?8z5jYlCI28CYfPXI+tgLuH3Ca6BJJWYn5JC1GXHHfsdoWEXeoMaS2ILs9glDwE?=
	=?us-ascii?q?SaauS4s72R6ysw/6zqJtLvDI9S0AqZLjyN916vXUlREq6zN0CdqS02SWQG5qg2?=
	=?us-ascii?q?wHWiE5071mrUNhzVeDy7Z3judcFdxS/PNJThw6OYTbz+xiFd/yXBzOftKSR1m4?=
	=?us-ascii?q?X9qpHC8+Qc8rz98JeUZ9FIbqsheWiy6nBLkcjbCMQoc99K7bwXH1Ycl6zWTP0K?=
	=?us-ascii?q?Qzp10nRNZfc2ygmqN7sQPUAtiavV+ekvP+c6Uf22jI/XqFykKQtUBDWQp5F67C?=
	=?us-ascii?q?WCZMNQPtsd3l6xaaHPeVArM9P14ZxA=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2H0AQATYQxZ/1sBGKxcGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBFQEBAQECAQEBAQgBAQEBhAyBDAefLyGXPEMhDYV2AoUKFAEBAQE?=
	=?us-ascii?q?BAQEBAQEBAoEQgjMgCwRGKQMBAQEBAQEBAQEjAQEBAQEBAQEBAQEBAQEBGgINX?=
	=?us-ascii?q?gEBAQMBeBACAQgYFRkoCiUCBA0BBQICiiqzVYplAQEBAQEBAQEBAQEBAQEBAQE?=
	=?us-ascii?q?BAR+IPSsLgmWEPw4WP4UmBZ1vhxuGJYgwjw+UNzaBLG+HTXYBhjcqgQaBDQEBA?=
	=?us-ascii?q?Q?=
X-IPAS-Result: =?us-ascii?q?A2H0AQATYQxZ/1sBGKxcGQEBAQEBAQEBAQEBBwEBAQEBFQE?=
	=?us-ascii?q?BAQECAQEBAQgBAQEBhAyBDAefLyGXPEMhDYV2AoUKFAEBAQEBAQEBAQEBAoEQg?=
	=?us-ascii?q?jMgCwRGKQMBAQEBAQEBAQEjAQEBAQEBAQEBAQEBAQEBGgINXgEBAQMBeBACAQg?=
	=?us-ascii?q?YFRkoCiUCBA0BBQICiiqzVYplAQEBAQEBAQEBAQEBAQEBAQEBAR+IPSsLgmWEP?=
	=?us-ascii?q?w4WP4UmBZ1vhxuGJYgwjw+UNzaBLG+HTXYBhjcqgQaBDQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.38,292,1491253200"; d="scan'208";a="40632492"
Received: from hel-exch-01.corp.vaisala.com ([172.24.1.91])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	05 May 2017 14:30:27 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-01.corp.vaisala.com (172.24.1.91) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Fri, 5 May 2017 14:30:27 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Fri, 5 May 2017 14:30:27 +0300
From: <niko.mauno@vaisala.com>
To: <leonardo.sandoval.gonzalez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] Allow overriding environment specific SPDX
	variables
Thread-Index: AQHSw/mWLE6QUEh+wUW6n2xCpu4qSKHihEYAgAAF1wCAAAN2gIAC3ioA
Date: Fri, 5 May 2017 11:30:26 +0000
Message-ID: <5e221354-3744-db40-84a8-ed76a2201399@vaisala.com>
References: <1493807968-4697-1-git-send-email-niko.mauno@vaisala.com>
	<1493824168.1761.12.camel@linux.intel.com>
	<968159e5-5987-e42c-54e6-e2ac43d033dd@vaisala.com>
	<1493826165.1761.15.camel@linux.intel.com>
In-Reply-To: <1493826165.1761.15.camel@linux.intel.com>
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
X-List-Received-Date: Fri, 05 May 2017 11:30:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <D7102B56F889B248B62F97952F863EB2@exch.vaisala.com>
Content-Transfer-Encoding: quoted-printable



On 03.05.2017 18:42, Leonardo Sandoval wrote:
> On Wed, 2017-05-03 at 15:30 +0000, niko.mauno@vaisala.com wrote:
>>
>> On 03.05.2017 18:09, Leonardo Sandoval wrote:
>>> On Wed, 2017-05-03 at 10:39 +0000, niko.mauno@vaisala.com wrote:
>>>> Change certain variable assignments from 'hard' (=3D) to 'soft' (?=3D)=
 so that
>>>> suitable permutations of values for these variables can be assigned eg=
. in
>>>> custom meta layers. Otherwise eg. fossology server is limited to run o=
n same
>>>> machine as bitbake, and generated SPDX files are placed into home dire=
ctory
>>>> path of a custom luser account.
>>>>
>>>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>>>> ---
>>>>  meta/conf/licenses.conf | 12 +++++++-----
>>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
>>>> index d210a0e..fcaec1b 100644
>>>> --- a/meta/conf/licenses.conf
>>>> +++ b/meta/conf/licenses.conf
>>>> @@ -123,7 +123,9 @@ SPDXLICENSEMAP[SGIv1] =3D "SGI-1"
>>>>
>>>>  ## SPDX temporary directory
>>>>  SPDX_TEMP_DIR =3D "${WORKDIR}/spdx_temp"
>>>> -SPDX_MANIFEST_DIR =3D "/home/yocto/fossology_scans"
>>>> +
>>>> +## Output directory for generated SPDX files
>>>> +SPDX_MANIFEST_DIR ?=3D "/home/yocto/fossology_scans"
>>>
>>> not sure if this is right, but shouldn't be SPDX_MANIFEST_DIR ?=3D
>>> "${SPDX_TEMP_DIR}/fossology_scans' so this way we do not rely on a
>>> yocto's home folder?
>=20
> a single series with two patches would make more sense in my opinion
> because these are two logical changes in the same area.
>=20

Thank you, implemented in http://lists.openembedded.org/pipermail/openembed=
ded-core/2017-May/136342.html

-Niko

>>>
>>> Leo
>>>
>>
>> That would seem like a more feasible default. Is this something that=20
>> should be addressed now in this patch, or in another (later) changeset?
>>
>>>>
>>>>  ## SPDX Format info
>>>>  SPDX_VERSION =3D "SPDX-1.1"
>>>> @@ -142,7 +144,7 @@ DATA_LICENSE =3D "CC0-1.0"
>>>>  #   information.
>>>>  #
>>>>
>>>> -FOSS_NO_COPYRIGHT =3D "true"
>>>> +FOSS_NO_COPYRIGHT ?=3D "true"
>>>>
>>>>  # A option defined as[FOSS_RECURSIVE_UNPACK] in ./meta/conf/licenses.=
conf. is
>>>>  # used to control if FOSSology server need recursively unpack tar.gz =
file which
>>>> @@ -156,7 +158,7 @@ FOSS_NO_COPYRIGHT =3D "true"
>>>>  #    FOSSology server recursively unpack components.
>>>>  #
>>>>
>>>> -FOSS_RECURSIVE_UNPACK =3D "false"
>>>> +FOSS_RECURSIVE_UNPACK ?=3D "false"
>>>>
>>>>  # An option defined as [FOSS_FULL_SPDX] in ./meta/conf/licenses.conf =
is used to
>>>>  # control what kind of SPDX output to get from the FOSSology server.
>>>> @@ -171,7 +173,7 @@ FOSS_RECURSIVE_UNPACK =3D "false"
>>>>  #   license tags in the report will be "NOASSERTION"
>>>>  #
>>>>
>>>> -FOSS_FULL_SPDX =3D "true"
>>>> +FOSS_FULL_SPDX ?=3D "true"
>>>>
>>>>  # FOSSologySPDX instance server. http://localhost/repo is the default
>>>>  # installation location for FOSSology.
>>>> @@ -180,7 +182,7 @@ FOSS_FULL_SPDX =3D "true"
>>>>  #   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-=
Web-API
>>>>  #
>>>>
>>>> -FOSS_BASE_URL =3D "http://localhost/repo/?mod=3Dspdx_license_once"
>>>> +FOSS_BASE_URL ?=3D "http://localhost/repo/?mod=3Dspdx_license_once"
>>>>  FOSS_SERVER =3D "${FOSS_BASE_URL}&fullSPDXFlag=3D${FOSS_FULL_SPDX}&no=
Copyright=3D${FOSS_NO_COPYRIGHT}&recursiveUnpack=3D${FOSS_RECURSIVE_UNPACK}=
"
>>>>
>>>>  FOSS_WGET_FLAGS =3D "-qO - --no-check-certificate --timeout=3D0"
>>>> --
>>>> 2.1.4
>>>
>>>
>=20
> =

