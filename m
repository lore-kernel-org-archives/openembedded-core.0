Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TtFgS-0000PH-T9
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 11:48:29 +0100
Received: by mail-pa0-f41.google.com with SMTP id bj3so280290pad.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 02:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:organization:user-agent
	:mime-version:content-transfer-encoding:content-type;
	bh=2tN8eHlDJlS8+HGJqifmBvwIzwBavfa+RWIoxmZs1LM=;
	b=uitGIEZMTSPgEACaPYTjJVP2Zt6TKoGG89n9f3lze+8HM8/vbq4wat7GSsxCdyjjmn
	WEcY44P27+KDzorRN4s2Y6pooP/WoUpDWZFubWmtPBv0BjbEAHu1jhiKZrLpmNyZb9vR
	LNtdaVkeRu69aM/1dLmu9mGN/QZzAGJxUd7AqEEkAo7FnMP4FSgZYMI3X5KtkjuFnrPo
	ScUKw8FrAUTblMtuabv8MoSwSnuPY6koIn2PTQ7R29clmRIpAzsI6BV3Co5Y0PEKElgx
	aLViodbJS42uN5uhUbHZRQBQvl7tPgM9A8ZChUuWVYidd2dm4osoyBGrKCqeTDVtV5pY
	JHMA==
X-Received: by 10.68.192.66 with SMTP id he2mr216465185pbc.112.1357813994836; 
	Thu, 10 Jan 2013 02:33:14 -0800 (PST)
Received: from yiqingliang-pc.localnet ([58.212.76.3])
	by mx.google.com with ESMTPS id vk5sm606264pbc.34.2013.01.10.02.33.12
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 02:33:13 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2013 18:31:22 +0000
Message-ID: <1757330.jo1AhcIeyl@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.5 (Linux/3.6.11-1-ARCH; KDE/4.9.5; x86_64; ; )
MIME-Version: 1.0
Subject: glib2.0 and dbus dependency
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
X-List-Received-Date: Thu, 10 Jan 2013 10:48:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

when compiling using 4 threads, I got following error.
the glib2.0-native want find dbus header file.
If I compiled dbus/dbus-natigve, and then compile glib2.0 OK.

when grep glib2.0 bb files, I can't find dbus in dependency, why?




 
ERROR: Function failed: do_compile (see /mnt/src/arm9plf-
build/tmp/work/x86_64-linux/glib-2.0-native/1_2.34.3-
r0/temp/log.do_compile.28193 for further information)
ERROR: Task 1851 (virtual:native:/mnt/src/optimus/poky/meta/recipes-
core/glib-2.0/glib-2.0_2.34.3.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 929 tasks of which 925 didn't need to be rerun 
and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  virtual:native:/mnt/src/optimus/poky/meta/recipes-
core/glib-2.0/glib-2.0_2.34.3.bb, do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.



