Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4Dvv-0001Yh-9e
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:37:31 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 09:18:58 -0700
Received: by obceq6 with SMTP id eq6so1371048obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 09:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=1Q6JOIE0r8VR/6EWsWgcMeYcZxKzheoABi4zw1Po1Bw=;
	b=mXbcvF7QmDbmRgd9J+nW6tVjukDrXUml9wy41dYCQ2lHYj6LHM6/+Muayu9NwOTezb
	DZiQIY+W9JySHXBUuivtQNIBmkttp1rk9KFPfOprTOD9LeZBb4ylzBEyc83fwnYU0Edb
	19t5+1YJQKP86SSV6aNPEu3tfe6IV7+QMzXUnEIuYoTh+QsGCZ/CFnbxtiN85/qViAdX
	AAjuZt9TTcB5O5yvRPwtcW1Y4ExbNAgi/bb0wejPw6AF5PISxWatZqoYh8sn4a8NZaSX
	fYkmelcoIC9rTkj/gIEttAcMfUuALQwtzTDR8G48dTVcbA71tOcdgyuKJeBkRIZJL/Yf
	2qIA==
Received: by 10.182.193.105 with SMTP id hn9mr15913655obc.11.1345652337602;
	Wed, 22 Aug 2012 09:18:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 09:18:35 -0700 (PDT)
In-Reply-To: <CAJTo0LbJaRyPCexNT8nVhY-qvh19UxH9WSf22==GF8kjWuFaAg@mail.gmail.com>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
	<CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
	<CAJTo0LbJaRyPCexNT8nVhY-qvh19UxH9WSf22==GF8kjWuFaAg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 17:18:35 +0100
Message-ID: <CAJTo0LYvK_Nbj-ThQRNGQxh6P1wZqzPmm0pGNYNGnTucQEV1ng@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmI+MwqY0qT3rkiY+p9Cw0M7PI2oTRpjNLA2P+4gCyYSSX9muHKkQh7oBJ6+AXUm47ErVf1
Subject: Re: RFC: One X Server To Rule Them All
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 16:37:31 -0000
Content-Type: text/plain; charset=UTF-8

More numbers!

The interesting delta in the root file system is as follows:

-1617464 ./usr/bin/Xfbdev

Bye kdrive.

-9892 ./usr/lib/libts-1.0.so.0.0.0
+8344 ./usr/lib/libts-1.0.so.0.0.0

Now *this* is weird.

+34948 ./usr/lib/libpciaccess.so.0.11.1
+17088 ./usr/lib/xorg/modules/libfbdevhw.so
+19544 ./usr/lib/xorg/modules/drivers/fbdev_drv.so
+30492 ./usr/lib/xorg/modules/libshadowfb.so
+135580 ./usr/lib/xorg/modules/libfb.so
+24492 ./usr/lib/xorg/modules/libvbe.so
+20804 ./usr/lib/xorg/modules/input/kbd_drv.so
+42980 ./usr/lib/xorg/modules/input/mouse_drv.so
+47936 ./usr/lib/xorg/modules/input/evdev_drv.so
+98908 ./usr/lib/xorg/modules/extensions/libextmod.so
+19532 ./usr/lib/xorg/modules/extensions/libdbe.so
+27144 ./usr/lib/xorg/modules/libvgahw.so
+26984 ./usr/lib/xorg/modules/libshadow.so
+1099 ./usr/share/X11/xorg.conf.d/10-evdev.conf
+17315 ./usr/share/X11/rgb.txt
+13616 ./usr/bin/cvt
+7476 ./usr/bin/showrgb
+1983908 ./usr/bin/Xorg
+526 ./etc/X11/xorg.conf

That's a grand total of 2578716 bytes, or an overall gain of 938kb.

I expect the dbe extension can disappear, and you'll notice that to
cover all bases the keyboard, mouse, *and* evdev input modules are
present - we don't need all three.  The rgb.txt database was pulled in
but that's entirely optional and wasn't pulled in by kdrive.

That concludes any analysis of killing kdrive.  Patch series coming
shortly to action it, followed by the same analysis on
xserver-xorg-lite.

Ross


