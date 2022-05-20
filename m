Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4E1C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:04:32 +0000 (UTC)
Subject: Re: [meta][dunfell][PATCH] libinput: Add fix for CVE-2022-1215
To: openembedded-core@lists.openembedded.org
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (103.238.105.13)
X-Originating-Platform: Linux Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 20 May 2022 05:04:27 -0700
References: 
 <CAOSpxdZ7Nqe8XKFRgrNXp3Sx_LgajemLg3QNyTxf0vSHfcLcrA@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZ7Nqe8XKFRgrNXp3Sx_LgajemLg3QNyTxf0vSHfcLcrA@mail.gmail.com>
Message-ID: <2277.1653048267139448562@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="aS0qeWjhVhUM16CDFR55"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:04:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165926

--aS0qeWjhVhUM16CDFR55
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 10:50 AM, Steve Sakoman wrote:

>=20
> Extra newline above silently inhibits application of the following two
> hunks!

Hi Steve,

Can we raise a bug in the Yocto for this? Because it seems a serious issue =
where the patch is actually not applied and bitbake not giving any warning/=
error for this.
Mostly if sometimes it should fail with the do_compilation only, but someti=
mes if the dependency is not with do_compile it will not fail which happene=
d in this case.

I think we should file a bug for this and some expert in patching tool shou=
ld take a look at that.

Richard, Steve: Suggestions, please.

Thans,
Ranjitsinh Rathod

--aS0qeWjhVhUM16CDFR55
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 10:50 AM, Steve Sakoman wrote:<br />
<blockquote>Extra newline above silently inhibits application of the follow=
ing two hunks!</blockquote>
Hi Steve,<br /><br />Can we raise a bug in the Yocto for this? Because it s=
eems a serious issue where the patch is actually not applied and bitbake no=
t giving any warning/error for this.<br />Mostly if sometimes it should fai=
l with the do_compilation only, but sometimes if the dependency is not with=
 do_compile it will not fail which happened in this case.<br /><br />I thin=
k we should file a bug for this and some expert in patching tool should tak=
e a look at that.<br /><br />Richard, Steve: Suggestions, please.<br /><br =
/>Thans,<br />Ranjitsinh Rathod

--aS0qeWjhVhUM16CDFR55--

