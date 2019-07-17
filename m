Return-Path: <adrian.ratiu@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 57D247ED2B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 10:46:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aratiu) with ESMTPSA id EFCF528AE1F
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Kang Kai <Kai.Kang@windriver.com>
In-Reply-To: <a1a87489-5023-2ac9-59ee-996725d08a72@windriver.com>
References: <20190717074836.27002-1-adrian.ratiu@collabora.com>
	<a1a87489-5023-2ac9-59ee-996725d08a72@windriver.com>
Date: Wed, 17 Jul 2019 13:46:10 +0300
Message-ID: <87ftn5ey6l.fsf@collabora.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cogl-1.0.inc: set RDEPENDS_${PN}-dev = ""
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
X-List-Received-Date: Wed, 17 Jul 2019 10:46:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Jul 2019, Kang Kai <Kai.Kang@windriver.com> wrote:
Hi

> On 2019/7/17 =E4=B8=8B=E5=8D=883:48, Adrian Ratiu wrote:=20
>> ${PN}-dev by default depends on ${PN} but in this case ${PN} is=20
>> empty by design (FILES_${PN} =3D "") and is not created, leading=20
>> to installation dependency errors like the following:=20
>>=20
>> Collected errors:=20
>>   * Solver encountered 1 problem(s): * Problem 1/1: *   -=20
>>   nothing provides cogl-1.0 =3D 1.22.2-r0 needed by=20
>>   cogl-1.0-dev-1.22.2-r0.armv7at2hf-neon-imx * * Solution 1: *=20
>>   - do not ask to install a package providing cogl-1.0-dev=20
>=20=20
> I think what you need is=20
>=20
> ALLOW_EMPTY_${PN} =3D "1"

Why is creating and depending on an empty package better than not=20
creating and depending on it at all?

From what I can see in other recipes both methods are used.

>
>
> Regards,
> Kai
>
>
>>
>> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
>> ---
>>   meta/recipes-graphics/cogl/cogl-1.0.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-grap=
hics/cogl/cogl-1.0.inc
>> index 3e392fa5ec..a388023a03 100644
>> --- a/meta/recipes-graphics/cogl/cogl-1.0.inc
>> +++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
>> @@ -75,4 +75,6 @@ RPROVIDES_libcogl =3D "cogl-1.0"
>>   RCONFLICTS_libcogl =3D "cogl-1.0"
>>   RREPLACES_libcogl =3D "cogl-1.0"
>>=20=20=20
>> +RDEPENDS_${PN}-dev =3D ""
>> +
>>   COMPATIBLE_HOST_armv4 =3D 'null'
>
>
> --=20
> Kai Kang

