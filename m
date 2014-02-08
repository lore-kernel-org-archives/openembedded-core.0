Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id A67426E3BB;
	Sat,  8 Feb 2014 16:08:50 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so3998530igb.2
	for <multiple recipients>; Sat, 08 Feb 2014 08:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Ezh70apN/sam1T+6wvb8kvd/T8xpxhj4K1ecGWxVb6w=;
	b=hdzmZa/IVcrKdU0uSSPkiu+gUsSUBBYvkaQIX82G7UMw774lokND/mQRs8sJkYcQcL
	OT0yZbDLUTG/dPw/TRAVTtyZ9oEwbFlriY1TPmQw84yk5VfjigjOTOiRryjtUs9hzDaq
	yDO9Xy3Y9aN9p547W+FoxQ4nlNKwIOD3HOohwamQgcOPAJ+f6LkuwphYNQEvmRmVxhYB
	i8WgBI3VqluD9UsQKYwhWmy/Qjdoy1+yP2djYoZm2ZkVLZlth+JjD18XqJd7JRK/uG8G
	QOqq47Mm+ybTu9YsFUWa1WuATLuiuATivmQa5n+pEK9xAL50w3mluL6hfeZMbuJ1AUeL
	8cnw==
X-Received: by 10.50.38.171 with SMTP id h11mr5847421igk.20.1391875731248;
	Sat, 08 Feb 2014 08:08:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Sat, 8 Feb 2014 08:08:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Feb 2014 08:08:21 -0800
Message-ID: <CAMKF1sptnVxCrjm7PAOCtRWzmSsxPv4nc0nUO82jMPQ+BCz9Hg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: [RFT] eglibc 2.19
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
X-List-Received-Date: Sat, 08 Feb 2014 16:08:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi all

I have staged a branch with eglibc 2.19 upgraded recipes here

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/eglibc-2.19

These are not final recipes there may be tweaks needed like adjusting SRC_URI
later on.

please help testing it out in your environments and machines
I would be happy to help out with issues we find

Thank you

-Khem

