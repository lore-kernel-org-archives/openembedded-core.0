Return-Path: <mike.looijmans@topic.nl>
Received: from smtp07.online.nl (smtp07.online.nl [194.134.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id 630AA6ED65
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 17:46:27 +0000 (UTC)
Received: from smtp07.online.nl (localhost [127.0.0.1])
	by smtp07.online.nl (Postfix) with ESMTP id C4CFA98137
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 18:46:26 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp07.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 18:46:26 +0100 (CET)
Message-ID: <53121CF2.6090402@topic.nl>
Date: Sat, 01 Mar 2014 18:46:26 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
X-Online-Scanned: by Cloudmark authority (on smtp07.online.nl)
Subject: rootfs fails to build in current master
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
X-List-Received-Date: Sat, 01 Mar 2014 17:46:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I get this mysterious error at rootfs after updating to current master:

Exception: AttributeError: 'module' object has no attribute 
'shell_trap_code'


I haven't been following OE for a while, so I have no clue as to what 
caused this.

Stack trace:

File: '/media/work/master-next/openembedded-core/meta/lib/oe/image.py', 
lineno: 248, function: _write_script
      0244:        self.d.setVarFlag('img_creation_func', 'func', 1)
      0245:        self.d.setVarFlag('img_creation_func', 'fakeroot', 1)
      0246:
      0247:        with open(script_name, "w+") as script:
  *** 0248:            script.write("%s" % bb.build.shell_trap_code())
      0249:            script.write("export ROOTFS_SIZE=%d\n" % 
self._get_rootfs_size())
      0250:            bb.data.emit_func('img_creation_func', script, 
self.d)
      0251:            script.write("img_creation_func\n")
      0252:



-- 
Mike Looijmans

