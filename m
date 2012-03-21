Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAU2i-0004P9-Ja
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 23:30:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Mar 2012 15:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="120194456"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by orsmga001.jf.intel.com with ESMTP; 21 Mar 2012 15:21:13 -0700
Message-ID: <4F6A5458.9030904@linux.intel.com>
Date: Wed, 21 Mar 2012 15:21:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<20120321230514.1c170480@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B6A9@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137B6A9@ORSMSX106.amr.corp.intel.com>
Cc: =?ISO-8859-1?Q?Eric_B?=, Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Wed, 21 Mar 2012 22:30:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


Eric, Nitin:

Sorry for the top post here, looks like there might be some difference 
during configuration and compilation, can you send your config.log and 
the log.do_configure along with log.do_compile to the list.

I think they need more investigation.

Sau!


On 03/21/2012 03:10 PM, Kamble, Nitin A wrote:
>> -----Original Message-----
>> From: Eric Bénard [mailto:eric@eukrea.com]
>> Sent: Wednesday, March 21, 2012 3:05 PM
>> To: Kamble, Nitin A
>> Cc: Martin Jansa; openembedded-core@lists.openembedded.org;
>> richard.purdie@linuxfoundation.org
>> Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with
>> python support"
>>
>> Le Wed, 21 Mar 2012 21:53:10 +0000,
>> "Kamble, Nitin A"<nitin.a.kamble@intel.com>  a écrit :
>>>   If it is working for you, I don't understand why is it not working
>> here.
>>>
>> it's not working _only_ for me, Martin also had success.
>>
>>> [nitin@nbuild0 oecore-x86_64]$ cd /usr/local/oecore-x86_64/
>>> [nitin@nbuild0 oecore-x86_64]$ ls
>>> environment-setup-x86_64-oe-linux  site-config-x86_64-oe-linux
>> sysroots  version-x86_64-oe-linux
>>> [nitin@nbuild0 oecore-x86_64]$ . environment-setup-x86_64-oe-linux
>>> [nitin@nbuild0 oecore-x86_64]$ ./sysroots/x86_64-oesdk-
>> linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
>>> *** glibc detected *** ./sysroots/x86_64-oesdk-linux/usr/bin/x86_64-
>> oe-linux/x86_64-oe-linux-gdb: double free or corruption (out):
>> 0x00007f3226818030 ***
>>> Aborted (core dumped)
>>> [nitin@nbuild0 oecore-x86_64]$ ldd ./sysroots/x86_64-oesdk-
>> linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
>>>          linux-vdso.so.1 =>   (0x00007fffd05d8000)
>>>          libreadline.so.6 =>  /lib64/libreadline.so.6
>> (0x0000003f07400000)
>>>          libdl.so.2 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libdl.so.2 (0x00007fa207a72000)
>>>          libncurses.so.5 =>  /usr/local/oecore-x86_64/sysroots/x86_64-
>> oesdk-linux/lib/libncurses.so.5 (0x00007fa20784f000)
>>>          libtinfo.so.5 =>  /usr/local/oecore-x86_64/sysroots/x86_64-
>> oesdk-linux/lib/libtinfo.so.5 (0x00007fa207628000)
>>>          libz.so.1 =>  /lib64/libz.so.1 (0x0000003f06c00000)
>>>          libm.so.6 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libm.so.6 (0x00007fa2073a5000)
>>>          libpthread.so.0 =>  /usr/local/oecore-x86_64/sysroots/x86_64-
>> oesdk-linux/lib/libpthread.so.0 (0x00007fa207188000)
>>>          libutil.so.1 =>  /usr/local/oecore-x86_64/sysroots/x86_64-
>> oesdk-linux/lib/libutil.so.1 (0x00007fa206f84000)
>>>          libexpat.so.1 =>  /lib64/libexpat.so.1 (0x0000003f09800000)
>>>          libc.so.6 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libc.so.6 (0x00007fa206bfd000)
>>>          /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-
>> linux-x86-64.so.2 =>  /lib64/ld-linux-x86-64.so.2 (0x0000003f05000000)
>>>
>>>
>>> I am seeing that the sdk gdb is dynamically linking with some of the
>> host libraries as seen above.
>>>
>> ebenard@eb-e6520 x86_64-oe-linux]$ ldd x86_64-oe-linux-gdb
>> ./x86_64-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libc.so.6: version `GLIBC_2.14' not found (required by
>> /lib64/libz.so.1)
>> ./x86_64-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libc.so.6: version `GLIBC_2.14' not found (required by
>> /usr/lib64/libpython2.7.so.1.0)
>> 	linux-vdso.so.1 =>   (0x00007fff12dff000)
>> 	libreadline.so.6 =>  /lib64/libreadline.so.6 (0x0000003ba3a00000)
>> 	libdl.so.2 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libdl.so.2 (0x00007fbfa6c67000)
>> 	libncurses.so.5 =>  /usr/local/oecore-x86_64/sysroots/x86_64-
>> oesdk-linux/lib/libncurses.so.5 (0x00007fbfa6a44000)
>> 	libtinfo.so.5 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libtinfo.so.5 (0x00007fbfa681d000)
>> 	libz.so.1 =>  /lib64/libz.so.1 (0x0000003ba3200000)
>> 	libm.so.6 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libm.so.6 (0x00007fbfa659a000)
>> 	libpthread.so.0 =>  /usr/local/oecore-x86_64/sysroots/x86_64-
>> oesdk-linux/lib/libpthread.so.0 (0x00007fbfa637d000)
>> 	libutil.so.1 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libutil.so.1 (0x00007fbfa6179000)
>> 	libpython2.7.so.1.0 =>  /usr/lib64/libpython2.7.so.1.0
>> (0x0000003bb3000000)
>> 	libexpat.so.1 =>  /lib64/libexpat.so.1 (0x0000003ba7200000)
>> 	libc.so.6 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libc.so.6 (0x00007fbfa5df1000)
>> 	/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-
>> linux-x86-64.so.2 =>  /lib64/ld-linux-x86-64.so.2 (0x0000003ba1600000)
>> [ebenard@eb-e6520 x86_64-oe-linux]$ ./x86_64-oe-linux-gdb
>> GNU gdb (GDB) 7.4
>> Copyright (C) 2012 Free Software Foundation, Inc.
>> License GPLv3+: GNU GPL version 3 or later
>> <http://gnu.org/licenses/gpl.html>
>> This is free software: you are free to change and redistribute it.
>> There is NO WARRANTY, to the extent permitted by law.  Type "show
>> copying" and "show warranty" for details.
>> This GDB was configured as "--host=x86_64-oesdk-linux
>> --target=x86_64-oe-linux". For bug reporting instructions, please see:
>> <http://www.gnu.org/software/gdb/bugs/>.
>> (gdb) quit
>> [ebenard@eb-e6520 x86_64-oe-linux]$ cd ../i586-oe-linux/
>>
>> [ebenard@eb-e6520 i586-oe-linux]$ ldd i586-oe-linux-gdb
>> ./i586-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libc.so.6: version `GLIBC_2.14' not found (required by
>> /lib64/libz.so.1)
>> ./i586-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libc.so.6: version `GLIBC_2.14' not found (required by
>> /usr/lib64/libpython2.7.so.1.0)
>> 	linux-vdso.so.1 =>   (0x00007fff7c949000)
>> 	libreadline.so.6 =>  /lib64/libreadline.so.6 (0x0000003ba3a00000)
>> 	libdl.so.2 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libdl.so.2 (0x00007fe6f9c74000)
>> 	libncurses.so.5 =>  /usr/local/oecore-x86_64/sysroots/x86_64-
>> oesdk-linux/lib/libncurses.so.5 (0x00007fe6f9a51000)
>> 	libtinfo.so.5 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libtinfo.so.5 (0x00007fe6f982a000)
>> 	libz.so.1 =>  /lib64/libz.so.1 (0x0000003ba3200000)
>> 	libm.so.6 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libm.so.6 (0x00007fe6f95a7000)
>> 	libpthread.so.0 =>  /usr/local/oecore-x86_64/sysroots/x86_64-
>> oesdk-linux/lib/libpthread.so.0 (0x00007fe6f938a000)
>> 	libutil.so.1 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libutil.so.1 (0x00007fe6f9186000)
>> 	libpython2.7.so.1.0 =>  /usr/lib64/libpython2.7.so.1.0
>> (0x0000003bb3000000)
>> 	libexpat.so.1 =>  /lib64/libexpat.so.1 (0x0000003ba7200000)
>> 	libc.so.6 =>  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
>> linux/lib/libc.so.6 (0x00007fe6f8dfe000)
>> 	/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-
>> linux-x86-64.so.2 =>  /lib64/ld-linux-x86-64.so.2 (0x0000003ba1600000)
>> [ebenard@eb-e6520 i586-oe-linux]$ ./i586-oe-linux-gdb
>> GNU gdb (GDB) 7.4
>> Copyright (C) 2012 Free Software Foundation, Inc.
>> License GPLv3+: GNU GPL version 3 or later
>> <http://gnu.org/licenses/gpl.html>
>> This is free software: you are free to change and redistribute it.
>> There is NO WARRANTY, to the extent permitted by law.  Type "show
>> copying"
>> and "show warranty" for details.
>> This GDB was configured as "--host=x86_64-oesdk-linux --target=i586-oe-
>> linux".
>> For bug reporting instructions, please see:
>> <http://www.gnu.org/software/gdb/bugs/>.
>> (gdb) quit
>>
>> --
>> http://eukrea.com/en/news/104-2012
>
>
> Looks like in my case the sdk gdb is not dynamically linked with libpython.
>
> Nitin
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


