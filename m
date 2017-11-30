Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id A8FC377E88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 15:31:07 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id g191so2824589ywe.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 07:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Bau9p6udXmz9DBdehaeoXQ8OLc8Kq/RvwWZBaIhLjx8=;
	b=t6z2is2GaBu1PH2RHR5jBQ5PBOag8pDhYG1Di2KPe4+OuRTsIWjjJjHpjSsBMNRGJ5
	0vVZow013vkBN+VCBZavSeAgU5VfARIyR65XRgse0dv6K4EX1EYjMFaTKbATboXvo0B4
	+yMzimSRAER41Kl3DfS9sIDyUChVuHyJGP+vO3NI5MfdhkN4qXVqarRKFYIWQzPwCAt1
	fRGl+Wko9pPXSv8V3RageVDHftx3LTFrnGh3yI0857kbqj7JKrF/s+zltwEyNKbZtgbJ
	5lWTEugppNsCf1W2jIn5PAdg6mnVBnBh3ZrTdZpqFEakwGuKweOmSXcX4VOiaf0ski6a
	1t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Bau9p6udXmz9DBdehaeoXQ8OLc8Kq/RvwWZBaIhLjx8=;
	b=GT+usgO/RMHNjQFY3IPKcLxjP232rC/m/UQT47hrLwN26f8fstEw42wALaluHbkzCr
	IdDg8/RajHPYaZPMIfyKNZLdNLHYPjmeKeTG9EhHVTclgIrUd7/o83AhhIcoCZJI12mN
	8LTzIvYotA8FrZ3IGsfvt4GOG/A0PbR+C4AD0Hq3cogi3bfe9qniFuhe5SoN0JeUdUTp
	x+AlZCI9ekt8WxAtUTnHIiG/b8Z9dO5KAJEAZ7pi2D99+rsH3mbrzSlBVs0i6gYPBhxB
	et86gmyAaV7QRun6wxGvnTg05db9CA43L6knC2ilO3bJAh+QqzTvr7+XCG0H6w3irm3p
	Zc3Q==
X-Gm-Message-State: AJaThX7JmAec0vaqFzN3BT6hcgsLNxvW8wI5duMscc2+OcwtveGYWU/k
	l/xytR82WKowOZoVqNC8k6FuxRGvO7ZiLyCZ0M8=
X-Google-Smtp-Source: AGs4zMZa2yB7LVEETxSRplkMsVW7OOtb7VSy4begLgU9a576W+E8RIzVR4iUQkMdCPilRgzX0r4KioX5zA7ARazy6KU=
X-Received: by 10.129.228.3 with SMTP id r3mr1239528ywl.479.1512055868444;
	Thu, 30 Nov 2017 07:31:08 -0800 (PST)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Thu, 30 Nov 2017 15:30:57 +0000
Message-ID: <CAFeBWL4nTUMB2DDDXc=_hpZ6Aabaygi=_hekGY7ixE7vy1Y+7Q@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: libopkg header files (opkg.h) no longer installed..?
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
X-List-Received-Date: Thu, 30 Nov 2017 15:31:07 -0000
Content-Type: multipart/alternative; boundary="089e0821e854eb57f8055f34f094"

--089e0821e854eb57f8055f34f094
Content-Type: text/plain; charset="UTF-8"

It doesn't look like inclusion of libopkg or libopkg-dev do not put headers
(such as opkg.h) in the target.
Can someone guide me on what I might be doing wrong?

Thank you,

Adam

--089e0821e854eb57f8055f34f094
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It doesn&#39;t look like inclusion of libopkg or libopkg-d=
ev do not put headers (such as opkg.h) in the target.<div>Can someone guide=
 me on what I might be doing wrong?</div><div><br></div><div>Thank you,</di=
v><div><br></div><div>Adam</div></div>

--089e0821e854eb57f8055f34f094--
