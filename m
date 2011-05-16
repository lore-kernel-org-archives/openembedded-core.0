Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QM6bL-0006En-3X
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:49:24 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 6FB1616601F4; Mon, 16 May 2011 16:46:28 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 45FEF16600EF;
	Mon, 16 May 2011 16:46:26 -0600 (MDT)
Message-ID: <4DD1A942.7060400@mlbassoc.com>
Date: Mon, 16 May 2011 16:46:26 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
References: <4DB99F31.4000308@mlbassoc.com>	<BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>	<BANLkTi=G-4UfXNdnJSy7qF3gb0-xLr6+4Q@mail.gmail.com>
	<4DBEAA2C.1020601@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D88F0101@orsmsx504.amr.corp.intel.com>
	<4DCA6C60.6050203@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D88F0328@orsmsx504.amr.corp.intel.com>
	<4DCAADC0.9030106@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D8A2E4FE@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94D8A2E4FE@orsmsx504.amr.corp.intel.com>
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Mon, 16 May 2011 22:49:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2011 03:26 PM, Kamble, Nitin A wrote:
> Gary,
>   I tried with qemuarm machine in the yocto tree. And I find the usb devices are working when compiled with gcc 4.6.0

Can you try it on the beagleboard?

Also, it's not that the USB device isn't found, rather no devices connected to
the USB bus are discovered.

> root@qemuarm:~# usb-devices
>
> T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=12  MxCh= 3
> D:  Ver= 1.10 Cls=09(hub  ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1d6b ProdID=0001 Rev=02.06
> S:  Manufacturer=Linux 2.6.37.6-yocto-standard+ ohci_hcd
> S:  Product=OHCI Host Controller
> S:  SerialNumber=0000:00:0c.0
> C:  #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=0mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
>
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12  MxCh= 0
> D:  Ver= 1.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 8 #Cfgs=  1
> P:  Vendor=056a ProdID=0000 Rev=42.10
> S:  Manufacturer=QEMU 0.14.0
> S:  Product=Wacom PenPartner
> S:  SerialNumber=1
> C:  #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=80mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=01 Prot=02 Driver=wacom
>
> root@qemuarm:~# dmesg | head
> Linux version 2.6.37.6-yocto-standard+ (nitin@nbuild2.sc.intel.com) (gcc version 4.6.0 (GCC) ) #1 PREEMPT Fri May 13 13:55:35 PDT 2011
> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
> CPU: VIVT data cache, VIVT instruction cache
> Machine: ARM-Versatile PB
> Memory policy: ECC disabled, Data cache writeback
> On node 0 totalpages: 32768
> free_area_init_node: node 0, pgdat c05640c0, node_mem_map c05c0000
>    Normal zone: 256 pages used for memmap
>    Normal zone: 0 pages reserved
>    Normal zone: 32512 pages, LIFO batch:7
>
>
>
>> -----Original Message-----
>> From: Gary Thomas [mailto:gary@mlbassoc.com]
>> Sent: Wednesday, May 11, 2011 8:40 AM
>> To: Kamble, Nitin A
>> Cc: Khem Raj; Poky Project; Patches and discussions about the oe-core
>> layer
>> Subject: Re: [poky] GCC 4.6.0 on ARM?
>>
>> On 05/11/2011 09:35 AM, Kamble, Nitin A wrote:
>>>> Yes, that's the only change.  Building the kernel from the same
>>>> source repository with 4.5.2 (using patches from you and Khem Raj)
>>>> works perfectly.
>>>>
>>> Hi Gary,
>>>     The yocto-linux kernel had to go through few changes to mute some
>> compiler warnings with gcc 4.6.0. Are you building your own kernel?
>>
>> Yes.  It's roughly based on the Angstrom 2.6.37 with BeagleBoard
>> support (I have additional OMAP boards which are not in the public
>> tree).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


