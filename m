Return-Path: <christrobridge@hotmail.com>
Received: from DUB004-OMC3S32.hotmail.com (dub004-omc3s32.hotmail.com
	[157.55.2.41])
	by mail.openembedded.org (Postfix) with ESMTP id C97936057A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:00:20 +0000 (UTC)
Received: from DUB130-W36 ([157.55.2.7]) by DUB004-OMC3S32.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Tue, 1 Mar 2016 00:00:21 -0800
X-TMN: [mSQnDP+qqW6dPy/fOMRnKmFWLLtvNTJB]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <DUB130-W36C13406AFB6A8BC0209B0DABB0@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 1 Mar 2016 08:00:21 +0000
Importance: Normal
In-Reply-To: <DUB130-W36E2C873DA9A2A4B6B6A73DABB0@phx.gbl>
References: <DUB130-W36E2C873DA9A2A4B6B6A73DABB0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Mar 2016 08:00:21.0144 (UTC)
	FILETIME=[6706D180:01D17390]
Subject: Re: [oe] [PATCH] gpsd: Fix build when static libs disabled
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
X-List-Received-Date: Tue, 01 Mar 2016 08:00:23 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry wrong list again...=0A=
=0A=
Still half asleep.=0A=
=0A=
----------------------------------------=0A=
> From: christrobridge@hotmail.com=0A=
> To: openembedded-core@lists.openembedded.org=0A=
> Date: Tue=2C 1 Mar 2016 07:58:14 +0000=0A=
> Subject: [OE-core] [oe] [PATCH] gpsd: Fix build when static libs disabled=
=0A=
>=0A=
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/=
106230.html=0A=
>=0A=
>> Fix this build error:=0A=
>> SCons Error: no such option: --disable-static=0A=
>> Signed-off-by: Maxin B. John <maxin.john at intel.com>=0A=
>> ---=0A=
>> meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 1 +=0A=
>> 1 file changed=2C 1 insertion(+)=0A=
>> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/reci=
pes-navigation/gpsd/gpsd_3.14.bb=0A=
>> index ff268b3..a300595 100644=0A=
>> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb=0A=
>> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb=0A=
>> @@ -47=2C6 +47=2C7 @@ EXTRA_OESCONS =3D " \=0A=
>> systemd=3D'${SYSTEMD_OESCONS}' \=0A=
>> ${EXTRA_OECONF} \=0A=
>> "=0A=
>> +DISABLE_STATIC =3D ""=0A=
>> & this cannot be used=2C because then chrpath is not found and only stat=
ic lib is built=0A=
>> & target=3D${HOST_SYS}=0A=
>>=0A=
>> --=0A=
>> 2.4.0=0A=
>=0A=
> While this fixes the build=2C is it just fixing the symptom?=0A=
>=0A=
> I have a patch that copies the fix in:=0A=
>=0A=
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/=
106251.html=0A=
>=0A=
> That is: use EXTRA_CONF_PACKAGECONFIG instead of EXTRA_OECONF=2C as menti=
oned the above diff.=0A=
>=0A=
> This prevents the option being pulled in in the first place=2C which ough=
t to be a more general solution.=0A=
>=0A=
> Regards=2C=0A=
> Chris=0A=
>=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> Openembedded-core mailing list=0A=
> Openembedded-core@lists.openembedded.org=0A=
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=
 		 	   		  =

