Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3074574168
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 10:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4EAsYvQ022102; Thu, 14 May 2015 11:54:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XpH6LFpE8GIs; Thu, 14 May 2015 11:54:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4EAsdWr022110
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 14 May 2015 11:54:50 +0100
Message-ID: <1431600879.30971.211.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Thu, 14 May 2015 11:54:39 +0100
In-Reply-To: <55528041.8020901@linux.intel.com>
References: <cover.1431443215.git.alejandro.hernandez@linux.intel.com>
	<62f3e62e0a2145d32fd75530b6f2aeba00dc1bc4.1431443215.git.alejandro.hernandez@linux.intel.com>
	<20150512223017.GG2714@jama> <55528041.8020901@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python3: Upgrade from 3.4.2 to 3.4.3
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
X-List-Received-Date: Thu, 14 May 2015 10:54:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-05-12 at 17:35 -0500, Alejandro Hernandez wrote:
> 
> On 12/05/15 17:30, Martin Jansa wrote:
> > On Tue, May 12, 2015 at 03:09:50PM +0000, Alejandro Hernandez wrote:
> >> Modifies:
> >> python3-native_3.4.2.bb -> python3-native_3.4.3.bb: Updates checksums, LICENSE did not change,
> >> dates were updated.
> >> python3_3.4.2.bb -> python3_3.4.3.bb: Updates checksums, LICENSE did not change,
> >> dates were updated.
> >> generate-manifest-3.4.py: fixes asyncio and net-tools.
> >> python-3.4-manifest.inc: fixes asyncio and net-tools.
> >> This upgrade contains a fix for CVE-2014-9365.
> > There is still that textrel issue I've reported earlier:
> > python3-3.4.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/python3/3.4.2-r1.0/packages-split/python3-audio/usr/lib/python3.4/lib-dynload/ossaudiodev.cpython-34m.so' has relocations in .text [textrel]
> [...]
> >
> > IIRC you've already sent some patch to fix it, do you know what's the status of it, if it was applied or not (why?)?
> 
> Oh nice, I had not seen your patch, I was aware the issue still existed 
> but I upgraded first,  mainly to include the CVE fix and I was just 
> gonna start to work on that issue, no I don't know what the status of it 
> is, RP was probably waiting for the Autobuilder issues to be fixed, but 
> now they are, so it'll probably be applied soon.

I think there is some misunderstanding here. I don't think there is a
patch to fix the textrel issues as yet. If there is, someone needs to
point me at it as I can't find it.

Cheers,

Richard




