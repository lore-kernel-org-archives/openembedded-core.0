Return-Path: <sakoman@gmail.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id A26526D2F5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 15:33:26 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id p14so1486735vbm.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 07:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=lIWr91JObu4dVzwZ0iVZ6WLLmKIVHUlUmA7SEnNWKSQ=;
	b=WcIFO0YDEa2+7jkvU281ICexv9oVqDJG/zDKcYxAG+GiJZTbu1Tdl0jNTUm91s9irr
	q1oSqmPFKH2KUA29BXP9BDGijixAD04llQM+gwgBJl6qJgACXp9V5w/gnjXETGmVeywx
	EPAhcUx4ENXfNaQ5G8XNcz8upxMGEfLrNhw76OPG6ebYLNMFfVnjkH5yW50FDGcrUWY2
	8mvNEAmz5khd62dlgOwnMUwYTNBRgQ4z/SaAzCaHkydE4NHRmzo3+/eOkbPBMT2O717S
	9g+s2UzIcnwBKQrbRyaIkNhBqbPFROakpMdtK4BpA/rF3llKCJa4d/+N5coFfQxanZgm
	qNzA==
MIME-Version: 1.0
X-Received: by 10.58.255.71 with SMTP id ao7mr12474239ved.16.1383924807942;
	Fri, 08 Nov 2013 07:33:27 -0800 (PST)
Received: by 10.58.107.198 with HTTP; Fri, 8 Nov 2013 07:33:27 -0800 (PST)
Date: Fri, 8 Nov 2013 07:33:27 -0800
Message-ID: <CAGDS+nkupBrwgBBTbZzSnnB9pjaf2P6gMuQHn6QAZjfkFqi7ww@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] wpa-supplicant - enable CONFIG_CTRL_IFACE_DBUS_NEW in config
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
X-List-Received-Date: Fri, 08 Nov 2013 15:33:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've begun using Yocto 1.5 (dora) for several client projects over the
past few weeks.

I noticed that images that included connman and wpa-supplicant always
failed to enable the wifi technology properly.  The visible error
indication in the log:

src/technology.c:technology_get() No matching drivers found for wifi

After many hours of debugging I finally figured out that this was due
to a missing option in wpa-supplicant (CONFIG_CTRL_IFACE_DBUS_NEW)

Adding a bbappend for wpa-supplicant with this option enabled fixed
the issue and connman now handles wifi interfaces as expected.

Was there a particular reason CONFIG_CTRL_IFACE_DBUS_NEW wasn't enabled?

Steve

