Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id E6BC760559
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 May 2014 20:04:21 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id mc6so230287lab.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=PZbNcid023zYrswADnAGTkgM3hUsV11OC/5DgqmKkfU=;
	b=RDyztDYVDkkdfpGb/bQs3YF4xh/qrlR9LapxA0hfsjeHf4f4wj8720sZG67n2gs2F+
	mYNnuwpeAS8uBbND0Iog6CxmfWmm0+K0OmoyVm5usfalMrC0G+O9kldpl5RYLM6ZPGrW
	t6qXXokwPtaNDQVWCbcxlKKOVYe8A2Hba7f2pKN4nRfi2IrSMOQ9P5x7ekKAVOgSTBav
	LkuDiwNKHVPnCK3hXaJBUUkL/+27l2Ia+WdhZBTynmb5kOX21nIe2sjCc/mDkdayu9AH
	6n2rsUpkBKW3yJw/7PigOd6j54EBm5pTXgjednnH0554s2zGorDpd95tobi8FUWFzrUk
	XSUw==
MIME-Version: 1.0
X-Received: by 10.152.36.161 with SMTP id r1mr8919312laj.29.1399233861915;
	Sun, 04 May 2014 13:04:21 -0700 (PDT)
Received: by 10.112.36.164 with HTTP; Sun, 4 May 2014 13:04:21 -0700 (PDT)
Date: Sun, 4 May 2014 22:04:21 +0200
Message-ID: <CAPbeDCkQ5+fKDLwmwsRK6y8WcJwoctTrGw1_FbF9JAr3o3bWTA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: rm_work not cleaning up when doing "-c populate_sdk"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 May 2014 20:04:23 -0000
Content-Type: multipart/alternative; boundary=089e0158b5e44c192504f89885f5

--089e0158b5e44c192504f89885f5
Content-Type: text/plain; charset=UTF-8

Hello,

I'm using the rm_work class in my setup, and I noticed that the work
directories for all my nativesdk-* packages we're not being cleaned up.

I do "bitbake -c populate_sdk my-image" to create the SDK.

From what I can tell by looking at rm_work.class, the rm_work task is
appended at the end, but for some reason rm_work is not executed.

If I do "bitbake nativesdk-<somepackage>", rm_work is indeed executed.

Would it be possible to hook in rm_work in the populate_sdk case as well ?
Or is there another way of executing rm_work for all packages ?

-- Jacob

--089e0158b5e44c192504f89885f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hello,<br><br></div>I&#39;m using=
 the rm_work class in my setup, and I noticed that the work directories for=
 all my nativesdk-* packages we&#39;re not being cleaned up.<br><br></div>
I do &quot;bitbake -c populate_sdk my-image&quot; to create the SDK.<br><br=
></div>From what I can tell by looking at rm_work.class, the rm_work task i=
s appended at the end, but for some reason rm_work is not executed.<br>
<br></div><div>If I do &quot;bitbake nativesdk-&lt;somepackage&gt;&quot;, r=
m_work is indeed executed.<br><br></div>Would it be possible to hook in rm_=
work in the populate_sdk case as well ?<br></div><div>Or is there another w=
ay of executing rm_work for all packages ?<br>
</div><div><br>-- Jacob</div></div>

--089e0158b5e44c192504f89885f5--
