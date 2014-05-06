Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 95E6365FC5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 13:20:39 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id va2so6775502obc.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=o7uSGEnGKXJ7lczMIlwQrbH8gBwABadNa75NUxfRR/8=;
	b=ta6YhsSdYwiqmX0+vUG28UqxU4HhaXfEuSWSalv20oh0OCs0r9WEsxbVOk2bJicNqS
	mzOU47S5E2IPmygeBUUvWrjuB6AbAjM6SY6Z7dMil5UBVa345MoTsXmRcH7Y0FaBmJ0y
	ZSUQ+q34ODyL3caMO+uR0w4aN4Xe82AgTz59qK9nTwsC3oG5ev/6u+VKz5UkBGxvasev
	aCVVVDKMtpZqlwLz5kRZMfTcXDyrEEHLmsNZVYPx4fi3+9Gx1bMciDBPFBib0nAHRsdG
	GfpwxxWokrQZ4IPya1QV1BlDyr/0y/M+Ag/AnPBe79XIYHaOdoigMQIOCcdRLIWW6/sD
	rM+Q==
X-Received: by 10.60.73.39 with SMTP id i7mr9105812oev.51.1399382439976; Tue,
	06 May 2014 06:20:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.111.133 with HTTP; Tue, 6 May 2014 06:20:19 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 6 May 2014 15:20:19 +0200
Message-ID: <CAPybu_2QJ=GXH0Vo_hvAOu-uoj=KDe2ouyQ1EC6pmx6cSKc8TQ@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: daisy: System crash running grub-efi on 64 bit machine
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
X-List-Received-Date: Tue, 06 May 2014 13:20:46 -0000
Content-Type: text/plain; charset=UTF-8

Hello

I have just ported my build system to daisy and I am unable to boot
from grub-efi. As soon as the grub binary is loaded by uefi, the
system freezes. The error can be reproduced on virtualbox.

Since it is even before the kernel is loaded, and no error message is
given I don't know which will be the easiest way to debug the issue. I
hope that the log message from virtualbox can give you a hint of the
issue: https://gist.github.com/anonymous/7ffd78aa3aada41801fe .

It could be a toolchain issue, because if I build the same code (even
with the patches) with Debian's gcc everything works as expected.

If anyone needs the .vdi file I will be more than happy to share it.

Thanks!



-- 
Ricardo Ribalda

