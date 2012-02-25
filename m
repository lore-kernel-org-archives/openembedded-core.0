Received: from 253-16.static.businesstel.hu ([178.210.253.16]
	helo=teledigit.eu) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kgy@teledigit.eu>) id 1S1Gnx-00051C-Oe
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 13:32:49 +0100
X-AuthUser: kgy@teledigit.eu
Received: from kgy.localnet ([172.25.4.106]:51906)
	by teledigit.eu with [XMail 1.26 ESMTP Server]
	id <S25E2> for <openembedded-core@lists.openembedded.org> from
	<kgy@teledigit.eu>; Sat, 25 Feb 2012 14:24:25 +0200
From: =?ISO-8859-1?Q?K=F6vesdi_Gy=F6rgy?= <kgy@teledigit.eu>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2012 13:26:57 +0100
Message-ID: <17057774.C0TjevbrGC@kgy>
Organization: NNG
User-Agent: KMail/4.7.2 (Linux/3.1.9-1.4-desktop; KDE/4.7.2; i686; ; )
MIME-Version: 1.0
Subject: empty dirs in glib-2.0
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
X-List-Received-Date: Sat, 25 Feb 2012 12:32:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Compiling the Angstrom Linux, in the file openembedded-core/meta/recipes-
core/glib-2.0/glib-2.0_2.30.2.bb (a85f283ffae5407b23532ce2262142ee2d986af2) 
there are the followings:

do_install_append() {
  # remove some unpackaged files
  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
  # and empty dirs
  rmdir ${D}${libdir}/gio/modules/
  rmdir ${D}${libdir}/gio/
}

I have problems with the "empty dirs" section: the directory is not empty and 
therefore the installation fails here.
I replaced it with "rm -rf ..." and now it worx but i do not sure it is a good 
solution.
Why these directories are expected to be empty? What does it mean if they are 
not?

Thanx in advance
Gyorgy Kovesdi


