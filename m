Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id E41CF6B064
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:40:40 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id uz19so1799413obc.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=yabP4MM7WvztrAZ/QDn809hw16nxiwvmG0MboT1/EXM=;
	b=RjDgP00uiF5Be0l8me7L+V86ELwrMvqrqmN0XWEWUEYvnBXPZHlBHTKasaXEcBX9W0
	ksJQD/PJg4mlFnjkUyBv+kStfkZjJvQeBVesbkyG5b3jN5WOiHk2qNqmFu47zoJMhcV6
	PNFweucW9Jo8LDHi10oUCiELd8197nG/6Ym4qq3muH2ij4j5qrRNxTLQ228nMPNOv3tS
	oT/2ni3yh4jZLTMCT/GKAyoO15a9OjVuHB0mDSPubK1AKeffzLUuaF3msPmA/8EY0TV/
	AySPoteleQHbK5pJd8pY50n0kL2KzWDMHtNCA1CJuLwa8Ri9lHTgcrvBzonUeD0NpPG1
	VOfQ==
MIME-Version: 1.0
X-Received: by 10.60.45.196 with SMTP id p4mr108188oem.81.1378381242600; Thu,
	05 Sep 2013 04:40:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 5 Sep 2013 04:40:42 -0700 (PDT)
In-Reply-To: <1378379194.32427.33.camel@ted>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<CAP9ODKou8KFNUVjjMq7wcY8wJ5m-rh4YGpuFTA_JugiSis7dEQ@mail.gmail.com>
	<1378352101.14029.52.camel@dvhart-mobl4.amr.corp.intel.com>
	<CAJTo0LZb5hTNAjTJvL2ueRWqe1PWPUv3yU-fbobwjcAis-7JCg@mail.gmail.com>
	<1378379194.32427.33.camel@ted>
Date: Thu, 5 Sep 2013 08:40:42 -0300
X-Google-Sender-Auth: T2jEDar6bQL7F03IFIkOnR_GmbQ
Message-ID: <CAP9ODKo5FrS0aAdJF=VU5Oef=moVmLHcFayF+W29i2LNPix0Nw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: yunguo.wei@windriver.com, Darren Hart <dvhart@linux.intel.com>,
	Poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/4] Updates in support of genericx86*
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
X-List-Received-Date: Thu, 05 Sep 2013 11:40:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 5, 2013 at 8:06 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2013-09-05 at 10:47 +0100, Burton, Ross wrote:
>> On 5 September 2013 04:35, Darren Hart <dvhart@linux.intel.com> wrote:
>> >> > Some of the oe-core changes could be contained in the meta-yocto-bsp layer, but
>> >> > as these changes come from meta-intel, they are needed by multiple layers, and I
>> >> > felt it might make more sense in oe-core. If people object to the mga or intel
>> >> > xserver video drivers, I can respin those for meta-yocto-bsp.
>> >>
>> >> QEMU does not need them so they should be in meta-yocto-bsp.
>> >
>> > I'm fine with that if that is the consensus. Does anyone else care to
>> > weigh in?
>>
>> By that logic nearly all the X drivers in oe-core should be in
>> meta-yocto-bsp (synaptics, intel, modesetting, omap, omapfb, keyboard,
>> mouse), but then we'd be forcing people using anything other than qemu
>> to use meta-yocto-bsp (or duplicate the recipes).  A more nuanced
>> rationale for keeping modesettings/intel/etc is that whilst the driver
>> isn't used on QEMU it is in use on a large number of machines so it
>> can be centrally maintained in oe-core.  I'm not convinced this holds
>> for -mga (unless you're reading this from the late 90s) so it should
>> be in meta-yocto-bsp.
>
> There is some thinking going on at the moment about merging genericx86
> and qemux86 since the two machines are converging and any differences
> could be dealt with at runtime. To me, this is a key detail.
>
> I agree that -mga is a push for OE-Core but the other drivers are useful
> and I can see a case for moving them towards the core rather than having
> several layers needing them.

I am not sure Intel's driver should be in OE-Core; if that's the case
we'd need nouveau and ati drivers there as well as they are largely
used in PCs.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

