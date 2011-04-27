Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liping.ke@intel.com>) id 1QEznB-00075F-Na
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 10:08:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 01:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684569063"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 01:05:38 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 27 Apr 2011 16:05:22 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 27 Apr 2011 16:05:09 +0800
From: "Ke, Liping" <liping.ke@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Apr 2011 16:05:07 +0800
Thread-Topic: [OE-core] [PATCH 1/1] Image Creator: Make bitbake server type
	configuration (xmlrpc, none)
Thread-Index: AcwEsIojkvPVseTNQ+6Yps9VHdKX9QAALDBA
Message-ID: <789F9655DD1B8F43B48D77C5D30659734C09DC54@shsmsx501.ccr.corp.intel.com>
References: <cover.1303889896.git.liping.ke@intel.com>
	<904d24a2315fcb32d56e0c166ce27d99106a3d9e.1303889896.git.liping.ke@intel.com>
In-Reply-To: <904d24a2315fcb32d56e0c166ce27d99106a3d9e.1303889896.git.liping.ke@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "Lock, Joshua" <joshua.lock@intel.com>, "Zhang,
	Jessica" <jessica.zhang@intel.com>
Subject: Re: [PATCH 1/1] Image Creator: Make bitbake server type	configuration (xmlrpc, none)
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
X-List-Received-Date: Wed, 27 Apr 2011 08:08:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Josh Saul
I have resent the patch for removing the left debugging line. Please look@ =
the newer email:)

Thanks a lot for your help!
criping



-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Liping Ke
Sent: Wednesday, April 27, 2011 3:45 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/1] Image Creator: Make bitbake server type conf=
iguration (xmlrpc, none)

From: Liping Ke <liping.ke@intel.com>

Add -t parameters for configuring xmlrpc or none server.

Signed-off-by: Liping Ke <liping.ke@intel.com>
---
 bitbake/bin/bitbake |   20 +++++++++++++++-----
 1 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/bitbake/bin/bitbake b/bitbake/bin/bitbake
index 6d05289..754517a 100755
--- a/bitbake/bin/bitbake
+++ b/bitbake/bin/bitbake
@@ -39,8 +39,6 @@ import bb.msg
 from bb import cooker
 from bb import ui
 from bb import server
-from bb.server import none
-#from bb.server import xmlrpc
=20
 __version__ =3D "1.11.0"
 logger =3D logging.getLogger("BitBake")
@@ -71,7 +69,7 @@ def get_ui(config):
         return getattr(module, interface).main
     except AttributeError:
         sys.exit("FATAL: Invalid user interface '%s' specified.\n"
-                 "Valid interfaces: depexp, goggle, ncurses, knotty [defau=
lt]." % interface)
+                 "Valid interfaces: depexp, goggle, ncurses, hob, knotty [=
default]." % interface)
=20
=20
 # Display bitbake/OE warnings via the BitBake.Warnings logger, ignoring ot=
hers"""
@@ -161,6 +159,9 @@ Default BBFILES are the .bb files in the current direct=
ory.""")
     parser.add_option("-u", "--ui", help =3D "userinterface to use",
                action =3D "store", dest =3D "ui")
=20
+    parser.add_option("-t", "--servertype", help =3D "choose which server =
to user, none or xmlrpc",
+               action =3D "store", dest =3D "servertype")
+
     parser.add_option("", "--revisions-changed", help =3D "Set the exit co=
de depending on whether upstream floating revisions have changed or not",
                action =3D "store_true", dest =3D "revisions_changed", defa=
ult =3D False)
=20
@@ -175,8 +176,17 @@ Default BBFILES are the .bb files in the current direc=
tory.""")
     loghandler =3D event.LogHandler()
     logger.addHandler(loghandler)
=20
-    #server =3D bb.server.xmlrpc
-    server =3D bb.server.none
+    # Server type could be xmlrpc or none currently, if nothing is specifi=
ed,
+    # default server would be none
+    if configuration.servertype:
+        server_type =3D configuration.servertype
+    else:
+        server_type =3D 'none'
+
+    module =3D __import__("bb.server", fromlist =3D [server_type])
+    server =3D getattr(module, server_type)
+
+    print ("lke: servertype: ", server_type)
=20
     # Save a logfile for cooker into the current working directory. When t=
he
     # server is daemonized this logfile will be truncated.
--=20
1.7.0.4


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


