Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402F0FD9E1A
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 21:46:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81720.1772142411426735005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 13:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WWBmH/5N;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48069a48629so14650625e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772142410; x=1772747210; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=667zOWVOFQvOlLbeKYiZuU62K60C4QE60FtA3JMEXzI=;
        b=WWBmH/5N2spqUWHyH2v89+EnZm3FgdCg9ov2Jv1B0CmEL4skWnAgBboi/q9u4cLsFJ
         ibMNDHiK4UoKFCMtaY38T58TKHpGK/5hJLYPCB/axMxUdb3YUVZanFese1KgBFALN5ba
         C8c1WtY4eT2AvxmKOXBHatqYG0hpCLLGxdYaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772142410; x=1772747210;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=667zOWVOFQvOlLbeKYiZuU62K60C4QE60FtA3JMEXzI=;
        b=FmgtkhW6IuBN8ED6ovKzIkcMjx72NsFutispdZPT3goC0OpPX/GX5cNtn2GUm1Wf6T
         U/bunFln+81ThdN+OtAz2jMLkND87pUgCFC2PGVK0IRZQMbyOG7Mb4W2e9C6Pyopfq1e
         4NXla0GTPS6ZW17V6VinSKsZ8sLBxiYcSkJL3g8nP4LZ7XVXiB/ekqvUrEt5skgu5+V8
         JKdsVxPeXJ2EL10OzWJ4fTzi7J4bfaFN+9I5gT9jbzWn6LbLv5AEKVifUme1QlSvONd+
         WDiN9LGolwJ6ALAeI+7IGDfdQOtJBDuhyLIHW8ICOksOOP6fTkJh+XgHOgmLC4CCdDRo
         g6dA==
X-Gm-Message-State: AOJu0Ywh9g/72vSVZwKJmjs3aSb0sOOi7NvBIU0a2lveBn+6yELxNTAD
	2/Az7Qv0ClbWTEpggtvPHKOS4OciFQtUaKTuyetER3jeQKPzz1W/sgBR7YSpycIk3gQ=
X-Gm-Gg: ATEYQzy5NeAB+n2mERUETKuOx7Nr+pevU9ZYiMXJJNmcQMaVpEQFtvjKPxV1UePsU6x
	s5qVIFVSx+npj5YOweJBS5Y2nWh7tE9WqQqXLziyvRE9wZWtOFM86PzUKR51Vg3WI5zXgDltFbX
	LHKaYO3ye8Sc+PKBPrnIpwOVuVIUCm2/735E0l6yilQyfnUCVKrrDg4H50Py+Kd7+GmrrE/hAk0
	UPvmwt8Zj9ujJ5VL+Kbc0SwOqzKjjOC77yseVV8jpckOPBiVQuzlpKLskfZ1iZmeQCyVbmUJWrh
	CaJ1PHIKYEdzztN67aFJCvW/YLeOkgeSfsa49wcBDXYyKCPTS2n29CoRbE9YqxgVNirIWePMl2k
	DIoQRS99IkUOwGRhTCIiZNhfpxVYMLDOGmLdHemGDzob8Etx3wkQLMSCrKwHsprVdv3ylDw8tWQ
	vWwE5kAKC7QKLyKspcch/Gqo32FC1ufgTOE1H6br/HktGibQAyHfkdSNAFmnet4t033s4vNwyva
	6psa4JE/bPrFnw4zYHJqA1B0Dg=
X-Received: by 2002:a05:600c:1f83:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-483c9c031e6mr5951005e9.19.1772142409706;
        Thu, 26 Feb 2026 13:46:49 -0800 (PST)
Received: from localhost (2a01cb001331aa002c0b752a8b25831e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2c0b:752a:8b25:831e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f26d7sm183023045e9.3.2026.02.26.13.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 13:46:49 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 22:46:48 +0100
Message-Id: <DGP81ZOFBWPO.20C7PHLJ24EJL@smile.fr>
Subject: Re: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.6 ->
 3.5.4
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Marko, Peter"
 <Peter.Marko@siemens.com>
X-Mailer: aerc 0.20.0
References: <20260123123336.41126-1-peter.marko@siemens.com>
 <CAMSfU+7FpuEruzCELf=PGAmGgEzWYf_WBnU2goHdsPSsSkDcVg@mail.gmail.com>
 <CAMSfU+5RvtaRei8Kt=-=rRi77ch=3dFJ0DzNLDdmjfpnmTzonw@mail.gmail.com>
 <AS1PR10MB56972C585270289D148F9261FD9CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM> <CAMSfU+6_7HFFW-_yiea028+oK=yz2mkanYVPBXTwC-EqaiZO4w@mail.gmail.com>
In-Reply-To: <CAMSfU+6_7HFFW-_yiea028+oK=yz2mkanYVPBXTwC-EqaiZO4w@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 21:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232064

On Mon Feb 2, 2026 at 4:38 PM CET, Yoann Congal wrote:
> Le sam. 31 janv. 2026 =C3=A0 19:47, Marko, Peter <Peter.Marko@siemens.com=
> a
> =C3=A9crit :
>
>> I have checked the m2crypto build issue and found out that I had to fix
>> this for newer Yocto releases already.
>>
>>
>> https://git.openembedded.org/meta-openembedded/commit/?id=3Df9158ce32fff=
a6f18eed4008c3295146c81d55ea
>>
>> Applying this commit to scarthgap works, so I have submitted it.
>>
>> https://lists.openembedded.org/g/openembedded-devel/message/124019
>>
>
>  Thanks Peter,
>
> I've put that m2crypto patch on a branch and ran a full meta-openembedded
> world build (every layers under meta-openembedded)
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/81/builds/1285
> =3D> Only warnings (reference to TMPDIR [buildpaths]) that are most likel=
y
> not related to the openssl upgrade

I've run this build again (with a more recent scarthgap
oe-core & meta-openembedded):
* Since the m2crypto patch has merged, meta-openembedded is on scarthgap
  without additionnal patches.
