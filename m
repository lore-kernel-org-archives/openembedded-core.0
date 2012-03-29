Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SDI4k-0004Cj-DK
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 18:19:50 +0200
Received: by iaag37 with SMTP id g37so3225536iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=03/0LfyFE6xS9CIWx+k5pvBm41yrmgr9/jHw7/8cL7k=;
	b=UYsVxIU+sQdV1yOhqiWUK/usvRG4xwmGSjAtSdwJOXQ6w7CEcle78kittGzYl9nqP5
	f6RD7vLBcq3Gbwl1B/vMzrCn+3omVRELwfS1mJUrkprpC5qpy8xHAjSY0lP+30gKJtgM
	kdn1R9NaGklvg6+kCgdAax1Puxdlsa8QgmtGr/Ps6BBbGG+Zpe41xbxluAtvEqEwhNw2
	1M0Y6wiap7AHpsadBYjWKhr7eqW9Gvw8gufEjJ+qplEMAmhblH/BmRKVeWWRTONpyDWy
	DEXELW1wo6yZ4SR16qVfX2U+zIqFBd3ydRDH95J7trNPCaDwa73HYohq+3+gCfMrTx10
	yFXA==
MIME-Version: 1.0
Received: by 10.50.156.135 with SMTP id we7mr2149132igb.0.1333037446257; Thu,
	29 Mar 2012 09:10:46 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Thu, 29 Mar 2012 09:10:46 -0700 (PDT)
Date: Thu, 29 Mar 2012 18:10:46 +0200
Message-ID: <CALbNGRTX6A08bv_sc8VKs9Kv7k8UT1fgMOz_yhhVTMK7DKBsjQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: DEPENDS not extended to -native for BBCLASSEXTENDS when added by PACKAGECONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 16:19:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

on my colleagues's build machine ( Ubuntu 11.04 / Angstrom based /
target overo / pullled all layers yesterday ) image building fails for
gtk+native with

| configure: error: *** libX11 not found. Check 'config.log' for more details.

and in config.log

| /usr/bin/ld: cannot find -lXrender

After manually building libxrender-native build continues without issues.

Seems this issue is same as mentioned in [1] without result.

Martin: how did you fix that on your environment?

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/018293.html


