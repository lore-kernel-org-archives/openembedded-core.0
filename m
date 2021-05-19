Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.37])
 by mx.groups.io with SMTP id smtpd.web11.14503.1621442802245572597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 09:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=edq2AA2W;
 spf=pass (domain: outlook.com, ip: 40.92.51.37, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3Oynd8s+ezK6HG+2czk+PFG7jPIWDyRkptqaQjOsTZWuHJDnFdZAhNYrTUdOTwfZFnnwe8jli7YEevC1mBaZNPk60R9galDXvJcAgOuvp6SZgjPUJ1+4QS782fLTAXTR4KmbqGkIZMV0QNqqCb3NisvGBPALSfKsKps0hrWXOob2lypXhxuW03ojTG5SB7qhP7P6eg/FNRlAOX833dxMWrFynI5It3vJbJ0uJHxMd5g1EmZ+irJLIMJt+3GEJ7uHIyWSMZ/ypJgXzgLeQTQKKhtOVtOwujgzMi8rTXbAVT/BlqPzKPU6nVFKFMb+nCa19pW/BNXOQ4HGLF9x5vXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXXFbNLSVnl+K3z2i/Ccczb7sbhDSecQ2QtftgHtCZw=;
 b=kXxdIdByZkc4OPkcirJrK53lLOJVXF68pX1oNPPO8CVFnwhYdp5tOHPfdiLdWaut4tQOYJ1DLtvo/IVunQUY6uGSAXB6v9oa/NN09Nragya6JWsxxKzzZz/ihZL4rdVzcmsVraJSXWBhIPjA/TjBxyLHWIiUTrdlXiYeY10CvhAzueBP2tpu71Pwr2nPhCCogWY532bw5WpLHkjKkIWs0OiO9oofftMA9sgLn/390kLYRy4L+KF/qLG20+sogNFBy2q+eoNAFKTjyKc36Es1c28hr2JxHAVJIQL2VBpQd24j6WIDPepwMU67ibfVD4dtqiPbRvcYWel+HzY3p/ifyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXXFbNLSVnl+K3z2i/Ccczb7sbhDSecQ2QtftgHtCZw=;
 b=edq2AA2WwHlLJHIdoFXP3KYP73a1CgIj94GYauxGTKPYEewOJvPE0pcHXAPaNF1RtONn1pJzwE4l2Yd7OhSZT8qEB1bGhtrHZ9hKkAaBUGbqKWkAL5cNvbyzpWEHPcAcdUW8rXP5ZQOeI8PYJn5OysnJfV29Hi3Z37SogoRy8s8z11UHMBQlY7nK5T8lYqD5d6yitRZhhuA8dIlLkW1SDrQWXeWaGcxjtFrbhVksXBdVnih3JihpnvILr+LgbnCdyRs+oRf9UbGcocGOTSUsDW5x0SRn/OkNjrkwGksUyYATlARrRaybfV2LBq76skgfvGNB/1PyaA1ZDoZbhPBXWw==
Received: from AM7EUR06FT006.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::47) by
 AM7EUR06HT053.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::62)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 16:46:40 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc36::43) by AM7EUR06FT006.mail.protection.outlook.com
 (2a01:111:e400:fc36::336) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 19 May 2021 16:46:40 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6215F5BCEC212081721D71E72F06F4F4DB676E2355712E53E3A457894D2F2EA6;UpperCasedChecksum:20E4799C35EA70D92A50A7AA909909FE95DBB35EF43BD50FB77CC7DD6E04349A;SizeAsReceived:8937;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 16:46:40 +0000
Subject: Re: [OE-core] [PATCH] sstatesig.py: make it fatal error when sstate manifest isn't found
To: Martin Jansa <martin.jansa@gmail.com>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210519102302.2674317-1-Martin.Jansa@gmail.com>
 <AM9PR09MB4642AC4E6EAC764B936940BAA82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CA+chaQdBf=aJZddxAc43GBXNoRAYwWTzw3MtQSmKxK7=tsNnzQ@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB46421A3886751FC639F8A6F2A82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 19 May 2021 18:46:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CA+chaQdBf=aJZddxAc43GBXNoRAYwWTzw3MtQSmKxK7=tsNnzQ@mail.gmail.com>
