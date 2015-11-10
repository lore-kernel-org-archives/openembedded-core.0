Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2E30876294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:22:36 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so10365832wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=eFNVUxtfxIGyRTPK34hVQRTSWegFbSFMSxOW3dLAT3o=;
	b=B+SF7nQrZS2wiHOsMj5+kJcznXyD8+pwb7q7nzvjLZORTFqh6/Jwy/07/qiqHq8jeO
	Qz8V7yj129WnNbjOcfpNTmMJwGPuwrkAK/Uj7yd263ZVPWLoxsv0qW3Nakm4thCu75NO
	Lnsajy20Zax7t4b1d0oiQvO0U7PY/Z6YBzeYJvTyulM9MefAAHwHNHRyx5hAo8vbcHFf
	XM885glnR6seqnRwXtiO3jew+nZB9n38mOn6MsikQ1UNx0Qi6DEyXP2VWqiUxzbltmUv
	JBUzg033snNMpRrWziajRUchoRiVPAdn4LWTVXKFdNpOzDE+z9y0DC+B21cdNAiNthCv
	QbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-type;
	bh=eFNVUxtfxIGyRTPK34hVQRTSWegFbSFMSxOW3dLAT3o=;
	b=PkNltv0Vr8aJx2j9IKiSaU774A0BS6h5MMNxJTsH/EhuudlsT7FUoMtx8AfhHxOSIc
	k4e+oqmjyNCaa2lWqvM+Td/+hTBpZ6mDqdzRB6MH7O0SyPYV3WW3DduYrN/QntKFg5NX
	d/bDdCYEbJ0eSKsyT57sr/TBdsy1sjIGt1v3lLcDGYOpWNT9g/tOBkO+oSUwa3z1LJDo
	7Kmky9EmJWirt88F4pA8yJIvzk5DVhyX6VE2kwGho7voZ5CINMo4skCr4AKcBfM2XvG4
	5TldzeQSXt8ZQvvtJ2Gp4i5aH4m/e002l7PCaKjTFJednUCwkKDZn4kLmGS6aPNUaBe3
	2qEA==
X-Gm-Message-State: ALoCoQlyVzJ5tIj4gYkuq6/foKV/zMjZuU7j3quc2OVb0blVFbTJHXq6jlDkWJhI5JrucfIDX4ai
X-Received: by 10.28.174.144 with SMTP id x138mr33825248wme.28.1447165356506; 
	Tue, 10 Nov 2015 06:22:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.216.207 with HTTP; Tue, 10 Nov 2015 06:22:07 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 10 Nov 2015 16:22:07 +0200
Message-ID: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 14:22:37 -0000
Content-Type: multipart/alternative; boundary=001a1143b40c0192c8052430711d

--001a1143b40c0192c8052430711d
Content-Type: text/plain; charset=UTF-8

Hi all,

There's currently no software built with vala in oe-core. That's not great
for vala (as it's not getting the automated testing that high quality
maintenance would require) and it's not great for oe-core (as maintenance
effort is better spent on components that _are_ used).

Based on the above there's a feature request** to remove vala from oe-core.
Please comment here or on the bug if you think this is an inappropriate
idea or have suggestions.

If the plan goes through I intend to send a patch to add vala to another
layer to minimize disruption: I guess that would be
meta-openembedded/meta-oe as vala seems to have one user in this layer and
another one on that layer ... Suggestions welcome on that as well.

Alex, note that this might affect your GI patch set (or the other way
round).


Regards,
  Jussi

**) https://bugzilla.yoctoproject.org/show_bug.cgi?id=8640

--001a1143b40c0192c8052430711d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>There&#39;s currently no softwa=
re built with vala in oe-core. That&#39;s not great for vala (as it&#39;s n=
ot getting the automated testing that high quality maintenance would requir=
e) and it&#39;s not great for oe-core (as maintenance effort is better spen=
t on components that _are_ used).</div><div><br></div><div>Based on the abo=
ve there&#39;s a feature request** to remove vala from oe-core. Please comm=
ent here or on the bug if you think this is an inappropriate idea or have s=
uggestions.</div><div><br></div><div>If the plan goes through I intend to s=
end a patch to add vala to another layer to minimize disruption: I guess th=
at would be meta-openembedded/meta-oe as vala seems to have one user in thi=
s layer and another one on that layer ... Suggestions welcome on that as we=
ll.=C2=A0</div><div><br></div><div>Alex, note that this might affect your G=
I patch set (or the other way round).</div><div><br></div><div><br></div><d=
iv>Regards,</div><div>=C2=A0 Jussi</div><div><br></div><div>**) <a href=3D"=
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8640">https://bugzilla.=
yoctoproject.org/show_bug.cgi?id=3D8640</a><br></div><div><br></div></div>

--001a1143b40c0192c8052430711d--
