Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283D3CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 17:48:55 +0000 (UTC)
Subject: Re: [PATCH v6] kernel-fit-image: allow extending compatible string property for DTBs
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.51)
X-Originating-Platform: Windows Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 Oct 2025 10:48:49 -0700
References: <DDHSUHMG4NPM.1V6O1K0B4783Z@bootlin.com>
In-Reply-To: <DDHSUHMG4NPM.1V6O1K0B4783Z@bootlin.com>
Message-ID: <8400.1760550529402171011@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 17:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224903

On Tue, Oct 14, 2025 at 11:05 AM, Mathieu Dubois-Briand wrote:

>
> Hi Kavinaya,
>=20
> We suspect this series is responsible for a break on Richard master-next
> branch. This seems either a bit intermittent or a bad interaction with
> something else, as I don't have a similar issue here. Still, dropping
> the patch fixes the issue, so there is probably something bad in there.
>=20
> ERROR: linux-yocto-6.16.9+git-r0 do_compile: Execution of
> '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-1431372/tm=
p/work/qemux86_64-poky-linux/linux-yocto/6.16.9+git/temp/run.do_compile.555=
534'
> failed with exit code 1
> ...
> | make[1]: *** No rule to make target 'am335x-bonegreen.dtb'. Stop.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2530
>=20
> Can you have a look at this error please?
>

Hi Mathieu,

I will post the updated test case that addresses the issue in patch v8.

Thanks,
Kavinaya

