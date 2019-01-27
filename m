Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id C422F7C3B7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 11:20:08 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id g8so11197085iok.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 03:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=DkZb8J1SiBwi/z6RmllapfCzJOBXTDJ2Z4a1UEZ+Tyw=;
	b=i6lsdADIMSA5E6wlRF1lRqxQEGIQ4pSmHqBWICpRORZPRW+TFIgtI94hGHPtpTA/vf
	XrPIBHQvtgnMXioSXuFFFHtPwYz+64nHPWkQCE4kyHB6/BimgrnOsHVuverM/vGvZpDQ
	d211O4ary785Rp4g7JwYEyEudGbevUOyrZ49EXQoEMS/cVEOhcqORH8WferImYXFHAj0
	VIcVlaa2KH99BFFww+moj0wyC6ncZPYlR2/aW9sQwOKRZgc8gSEHIh/Fap5EWXjzG7z5
	ZFLEHc1ywX/ud2abuYU8q1vju8zN/FC9yZrslCTBW2lBesa0NAq93UTL7w7aaBEZrgOV
	JIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DkZb8J1SiBwi/z6RmllapfCzJOBXTDJ2Z4a1UEZ+Tyw=;
	b=d5di0zCgRuAa9bXCo4aDO5DFqIiJXuJWp3c9nFRiBBJ6yM5z5uPBqb2Qi1Nn068SvL
	JoLVt9OLRGFgxQB8ztsVQX3z35K2RMwa1uAVB4aRHeTBJNnOXVkiPdLa/yk7l6rVw3yx
	nEVlhPNO/GxZuW2m6O0iNaJ1TddRAqkEwcdrktDOvFNXNo5XoqGEzBQVV2nQ7QH3+Eg8
	0e7p2zEnNjx7B4setQcF2CzmQctXUjn4nqcqj4VYktdI1kSs5qB+eZtCa0+ftYoH/M4Z
	rGSFp4Li7hHhK58K9wkumSp3Hf0qGOgoSo3UfdTLNd6wi1o8BACITzBBshVMMWHflHCz
	tAlQ==
X-Gm-Message-State: AHQUAuauEwrVSdT5nnIBBnvvb1GhTYe/wunb4zXVK5hVKN5I9/1sUF1Z
	0sudfUgQRo+A6xq4xaEhwapJXqIgpZqel5V7/oP74NC7
X-Google-Smtp-Source: AHgI3IawaegKNBrYsMktB3VOahrIjAhPsQ49H8ASBAhHwG5AINZDlf4FDMewgZNi4YSuhB0Z3Cr2lhQJucLuA+YeVDM=
X-Received: by 2002:a5d:9ad8:: with SMTP id x24mr10184836ion.19.1548588009328; 
	Sun, 27 Jan 2019 03:20:09 -0800 (PST)
MIME-Version: 1.0
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Sun, 27 Jan 2019 12:15:51 +0100
Message-ID: <CAJkqNs2nPu6q+XnPeXw7CjA7wP_6DJNAHbJ4cxgNY2WQtG9stg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/1] gcc-shared-source: Fix devtool missing patch/unpack tasks
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
X-List-Received-Date: Sun, 27 Jan 2019 11:20:09 -0000
Content-Type: text/plain; charset="UTF-8"

Devtool needs to execute these tasks so we cannot disable them
and if SRC_URI is empty we don't need to disable them anymore.

Changing task dependency so that sources are extracted when running
devtool modify. Setting EXTERNALSRC so devshell can find the shared
gcc sources.

In version 2 I changed the task dependencies.

The following changes since commit 083817577de9b55bf561c926a8948d0fc4988626:

  meta-yocto-bsp: Bump to the latest stable kernel for the non-x86
BSPs (2019-01-26 13:40:03 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib dziendzi/gcc-1

Tomasz Dziendzielski (1):
  gcc-shared-source: Fix devtool missing patch/unpack tasks

 meta/recipes-devtools/gcc/gcc-shared-source.inc | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

--
2.20.1

