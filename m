Return-Path: <Peter.Marko@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 4676178B83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 14:57:56 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w5BEvvZu005893
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 16:57:57 +0200
Received: from ATVIES991U7MSX.ww300.siemens.net
	(atvies991u7msx.ww300.siemens.net [158.226.163.41])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTPS id w5BEvvhn030929
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 16:57:57 +0200
Received: from ATVIES991UAMSX.ww300.siemens.net ([169.254.1.167]) by
	ATVIES991U7MSX.ww300.siemens.net ([158.226.163.41]) with mapi id
	14.03.0399.000; Mon, 11 Jun 2018 16:57:57 +0200
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [v5][PATCH] busybox: update to 1.28.4
Thread-Index: AQHUATtSw1iDAG+MdE6ftFAVL1knhKRanPqAgABj4oCAACMgoA==
Date: Mon, 11 Jun 2018 14:57:57 +0000
Message-ID: <6D4566C9E07A8D4DAB6F935696920A8424601721@ATVIES991UAMSX.ww300.siemens.net>
References: <1528690704-338-1-git-send-email-akuster808@gmail.com>
	<9739bd9dd81149458033ba72cb7ce411@XBOX02.axis.com>
	<bb38520f-85d7-9e63-83a6-76477073285a@gmail.com>
In-Reply-To: <bb38520f-85d7-9e63-83a6-76477073285a@gmail.com>
Accept-Language: sk-SK, de-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.21]
MIME-Version: 1.0
Subject: Re: [v5][PATCH] busybox: update to 1.28.4
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
X-List-Received-Date: Mon, 11 Jun 2018 14:57:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 06/11/2018 04:43 PM, akuster808 wrote:
> On 06/11/2018 01:45 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf=20
>> Of Armin Kuster
>> Sent: den 11 juni 2018 06:18
>> To: akuster808@gmail.com; openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [v5][PATCH] busybox: update to 1.28.4
>>
>> refactored busybox-udhcpc-no_deconfig.patch for this update updated=20
>> 1.28.3
>>
>> [v1]
>> removed patches included in update:
>> busybox/CVE-2011-5325.patch
>> busybox/CVE-2017-15873.patch
>> busybox/busybox-CVE-2017-16544.patch
>>
>> [v2]
>> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier
>>
>> [v3]
>> Update defconfig based on feedback
>>
>> [v4]
>> Decided to update again.
>> 1.28.4
>>
>> [v5]
>> rebased change do to changes in master squashed .cfg into defconfig=20
>> and remove files Delete busybox-fix-lzma-segfaults.patch which is=20
>> included in updated.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> The commit message should be rewritten to document the final commit,=20
> without any patch series references. They belong after --- below.
>=20
> Done that before and folks complained so I started included with files go=
t removed. May I suggest updating the process so we can be consistent.
>=20
> - armin
>

Isn't cover letter the place to put these "history" comments?
Commit message should contain just normal change description.

Peter

>> ---
>>  .../busybox/busybox/CVE-2011-5325.patch            | 481 --------------=
-------
>>  .../busybox/busybox/CVE-2017-15873.patch           |  95 ----
>>  .../busybox/busybox/busybox-CVE-2017-16544.patch   |  43 --
>>  .../busybox/busybox-fix-lzma-segfaults.patch       | 106 -----
>>  .../busybox/busybox-udhcpc-no_deconfig.patch       |  36 +-
>>  meta/recipes-core/busybox/busybox/defconfig        | 278 ++++++------
>>  meta/recipes-core/busybox/busybox/getopts.cfg      |   3 -
>>  .../busybox/busybox/login-utilities.cfg            |  13 -
>>  meta/recipes-core/busybox/busybox/mdev.cfg         |   2 -
>>  .../busybox/busybox/mount-via-label.cfg            |   9 -
>>  meta/recipes-core/busybox/busybox/resize.cfg       |   2 -
>>  meta/recipes-core/busybox/busybox/sha1sum.cfg      |   1 -
>>  meta/recipes-core/busybox/busybox/sha256sum.cfg    |   1 -
>>  meta/recipes-core/busybox/busybox/syslog.cfg       |  11 -
>>  .../{busybox_1.27.2.bb =3D> busybox_1.28.4.bb}       |  15 +-
>>  15 files changed, 162 insertions(+), 934 deletions(-)  delete mode=20
>> 100755 meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
>>  delete mode 100644=20
>> meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
>>  delete mode 100644=20
>> meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
>>  delete mode 100644=20
>> meta/recipes-core/busybox/busybox/busybox-fix-lzma-segfaults.patch
>>  delete mode 100644 meta/recipes-core/busybox/busybox/getopts.cfg
>>  delete mode 100644=20
>> meta/recipes-core/busybox/busybox/login-utilities.cfg
>>  delete mode 100644=20
>> meta/recipes-core/busybox/busybox/mount-via-label.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/sha1sum.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/sha256sum.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/syslog.cfg
>>  rename meta/recipes-core/busybox/{busybox_1.27.2.bb =3D>=20
>> busybox_1.28.4.bb} (72%)
> //Peter
>

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

