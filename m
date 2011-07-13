Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qh0dx-0000AN-Ha
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 16:42:29 +0200
Received: by iwn4 with SMTP id 4so5741972iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=+d9CKNJdvuskv9tCFddqbgCDigS/uzkn2rq3iYuHCQ4=;
	b=DgM6mhX6X9mGOFAwSNwEdhqUgr3bFp5Ixcz5xn5llBeGd6OFb8ryBXiV1zz++v6rtA
	aG0clyVqzD19bRBCz1XRkGDn0XqbaZUBCj34PdasvZ/k6kcPdJ+pc27jK8v2RhPkuelk
	Uh/rmmuQ8Hou/zLAEYvR40FyQcWSm3D3oUOOw=
Received: by 10.231.39.74 with SMTP id f10mr1055936ibe.199.1310567910439;
	Wed, 13 Jul 2011 07:38:30 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id dn23sm436637ibb.29.2011.07.13.07.38.28
	(version=SSLv3 cipher=OTHER); Wed, 13 Jul 2011 07:38:29 -0700 (PDT)
Message-ID: <4E1DADE4.9040100@gmail.com>
Date: Wed, 13 Jul 2011 07:38:28 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
	<1310556033.20015.1104.camel@rex>
In-Reply-To: <1310556033.20015.1104.camel@rex>
Subject: Re: [PATCH 0/5] commits for yocto.git tree for x32 work
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
X-List-Received-Date: Wed, 13 Jul 2011 14:42:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2011 04:20 AM, Richard Purdie wrote:
> On Tue, 2011-07-12 at 12:02 -0700, nitin.a.kamble@intel.com wrote:
>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>
>> These are commits for yocto tree. I came up with as part of the x32 work.
>> I think these commits does not belong in the x32 layer and should go
>> in the yocto/oecore tree.
>>
>> The siteinfo.bbclass commit is a hacky way to get the the right siteinfo for
>> x32 now. In the future a better solution will be implemented for that purpose.
>>
>> The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:
>>
>>    insane.bbclass: skip rdepends QA checks for kernel / modules (2011-07-12 15:22:09 +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib nitin/x32
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32
>>
>> Nitin A Kamble (5):
>>    siteinfo.bbclass: hack for x32
>>    udev-172: add a newer version for newer kernel
>>    runqemu: support qemux32 machine
>
> These first three need a little more thought. They're fine to as proof
> of concept work but we need to find better ways to integrate them.
>
> Specifically:
>
> The siteinfo change is a hack and can't be merged as is. We need to find
> a way to change the target_arch or target_os in such a way we can signal
> to siteinfo to do something different. I also wonder if using i686-linux
> is actually correct for x32 in all cases since x32 does support 64 bit
> data types.

I think it should have its own bits in separate file.

>
> The udev update needs various other work as people have commented. We
> need to resolve the udev differences between meta-oe and oe-core.
>
> runqemu looks like it can be simplified as it looks like just the kernel
> name is different? Is x32 using a different machine config at present?
> Can we use the qemux86-64 machine directly and just add some tweaks to
> it? That would avoid the need to change the qemu scripting?
>
> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



