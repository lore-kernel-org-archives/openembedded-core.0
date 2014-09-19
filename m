Return-Path: <harshjain32@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 16F0D62252
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 11:31:03 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id w61so2282092wes.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=H4+ewDVCJ+oLUaNE3JIYSnTklm8gJWyE7NXV0jCA5YE=;
	b=LyxpC0z3RQUTWPn77y7m+re1OhOihZ4yIkW02+AWvxCeOPgaGeXu8eSUKAQANn9DjI
	hxtihd0iCSBRehib9CJOcuV7U/EvqVChtbf4BQT4rYUGjntstOnNKqs2RSYTv15c+OAi
	WjByaDQQEqO9Ytn5bHpudFA5O+0LEmGLw4S/tD795Ck9nyos/BdrlMI2BVL/DWbNHRsK
	5QVRZGaZgmtKeHRjuG77kTjuiw7sm2Ze4EKD5toNtv6fZ84zbwDoVMy4gBANeqxThHPn
	8++kyellJGrT4CIkMBKHy1PRTaB5jUX0WDONHkHVGRIeNmHmJuE0pluSFJPvGUdtPqXV
	oEmw==
MIME-Version: 1.0
X-Received: by 10.194.243.230 with SMTP id xb6mr552655wjc.100.1411126264575;
	Fri, 19 Sep 2014 04:31:04 -0700 (PDT)
Received: by 10.216.96.11 with HTTP; Fri, 19 Sep 2014 04:31:04 -0700 (PDT)
Date: Fri, 19 Sep 2014 17:01:04 +0530
Message-ID: <CAKuL1XT+=AYT_LVveVWOO2qqoiLwCbi6fP0j_b+xq3aMN7jdSQ@mail.gmail.com>
From: harsh jain <harshjain32@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Recipe file of Python 2.7.4 of later version
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
X-List-Received-Date: Fri, 19 Sep 2014 11:31:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi,


Python version 2.7.3 is not compatible with AARCH64
architecture.Support for AARCH64 is added in 2.7.4 onwards._ctypes.so
is not compiled by  2.7.3 python version for AARCH64.

1 ) Can we have recipe file of  2.7.4 or later version. If yes from
where i can download.
2 ) There are several other python package which have build dependancy
on 2.7.3 version.When I try to install 2.7.4 using custom build recipe
file these dependencies give warning message.Is there any global
setting in configuration file to solve this issue.

Is there any other to update the python in build system?

Thanks  and Regards
Harsh Jain