* https://autobuilder.yoctoproject.org/valkyrie/?#/builders/81/builds/1323
  same unrelated buildpath warnings, no errors.

Regards,
>
>
>> Peter
>>
>>
>>
>> *From:* Yoann Congal <yoann.congal@smile.fr>
>> *Sent:* Wednesday, January 28, 2026 12:05
>> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>> *Cc:* openembedded-core@lists.openembedded.org
>> *Subject:* Re: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.=
6
>> -> 3.5.4
>>
>>
>>
>> Le ven. 23 janv. 2026 =C3=A0 18:02, Yoann Congal <yoann.congal@smile.fr>=
 a
>> =C3=A9crit :
>>
>> Le ven. 23 janv. 2026 =C3=A0 13:33, Peter Marko via lists.openembedded.o=
rg
>> <peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
>>
>> Intention of this RFC is to run full autobuilder job matrix to see if
>> there are any failures not detected by my local testsuite.
>>
>>
>>
>> I created a poky branch with this patch :
>> https://git.yoctoproject.org/poky-contrib/log/?h=3Dycongal/scarthgap/ope=
nssl_3.5_upgrade
>>
>> (above my -nut branch to decrease the probability of an unrelated AB-INT
>> failure)
>>
>>
>>
>> I've started the build :
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3118
>>
>>
>>
>> Hello,
>>
>>
>>
>> As discussed during the tech call of last tuesday, I've started builds:
>>
>> * a new a-full with rebased branch on the latest scarthgap (now, the
>> branch is only scarthgap+this upgrade)
>>
>>   *
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3133/
>> failed on a unrelated AB-INT issue (#15945) but is otherwise OK
>>
>> * a meta-oe build (which includes a world build for meta-oe, meta-python=
,
>> meta-networking & meta-filesystems):
>>
>>   *
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1277
>>
>>   * *Failed on python3-m2crypto* (log.do_compile =3D>
>> https://gist.github.com/ycongal-smile/4c6501ecd81c9f475b793234cceb7a74)
>>
>> * to compare, I've started the same build with a vanilla scarthgap branc=
h
>> (without the openssl upgrade):
>>
>>   *
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1278
>> =3D> success (albeit with warnings)
>>
>>
>>
>> Can you investigate this python3-m2crypto failure?
>>
>>
>>
>> Also, the "meta-oe" build does not cover every layer in meta-openembedde=
d,
>> I think I will increase coverage to all the meta-openembedded layers for
>> the next run...
>>
>>
>>
>>
>>
>> Topic for discussion is especially what should be the final form of this
>> upgrade as some users may want to stay on openssl 3.2.x originally
>> shipped with Yocto 5.0 Scarthgap.
>> Current form was chosen to easily review recipe/patch differences.
>> Is it fine to overwrite or do we need to keep both version and make one
>> the default and other optional? Which would be tested on AB?
>>
>> Peter Marko (1):
>>   openssl: upgrade 3.2.6 -> 3.5.4
>>
>>  .../openssl/files/environment.d-openssl.sh    |  9 ++-
>>  ...ke-history-reporting-when-test-fails.patch | 19 +++--
>>  ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
>>  ...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---
>>  .../0001-extend-check_cwm-test-timeout.patch  | 32 ++++++++
>>  .../openssl/openssl/CVE-2024-41996.patch      | 44 -----------
>>  .../{openssl_3.2.6.bb =3D> openssl_3.5.4.bb}    | 76 +++++++++++++-----=
-
>>  7 files changed, 116 insertions(+), 94 deletions(-)
>>  create mode 100644
>> meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-tim=
eout.patch
>>  delete mode 100644
>> meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
>>  rename meta/recipes-connectivity/openssl/{openssl_3.2.6.bb =3D>
>> openssl_3.5.4.bb} (75%)
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#229884):
>> https://lists.openembedded.org/g/openembedded-core/message/229884
>> Mute This Topic: https://lists.openembedded.org/mt/117416674/4316185
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>>
>> --
>>
>> Yoann Congal
>>
>> Smile ECS
>>
>>
>>
>> --
>>
>> Yoann Congal
>>
>> Smile ECS
>>


--=20
Yoann Congal
Smile ECS


