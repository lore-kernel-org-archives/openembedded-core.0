Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QtHIw-0003Ew-0D
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 12:55:30 +0200
Received: by qwh5 with SMTP id 5so3083561qwh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=AuYI6a+XdZga4UlcQ0A/MjxcI1xLlPxHvpMJuc4LSnQ=;
	b=ddef+hwLVsIZT2xNAHgmNt2j2VxqLKTyMeR8ZsnCy09gMja5QjdOU8FGl/MJVktKgi
	okyW3Nf9NyxI+AILozEXhjmjKE6j5dMQDBeJg/2Jmz+JDJCLAj+kqYBRWGqXvlAujc9O
	wbHNBJZ7+/N5MlGxeWB5XT5egaxZv8Sz2IgEo=
MIME-Version: 1.0
Received: by 10.229.62.103 with SMTP id w39mr3352983qch.59.1313491851167; Tue,
	16 Aug 2011 03:50:51 -0700 (PDT)
Received: by 10.229.186.7 with HTTP; Tue, 16 Aug 2011 03:50:51 -0700 (PDT)
Date: Tue, 16 Aug 2011 12:50:51 +0200
Message-ID: <CAGiJk9euxaWGh_=hpspcLH0DtDSAejHZvj_HKLfKrcuvBHn6xQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Error building any X11 image: "Nothing PROVIDES 'libxcb-native'"
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
X-List-Received-Date: Tue, 16 Aug 2011 10:55:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
recently all X11 images fail to build for me.

The following error shows up (this is from core-image-sato):
-
ERROR: Nothing PROVIDES 'libxcb-native' (but
virtual:native:/var/oe-core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
DEPENDS on or otherwise requires it)
...
Missing or unbuildable dependency chain was: ['core-image-sato',
'task-core-apps-console', 'xf86-video-fbdev', 'xserver-xorg',
'font-util-native', 'mkfontdir-native', 'virtual/libx11-native',
'libxcb-native']
-
Looks like the DEPENDS are "wrong" and it should refer to libxcb
(/var/oe-core/setup-scripts/sources/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.7.bb)
instead of libxcb-native (which is not known by bitbake), but i can't
find the commit which changed this DEPENDS.

After all I can't find any file that has this DEPENDS, "grep -r
libxcb-native *" in my source direcory showed up nothing.


Suggestions are welcome.



Regards
Samuel