X-TMN: [scS0OC5yTnZLktCh3xu+TYsT6t+bXtRl]
X-ClientProxiedBy: AM7PR04CA0016.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::26) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <a6a08f10-bd71-997c-1e98-096cd62e75db@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.87.130) by AM7PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:20b:110::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 16:46:39 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 387be4d1-b937-4321-7003-08d91ae5acdc
X-MS-TrafficTypeDiagnostic: AM7EUR06HT053:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zWSXIH9PS6bfdIqu5h2keINVkFYTLEkiDeVZ93nHjiBgXMMJ4o8DHrlOXmeh3zZc0nT3BREj3QgKvygpEaRzaHJx9hdOJaevTWHnciJ1orK7CI+Zn5XMttdbsqAtsEZ5WhpUhI+76iFLWEF9+j8j3t+EymlRrehgvc+DPinEt713d1c3i43L1TNNo8Sn7ALPm3BWb1OGMO4Jf7WTATGIHJmFKxhXEM78fnL8U06foCJzB5+CZo90UfXJE2TxauIIf12VC1FgQb5SV+/coHbHRTInLPsf0ZmqCuO2+MvII+3vlUEFBv2upkmY5VSHrja/2yES0CjvRt2NaS2F1kNmmLlarokvhgSGaXnV8yuTskMVIXk/UsS8Q4ITANevFopb2b9esu9xK2Pp2TZeer4+dXPjjs1kWzpEr8FWhALxQpyuhAmBJEmnsEgF1q9K9KR2ZlSZYxy1HpIUcvBmizvAvRMqlyM9IXbGL/QTcIzYV7U=
X-MS-Exchange-AntiSpam-MessageData: 
	+4h3UL3HzPvjaj6ageSBaAeFy6S5vztc11Nikc+avSeBtf4O5LwsO6nv6xcThkkPvr1NZdr4FFALW3Jz3LtQDb9MipJ88clUcWGMDClimHVZXh3yv4OVFAIMj18D9EPmyOoRTdPNCUMsVlDeUl0TQw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387be4d1-b937-4321-7003-08d91ae5acdc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 16:46:40.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR06FT006.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT053
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 19.05.21 17:02, Martin Jansa wrote:
>=20
>=20
> On Wed, May 19, 2021 at 12:47 PM Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>=20
>=20
>     On 19.05.21 12:23, Martin Jansa wrote:
>      > * all known issues in this area were fixed, make it fatal that it
>      >=C2=A0 =C2=A0 cannot be overlooked if someone triggers this issue a=
gain
>      >
>      > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>      > ---
>      >=C2=A0 =C2=A0meta/lib/oe/sstatesig.py | 2 +-
>      >=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>      >
>      > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
>      > index 6cd6e11acc..e86a09b332 100644
>      > --- a/meta/lib/oe/sstatesig.py
>      > +++ b/meta/lib/oe/sstatesig.py
>      > @@ -453,7 +453,7 @@ def find_sstate_manifest(taskdata, taskdata2,
>     taskname, d, multilibcache):
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest =3D
>     d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch,
>     taskdata, taskname))
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(manifest=
):
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return manif=
est, d2
>      > -=C2=A0 =C2=A0 bb.error("Manifest %s not found in %s (variant '%s'=
)?" %
>     (manifest, d2.expand(" ".join(pkgarchs)), variant))
>      > +=C2=A0 =C2=A0 bb.fatal("Manifest %s not found in %s (variant '%s'=
)?" %
>     (manifest, d2.expand(" ".join(pkgarchs)), variant))
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0return None, d2
>=20
>     doesn't that make the return statement obsolete? also how can an erro=
r
>     be overlooked? It does make the task triggering this issue fail, so h=
ow
>     is a fatal better in this case (besides abnormally terminating the ta=
sk)
>=20
>=20
> bb.error doesn't make the task to fail, it only shows an error (which=20
> results in non-zero exit code), but lets depending tasks to continue and=
=20
> fail with other (often more misleading) errors, because their dependency=
=20
> is really missing in RSS
>=20
> without this patch:
> ERROR: adwaita-icon-theme-3.34.3-r0 do_prepare_recipe_sysroot: Manifest=20
> /OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-a=
t-spi2-core-native.populate_sysroot=20
> not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
> ERROR: adwaita-icon-theme-3.34.3-r0 do_prepare_recipe_sysroot: Manifest=20
> /OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-a=
t-spi2-core-native.populate_sysroot=20
> not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
> ERROR: adwaita-icon-theme-3.34.3-r0 do_configure: Manifest=20
> /OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-a=
t-spi2-core-native.populate_sysroot=20
> not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
> ERROR: adwaita-icon-theme-3.34.3-r0 do_install: Manifest=20
> /OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-a=
t-spi2-core-native.populate_sysroot=20
> not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
> ERROR: adwaita-icon-theme-3.34.3-r0 do_package: Manifest=20
> /OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-a=
t-spi2-core-native.populate_sysroot=20
> not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
> ERROR: adwaita-icon-theme-3.34.3-r0 do_package_write_ipk: Manifest=20
> /OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-a=
t-spi2-core-native.populate_sysroot=20
> not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
> NOTE: Tasks Summary: Attempted 2819 tasks of which 2803 didn't need to=20
> be rerun and all succeeded.
> Summary: There were 6 ERROR messages shown, returning a non-zero exit cod=
e.
>=20
> with this patch:
> ERROR: adwaita-icon-theme-3.34.3-r0 do_prepare_recipe_sysroot: Manifest=20
> /OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-a=
t-spi2-core-native.populate_sysroot=20
> not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
> ERROR: Logfile of failure stored in:=20
> /OE/build/oe-core/tmp-glibc/work/all-oe-linux/adwaita-icon-theme/3.34.3-r=
0/temp/log.do_prepare_recipe_sysroot.1638704
> ERROR: Task=20
> (/OE/build/oe-core/openembedded-core/meta/recipes-gnome/gnome/adwaita-ico=
n-theme_3.34.3.bb:do_prepare_recipe_sysroot)=20
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2805 tasks of which 2800 didn't need to=20
> be rerun and 1 failed.
> Summary: 1 task failed:
>   =20
> /OE/build/oe-core/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon=
-theme_3.34.3.bb:do_prepare_recipe_sysroot
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>=20
> Without this fix:
> https://git.openembedded.org/openembedded-core/commit/?id=3D63da9a4f889c5=
b0e41bc8ec08abe0acea1546479=20
> <https://git.openembedded.org/openembedded-core/commit/?id=3D63da9a4f889c=
5b0e41bc8ec08abe0acea1546479>
>=20
> I was seeing various native dependencies missing and as you can see in=20
> the=C2=A0adwaita-icon-theme example, missing=C2=A0at-spi2-core-native isn=
't fatal=20
> for the build, but were adwaita-icon-theme packages and sstate built=20
> correctly? If you don't investigate all these ERROR messages and=20
> non-zero exit code (e.g. just because you have thousands of builds per=20
> day populating the same sstate mirror), you might miss some of these=20
> breakages. While using fatal prevents adwaita-icon-theme to even start=20
> building and producing possibly broken packages, images, sstate.
>=20
> In some other cases e.g. qtwayland-native missing when building target=20
> qtwayland you will get do_compile failure complaining that the the=20
> binary from qtwayland-native is missing, but the root cause of this=20
> issue is written many lines above do_compile log. You can see some other=
=20
> examples in=20
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
master&id=3D817f1c14cec4d66504a5028908a4ebac147f3b52=20
> <https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa=
/master&id=3D817f1c14cec4d66504a5028908a4ebac147f3b52>=20
> and before changing this from bb.warn to bb.error in previous patch most=
=20
> of these issues were just "some random builddir breakage which was=20
> resolved by doing clean build from sstate".
>=20
> And this happens in multi-machine builds with=20
> dunfell/gatesgarth/hardknott and only master is safe now. I plan to ask=20
> Steve to backport this and related fixes to dunfell after a bit more=20
> time in master:
> https://git.openembedded.org/openembedded-core/commit/?id=3D0eb95212a7e6b=
6bdc1243094072dea432cb48f0f=20
> <https://git.openembedded.org/openembedded-core/commit/?id=3D0eb95212a7e6=
b6bdc1243094072dea432cb48f0f>
> https://git.openembedded.org/openembedded-core/commit/?id=3D63da9a4f889c5=
b0e41bc8ec08abe0acea1546479=20
> <https://git.openembedded.org/openembedded-core/commit/?id=3D63da9a4f889c=
5b0e41bc8ec08abe0acea1546479>
> https://git.openembedded.org/openembedded-core/commit/?id=3D95607a26854d8=
73399d2b9d7e5fcbffc0cbdba4c=20
> <https://git.openembedded.org/openembedded-core/commit/?id=3D95607a26854d=
873399d2b9d7e5fcbffc0cbdba4c>
> and then this one.

Thanks for the detailed explanation, if it reduces the noise (incl false=20
positives) I'm all for it

>=20
> Regards,
