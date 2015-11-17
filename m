Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 14EC073D46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 08:46:44 +0000 (UTC)
Received: by ioir85 with SMTP id r85so11759135ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 00:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=9bqpw7nYAFiwgJJ0rqOiocF9jT9elavlEoHa2Nl8jjg=;
	b=R0KkdCo/tMpNCKtptfEDy/ywThQ/Jb5olTfiDbJV5ixgtjF50+qKjw9IOp/KJF6yOh
	fCTpIqOuvP0F7/x4/qzOJB3gAg8NusyCLNZDhOsAAFlMza+Y7fUPNsDxK6aHKbdB1PeL
	mG6U9vEngD+41pLwEX7sLy+CD0ECAnQvwbalBSZWZUYfEUhmI2zJVdroE52MPeVr5I72
	dSmbYQsbQxT9LK9RdS/MPfORduRdaHKKdN1Uv9oPQttQ70TlSfR4MwVBAhFyqOTOOuY8
	ijRsLvQAhnyRjo7p3WcsRixR+SJJ31/Z8he61Cd7iM1jM+ai6Rr+rrs0Q5thQ890+hK/
	4Gaw==
MIME-Version: 1.0
X-Received: by 10.107.135.30 with SMTP id j30mr33846295iod.148.1447750004723; 
	Tue, 17 Nov 2015 00:46:44 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Tue, 17 Nov 2015 00:46:44 -0800 (PST)
Date: Tue, 17 Nov 2015 09:46:44 +0100
Message-ID: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Lots of [host-user-contaminated] warning
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
X-List-Received-Date: Tue, 17 Nov 2015 08:46:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

this bugs me for a while and I wonder if I am again the only one
facing this: I get floods of warnings for sourcecode files as

WARNING: QA Issue: qtserialport:
/qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.0-alpha1+gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h
is owned by uid 1000, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
WARNING: QA Issue: qtx11extras:
/qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-alpha1+gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp
is owned by uid 1000, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
WARNING: QA Issue: qtxmlpatterns:
/qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.6.0-alpha1+gitAUTOINC+94136d4280-r0/git/src/xmlpatterns/type/qbuiltintypes.cpp
is owned by uid 1000, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]

I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally - few recipes
set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.

Help appreciated

Andreas

