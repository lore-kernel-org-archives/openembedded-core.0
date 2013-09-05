Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id CD8676B12F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:47:52 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cz12so312902veb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 02:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IkMeoOxxg6waM6UuSz146yVAkAXFgoXJ90Jw5hVEQlY=;
	b=B0EBGfe1QGuOex8E723QRA534DbK6zTkD5LaTnxEHscGNCqSlDe7r82X+l0chF9IJ7
	EJhbenzbymA6rX5kQeDl4UjgRU6E7wx+zkcxDOT4+yhhRFb8Vy5Bx27zn+24mS5tqfc0
	RyKrQX7ISIBrhh7vVHEgj/u/bpD5SxndnHER8eF0U7gBua6+LSGj2nwHj7lzc48gc14D
	Rtkeqx67rca6koklbbcAGJw3bZyxzBy53SzIR/G8XnxjzuLYowgS/PDuK287TpOH3HvC
	voQHw6MQU/TecGfWzfDBIo+reb2kkPV2ZJQ3rNKJ/x44ChBxEYv467ItlG1ZVbRASSwX
	C9pQ==
X-Gm-Message-State: ALoCoQmdK4vhwDNJ0BnoUdLRrhOV8SQ2F6FKzw2dnab3Az2+LIHmN8EyJz+uMCVLfcrI7sXoYxLR
X-Received: by 10.52.244.116 with SMTP id xf20mr1911626vdc.16.1378374474454;
	Thu, 05 Sep 2013 02:47:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 02:47:33 -0700 (PDT)
In-Reply-To: <1378352101.14029.52.camel@dvhart-mobl4.amr.corp.intel.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<CAP9ODKou8KFNUVjjMq7wcY8wJ5m-rh4YGpuFTA_JugiSis7dEQ@mail.gmail.com>
	<1378352101.14029.52.camel@dvhart-mobl4.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 10:47:33 +0100
Message-ID: <CAJTo0LZb5hTNAjTJvL2ueRWqe1PWPUv3yU-fbobwjcAis-7JCg@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: yunguo.wei@windriver.com, Poky <poky@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Thu, 05 Sep 2013 09:47:53 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 04:35, Darren Hart <dvhart@linux.intel.com> wrote:
>> > Some of the oe-core changes could be contained in the meta-yocto-bsp layer, but
>> > as these changes come from meta-intel, they are needed by multiple layers, and I
>> > felt it might make more sense in oe-core. If people object to the mga or intel
>> > xserver video drivers, I can respin those for meta-yocto-bsp.
>>
>> QEMU does not need them so they should be in meta-yocto-bsp.
>
> I'm fine with that if that is the consensus. Does anyone else care to
> weigh in?

By that logic nearly all the X drivers in oe-core should be in
meta-yocto-bsp (synaptics, intel, modesetting, omap, omapfb, keyboard,
mouse), but then we'd be forcing people using anything other than qemu
to use meta-yocto-bsp (or duplicate the recipes).  A more nuanced
rationale for keeping modesettings/intel/etc is that whilst the driver
isn't used on QEMU it is in use on a large number of machines so it
can be centrally maintained in oe-core.  I'm not convinced this holds
for -mga (unless you're reading this from the late 90s) so it should
be in meta-yocto-bsp.

Ross

