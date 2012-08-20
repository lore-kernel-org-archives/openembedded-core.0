Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1T3OCm-0002DY-Bx
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 11:23:28 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Mon, 20 Aug 2012
	11:11:25 +0200
X-TM-IMSS-Message-ID: <2c4ba44e000e47a1@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 2c4ba44e000e47a1 ;
	Mon, 20 Aug 2012 11:11:30 +0200
Message-ID: <5031FF3C.8020106@nedap.com>
Date: Mon, 20 Aug 2012 11:11:24 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: icedtea compile error
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
X-List-Received-Date: Mon, 20 Aug 2012 09:23:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

while compiling openjdk-6 for qemux86.
Anyone seen this before? (and fixed...)

| precompiled.incl.gch
| In file included from ../generated/incls/_precompiled.incl:230:0:
| 
/media/OpenEmbedded/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/i686-linux/icedtea6-native-1.8.11-r5.1/icedtea6-1.8.11/openjdk-ecj/hotspot/src/share/vm/runtime/interfaceSupport.hpp:394:0: 
error: "__LEAF" redefined [-Werror]
| /usr/include/i386-linux-gnu/sys/cdefs.h:44:0: note: this is the 
location of the previous definition
| cc1plus: all warnings being treated as errors
| make[7]: *** [incls/_precompiled.incl.gch] Error 1



