Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id DFE6577202
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 09:36:05 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id n124so107330807lfd.2
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 01:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=BIWMO80BHkPC7idyezNEwyygRiFR2aMiu3TjAoN58N4=;
	b=nkMt2SESn6eiWRsg5lswTjlwmrBoRXQncmt5zKObrERYNK3qTe6Zsg8HmyPlUHNhFr
	vQoiTeCim9HSPsBzyAZzW4cUP3LYGlSy/j76/GjaQ0rQVFovvmmCWBVQoheXx51uT6vc
	WOa1TzsIzoCAhc2vBY3wfBA7K8icT5Gs+KtcnyyuKbFe3+j4PTJEq4D9rWM5S8QmWpai
	q8yz4zrKbROFZ2tRCsJ/lCHDWxnluMqj2/9pCgjpcqhbtp7tUZblb05YNcTybrUoF5f+
	nwqBJQelD/Nt1oxtJyeyrAqOhm6SV6R3agIf5v+l5Bboc8LUwVwES2MHE3BDDLwnW83Y
	OV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=BIWMO80BHkPC7idyezNEwyygRiFR2aMiu3TjAoN58N4=;
	b=k3pL5X6MU5aV+pZXIM9R0pVJKpejQLjCmqk0jrINkuImGq2X+HHB96zubC1nZpCYs+
	m+Bc1JKOCF6n5YFzDAgTj9ve54+c6TmnvF+itwjiLjzQiylC0jqsWYFCA5jDSi+dVzCC
	/r/+3Gb01rx0BAfTmK7IdwhjPkOdOEHWiaMueSxIY5WhDJdhZB3gdUkXhgmKSgh8B00b
	WiUWZshHbQV1iOWIh3szHLw5D/k3v3ceTPRlY7HOYGrgCPamCYhsblUpL60JNA+fQ76D
	IvIO5G6GcJfYrOcAciO6i8Xp55t2QVOy/D4t0/2k5X9cmJ6nGuOfFRdU/Ue5oRRFCSep
	MdJQ==
X-Gm-Message-State: AIkVDXJv0yHZv7rCTqJFkbKQdpBlGKUzCRbCYU8I3DHB2MnIQyGNb/MdtrlyfWJSEm/w0A==
X-Received: by 10.25.151.20 with SMTP id z20mr10595529lfd.92.1485250565082;
	Tue, 24 Jan 2017 01:36:05 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	206sm7214738ljf.35.2017.01.24.01.36.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jan 2017 01:36:04 -0800 (PST)
To: OE-core <Openembedded-core@lists.openembedded.org>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <502e675a-bdaa-3acd-5343-5cb2f40f2a7a@mender.io>
Date: Tue, 24 Jan 2017 10:36:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
Subject: Recipe specific sysroots: New failure to compile Go
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
X-List-Received-Date: Tue, 24 Jan 2017 09:36:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

After the new feature, recipe specific sysroots, was added, I'm facing
the following compile error when compiling Go:

-------------------------------------------
ERROR: go-native-1.7.4-r0 do_compile: Function failed: do_compile (log
file is located at
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/temp/log.do_compile.10566)
ERROR: Logfile of failure stored in:
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/temp/log.do_compile.10566
Log data follows:
| DEBUG: Executing shell function do_compile
| + set -e
| + unset GOBIN
| + '[' '!' -f run.bash ']'
| + case "$(uname)" in
| ++ uname
| + ld --version
| + grep 'gold.* 2\.20'
| + for se_mount in /selinux /sys/fs/selinux
| + '[' -d /selinux -a -f /selinux/booleans/allow_execstack -a -x
/usr/sbin/selinuxenabled ']'
| + for se_mount in /selinux /sys/fs/selinux
| + '[' -d /sys/fs/selinux -a -f
/sys/fs/selinux/booleans/allow_execstack -a -x /usr/sbin/selinuxenabled ']'
| ++ uname -s
| + '[' Linux == GNU/kFreeBSD ']'
| + rm -f ./runtime/runtime_defs.go
| + echo '##### Building Go bootstrap tool.'
| ##### Building Go bootstrap tool.
| + echo cmd/dist
| cmd/dist
| ++ cd ..
| ++ pwd
| + export
GOROOT=/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/go-1.7.4/go
| +
GOROOT=/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/go-1.7.4/go
| +
GOROOT_BOOTSTRAP=/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3
| + '[' '!' -x
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3/bin/go
']'
| + '['
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3
==
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/go-1.7.4/go
']'
| + rm -f cmd/dist/dist
| +
GOROOT=/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3
| + GOOS=
| + GOARCH=
| +
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3/bin/go
build -o cmd/dist/dist ./cmd/dist
| #
_/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/go-1.7.4/go/src/cmd/dist
|
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3/pkg/tool/linux_amd64/6l:
readsym out of sync
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/temp/log.do_compile.10566)
ERROR: Task
(virtual:native:/home/jenkins/workspace/yoctobuild/oe-meta-go/recipes-devtools/go/go_1.7.4.bb:do_compile)
failed with exit code '1'
-----------------------------------------------

Note in particular the "readsym out of sync", which appears to be the
heart of the problem.

Using git bisect I have verified that it is the commit
9107d6ca144ac1f6169830dee25dae2dad775333, the introduction of recipe
specific sysroots, that breaks the build. However, I cannot see an
obvious link between the two, the error looks very internal to Go. Any
clue what's going on?

-- 
Kristian

