Received: from smtplq-out14.aruba.it ([62.149.158.34] helo=smtplq01.aruba.it)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <stefano@supergenesis.it>) id 1ScBWT-00042Q-FL
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 10:23:21 +0200
Received: (qmail 11011 invoked by uid 89); 6 Jun 2012 08:12:52 -0000
Received: from unknown (HELO smtp6.aruba.it) (62.149.158.226)
	by smtplq01.aruba.it with SMTP; 6 Jun 2012 08:12:52 -0000
Received: (qmail 3118 invoked by uid 89); 6 Jun 2012 08:12:52 -0000
Received: from unknown (HELO ?192.168.0.20?)
	(stefano@supergenesis.it@151.65.12.244)
	by smtp6.ad.aruba.it with SMTP; 6 Jun 2012 08:12:51 -0000
Message-ID: <4FCF10F9.9070507@supergenesis.it>
Date: Wed, 06 Jun 2012 10:12:41 +0200
From: Stefano <stefano@supergenesis.it>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:13.0) Gecko/20120604 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Spam-Rating: smtp6.ad.aruba.it 1.6.2 0/1000/N
X-Spam-Rating: smtplq01.aruba.it 1.6.2 0/1000/N
Subject: qt embedded enable plugin-gfx-powervr
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
X-List-Received-Date: Wed, 06 Jun 2012 08:23:21 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

This the result of ldd on libqgfxpvregl.so

ldd libqgfxpvregl.so

libpvrQWSWSEGL.so.1 => /usr/lib/libpvrQWSWSEGL.so.1 (0x4011b000)
libQtOpenGLE.so.4 => /usr/lib/libQtOpenGLE.so.4 (0x40126000)
libQtGuiE.so.4 => /usr/lib/libQtGuiE.so.4 (0x401ac000)
libEGL.so => /usr/lib/libEGL.so (0x40ac6000)
libQtCoreE.so.4 => /usr/lib/libQtCoreE.so.4 (0x40ad0000)
libpthread.so.0 => /lib/libpthread.so.0 (0x400a3000)
libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x40ddc000)
libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x400cc000)
libc.so.6 => /lib/libc.so.6 (0x40e9f000)
libpvr2d.so => /usr/lib/libpvr2d.so (0x400e9000)
libGLESv2.so => /usr/lib/libGLESv2.so (0x40fca000)
libm.so.6 => /lib/libm.so.6 (0x4101c000)
libQtNetworkE.so.4 => /usr/lib/libQtNetworkE.so.4 (0x4108d000)
libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0x411c2000)
libpng12.so.0 => /usr/lib/libpng12.so.0 (0x412a8000)
libz.so.1 => /usr/lib/libz.so.1 (0x40075000)
libfreetype.so.6 => /usr/lib/libfreetype.so.6 (0x412ce000)
libIMGegl.so => /usr/lib/libIMGegl.so (0x400f6000)
libdl.so.2 => /lib/libdl.so.2 (0x4010d000)
libgthread-2.0.so.0 => /usr/lib/libgthread-2.0.so.0 (0x41347000)
librt.so.1 => /lib/librt.so.1 (0x41353000)
/lib/ld-linux.so.3 (0x4004f000)
libsrv_um.so => /usr/lib/libsrv_um.so (0x41362000)

Look like correct...







