Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1SgDrb-0000ez-DL
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 13:41:51 +0200
Received: from localhost (83.252.253.85) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.245.1; Sun, 17 Jun 2012
	13:31:02 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jun 2012 13:31:30 +0200
Message-ID: <cover.1339932526.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [oe-core, for-denzil][PATCH 0/1] qt4-embedded: Reference QT_ARCH correctly in QT_CONFIG_FLAGS
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
X-List-Received-Date: Sun, 17 Jun 2012 11:41:51 -0000
Content-Type: text/plain

This single patch serie should be applied to master and denzil.

The commit "qt4: move functions from python to shell style", commit id: 
98cb2efe4e9f3092d531c9fc809406c3ef559725 made it impossible to use 
oe_filter_out on QT_CONFIG_FLAGS. The error received was:

$ bitbake core-image-sato -eLoading cache: 100%                                         
|###################################################| ETA:  00:00:00                    
Loaded 1109 entries from dependency cache.                                              
ERROR: Failure expanding variable QT_CONFIG_FLAGS[:=], expression was                   
${@oe_filter_out('-plugin-gfx-transformed', '      -embedded ${QT_ARCH}                 
-qtlibinfix E     -plugin-gfx-transformed -plugin-gfx-qvfb                              
-plugin-gfx-vnc -plugin-gfx-directfb     -plugin-mouse-tslib                            
-qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput     -qt-kbd-tty                        
-DQT_KEYPAD_NAVIGATION      -release -no-cups -reduce-relocations                       
-shared -no-nas-sound -no-nis                     -system-libjpeg                       
-system-libpng -system-libtiff -system-zlib                     -no-pch                 
-qdbus -stl -glib -phonon -webkit                     -xmlpatterns                      
-no-rpath -qt3support -silent                     --enable-pulseaudio                   
-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite                
-no-accessibility -no-sm                        -exceptions ', d)} which                
triggered exception SyntaxError: EOL while scanning string literal                      
(QT_CONFIG_FLAGS[:=], line 1)                                                           
ERROR: Command execution failed: Exited with 1                                          
                                                                                        
Summary: There were 2 ERROR messages shown, returning a non-zero exit                   
code.                                       


The following changes since commit 63d1ae1c2828cda03828b4c3fdde037d7a23f1e4:

  directfb: added missing Upstream-status (2012-06-15 15:41:11 +0100)

are available in the git repository at:

  git://github.com/darander/oe-core qt4-arch-fix
  https://github.com/darander/oe-core/tree/qt4-arch-fix

Anders Darander (1):
  qt4-embedded: fix QT_ARCH usage in QT_CONFIG_FLAGS

 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10



