Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id B07DF60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:58:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,766,1367942400"; 
   d="scan'208";a="8053335"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 29 Jul 2013 11:55:26 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6T3wQgu001285
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 11:58:26 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013072911561722-200721 ;
	Mon, 29 Jul 2013 11:56:17 +0800 
Message-ID: <51F5E863.9010406@cn.fujitsu.com>
Date: Mon, 29 Jul 2013 11:58:27 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/29 11:56:17,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/29 11:56:17,
	Serialize complete at 2013/07/29 11:56:17
Subject: [RFC][PATCH 0/6]provide a common machine configuration to developer for customizing specific machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jul 2013 03:58:28 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

The main purposes are following.
 - make it possible for developers/distributor to customize their specific machine
   based common machine configurations such as meta/conf/machine/inc/qemuxx.inc
 - make our specific machine compatible with bb file which depends on COMPATIBLE_MACHINE="qemuxx|..."
 - easy to developers to merge mainline to their branch which containing specific machine.

Bian Naimeng (6):
  qemuarm.conf: provide a common qemuarm machine configuration, 
                so developer/distributor can customize their specific one.
  qemuxmips64.conf: provide a common qemuxmips64 machine configuration, 
                    so developer/distributor can customize their specific one.
  qemumips.conf: provide a common qemumips machine configuration, 
                 so developer/distributor can customize their specific one.
  qemuppc.conf: provide a common qemuppc machine configuration, 
                so developer/distributor can customize their specific one.
  qemux86-64.conf: provide a common qemux86-64 machine configuration, 
                   so developer/distributor can customize their specific one.
  qemux86.conf: provide a common qemux86 machine configuration, 
                so developer/distributor can customize their specific one.

 meta/conf/machine/include/qemuarm.inc    |   10 ++++++++++
 meta/conf/machine/include/qemumips.inc   |   11 +++++++++++
 meta/conf/machine/include/qemumips64.inc |   11 +++++++++++
 meta/conf/machine/include/qemuppc.inc    |    9 +++++++++
 meta/conf/machine/include/qemux86-64.inc |   24 ++++++++++++++++++++++++
 meta/conf/machine/include/qemux86.inc    |   24 ++++++++++++++++++++++++
 meta/conf/machine/qemuarm.conf           |   10 ++--------
 meta/conf/machine/qemumips.conf          |   12 ++----------
 meta/conf/machine/qemumips64.conf        |   12 ++----------
 meta/conf/machine/qemuppc.conf           |    8 +-------
 meta/conf/machine/qemux86-64.conf        |   23 +----------------------
 meta/conf/machine/qemux86.conf           |   25 ++-----------------------
 12 files changed, 99 insertions(+), 80 deletions(-)



