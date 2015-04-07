Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 23F7A605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 09:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t379Wq9T025916; Tue, 7 Apr 2015 10:32:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9NyUzQJR65vo; Tue,  7 Apr 2015 10:32:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t379WaIm025904
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Apr 2015 10:32:48 +0100
Message-ID: <1428399156.14020.453.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 07 Apr 2015 10:32:36 +0100
In-Reply-To: <89112aaf74a5e6b6e87fd335efab08fb4b89cd26.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
	<89112aaf74a5e6b6e87fd335efab08fb4b89cd26.1428341478.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/24] binutils: upgrade to 2.25
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
X-List-Received-Date: Tue, 07 Apr 2015 09:32:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I ran an older patchset containing this against the autobuilder. We have
two problems which I think are 2.25 related:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=56f680b60ab5fd396f2a65431376683ca6707127

libunwind is failing on x86, likely due to:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65248

which is only planned to be fixed in gcc5. Not sure how we can fix this
one other than perhaps forcing the use of gold in this case (which seems
wrong).

We also have a uboot issue on mpc8315e-rdb which there are fixes around
for, we just need someone to find them and patch it. Both failures are
in the above error reporting link.

Cheers,

Richard


