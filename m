Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RnvDT-0001NX-Pb
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 17:52:01 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2012 08:43:00 -0800
Received: by iabz7 with SMTP id z7so123409iab.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 08:42:59 -0800 (PST)
Received: by 10.42.161.132 with SMTP id t4mr22473253icx.16.1326991379301;
	Thu, 19 Jan 2012 08:42:59 -0800 (PST)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id d15sm11659553ibf.7.2012.01.19.08.42.57
	(version=SSLv3 cipher=OTHER); Thu, 19 Jan 2012 08:42:58 -0800 (PST)
Message-ID: <4F184806.8040205@intel.com>
Date: Thu, 19 Jan 2012 08:42:46 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1326855665-11617-1-git-send-email-raj.khem@gmail.com>
	<182165EE-D546-4E80-932D-6409E234863B@dominion.thruhere.net>
	<74FB388C-DFB3-42A8-AAA3-C92B74433F9A@dominion.thruhere.net>
In-Reply-To: <74FB388C-DFB3-42A8-AAA3-C92B74433F9A@dominion.thruhere.net>
Subject: Re: [PATCH] e2fsprogs_1.42.bb: Fix build fallout for uclibc
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
X-List-Received-Date: Thu, 19 Jan 2012 16:52:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2012 05:34 AM, Koen Kooi wrote:
>
> Op 18 jan. 2012, om 10:51 heeft Koen Kooi het volgende geschreven:
>
>>
>> Op 18 jan. 2012, om 04:01 heeft Khem Raj het volgende geschreven:
>>
>>> e2fsprogs 1.42 onwards uses fallocate() which uclibc
>>> does not implement(yet). In most of places its use
>>> is controlled and it only used when configure detects
>>> fallocate being present but in this one case it missed
>>> to check for fallocate being available so here we
>>> add the check
>>
>> FWIW, e2fsprogs(-native) also has problems with ASNEEDED:
>>
>> | tune2fs: symbol lookup error: tune2fs: undefined symbol: ext2fs_group_desc
>
> And that one suddenly went away!

That was fixed when the bitbake.conf change made it into master which 
now adds base_libdir_native to the RPATH for native compiled binaries.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=35759f977eec6ef81e125a509a7148d7e53a6515

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


