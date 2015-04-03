Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2047673CB9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 14:34:24 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so26302556pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Apr 2015 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=MpBSF69FRpQZRdBecMw//j+3ypsQAwkzZmo4YcRmqmk=;
	b=xzQRMOfSpczHkANzQ3RLcoS8vki951bZjkS6UJ6WZ9dL+/7E6+ER5TknU+jgvJHxyB
	E6hUQoVIZBZUQbY2ezeIXdaY2qUYMXb/GMo6PMJr38m51HFvGVBSp/uSGGT8IfutCfDw
	mQQb9e07FQwGkIt3PZtwEXhAQWZKizVeZNsj0vVkBK/C6i0VBuXxip0P/Ats2GSSXGiq
	L2ekazF4yWhRV71IIt9Xd6tN467XFoekKRY/M0aYJ7Ih9bkE/vrTqini/PXWW+cu3pL2
	a11v3ZXVFz/L7HLCFQX+yzj09S+T8sIidWcdXj19EF3cO0B9r0qZvK6oJRLVXVgA76X4
	5neA==
X-Received: by 10.66.118.136 with SMTP id km8mr4701901pab.43.1428071665940;
	Fri, 03 Apr 2015 07:34:25 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:c58:5feb:7967:5a21?
	([2601:c:a700:3ba7:c58:5feb:7967:5a21])
	by mx.google.com with ESMTPSA id
	rt12sm7257413pab.34.2015.04.03.07.34.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Apr 2015 07:34:24 -0700 (PDT)
Message-ID: <551EA4E6.4090304@gmail.com>
Date: Fri, 03 Apr 2015 07:34:14 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: combo-layer issue
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
X-List-Received-Date: Fri, 03 Apr 2015 14:34:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning all,

I am trying to replicate how Poky is created using combo-layer.  I have 
referenced  https://wiki.yoctoproject.org/wiki/Combo-layer

The issue seems to be related when I define "branch". Not defining it 
works fine (ie, master default). I suspect I am doing something 
incorrectly or a compatibility issue with my local git version 1.9.1.

can someone poke to go in the right direction.

kind regards,
Armin


combo-layer.conf:

[bitbake]
src_uri = git://git.openembedded.org/bitbake
local_repo_dir = /tmp/src/test/bitbake
dest_dir = bitbake
branch = 1.26
last_revision =

[oe-core]
src_uri = git://git.openembedded.org/openembedded-core
local_repo_dir = /tmp/src/test/oecore
dest_dir = .
branch = fido
last_revision =



Error message:

[07:22:26] fatal: ambiguous argument 'fido': unknown revision or path 
not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'
fido

Traceback (most recent call last):
   File "./scripts/combo-layer", line 869, in <module>
     ret = main()
   File "./scripts/combo-layer", line 865, in main
     actions.get(args[1], action_error)(confdata, args[1:])
   File "./scripts/combo-layer", line 220, in action_init
     rev = runcmd('git rev-parse %s' % initialrev, ldir).strip()
   File "./scripts/combo-layer", line 179, in runcmd
     raise e
CalledProcessError: Command 'git rev-parse fido' returned non-zero exit 
status 128


