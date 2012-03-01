Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S33Lv-0002iy-AK
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 11:35:15 +0100
Received: by dald2 with SMTP id d2so679011dal.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 02:26:45 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.224.225 as permitted sender) client-ip=10.68.224.225; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.224.225 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.224.225])
	by 10.68.224.225 with SMTP id rf1mr822295pbc.133.1330597605046
	(num_hops = 1); Thu, 01 Mar 2012 02:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Osm/+ZR36VDZ8ceOQnmsR+C4wu9jKPTKLWd2PouUXpk=;
	b=aYeSefotZY/Eit1C3pPH2QzDDtmC3aE8u8uOJUIGBlYPy5CbZeCVSngdKSgG2bonNg
	wV/5DMKmGVhG15a9IMEB2qfE7itYniMKvR0Figc+QUnpP9QOv0UrYwYN0lqqZ0byzWs/
	T7NuL/gFCkTknXXfYPf0v0y1LekLTaMG8hrpY=
Received: by 10.68.224.225 with SMTP id rf1mr695536pbc.133.1330597604924;
	Thu, 01 Mar 2012 02:26:44 -0800 (PST)
Received: from [192.168.1.78] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id u9sm1739756pbj.39.2012.03.01.02.26.42
	(version=SSLv3 cipher=OTHER); Thu, 01 Mar 2012 02:26:43 -0800 (PST)
Message-ID: <4F4F4EE1.9040000@gmail.com>
Date: Thu, 01 Mar 2012 02:26:41 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120224 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAAA4K6JS1szpRpSJXiYTHYPoea8sjPcz=x2kADtCyuP1uTOqqw@mail.gmail.com>
In-Reply-To: <CAAA4K6JS1szpRpSJXiYTHYPoea8sjPcz=x2kADtCyuP1uTOqqw@mail.gmail.com>
Subject: Re: [PATCH 3/6] insane.bbclass: fix elf.arch not matching
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
X-List-Received-Date: Thu, 01 Mar 2012 10:35:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/01/2012 01:04 AM, Jegan Chandru wrote:
> Hi,
> 
> I am trying to built a x86_64 bit target filesystem on a 64 bit
> host(Ubuntu-11.10) using yocto poky framework.
> I encountered the same problem while compiling the kernel for my target. 
> 
> /WARNING: QA Issue: Architecture did not match (62 to 3) on
> /work/x86_64_intel-linux/linux-yocto-3.0.4+git3+d05450e4aef02c1b7137398ab3a9f8f96da74f52_5+6b2c7d65b844e686eae7d5cccb9b638887afe28e-r2/packages-split/kernel-vmlinux/boot/vmlinux-3.0.4-yocto-standard-00054-g6b2c7d6/
> 
> As you can see I am using linux-yocto kernel version 3.0.4. So can you
> please shed some light on this issue.

Do you have the commit you replied to in your tree ?


commit 74686edafa241839d3880e06740ee7450ff94fd8
Author: Nitin A Kamble <nitin.a.kamble@intel.com>
Date:   Tue Jan 10 17:33:31 2012 -0800

    insane.bbclass: fix elf.arch not matching error for x32 kernel

    For x32 the user space is 32bit and the kernel is 64bit.
    So the elf.arch for vmlinuz is x86_64 and not x86. This commit
    fixes this QA error thrown for x32 kernel.

    | ERROR: QA Issue: Architecture did not match (62 to 3) on

/work/qemux86_64-poky-linux-gnux32/linux-korg-3.1+git1+e2bf8464ddbf5da24d3d320cded5691828a91a0b-r1/packages-split/kernel-vmlinux/boot/vmlinux-3.1.0-yocto-standard-01628-ge2b
    Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

> 
> Thanks,
> JC
> 
> PS: This is my first post on OE mailing list. Please direct me if I went
> wrong somewhere.
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



