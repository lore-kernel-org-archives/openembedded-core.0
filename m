Return-Path: <shanevolpe@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 58D186B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 13:16:59 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u57so1778607wes.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 05:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=hTbvdbNesUiXPrNf9ihfvHMClE4kXiPWrjmIW3cJzGI=;
	b=ruL6vpz4lIkgMhhd7i+q1G97MzvsIxKQhiMX2id66PP+EvZfUHvWfFlz0GLN50ShU8
	fGTnJaUlWLG3J4krprclZ6U+X5uNk/s0Pnf5CAOSjMqI5tMc7+GjbKExYYLzg4OEusRA
	Zqj0qFkxSV2RCJz5kJPlpbyF+u/X40v9AVWhoXC7YqbhxSVFDIQNdXXFjXtmT50uSfZs
	Kd3+meVFqQnlIfx5tAxeQ8u/jKHRL9lMy6b1Q5vQvB75OKxvmr94lFEk8w84PShdJgDa
	bPoJDnv5fGb+PRhw4Ml2w4yjcvzGzmnYXT7E/cTVHVIPEOBmMHcUB21Sa39AU2+Tvcn4
	WFEg==
X-Received: by 10.180.188.100 with SMTP id fz4mr2281128wic.57.1389791816844;
	Wed, 15 Jan 2014 05:16:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.85.133 with HTTP; Wed, 15 Jan 2014 05:16:36 -0800 (PST)
From: Shane Volpe <shanevolpe@gmail.com>
Date: Wed, 15 Jan 2014 08:16:36 -0500
Message-ID: <CAMgc3zNOyfSfz=jUmO2sCDOOJ8=MRwD+EZyAc3t-C6gzn3Ehnw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: unable to use bitbake -c populate_sdk core-image-minimal on dora
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
X-List-Received-Date: Wed, 15 Jan 2014 13:17:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

I believe I'm also having the same problem Nicolas has reported in
this thread, here is my output:

Issue 1:
update-alternatives: Error: cannot register alternative opkg to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/opkg
since it is already registered to /usr/bin/opkg


Issue 2:
update-alternatives: Error: cannot register alternative passwd to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/passwd
since it is already registered to /usr/bin/passwd
update-alternatives: Error: cannot register alternative chfn to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/chfn
since it is already registered to /usr/bin/chfn
update-alternatives: Error: cannot register alternative newgrp to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/newgrp
since it is already registered to /usr/bin/newgrp
update-alternatives: Error: cannot register alternative chsh to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/chsh
since it is already registered to /usr/bin/chsh
update-alternatives: Error: cannot register alternative groups to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/groups
since it is already registered to /usr/bin/groups
update-alternatives: Error: cannot register alternative chpasswd to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/sbin/chpasswd
since it is already registered to /usr/sbin/chpasswd
update-alternatives: Error: cannot register alternative login to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/bin/login since
it is already registered to /bin/login
update-alternatives: Error: cannot register alternative vipw to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/sbin/vipw since
it is already registered to /sbin/vipw
update-alternatives: Error: cannot register alternative vigr to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/sbin/vigr since
it is already registered to /sbin/vigr
update-alternatives: Error: cannot register alternative su to
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/bin/su since it
is already registered to /bin/su

