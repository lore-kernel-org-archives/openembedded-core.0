Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE292CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 11:11:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.8836.1758798711863296884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 04:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Oa/Ie1n/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DEE2D4E40DD3;
	Thu, 25 Sep 2025 11:11:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3B396062C;
	Thu, 25 Sep 2025 11:11:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B949102F1724;
	Thu, 25 Sep 2025 13:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758798708; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oOEv5kvXWKcrGyBwFZAhmf8JAnjv3uQLcQfY7lL3FMg=;
	b=Oa/Ie1n/5ej2KOCGKGz27JVX21hgG04daW+ZUY+KFhKi9SCBxB3AeoMWK1CRNyPnntWpCF
	oz01N36TJJ0c4C3+qInAEXV6EyljpAYa9Pr3f6E1CvpN+Z/kgu3XScDfnsIYDc3m6SeC3G
	LsBSKAwpucjECDfYmqnrtwX5hMkXg1PpMtkattsA2N32lIvh3Nwa4qP6QbeZHzXpi/3Pl5
	pYL90oiVq6x3JvzCW9i/Pvqt5uyAoZHZi/6qaIhIu0yfcJzDKvArx4i3vDTvtSB4Krc3hQ
	tp5lx1OlggnaBJG4w2hJ+86t30sVWhmkrRgHl6nUmWrI6k6DvEpGwdBxb0Yc4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Sep 2025 13:11:39 +0200
Message-Id: <DD1U3SCOKELE.2CRIIUQH4JCZ3@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/1] wic: updated fstab does not preserve
 metadata of the original file
Cc: "Randy MacLeod" <randy.macleod@windriver.com>,
 <openembedded-core@lists.openembedded.org>, <hongxu.jia@windriver.com>,
 <trevor.woerner@linaro.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Daniel Andrade" <dani.barra25@gmail.com>, "Trevor Woerner"
 <twoerner@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250902190555.7929-1-dani.barra25@gmail.com>
 <DCK51OC59LCA.XXERUU1OP7Y@bootlin.com>
 <16907d6c-a28d-4369-95fd-199fcccba105@windriver.com>
 <CA+-=zY2PzZ3RqtzLbFzd6TxSdBVft2KrSvzKQqP2oxZZUMnWhg@mail.gmail.com>
 <CA+-=zY09Um_hG1knpWFBRHx-mTBgNUN3vH9WA0nhiY7ub-PKvw@mail.gmail.com>
 <DD0EHMY9ITYL.3KAYD72BZUUIJ@bootlin.com>
 <CA+-=zY2HNd2r-Ux8vUbSU72dGXtPArRtzTaSnHiF0JEvC_jC-Q@mail.gmail.com>
 <DD1R90GRFNVC.24IBY55KSXN0@bootlin.com>
In-Reply-To: <DD1R90GRFNVC.24IBY55KSXN0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 11:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224015

Hi Trevor,

I'm not sure you have seen the following mail thread. It was suggested
we seek for your advices during today patch review call.

Do you have any opinion about this test, and if the behaviour we are
seeing is expected?

Thanks,
Mathieu

On Thu Sep 25, 2025 at 10:57 AM CEST, Mathieu Dubois-Briand wrote:
> OK! So I misunderstood your previous mail.
>
> I confirm that on master branch the test succeed, but fails if I change
> the filesystem to squashfs or btrfs.
>
> On a first glance, it looks like you are right, but I can't say I am
> experienced with wic internals. We might want a second opinion here.
>
> If the test is wrong, it has to be fixed. And so probably the tested
> code also have to be fixed. I this something you can do?
>
> Thanks,
> Mathieu
>
> On Wed Sep 24, 2025 at 6:04 PM CEST, Daniel Andrade wrote:
>> Hello Mathieu,
>>
>> Thank you for the quick answer.
>> Ok, I will start from the beginning.
>>
>> The failing test is supposed to test `--no-fstab-update` flags on wks fi=
le.
>> According to the understanding of the code, the flag is being passed acr=
oss
>> python scripts either as `self.no_fstab_update`, like in
>> scripts/lib/wic/partition.py, or `part.no_fstab_update`, on
>> scripts/lib/wic/plugins/source/rootfs.py.
>> The issue that is arising from the `oe-selftest -r
>> wic.Wic.test_no_fstab_update` is that it is not actually testing it,
>> because somehow the assigning of the previous variables is not correct,
>> which leads to a later assumption.
>> The thing that is really doing the "no update" is the line 134 of
>> `scripts/lib/wic/partition.py` where it excludes ext* and msdos partitio=
ns
>> from falling in the common plugin for Rootfs.
>> Because of this, I suggested someone to, in a clean and a different
>> environment compared to mine, change the wks file used to `squashfs` fst=
ype
>> (or any other supported wic fstype) instead of `ext4` which indeed also
>> made the test fail.
>> In summary, the test is failing not because of the patch (even though ma=
ybe
>> something can be improved or fixed later), but because it is just checki=
ng
>> for ext4 partitions that fall in a different way of approaching fstab wh=
ile
>> the real mechanism is not behaving as desired.
>>
>> TLDR: The test is getting passed not because it is enforcing
>> `--no-fstab-update` but because the partition is ext* or msdos. Changing=
 it
