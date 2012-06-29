Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkVhq-0008Np-LF
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 09:33:30 +0200
Received: by eaal1 with SMTP id l1so1234927eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Iwlgdo75H5CRN5+I+Int4myXrAiq+X3tDQju9D+SEMY=;
	b=L9OiWRSfIqFi/ixb+u8D3uqw3GriO37a6UA/IfyvnYNaCgYuu+sENCL1OemzYh+cK1
	HIvQBCnGs0GAuODtDgwKsjgyI3MtWHnFjAB8Pyx3Yj+vIHQjtBhWDz+cnZgp/V3W7amO
	2T6ciHZTKH/4KYt+PMJfgfjzV/5ViKUw6LnTidEvsNGXgz/B3CWFfO/FFg5SVxnuZHPa
	pkYkB5NFRXjxQLfEXmcWaFEEC/ReoxF08zVoH6ZgE/YaYj/M9QZVZtQRjYjHGpbW+LSM
	YNQ6eCXaU3cTClungD+iRMvsAH+vBP1ctuFNw+lQ8FLLqMp6zL+aRPd9mXwHxZjWbOJt
	sX0A==
Received: by 10.14.185.137 with SMTP id u9mr285976eem.220.1340954555057; Fri,
	29 Jun 2012 00:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 00:22:04 -0700 (PDT)
In-Reply-To: <4FED47D7.7080107@linux.intel.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<5b45f71fee3c593e5420a5a9b36ba947c429a397.1340942930.git.dvhart@linux.intel.com>
	<CAMKF1sopV66-Rohk5HYMygcSamkcxDgOM8bfruF7VWR0ZAXpnQ@mail.gmail.com>
	<4FED4226.30700@linux.intel.com>
	<CAMKF1sojfidUA9mne_RfXz+tE8d3pRboHbGxJL-dLD5wkeKVRw@mail.gmail.com>
	<4FED47D7.7080107@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2012 00:22:04 -0700
Message-ID: <CAMKF1sqm=A5za70vND38jdyUdUUyB017+OuoCWwpwBX3w6WWqA@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] kernel: Add kernel-headers package for target module build
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
X-List-Received-Date: Fri, 29 Jun 2012 07:33:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 11:14 PM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
>
>
> On 06/28/2012 11:04 PM, Khem Raj wrote:
>> On Thu, Jun 28, 2012 at 10:50 PM, Darren Hart <dvhart@linux.intel.com> w=
rote:
>>>
>>> However, I don't have a strong opinion here, I'll happily call it
>>> kernel-devel if that is strongly preferred by some.
>>
>> in oe terminology it will be -dev
>
> THe other reason I didn't go that route is that we already have a
> kernel-dev (although I don't much like the way it is used):
>
> From kernel.bbclass:
>
> PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel-misc kernel-headers"
> FILES =3D ""
> FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/confi=
g*"
> FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> # misc is a package to contain files we need in staging
> FILES_kernel-misc =3D "/kernel/include/config /kernel/scripts
> /kernel/drivers/crypto /kernel/drivers/media"
> FILES_kernel-headers =3D "/usr/src/kernel-headers"
>
> And looking at that it appears I broke kernel-misc by moving things to
> /usr/src (didn't notice that in my testing).
>
> How would you propose we redefine the above in order to use "kernel-dev"
> for the new package?

hmmm interesting so I guess, linux-dev being already taken, you might
call it linux-kernel-headers as you were doing. So we have
linux-libc-headers and linux-kernel-headers to differentiate between
raw and sanitized headers

>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>
>


