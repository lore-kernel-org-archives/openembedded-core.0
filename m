Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S7qPq-0007Cp-Ce
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:47:06 +0100
Received: by yenm3 with SMTP id m3so1937876yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 08:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/l8TaZhDwIL/clO93nLxQ+SSK1FwPUToMyKL9bnKH6g=;
	b=qs5i9upheIUtLlnjtHui6RKkLwZi6J44qLlLPtr8LUqYsMMHWrR24mgEHrL6xUrDEY
	smMdKZ81H9H7FM0eQawA+vrL5yMdare6gl3qMQPBxkxkgCqMF488rv6XSNCQOkgweArs
	Qed2VZ7WY73x7ugHXzWObgjb9Y6xIktCe1Si9DAJ5riJP+fhpz1IK7jiG4iJxvynOCvB
	/fDwvY//sG7K4VkFj9nz/90zFmQrAdrkhZWlbXYMeBFgtNsNK6Zs2E1jVJVYq4/4dwMt
	kVI8O8P3GEyJ71WxUcW6YI0t99gICXCP/cCXAdBeSXQqgUz0UaL+bnYQ6bXbJp2pVN/b
	FEPw==
MIME-Version: 1.0
Received: by 10.182.119.71 with SMTP id ks7mr3570996obb.9.1331739496200; Wed,
	14 Mar 2012 08:38:16 -0700 (PDT)
Received: by 10.182.246.8 with HTTP; Wed, 14 Mar 2012 08:38:16 -0700 (PDT)
Date: Wed, 14 Mar 2012 08:38:16 -0700
Message-ID: <CAGDS+nnPt6zgHGM99xMqnuVhEwZTuDwdEkvJ0E90mpQKDv=RAw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: net-tools breaks on rebuild
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
X-List-Received-Date: Wed, 14 Mar 2012 15:47:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm still encountering recipes that fail when sstate hash forces a
rebuild after a pull.

The latest is net-tools in nettools_do_patch:

| ERROR: Function failed: nettools_do_patch (see
/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-tools-1.60-23-r0/temp/log.do_patch.658
for further information)
| patching file debian/compat
| patching file debian/README.source
| patching file debian/rules
| patching file debian/config.h
| patching file debian/config.make
| patching file debian/install
| patching file debian/control
| patching file debian/copyright
| patching file debian/changelog
| patching file debian/watch
| patching file debian/patches/CVS-20081003-config.in_sync.patch
| patching file debian/patches/local-manpages.patch
| patching file debian/patches/CVS-20020730-route.c_opts_64.patch
| patching file debian/patches/CVS-lib_sync.patch
| patching file debian/patches/CVS-20051204-slttach.c_sync.patch
| patching file debian/patches/CVS-20071202-rarp.c_sync.patch
| patching file debian/patches/CVS-20081003-statistics.c_sync.patch
| patching file debian/patches/CVS-20051204-arp.c_sync.patch
| patching file debian/patches/CVS-20081002-ifconfig.c_sync.patch
| patching file debian/patches/CVS-20060927-mii-tool.c_sync.patch
| patching file debian/patches/CVS-20070316-netstat.c_sync.patch
| patching file debian/patches/netstat.c-local_changes.patch
| patching file debian/patches/CVS-20061011-ipmaddr.c_buffer_overflow.patch
| patching file debian/patches/series
| patching file debian/patches/Bug#345331-socket_overflow.patch
| patching file debian/patches/lib_local_changes.patch
| patching file debian/patches/CVS-20061011-includes_sync.patch
| patching file debian/patches/CVS-20031011-hostname.c_sync.patch
| patching file debian/patches/Bug#254243-netstat.c-wide-opt.patch
| patching file debian/patches/CVS-20081002-manpages_sync.patch
| patching file debian/patches/translations.patch
| patching file debian/patches/CVS-20030911-nameif.c_sync.patch
| patching file debian/patches/netstat.c-assorted_changes.patch
| Applying patch
/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-tools-1.60-23-r0/net-tools-1.60/debian/patches/CVS-20020730-route.c_opts_64.patch
| patching file route.c
| Hunk #1 FAILED at 2.
| Hunk #2 FAILED at 142.
| Hunk #3 succeeded at 184 with fuzz 1 (offset 8 lines).
| 2 out of 3 hunks FAILED -- rejects in file route.c
| patching file route.c
| Hunk #1 FAILED at 2.
| Hunk #2 FAILED at 142.
| Hunk #3 succeeded at 192 with fuzz 1 (offset 16 lines).
| 2 out of 3 hunks FAILED -- rejects in file route.c
| patching file route.c
| Hunk #1 FAILED at 2.
| Hunk #2 FAILED at 142.
| Hunk #3 succeeded at 200 with fuzz 1 (offset 24 lines).
| 2 out of 3 hunks FAILED -- rejects in file route.c
| Patch /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/net-tools-1.60-23-r0/net-tools-1.60/debian/patches/CVS-20020730-route.c_opts_64.patch
does not apply (enforce with -f)
NOTE: package net-tools-1.60-23-r0: task do_patch: Failed
ERROR: Task 1 (/home/sakoman/source/yocto/poky/meta/recipes-extended/net-tools/net-tools_1.60-23.bb,
do_patch) failed with exit code '1'
Waiting for 7 active tasks to finish:

I suspect the issue is in the recipes python do_patch:

# We invoke base do_patch at end, to incorporate any local patch
python do_patch() {
	bb.build.exec_func('nettools_do_patch', d)
	bb.build.exec_func('patch_do_patch', d)
}

Not sure how to fix this, but thought I would document the issue for
those more knowledgeable.

Steve