>> to squashfs, btrfs or any other wic supported partition, with or without
>> the patch, will cause this to fail. This is an extra thing non-related w=
ith
>> the proposed patch but that is preventing it to behave correctly as
>> intended by the test.
>>
>> Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> escreveu (ter=
=C3=A7a,
>> 23/09/2025 =C3=A0(s) 19:44):
>>
>>> Hi Daniel,
>>>
>>> Sorry, but I'm not sure to get your point.
>>>
>>> I ran the test locally, and it does fail. It also fails if I modify it
>>> to use squashfs instead of ext4.
>>>
>>> My reproduction procedure:
>>> git clone https://git.yoctoproject.org/poky-ci-archive -b
>>> autobuilder.yoctoproject.org/valkyrie/a-full-2320
>>> . oe-init-build-env
>>> echo 'SANITY_TESTED_DISTROS =3D ""' >> conf/local.conf
>>> oe-selftest -r wic.Wic.test_no_fstab_update
>>>
>>> Thanks,
>>> Mathieu
>>>
>>> On Tue Sep 23, 2025 at 5:05 PM CEST, Daniel Andrade wrote:
>>> > Good Afternoon,
>>> >
>>> > I have been trying to figure it out and something seems off.
>>> > The specific test you refer to may be hiding a problem or maybe I hav=
e my
>>> > testbench compromised and I would like your help to test.
>>> > The test `test_no_fstab_update ` verifies if the fstab was updated or=
 not
