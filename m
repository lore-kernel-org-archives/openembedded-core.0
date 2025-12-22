Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98077D711D5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 07:10:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75991.1766387434800734291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 23:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n/hIFxks;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A3D214E41D29
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 07:10:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FB4E606C1;
	Mon, 22 Dec 2025 07:10:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0B551037114E;
	Mon, 22 Dec 2025 08:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766387428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w/0/LSJZjNIZlBwGGXAKiePRAAdxGMV9FNaopDTtZ5A=;
	b=n/hIFxksMevDoJYmVQBhFolAnBkMeRK56XAntQ49C/wWl2CbYMDyOfH5Eo2vfbp20Q4v0R
	048hnYTVuBC1pnfO4va877Rlutuf+RBKjN6TMrrZV3CyR0hgwb1DtVrO2N43bKtI6f8BJy
	RbLSz+ZDHEiT8M/ey0f65YH3BD6l6uJ+skcRX514WXafNJG5KWWY5iFA6lVxRKWb32nNGz
	ZeOcHsqMOHfR8X7sKnAYzpTbuWEjUC/9+LsQdv+6ywRsyVv/KtJ6Kn9OXr8dxyEbaNyXFr
	jvwoG/MAl+1Sarn12Oi7aJh3DYarhGru3x2fSHMF9qNzYMWYs0i7y/B61tTsew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 08:10:24 +0100
Message-Id: <DF4K309U5R8V.3UX2W7MKLC13B@bootlin.com>
To: "Yoann Congal" <yoann.congal@smile.fr>
Subject: Re: [OE-core] [PATCH v4 2/2] meta/files/layers.schema.json: use URI
 shortcut for some remotes
Cc: <corentin.guillevic@smile.fr>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251219161311.2293512-1-corentin.guillevic@smile.fr>
 <20251219161311.2293512-2-corentin.guillevic@smile.fr>
 <DF3RWS2MGAXC.2OYHJPZRGZM9Y@bootlin.com>
 <CAMSfU+6rsTevsJqYmHwv3a4Gt2zi4JXg69itOs9R1saX8w2nJQ@mail.gmail.com>
In-Reply-To: <CAMSfU+6rsTevsJqYmHwv3a4Gt2zi4JXg69itOs9R1saX8w2nJQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 07:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228284

On Sun Dec 21, 2025 at 6:33 PM CET, Yoann Congal wrote:
> Le dim. 21 d=C3=A9c. 2025 =C3=A0 10:05, Mathieu Dubois-Briand via
> lists.openembedded.org
> <mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> a =C3=A9crit=
 :
>>
>> On Fri Dec 19, 2025 at 5:13 PM CET, Corentin Guillevic via
> lists.openembedded.org wrote:
>> > Among the three sources, only two have a single remote. So we can
> replace
>> > their entire structure 'remote' -> 'origin' -> 'uri' with a shorter on=
e
>> > (property 'uri' only).
>> >
>> > Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
>> > ---
>>
>> Hi Corentin,
>>
>> It looks like this is breaking some selftest:
>>
>> 025-12-19 13:57:11,641 - oe-selftest - INFO -
> bblayers.BitbakeLayers.test_validate_examplelayersjson
> (subunit.RemotedTestCase)
>> 2025-12-19 13:57:11,642 - oe-selftest - INFO -  ... FAIL
>>
>> Stderr:
>> 2025-12-19 13:53:18,059 - oe-selftest - INFO - Adding: "include
> selftest.inc" in
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/conf=
/local.conf
>> 2025-12-19 13:53:18,059 - oe-selftest - INFO - Adding: "include
> bblayers.inc" in bblayers.conf
>> 2025-12-19 13:57:11,642 - oe-selftest - INFO - 6: 13/38 66/653 (0.30s) (=
0
> failed) (bblayers.BitbakeLayers.test_validate_examplelayersjson)
>> 2025-12-19 13:57:11,642 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded=
-core/meta/lib/oeqa/selftest/cases/bblayers.py",
> line 163, in test_validate_examplelayersjson
>>     self.validate_layersjson(json)
>>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded=
-core/meta/lib/oeqa/selftest/cases/bblayers.py",
> line 159, in validate_layersjson
>>     self.validate_json(json, "layers.schema.json")
>>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded=
-core/meta/lib/oeqa/selftest/cases/bblayers.py",
> line 152, in validate_json
>>     result =3D runCmd(
>>              ^^^^^^^
>>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded=
-core/meta/lib/oeqa/utils/commands.py",
> line 214, in runCmd
>>     raise AssertionError("Command '%s' returned non-zero exit status
> %d:\n%s" % (command, result.status, exc_output))
>> AssertionError: Command
> '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/tmp=
/work/x86_64-linux/python3-jsonschema-native/4.25.1/recipe-sysroot-native/u=
sr/bin/nativepython3
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/tmp/=
work/x86_64-linux/python3-jsonschema-native/4.25.1/recipe-sysroot-native/us=
r/bin/jsonschema
> -i
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-=
core/meta/files/layers.example.json
> --base-uri
> file:///srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbak=
e/bin/../setup-schema/
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake/bin/.=
./setup-schema/layers.schema.json'
> returned non-zero exit status 1:
>>
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/tmp/=
work/x86_64-linux/python3-jsonschema-native/4.25.1/recipe-sysroot-native/us=
r/bin/jsonschema:5:
> DeprecationWarning: The jsonschema CLI is deprecated and will be removed =
in
> a future version. Please use check-jsonschema instead, which can be
> installed from https://pypi.org/project/check-jsonschema/
>>   from jsonschema.cli import main
>> {'branch': 'master', 'describe': '', 'uri': '
> https://github.com/kanavin/meta-alex', 'rev':
> '05b25605fb8b2399e4706d7323828676bf0da0b5'}: Additional properties are no=
t
> allowed ('uri' was unexpected)
>> {'branch': 'master', 'describe': '15.0-hardknott-3.3-310-g0a96edae',
> 'uri': 'git://git.yoctoproject.org/meta-intel', 'rev':
> '0a96edae609a3f48befac36af82cf1eed6786b4a'}: Additional properties are no=
t
> allowed ('uri' was unexpected)
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2867
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2762
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3003
>>
>> Can you have a look at this?
>
> Hello,
>
> The bitbake commit for this run is 96d10e4702b8ef53d9893f9b9e0c1d9c458566=
7c
> (the current mathieu/master-next-success).
> It does not contain the needed patches:
> * [PATCH v4 1/4] bitbake-setup: add inline URI
>     https://lists.openembedded.org/g/bitbake-devel/message/18624
> * [PATCH v4 2/4] layers.schema.json: support 'uri'
>     https://lists.openembedded.org/g/bitbake-devel/message/18625
> * [PATCH v4 3/4] bitbake-setup: use URI shortcut for all configurations
>     https://lists.openembedded.org/g/bitbake-devel/message/18626
> * [PATCH v4 4/4] doc/bitbake-setup: document "uri" property
>     https://lists.openembedded.org/g/bitbake-devel/message/18627
>
> Can you retry this patch with a bitbake branch containing these commits?
> (In retrospect, the link between the series should have been made more
> clear)
>

Yes, I was a bit too quick and took the two series out of sync. I will
add this one back to the queue.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


