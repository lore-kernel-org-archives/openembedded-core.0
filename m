Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1ShRYK-0006qF-Kd
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 22:31:00 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:45108 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1ShRNw-00050J-Ht for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 16:20:16 -0400
Date: Wed, 20 Jun 2012 16:20:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206201619360.5623@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] Fix typoes, "enviroment"
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
X-List-Received-Date: Wed, 20 Jun 2012 20:31:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/recipes-devtools/bison/bison/bison-2.3_m4.patch b/meta/recipes-devtools/bison/bison/bison-2.3_m4.patch
index 348ce1d..f63b92e 100644
--- a/meta/recipes-devtools/bison/bison/bison-2.3_m4.patch
+++ b/meta/recipes-devtools/bison/bison/bison-2.3_m4.patch
@@ -430,7 +430,7 @@ Upstream-Status: Pending
 +             glib_major_version, glib_minor_version, glib_micro_version);
 +      printf ("*** was found! If glib-config was correct, then it is best\n");
 +      printf ("*** to remove the old version of GLIB. You may also be able to fix the error\n");
-+      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
++      printf("*** by modifying your LD_LIBRARY_PATH environment variable, or by editing\n");
 +      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
 +      printf("*** required on your system.\n");
 +      printf("*** If glib-config was wrong, set the environment variable GLIB_CONFIG\n");
@@ -467,7 +467,7 @@ Upstream-Status: Pending
 +        printf("*** being found. The easiest way to fix this is to remove the old version\n");
 +        printf("*** of GLIB, but you can also set the GLIB_CONFIG environment to point to the\n");
 +        printf("*** correct copy of glib-config. (In this case, you will have to\n");
-+        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
++        printf("*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf\n");
 +        printf("*** so that the correct libraries are found at run-time))\n");
 +      }
 +    }
diff --git a/meta/recipes-devtools/bison/bison/m4.patch b/meta/recipes-devtools/bison/bison/m4.patch
index d139da5..702774f 100644
--- a/meta/recipes-devtools/bison/bison/m4.patch
+++ b/meta/recipes-devtools/bison/bison/m4.patch
@@ -282,7 +282,7 @@ Index: bison-2.4.2/m4/glib.m4
 +             glib_major_version, glib_minor_version, glib_micro_version);
 +      printf ("*** was found! If glib-config was correct, then it is best\n");
 +      printf ("*** to remove the old version of GLIB. You may also be able to fix the error\n");
-+      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
++      printf("*** by modifying your LD_LIBRARY_PATH environment variable, or by editing\n");
 +      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
 +      printf("*** required on your system.\n");
 +      printf("*** If glib-config was wrong, set the environment variable GLIB_CONFIG\n");
@@ -319,7 +319,7 @@ Index: bison-2.4.2/m4/glib.m4
 +        printf("*** being found. The easiest way to fix this is to remove the old version\n");
 +        printf("*** of GLIB, but you can also set the GLIB_CONFIG environment to point to the\n");
 +        printf("*** correct copy of glib-config. (In this case, you will have to\n");
-+        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
++        printf("*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf\n");
 +        printf("*** so that the correct libraries are found at run-time))\n");
 +      }
 +    }
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4 b/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
index 5e250cd..d36c8ff 100644
--- a/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
@@ -128,7 +128,7 @@ else
             echo "*** being found. The easiest way to fix this is to remove the old version"
             echo "*** of XMMS, but you can also set the XMMS_CONFIG environment to point to the"
             echo "*** correct copy of xmms-config. (In this case, you will have to"
-            echo "*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf"
+            echo "*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf"
             echo "*** so that the correct libraries are found at run-time)"
 	fi
     fi

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


