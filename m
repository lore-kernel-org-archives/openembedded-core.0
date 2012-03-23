Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SB3Ph-0000ev-1Q
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:16:13 +0100
Received: by yhjj56 with SMTP id j56so2652841yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=4lxhB59YIsDIcpb6qtY2+wqCumQ6mWgoXdM9e+vzIy8=;
	b=m7Wx5ODPG+1mO97G4liidHVBLdeTzbbGLNxRusZNzewKN2M5dxSOA2mRG50JFiY8X2
	wJQk+KWVTNALYexkG9SXO2IJHmCTubP9rUqSkSat11VDt17wQ7IDKx7lWjgH1fIH+pOT
	WLPmt0FTa0n4oZ08RF7iWWKsGpErNQ92wYiqSPozVy1yrpPGjAFH16izPY2LW516xVYQ
	Buutax4iBhUWoULm/9kScJsEF/aRziWa0ewQLkHa+wNJonX2PfAvJ3WoYYb3IZbGlbvm
	A+vj3FeH8LPycNSYKZ01EhRxebCOmjXrtRwyaxMeYOaphXfnaYI493LKzIKe4fFpmSyW
	T12w==
Received: by 10.68.225.194 with SMTP id rm2mr28858182pbc.95.1332504436038;
	Fri, 23 Mar 2012 05:07:16 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id v6sm5713330pbu.41.2012.03.23.05.07.13
	(version=SSLv3 cipher=OTHER); Fri, 23 Mar 2012 05:07:14 -0700 (PDT)
Message-ID: <4F6C676F.7060700@gmail.com>
Date: Fri, 23 Mar 2012 05:07:11 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120313 Thunderbird/11.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sr=PedPsmpPSGC42Wvof9fHbR26JM2hgEZjA3h621ynxA@mail.gmail.com>
	<20120322223127.136698cf@eb-e6520> <4F6C2259.7000802@gmail.com>
	<20120323093114.2f779b94@eb-e6520>
In-Reply-To: <20120323093114.2f779b94@eb-e6520>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Fri, 23 Mar 2012 12:16:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 03/23/2012 01:31 AM, Eric Bénard wrote:
> Hi Khem,
>
> Le Fri, 23 Mar 2012 00:12:25 -0700,
> Khem Raj<raj.khem@gmail.com>  a écrit :
>> OK can you try following patch ? (untested) it does not fix the paths so
>> once you install sdk it will have to be fixed as you did with chrpath
>> for testing
>>
>> http://paste.ubuntu.com/896082/
>>
>> I think issue is currently we are linking with static version of
>> libpython and also the search path to find python executable for gdb
>> when running is /usr/bin and not the python from SDK so this patch
>> takes care of both
>>
> very good catch, now gdb runs fine and strace shows that it loads
> the right library :
>
> open("/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7/lib-dynload/readline.so",
> O_RDONLY) = 6 fstat(6, {st_mode=S_IFREG|0755, st_size=23520, ...}) = 0
> futex(0x7f3ada48e0a8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
> open("/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7/lib-dynload/readline.so",
> O_RDONLY) = 7 read(7,
> "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`%\0\0\0\0\0\0"..., 832)
> = 832 fstat(7, {st_mode=S_IFREG|0755, st_size=23520, ...}) = 0
> mmap(NULL, 2118952, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 7,
> 0) = 0x7f3ad8a05000
>
> Eric

good. So this patch does the trick. I will post proper patch shortly
we still need to fix the rpath problem though


