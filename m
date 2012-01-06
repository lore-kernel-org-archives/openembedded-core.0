Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Rj9vE-0002XI-WF
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 14:33:30 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1F9D1F81263; Fri,  6 Jan 2012 06:26:06 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 21132F81261;
	Fri,  6 Jan 2012 06:26:05 -0700 (MST)
Message-ID: <4F06F66D.8030703@mlbassoc.com>
Date: Fri, 06 Jan 2012 06:26:05 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] webkit-gtk: Fix build
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
X-List-Received-Date: Fri, 06 Jan 2012 13:33:30 -0000
X-Groupsio-MsgNum: 15530
Content-Type: multipart/mixed; boundary="------------090502080209010802030406"

--------------090502080209010802030406
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This version (introduced in commit 663c893b084333ea9703079a9b056d74ffa5e2a3)
can only build if GL support is present.  This change enables that support
explicitly.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
  meta/recipes-sato/webkit/webkit-gtk_svn.bb |    5 ++++-
  1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 9652953..6fcf3f1 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                      file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                      file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
  -DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime 
sqlite3"
+DEPENDS = "virtual/libgl zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 \
+           cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base \
+           flex-native gperf-native perl-native-runtime sqlite3 \
+"
  DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
   SRCREV_FORMAT = "source"
-- 
1.7.7.5

--------------090502080209010802030406
Content-Type: text/plain;
 name="Attached Message Part"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Attached Message Part"



--------------090502080209010802030406--
