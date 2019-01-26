Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id C0DB57C44D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 23:30:58 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id x124so7882257itd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 15:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=QNY68MVyVLI9KGsnOcW5jr0hUJ4SWGe1g4pr4eLNj8E=;
	b=uAEe0Ol0C5mlhPUCN9FcJahBQXoGoQLx4fCXOtBe9yOgluITj2eXNS0cwbGIhaODyS
	5m8eXiIcFnI916zWFesQoDsNPB+W/1epsT0qgBpeqTPEZ1r6K1KiZVE6qUOHWc2vjsAv
	F0eV0xmNzl+P23qpns4yajZJgP8G4HW9orvNRIboXRI6dgu6Uz61C7WSmfhLNc5Ii5T0
	GRVKTNHljYH3S3C4/o+prcvaPTVR1LK34DC8/PzM/djhkjx4w4vmmztpCHqyVL6XPAMR
	c4s3eUN4zkI0G7r1u70+Kro8rKCUvXhSK3hfVvUg41F04jIVJeENAE/ra7we50NN10OM
	0r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=QNY68MVyVLI9KGsnOcW5jr0hUJ4SWGe1g4pr4eLNj8E=;
	b=TItWjOsmvAqI0TTqTMCTnVl9DnewJofv4n0sFBIttUQOxGn6yan7OW9hqqSAdvjwxS
	slmtTT6UW4CzUXwvnsQ3h44oq8qb7THpfkYHn4by3IyU8as75A1Z+8+Ywd+XlutIXGbp
	jjzEZuIPaqjzcbuuFLXVAlnDylVaK2Kwn2AKeLiSDnTIKvRaimeo6hIPFy6kyXjLB/UX
	NQG0sYBYdJq6CSNC1jq2t4j7KrOVBY0KhAqE/BnxyzM8O9MT71N4pgEzmQ7ZmwG63b8c
	EedE7uoz8gX4cVj7WYmCW0m2z8ZZ5t2CNP1s7aJZ+hOcOfv/q+kZxNOrvdwUosxUNzxg
	HkgQ==
X-Gm-Message-State: AJcUukcjTZrK4okDoty/TZ5PoEOE4c72lACPgpIbrcSUgAHCfbC3w17L
	uKV81E068pOUph4w7WxiCmENevCjb2T08dQRundujpH1
X-Google-Smtp-Source: ALg8bN58b5NfhgigpjBHQfzNktbCMxUOpfvomlXpVkj1cGvQOgzleu5sP2nhqH8GIMvb3/R3czEj1cgM4J5wmPTU8t4=
X-Received: by 2002:a24:b610:: with SMTP id g16mr5515651itf.3.1548545459215;
	Sat, 26 Jan 2019 15:30:59 -0800 (PST)
MIME-Version: 1.0
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Sun, 27 Jan 2019 00:26:42 +0100
Message-ID: <CAJkqNs0E9X2sMhv2kjW9JObajhNGCf7DL1CV+jf940hm7K7Gag@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] gcc-shared-source: Fix devtool missing patch/unpack tasks
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
X-List-Received-Date: Sat, 26 Jan 2019 23:30:58 -0000
Content-Type: text/plain; charset="UTF-8"

Devtool needs to execute these tasks so we cannot disable them but if
SRC_URI is empty we don't need to disable them anymore. Setting
EXTERNALSRC so devshell can find the shared gcc sources.
The following changes since commit 083817577de9b55bf561c926a8948d0fc4988626:

  meta-yocto-bsp: Bump to the latest stable kernel for the non-x86
BSPs (2019-01-26 13:40:03 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib dziendzi/gcc

Tomasz Dziendzielski (1):
  gcc-shared-source: Fix devtool missing patch/unpack tasks

 meta/recipes-devtools/gcc/gcc-shared-source.inc | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

--
2.20.1

