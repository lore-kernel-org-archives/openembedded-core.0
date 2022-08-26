Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA79ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 14:22:56 +0000 (UTC)
Subject: Re: [master][PATCH] image_types: add 7-Zip support in conversion
 types and commands
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?utf-8?q?Fegyvernek=2C_J=C3=A1sz-Nagykun-Szolnok=2C?=
 =?utf-8?q?_HU_=28178=2E48=2E208=2E198=29?=
X-Originating-Platform: Windows Chrome 104
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 26 Aug 2022 07:22:47 -0700
References: <20220826120220.18071b38@booty>
In-Reply-To: <20220826120220.18071b38@booty>
Message-ID: <24076.1661523767736620054@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8JirIFZLImAMfGxVUEqH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 14:22:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169918

--8JirIFZLImAMfGxVUEqH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I can not use 'git send-email' because my workstation is not configured to =
be able to send any mail. You can use my patch, the content is available un=
der '--' what is need to for it, or I can copy and paste it and re-send to =
this thread. But in 2022, I really recommend to you to improve your contrib=
uting processes more. It could be much better in a modern pull-request tick=
et in GitHub, GitLab or Bitbucket portal then this historical mode. That ki=
nd of process is too legacy, and it can not help in developing speed and to=
 get more-more users/contributors who want to help in daily developing.

My goal was replacing wic.zip conversion, because it is extremely slowly fo=
r an image which is several GB sizes. Problem is that normal zip can operat=
e only in single-thread mode, but 7-zip can do it in multi-thread mode in m=
uch faster if I use BZip2 method for a zip archive. I liked to provide .zip=
 extension because BZip2 support it, and it is fine for multiplatform usage=
, in 100% you can unzip it in Windows, Linux and OSX too. So, my new wic.7z=
ip can operate in 100% CPU load in each 8 cores of my CPU, therefore this i=
s the best for making a .zip file for wic image. But if someone wants to us=
e any other mode, they can do with variables overriding.

--8JirIFZLImAMfGxVUEqH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I can not use 'git send-email' because my workstation is not configure=
d to be able to send any mail. You can use my patch, the content is availab=
le under '--' what is need to for it, or I can copy and paste it and re-sen=
d to this thread. But in 2022, I really recommend to you to improve your co=
ntributing processes more. It could be much better in a modern pull-request=
 ticket in GitHub, GitLab or Bitbucket portal then this historical mode. Th=
at kind of process is too legacy, and it can not help in developing speed a=
nd to get more-more users/contributors who want to help in daily developing=
.</div>
<div>&nbsp;</div>
<div>My goal was replacing wic.zip conversion, because it is extremely slow=
ly for an image which is several GB sizes. Problem is that normal zip can o=
perate only in single-thread mode, but 7-zip can do it in multi-thread mode=
 in much faster if I use BZip2 method for a zip archive. I liked to provide=
 .zip extension because BZip2 support it, and it is fine for multiplatform =
usage, in 100% you can unzip it in Windows, Linux and OSX too. So, my new w=
ic.7zip can operate in 100% CPU load in each 8 cores of my CPU, therefore t=
his is the best for making a .zip file for wic image. But if someone wants =
to use any other mode, they can do with variables overriding.</div>

--8JirIFZLImAMfGxVUEqH--

