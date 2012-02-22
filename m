Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0FMa-0007fH-QH
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:48:20 +0100
Received: by wibhq7 with SMTP id hq7so170708wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 08:40:00 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.81.66 as permitted sender)
	client-ip=10.180.81.66; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.81.66 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.81.66])
	by 10.180.81.66 with SMTP id y2mr36791609wix.20.1329928800745 (num_hops
	= 1); Wed, 22 Feb 2012 08:40:00 -0800 (PST)
Received: by 10.180.81.66 with SMTP id y2mr30457205wix.20.1329928800683;
	Wed, 22 Feb 2012 08:40:00 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y1sm73320575wiw.6.2012.02.22.08.39.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 08:39:59 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Feb 2012 17:40:03 +0100
Message-Id: <11CBD2DA-EE9C-4062-AA95-7B1FAE68E82D@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlZcLLGnfA1Xo8hBPl4dWOFnVZLBbO0l7Dlj2BgSakS9thfoOkj3TbUTA/AQBJGkkQf+/K+
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: libsdl patch failure
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
X-List-Received-Date: Wed, 22 Feb 2012 16:48:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Is anyone else seeing this:

OTE: package libsdl-1.2.14-r5: task do_unpack: Started
NOTE: package libsdl-1.2.14-r5: task do_unpack: Succeeded
NOTE: Running task 1611 of 1622 (ID: 1, =
/OE/tentacle/sources/openembedded-core/meta/recipes-graphics/libsdl/libsdl=
_1.2.14.bb, do_patch)
NOTE: package libsdl-1.2.14-r5: task do_patch: Started
ERROR: Command Error: exit status: 1  Output:
Applying patch add.XGetRequest.symbol.patch
missing header for unified diff at line 11 of patch
can't find file to patch at input line 11
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|_XGetRequest API was backported to libx11-1.4.4 in:
=
|http://git.openembedded.org/openembedded-core/commit/?id=3De08604800fe1cb=
8f240f53c147ceb4ee08a29b91
|
|This breaks e.g. libsdl-image build with:
|| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libSDL.so: =
undefined reference to `_XGetRequest'
|
|For details see: https://bugzilla.redhat.com/show_bug.cgi?id=3D782251
|
|Upstream-Status: Accepted
|
--------------------------
No file to patch.  Skipping patch.
patch: **** missing line number at line 11: @@ -, +, @@

Patch add.XGetRequest.symbol.patch does not apply (enforce with -f)


regards,

Keon=


