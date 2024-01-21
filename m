Return-Path: <ashish.emailaddress@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7C9C47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 16:43:24 +0000 (UTC)
Subject: Inputs to share CVE patch for binutils CVE-2023-25584
To: openembedded-core@lists.openembedded.org
From: "Ashishx88" <ashish.emailaddress@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.207.207.66)
X-Originating-Platform: Linux Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 21 Jan 2024 08:43:16 -0800
Message-ID: <cSDk.1705855396440281429.AFnV@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mh909lG90h9Cok8v7wIs"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 16:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194093

--mh909lG90h9Cok8v7wIs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Members ,

I am trying to submit an CVE patch=C2=A0 CVE-2023-25584 for binutils
*This is my first patch in community so apologies if any basic info is miss=
ed*

Can members please help me for

1) Do i need to share only specific CVE patch with community
or
Patch with updates meta/recipes-devtools/binutils/binutils-2.39.inc &=C2=A0=
 CVE=C2=A0 both files being updated in same patch
(Currently this is what i have created )

2) Is there any known place where i can share that i am looking at this CVE=
 so we save effort duplication

3) Can i share the patch as attachment here or i need to send via " git sen=
d-email " only.
Currently i am facing some issue with git send-email at my end

4) I have validated the patch for (langdale) :
# devtool build binutils
# devtool build-image core-image-minimal
# bitbake binutils (after=C2=A0 cleanall )
# bitbake core-image-minimal
Is there any other test i need to do to ensure the sanity ?

Thanks ,
Ashish.

--mh909lG90h9Cok8v7wIs
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Members ,<br /><br />I am trying to submit an CVE patch&nbsp; CVE-2023-2=
5584 for binutils<br /><strong>This is my first patch in community so apolo=
gies if any basic info is missed</strong><br /><br />Can members please hel=
p me for&nbsp;<br /><br />1) Do i need to share only specific CVE patch wit=
h community <br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; or&nbsp;<br />&nbsp; &=
nbsp; &nbsp;Patch with updates meta/recipes-devtools/binutils/binutils-2.39=
.inc &amp;&nbsp; CVE&nbsp; both files being updated in same patch&nbsp;<br =
/>&nbsp; &nbsp; &nbsp;(Currently this is what i have created )&nbsp;<br /><=
br />2) Is there any known place where i can share that i am looking at thi=
s CVE so we save effort duplication&nbsp;<br />&nbsp; &nbsp;&nbsp;<br />3) =
Can i share the patch as attachment here or i need to send via "<span style=
=3D"background-color: #f5f5f5; color: #000000; font-family: Menlo, Monaco, =
Consolas, 'Courier New', monospace; font-size: 13px;">git send-email</span>=
" only.&nbsp;<br />&nbsp; &nbsp; Currently i am facing some issue with&nbsp=
;<span style=3D"background-color: #f5f5f5; color: #000000; font-family: Men=
lo, Monaco, Consolas, 'Courier New', monospace; font-size: 13px;">git send-=
email&nbsp;</span>&nbsp;at my end&nbsp;<br /><br />4) I have validated the =
patch for (langdale) :<br />&nbsp; &nbsp; # devtool build binutils&nbsp;<br=
 />&nbsp; &nbsp; # devtool build-image core-image-minimal&nbsp;<br />&nbsp;=
 &nbsp; # bitbake binutils (after&nbsp; cleanall )<br />&nbsp; &nbsp; # bit=
bake core-image-minimal&nbsp;<br />&nbsp; &nbsp; Is there any other test i =
need to do to ensure the sanity ?&nbsp;<br />&nbsp; &nbsp;&nbsp;<br />Thank=
s ,<br />Ashish.<br /><br />&nbsp;<br /><br /><br />

--mh909lG90h9Cok8v7wIs--

