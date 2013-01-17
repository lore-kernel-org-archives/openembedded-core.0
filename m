Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Tvo3l-0005h2-PY
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 12:55:08 +0100
Received: by mail-ob0-f179.google.com with SMTP id x4so2402868obh.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 03:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=7qpH/+h8IglGq8s3awj7vKQ5TKI2M8MamQlSEURX89E=;
	b=ZUAHYEILpWKkGyrwlUcH59SPCEzDHHN6K9ys9KaWjC9+x68pq4oZn4zHqRCw+0bgDQ
	M9iR2LgPQdMde/1QUlxYMaSPmfQoDHpV+Q1ro59Vvxtk/vbFkjf5JaUQqkQiY+OTS9Dp
	eFPTyFZQoYr3PZn730RpU4p4WdgGE7RW7FreNi0rxsbPM5dVIH+xjmAlUm9ZXp8SObzd
	AhIG8DXaRiNNGMUgK9gdYq+SRIlU9ubVLUcb/bBSGrPAGiV2HT0BqDHcmZ3nIO1ZHFTW
	3dSO1cFUswq/Yzs4PUnG1q0ZgAKEZ0N9Jrma/CbAWQKlL+LzbukhkgueROwfdiApoqIy
	sE7w==
MIME-Version: 1.0
X-Received: by 10.182.194.2 with SMTP id hs2mr3535929obc.97.1358422782322;
	Thu, 17 Jan 2013 03:39:42 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Thu, 17 Jan 2013 03:39:42 -0800 (PST)
Date: Thu, 17 Jan 2013 12:39:42 +0100
Message-ID: <CAGiJk9c_4ntO5BgiL7uKELarNa4gfUdpf7MUz=iW=VW54ihvhg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: package.bbclass: polulate_packages error "file exists"
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
X-List-Received-Date: Thu, 17 Jan 2013 11:55:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

while working on a makeover of some kde recipes the following error occurred:

OSError: [Errno 17] File exists

ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "populate_packages", line 177, in <module>
ERROR:
ERROR:   File "populate_packages", line 97, in populate_packages
ERROR:
ERROR: The code that was being executed was:
ERROR:      0173:                bb.note("%s contains dangling symlink
to %s" % (pkg, l))
ERROR:      0174:        d.setVar('RDEPENDS_' + pkg,
bb.utils.join_deps(rdepends, commasep=False))
ERROR:      0175:
ERROR:      0176:
ERROR:  *** 0177:populate_packages(d)
ERROR:      0178:
ERROR: [From file: 'populate_packages', lineno: 177, function: <module>]
ERROR:      0093:
ERROR:      0094:            mkdir_recurse(dvar, root, os.path.dirname(file))
ERROR:      0095:            fpath = os.path.join(root,file)
ERROR:      0096:            if not os.path.islink(file):
ERROR:  *** 0097:                os.link(file, fpath)
ERROR:      0098:                fstat = os.stat(file)
ERROR:      0099:                os.chmod(fpath, fstat.st_mode)
ERROR:      0100:                os.chown(fpath, fstat.st_uid, fstat.st_gid)
ERROR:      0101:                continue
ERROR: [From file: 'populate_packages', lineno: 97, function: populate_packages]
ERROR: Function failed: populate_packages


Is there a more descriptive explanation of what went wrong?
You can see the packaging part of the recipe at: http://pastebin.com/us4LbuSt
"uniq -c" shows no duplicates.

Any idea how to resolve this issue?


--
Regards
Samuel


