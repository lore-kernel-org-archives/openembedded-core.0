Received: from smtplq-out14.aruba.it ([62.149.158.34] helo=smtplq02.aruba.it)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <stefano@supergenesis.it>) id 1SbrNd-0004aG-UU
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 12:52:54 +0200
Received: (qmail 23044 invoked by uid 89); 5 Jun 2012 10:41:52 -0000
Received: from unknown (HELO smtp8.aruba.it) (62.149.158.228)
	by smtplq02.aruba.it with SMTP; 5 Jun 2012 10:41:52 -0000
Received: (qmail 8079 invoked by uid 89); 5 Jun 2012 10:41:49 -0000
Received: from unknown (HELO ?192.168.0.20?)
	(stefano@supergenesis.it@151.65.12.244)
	by smtp8.ad.aruba.it with SMTP; 5 Jun 2012 10:41:49 -0000
Message-ID: <4FCDE263.4050709@supergenesis.it>
Date: Tue, 05 Jun 2012 12:41:39 +0200
From: Stefano <stefano@supergenesis.it>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FBF9C60.5030000@supergenesis.it>
	<20120525151124.GA31846@mail.familie-heinold.de>
	<4FBFA389.3040201@supergenesis.it>
In-Reply-To: <4FBFA389.3040201@supergenesis.it>
X-Spam-Rating: smtp8.ad.aruba.it 1.6.2 0/1000/N
X-Spam-Rating: smtplq02.aruba.it 1.6.2 0/1000/N
Subject: Re: qt embedded enable plugin-gfx-powervr
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
X-List-Received-Date: Tue, 05 Jun 2012 10:52:54 -0000
Content-Type: multipart/alternative;
	boundary="------------070506020002030505010502"

--------------070506020002030505010502
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ok, now i'm trying to build the plugin-gfx-powervr but i need a little 
help with editing the recipes.

For my test i'm editing the qt4.inc with this lines:

QT_GLFLAGS ?= "-opengl es2 -depths 16,24,32 -plugin-gfx-powervr"

and i add at the end of line of QT_CONFIG_FLAGS
  "-DQT_NO_QWS_CURSOR \
   -DQT_WS_CLIENTLIT"

so i start the building with:
MACHINE=beagleboard ./oebb.sh bitbake qt4-embedded

But the build blocks on this error:
pvrqwswegl.c:42:30: fatal error: GLES/eglplatform.h: No such file or 
directory

So i apply these patches from 
https://github.com/prabindh/qt-configs/tree/master/qt4.8 and build is 
finish correclty.
Problem #1 i see the rm_work delete the folder of qt library but i need 
that for cross-compile with qt-creator my program.
I see the new library is installed in 
/tmp.../sysroot/beagleboard/usr/lib so i copy and paste on my sdcard in 
the same position.
And i run qdemo -qws -display powervr and i get:

Problem #2
QLibraryPrivate::loadPlugin failed on 
"/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so" : "Cannot load 
library /usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so: 
(/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so: undefined symbol: 
_ZNK16QWSWindowSurface12directRegionEv)"
"Cannot load library 
/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so: 
(/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so: undefined symbol: 
_ZNK16QWSWindowSurface12directRegionEv)"  could not load

Anybody have some info to solve the problem?
Thank's




--------------070506020002030505010502
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Ok, now i'm trying to build the plugin-gfx-powervr but i need a
    little help with editing the recipes. <br>
    <br>
    For my test i'm editing the qt4.inc with this lines:<br>
    <br>
    QT_GLFLAGS ?= "-opengl es2 -depths 16,24,32 -plugin-gfx-powervr" <br>
    <br>
    and i add at the end of line of QT_CONFIG_FLAGS<br>
    &nbsp;"-DQT_NO_QWS_CURSOR \ <br>
    &nbsp; -DQT_WS_CLIENTLIT"<br>
    <br>
    so i start the building with:<br>
    MACHINE=beagleboard ./oebb.sh bitbake qt4-embedded<br>
    <br>
    But the build blocks on this error: <br>
    pvrqwswegl.c:42:30: fatal error: GLES/eglplatform.h: No such file or
    directory<br>
    <br>
    So i apply these patches from
    <a class="moz-txt-link-freetext" href="https://github.com/prabindh/qt-configs/tree/master/qt4.8">https://github.com/prabindh/qt-configs/tree/master/qt4.8</a> and build
    is finish correclty.<br>
    Problem #1 i see the rm_work delete the folder of qt library but i
    need that for cross-compile with qt-creator my program.<br>
    I see the new library is installed in
    /tmp.../sysroot/beagleboard/usr/lib so i copy and paste on my sdcard
    in the same position.<br>
    And i run qdemo -qws -display powervr and i get:<br>
    <br>
    Problem #2<br>
    QLibraryPrivate::loadPlugin failed on
    "/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so" : "Cannot load
    library /usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so:
    (/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so: undefined
    symbol: _ZNK16QWSWindowSurface12directRegionEv)"<br>
    "Cannot load library
    /usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so:
    (/usr/lib/qtopia/plugins/gfxdrivers/libqgfxpvregl.so: undefined
    symbol: _ZNK16QWSWindowSurface12directRegionEv)"&nbsp; could not load<br>
    <br>
    Anybody have some info to solve the problem?<br>
    Thank's<br>
    <br>
    <br>
    <div class="moz-signature"><small><font face="Arial">
        </font></small><br>
    </div>
  </body>
</html>

--------------070506020002030505010502--
