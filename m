Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F50C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 08:16:49 +0000 (UTC)
Subject: Re: [PATCH] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
To: openembedded-core@lists.openembedded.org
From: "Dixit Parmar" <dixitparmar19@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (223.233.82.60)
X-Originating-Platform: Linux Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 01:16:47 -0700
References: <Z8IIVTwVir8JCsxE@gmail.com>
In-Reply-To: <Z8IIVTwVir8JCsxE@gmail.com>
Message-ID: <4168.1742113007457227336@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ddF3X66QfD0d00tz2hUT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212993

--ddF3X66QfD0d00tz2hUT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Can you show the conf files for the same kernel configuration
with and without the kernel_split_modules enabled ? That way
we know there's no change in existing behaviour.
> I have confirmed that in my testing. Can you suggest how I can
share that information here?
We also should make a test for this in the OE selftests. We
are adding conditional code paths, so they should be tested
to ensure no regressions in either in the future.
> Never done that before. May be I can do it given some direction
as separate patch.
I'm curious about the above line. It is unclear to me why we'd
only have this postinst be relevant if none was previously set.
> Reverted.
Is there really a scenario where the directory won't exist ? Isn't
this just running in our own install phase ? So all prerequisites
and directories should be in place.
> Ideally no, we kept it for safer side, I have added log warning.
The walking and sorting seems quite heavy. =C2=A0Isn't this called from do_=
split_packages indirectly ?
Do we really need to walk and gather the information ? Is this mainly for t=
he case of no-split
on the kernel modules ? If that is the case, isn't there a way to short cir=
cuit the processing
on the split-package case ?
> Litterally I could not think of anything else here and not sure of there
are any short-circuit options. I have limited knowledge in this. I am open =
to suggestions
if this is not the best solution at the moment.

--ddF3X66QfD0d00tz2hUT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Can you show the conf files for the same kernel configuration<br />wit=
h and without the kernel_split_modules enabled ? That way<br />we know ther=
e's no change in existing behaviour.<br />&gt; I have confirmed that in my =
testing. Can you suggest how I can<br />share that information here?</div>
<div>We also should make a test for this in the OE selftests. We<br />are a=
dding conditional code paths, so they should be tested<br />to ensure no re=
gressions in either in the future.<br />&gt; Never done that before. May be=
 I can do it given some direction&nbsp;<br />as separate patch.</div>
<div>I'm curious about the above line. It is unclear to me why we'd<br />on=
ly have this postinst be relevant if none was previously set.<br />&gt; Rev=
erted.</div>
<div>Is there really a scenario where the directory won't exist ? Isn't<br =
/>this just running in our own install phase ? So all prerequisites<br />an=
d directories should be in place.<br />&gt; Ideally no, we kept it for safe=
r side, I have added log warning.</div>
<div>The walking and sorting seems quite heavy. &nbsp;Isn't this called fro=
m do_split_packages indirectly ?<br />Do we really need to walk and gather =
the information ? Is this mainly for the case of no-split<br />on the kerne=
l modules ? If that is the case, isn't there a way to short circuit the pro=
cessing<br />on the split-package case ?<br />&gt; Litterally I could not t=
hink of anything else here and not sure of there<br />are any short-circuit=
 options. I have limited knowledge in this. I am open to suggestions<br />i=
f this is not the best solution at the moment.</div>
</div>

--ddF3X66QfD0d00tz2hUT--

