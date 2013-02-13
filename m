Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U5QHX-0001qP-IN for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 01:33:03 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1D0LR0H007745 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 00:22:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Uhrnm-uK97Il
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 00:22:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1D0MfEo007780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 00:22:45 GMT
Message-ID: <1360714600.11225.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Feb 2013 00:16:40 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: site/x32-linux: Specify double alignment
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
X-List-Received-Date: Wed, 13 Feb 2013 00:33:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Double alignment is 8 bytes on x32 but it is defaulting to 4 currently.
This leads to various issues and fontconfig fails to build due to the
mismatch triggering assert failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/site/x32-linux b/meta/site/x32-linux
index 7ce6551..36ee68b 100644
--- a/meta/site/x32-linux
+++ b/meta/site/x32-linux
@@ -4,6 +4,7 @@ ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
 ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=8}
 ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
 ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
+ac_cv_alignof_double=8
 
 # glib
 glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=32}




