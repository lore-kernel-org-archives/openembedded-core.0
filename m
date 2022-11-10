Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F08C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 04:51:08 +0000 (UTC)
Subject: Re: [PATCH] mesa: fix runpath with native llvm-config in target sysroot
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 09 Nov 2022 20:50:59 -0800
References: <CAE=T-s6xPvw_o_-_cODzb8BL2Xx3Dwi3T41_R4+xSqmJtG8rjA@mail.gmail.com>
In-Reply-To: <CAE=T-s6xPvw_o_-_cODzb8BL2Xx3Dwi3T41_R4+xSqmJtG8rjA@mail.gmail.com>
Message-ID: <12956.1668055859144615835@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8NCCtLHNgZ06CQMdhqhG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 04:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173068

--8NCCtLHNgZ06CQMdhqhG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Haven't tested, but seems as above might fix the other gallium-llvm mesa is=
sue I ran into when build for an x86_64 MACHINE.

# meson configure fails when the llvm-config --shared-mode command fails to=
 find libs in ${STAGING_LIBDIR}
# Temp solution copy files from recipe-sysroot/usr/lib64 to recipe-sysroot/=
usr/lib where llvm-config
# command can find libraries.
do_configure:prepend() {
install -d "${STAGING_LIBDIR}/../lib"
cp -ra ${STAGING_LIBDIR}/* ${STAGING_LIBDIR}/../lib
}

--8NCCtLHNgZ06CQMdhqhG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Haven't tested, but seems as above might fix the other gallium-llvm mesa is=
sue I ran into when build for an x86_64 MACHINE.<br /><br /># meson configu=
re fails when the llvm-config --shared-mode command fails to find libs in $=
{STAGING_LIBDIR}<br /># Temp solution copy files from recipe-sysroot/usr/li=
b64 to recipe-sysroot/usr/lib where llvm-config<br /># command can find lib=
raries.<br />do_configure:prepend() {<br />&nbsp; install -d "${STAGING_LIB=
DIR}/../lib"<br />&nbsp; cp -ra ${STAGING_LIBDIR}/* ${STAGING_LIBDIR}/../li=
b<br />}

--8NCCtLHNgZ06CQMdhqhG--