>>> > because on the wks file used to do it there is a --no-fstab-update. T=
he
>>> > thing is, I think this test is passing because what is forcing it to =
not
>>> > update is a constraint that I removed previously on the patch (the on=
e
>>> that
>>> > checks if the system is ext* or msdos) and not because the flag is
>>> > triggering its intended functionality.
>>> > The crosscheck I did was modifying the fstype from ext4 to squashfs a=
nd
>>> > indeed the test failed.
>>> > Can someone also verify this?
>>> >
>>> > Daniel
>>> >
>>> > Daniel Andrade <dani.barra25@gmail.com> escreveu (s=C3=A1bado, 13/09/=
2025
>>> =C3=A0(s)
>>> > 11:02):
>>> >
>>> >> Hello guys, sorry for the delay.
>>> >> I have been busy, but I hope to provide you with a fix in the next f=
ew
>>> >> days.
>>> >>
>>> >> Sorry about that,
>>> >> Daniel
>>> >>
>>> >> Randy MacLeod <randy.macleod@windriver.com> escreveu (quinta,
>>> 11/09/2025
>>> >> =C3=A0(s) 17:56):
>>> >>
>>> >>> On 2025-09-04 11:58 a.m., Mathieu Dubois-Briand via
>>> >>> lists.openembedded.org wrote:
>>> >>>
>>> >>> On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via
>>> lists.openembedded.org wrote:
>>> >>>
>>> >>> From: Daniel Andrade <dani.barra25@gmail.com> <dani.barra25@gmail.c=
om>
>>> >>>
>>> >>> Using `install` in the rootfs plugin forces fstab to be replaced
>>> entirely, meaning that even its Inodes will change, leading xattrs and
>>> SELinux context stored by pseudo not to be applied.
>>> >>> The fix just uses `cp` without preserving attributes from the
>>> temporary fstab since none of them are needed, just the content.
>>> >>> Same thing happens with the predefined mechanisms for ext4 and msdo=
s.
>>> Using debugfs there is no way to replace contents while maintaining
>>> metadata, so the approach taken on the path was to remove the different
>>> fstab logic for those fstypes and also use the same modified cp command=
.
>>> Reviewing the builds I did it seems to work for all of the fstypes.
>>> >>>
>>> >>> Another problem is that the timestamp applied to fstab is not the s=
ame
>>> as every other file. It seems like the `SOURCE_DATE_EPOCH` variable goe=
s to
>>> the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
>>> >>> Since you are using that variable everywhere, it is not the same va=
lue
>>> as ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf`
>>> that is applied in every other file.
>>> >>>
>>> >>> Daniel Andrade (1):
>>> >>>   wic: Content of the temporary updated fstab should be copied into=
 the
>>> >>>     original not replacing it entirely.
>>> >>>
>>> >>>  meta/conf/bitbake.conf                   |  4 +++-
>>> >>>  scripts/lib/wic/partition.py             | 15 +--------------
>>> >>>  scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
>>> >>>  3 files changed, 6 insertions(+), 17 deletions(-)
>>> >>>
>>> >>> Hi Daniel,
>>> >>>
>>> >>> Thanks for your patch.
>>> >>>
>>> >>> It looks like it is breaking a test:
>>> >>>
>>> >>> 2025-09-04 15:28:11,112 - oe-selftest - INFO -
>>> wic.Wic.test_no_fstab_update (subunit.RemotedTestCase)
>>> >>> 2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
>>> >>> ...
>>> >>> 2025-09-04 15:28:11,114 - oe-selftest - INFO -
>>> testtools.testresult.real._StringException: Traceback (most recent call
>>> last):
>>> >>>   File
>>> "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/se=
lftest/cases/wic.py",
>>> line 859, in test_no_fstab_update
>>> >>>     self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
>>> >>>   File "/usr/lib/python3.12/unittest/case.py", line 885, in assertE=
qual
>>> >>>     assertion_func(first, second, msg=3Dmsg)
>>> >>>   File "/usr/lib/python3.12/unittest/case.py", line 1251, in
>>> assertMultiLineEqual
>>> >>>     self.fail(self._formatMessage(msg, standardMsg))
>>> >>>   File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
>>> >>>     raise self.failureException(msg)
>>> >>> AssertionError: 'af3c087d6c9131735c8d1f270a226892' !=3D
>>> '9edb8255abd217fdb20e118833afb856'
>>> >>> - af3c087d6c9131735c8d1f270a226892
>>> >>> + 9edb8255abd217fdb20e118833afb856
>>> >>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412=
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268
>>> >>>
>>> >>> Can you fix it please?
>>> >>>
>>> >>> Ping?
>>> >>>
>>> >>> I think this is being tracked by:
>>> >>>
>>> >>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947
>>> >>>
>>> >>> "WIC does not preserve metadata when updating fstab"
>>> >>>
>>> >>> Btw, we were just following the "Need Info" process during the bug
>>> review
>>> >>> meeting
>>> >>> so that's why I'm sending this email.
>>> >>>
>>> >>> ../Randy
>>> >>>
>>> >>> Thanks,
>>> >>> Mathieu
>>> >>>
>>> >>>
>>> >>>
>>> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> >>> Links: You receive all messages sent to this group.
>>> >>> View/Reply Online (#222962):
>>> https://lists.openembedded.org/g/openembedded-core/message/222962
>>> >>> Mute This Topic: https://lists.openembedded.org/mt/115043355/361676=
5
>>> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub
>>> [randy.macleod@windriver.com]
>>> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> >>>
>>> >>>
>>> >>>
>>> >>> --
>>> >>> # Randy MacLeod
>>> >>> # Wind River Linux
>>> >>>
>>> >>>
>>>
>>>
>>>
>>>
>>> --
>>> Mathieu Dubois-Briand, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>>
>>>




--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


