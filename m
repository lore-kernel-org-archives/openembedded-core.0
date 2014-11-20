Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 317F065C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 19:07:18 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id l13so3635523iga.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 11:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=op8z1uJXkoaC52/YznvHUmPDedtfoiek/VUG1FhDiIo=;
	b=dxw1rbSs6TJ3TfWsI7hkiylegk5DhFWtsR8EnGfCcYGuvDNO15fgA3zv43tU3x2g2d
	r0gLPWmm6wwynQ/ovVRW4CrVaVrXYd2u8Do4wBUtdU0vdxk5HlmSOyQ5aCcRMUSzeV0h
	eCyDhu0PdsnCdpL+BkDEN48vbM9QXySYvLxLmjVyajv2Uv8IUqja6pYrDOVcXI4KQccT
	A6fhT28UmFI4J7qSL/XpBbpNs0fqt2DxyNBNt5Ccg12QdRkcv6ofqmlKaa0IFX1+SFim
	NlQQZfqYcoWnC6H3y8bMxZojARp6WpodNGI1cBNxhIGa4g854ccFFtwig6Es3Bt/e7D6
	xpRg==
X-Gm-Message-State: ALoCoQlmj0P+fLBmw2Hrww+uGLjerFSbWRyxDsBrfyQXR5ezZ64XnMgmUujEF5mICIkosq+/26lX
MIME-Version: 1.0
X-Received: by 10.107.132.78 with SMTP id g75mr29081784iod.21.1416510439003;
	Thu, 20 Nov 2014 11:07:19 -0800 (PST)
Received: by 10.107.47.41 with HTTP; Thu, 20 Nov 2014 11:07:18 -0800 (PST)
Date: Thu, 20 Nov 2014 13:07:18 -0600
Message-ID: <CALXw4G5Frso94JC_pQcYBDn90fucSTH1pjioRTAq6e-UdrVzhw@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: /media automounting
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
X-List-Received-Date: Thu, 20 Nov 2014 19:07:20 -0000
Content-Type: multipart/alternative; boundary=001a113fb6b289b5d205084f0962

--001a113fb6b289b5d205084f0962
Content-Type: text/plain; charset=UTF-8

Since the change in mount.sh to using /run/media, /media is nothing but an
empty directory now. Should volatiles (00_core) be modified to create
/run/media and link /media to it? This has worked for me on a read-only
rootfs on a CF card, just not sure if this works for all scenarios.

Also, I noticed that by changing the order creating /var/run/resolv.conf
and linking it to /etc/resolve.conf got rid of an error of trying to remove
and link it on startup. Should I include both of these fixes in one patch?

Thanks,

Michael Gloff

--001a113fb6b289b5d205084f0962
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Since the change in mount.sh to using /run/=
media, /media is nothing but an empty directory now. Should volatiles (00_c=
ore) be modified to create /run/media and link /media to it? This has worke=
d for me on a read-only rootfs on a CF card, just not sure if this works fo=
r all scenarios. <br><br></div>Also, I noticed that by changing the order c=
reating /var/run/resolv.conf and linking it to /etc/resolve.conf got rid of=
 an error of trying to remove and link it on startup. Should I include both=
 of these fixes in one patch?<br><br></div>Thanks,<br><br></div>Michael Glo=
ff<br></div>

--001a113fb6b289b5d205084f0962--
