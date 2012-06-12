Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeVh5-0008J9-8a
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 20:19:55 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga14.intel.com with ESMTP/TLS/RC4-MD5; 12 Jun 2012 11:09:18 -0700
Received: by mail-pz0-f52.google.com with SMTP id o14so6978217dan.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 11:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=IBsE14zhFoZZARLg4ktKp13OxTY52qK3IrfUAXV+FPg=;
	b=loNyUlXDJYrKLmmxKrnhx2rbLp/2hAobRlqURNylgBkcpiHOJ1KncGNHc7X+JAwh/u
	A4g1M/KiVVK0xJZ2s/MMcokc16nglWOwPby/OAXGBUbqeMN6XP+RFiXa3DbDwt7IQ3E8
	lXS3ztFPHyrZyxrMXMEwRfKChiU+ZRDoC442uphacJ8gT+GipoZGCe36Dmj1o7t9eGzo
	ci20sHis6/kz1cXMgeVBxOkishLtCmiRQdKqPanS/jPB07BspDZHmO1Av7wYHuPu0KYW
	BjJ/nQqbZkjotVZUAPpIQfnC3yBTqS9/21+b2GoU0wKd8ATWAOxq6hBZLOYpBU7B8O45
	jGBA==
Received: by 10.68.197.198 with SMTP id iw6mr40680614pbc.36.1339524556058;
	Tue, 12 Jun 2012 11:09:16 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id vc6sm2765737pbc.6.2012.06.12.11.09.13
	(version=SSLv3 cipher=OTHER); Tue, 12 Jun 2012 11:09:14 -0700 (PDT)
Message-ID: <4FD785D2.3020603@intel.com>
Date: Tue, 12 Jun 2012 11:09:22 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmWTPsQNjd/cWffjtj5RfEqfKS7XHH8HS2h97wqFgeSsYv+YuccPXZKXOSymbQISX+3WjKo
Cc: Yocto Project Discussions <yocto@linux.intel.com>
Subject: denzil bug status.
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
X-List-Received-Date: Tue, 12 Jun 2012 18:19:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

As we are less than a week from our intended release candidate freeze 
date (June 18) for the denzil point-release, I had a meeting with 
Richard Purdie and Saul Wold to go over the final bug list and assess 
the remaining work. Here is a summary of the results of that meeting.

The bug numbers I'm referring to can be found on the Yocto Project 
bugzilla site: https://bugzilla.yoctoproject.org

Bug 1258 - [crownbay] Xorg eats lots of CPU time after standby
STATUS: Still in progress
NOTES: Tom Zanussi needs hardware to reproduce the bug, and expects to 
have a crownbay system in the next day or two. We will revisit this bug 
once he's had a chance to investigate and assess its impact.

Bug 1465 - bitbake cannot fetch local files from SRC_URI when -b is used
STATUS: Patch under review on oe-core ML
NOTES: A patch for this was just sent out to the oe-core ML this 
morning, so a fix is under review.

Bug 1823 - [Bealgeboard C4] keyboard could not work with 20111207 build
STATUS: Just needs documentation
NOTES: This appears to be a documentation issue; we will mention the 
required boot parameters in the release notes for 1.2.1

Bug 2069 - Clutter run failed in qemux86/qemux86_64 on 
ubuntu/Opensuse/Fedora
STATUS: Deferred to 1.3
NOTES: This appears to be a qemugl issue rather than a bug in clutter. 
The fix for this is likely to be too invasive and the bug has been moved 
to the next major release.

Bug 2328 - Some RPM package file format is not correct on Beagleboard 
platform
STATUS: Deferred to 1.3, document case in release notes
NOTES: The fixes required for this are definitely too invasive for a 
point-release. Rather we will document this case in the release notes.

Bug 2329 - Forwarding only sometimes works from qemu connman-based images
STATUS: Patch under review on oe-core ML
NOTES: This is ready and in my sgarman/denzil-next branch, will be 
included in my next denzil pull request later today.

Bug 2336 - Proxy sanity check message is getting burried
STATUS: Patch under review on oe-core ML
NOTES: This is ready and in my sgarman/denzil-next branch, will be 
included in my next denzil pull request later today.

Bug 2363 - duplicated bash causes do_rootfs failed on Fedora 17
STATUS: Still in progress
NOTES: Saul agreed to try to reproduce the bug on a new Fedora 17 system 
he's setting up today.

Bug 2374 - [eglibc] mtrace should be packaged on it's own
STATUS: Still in progress
NOTES: We have half a fix for this but it breaks poky-tiny. Richard 
suggested a fix that could be applied to the poky-tiny distro config 
that would resolve the second half. Will be testing this ASAP.

Bug 2384 - Update distro version warning to not warn about new 
Ubuntu/Fedora/OpenSUSE releases
STATUS: Still in progress
NOTES: This is a trivial fix I should have a patch out for soon.

Bug 2452 - qemu Unable to find pseudo binary in /usr/bin/
STATUS: Still in progress
NOTES: I need to reproduce this issue and get a closer look at it. There 
is some risk we may need to defer if the fix is complex.

Bug 2477 - yocto-7-denzil : core-image-sato doesn't work with Atom N550
STATUS: Still in progress
NOTES: Due to inactivity on this bug I have sent an email to the 
reporter asking for a status update. Depending on the outcome of that we 
may still be able to resolve it, but there is high risk we won't.

Bug 2503 - task-base-extended depends on libc6 >=2.15, 2.13 is built
STATUS: Still in progress
NOTES: Richard has been assigned this bug and will look into it 
tomorrow. Significant risk we may need to defer it if the fix is complex.

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


