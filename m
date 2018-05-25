Return-Path: <slemieux.tyco@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 02FDA74926
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 13:37:48 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id d10-v6so6825021itj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vpG2yx3MitiXpT/YK5Qp1uSFgoWshdn+tYBG2NAJk+Y=;
	b=Srso16JgDh7EAZsmSLfXtGwvHISD7+ZTe9gbA46CyAv2Z4WN3GPUu+vEIBeqgModb/
	b1IwODVjv5M1h1149pb89hOmdoFss5a5BTKSzXrZmNeJisF3bRbSWcH/2D5EuOInmN3h
	C0NzoK0dWTkF7537NM9IXCCluJvyU0qlSILCcGZNbuZLXNKf9c02qExHGMNzQPxZMsb6
	ru1ggK6UaKC5N8qvaXy3Z+5RHEXK3esWMDbOyPvnJ66cUvSIcUcatPWzaZpYZiXsEazF
	Ufhm+7ei6a71/ea4v24/GZLHJbgRjMI6CHuWmV4xUcSDnuHDfSWxuL5ybzZqOLkOYJ4g
	uRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vpG2yx3MitiXpT/YK5Qp1uSFgoWshdn+tYBG2NAJk+Y=;
	b=ZVaTF5K3oveR1KdnsCRV+NW1KCdrKOY7hDIpsXcdBiW/y5lOYUkOcGxGf+zPvUMt95
	OYGhzIRLDtzQCxEJmd9blpiYavKi6WnWq886Jd2U1rB10T139+8l7mgYtX9hmPnvbCaG
	zruSkGZP4WKxKj4xW9HT+RfcE4SDJzUzlYdccZoKMBew20LlxBfS2zTkm7eSqM0rpU34
	YsXDEUtbWfeLFnqWezGnYrOdy5c32o1KL9mwQYKPuhw91fxoc5DhMCI2Y4JmV3GCHloH
	oaGwObTbBdvu4SmYn1vKclOi7FfdAVZy/v4oMvOmTaBI45nHxoEt5aOzWJawKYXsca2b
	3fRQ==
X-Gm-Message-State: ALKqPwcr1vqIZsIYrzhiuRhAEVFBApzY6M4EJSMoVMka7wp3Nuh/mPS1
	MDOd7sfGlvJv4ooMVouwtwFEYggLbSb/QJEVNrI=
X-Google-Smtp-Source: ADUXVKK+yIFF2+z+MK96EnvU4nSD6AuyUT1gopUre+rRxiHAgvBV3XRndqrv4ncs7LicVlsyds5ihdzEbPIBhtrfWMM=
X-Received: by 2002:a24:9d44:: with SMTP id
	f65-v6mr2012468itd.119.1527255469742; 
	Fri, 25 May 2018 06:37:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:a74f:0:0:0:0:0 with HTTP; Fri, 25 May 2018 06:37:49
	-0700 (PDT)
In-Reply-To: <CADkTA4ORbb+_1MHy-7JRq=PEZW+=FabV4b=6Guo6dxtOnQb0-A@mail.gmail.com>
References: <BN6PR1201MB01957E06C91D5C5C5B91F7D38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<BN6PR1201MB0195C7EC9D46A3F02DA9DCC38B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<CADkTA4NnhmA37wHWk1r4fZoAFZsoV-x=GW+OW_opdL8jwQgRCw@mail.gmail.com>
	<BN6PR1201MB01951494864FB274FEE4878B8B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<CADkTA4ORbb+_1MHy-7JRq=PEZW+=FabV4b=6Guo6dxtOnQb0-A@mail.gmail.com>
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Date: Fri, 25 May 2018 09:37:49 -0400
Message-ID: <CA+rxa6rGvbEa11ZhgqUB9JqVFiMoWpJ9wKD-5CtN3YQwpU8AdA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: jared.smith@agilent.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_kernel_configme and defconfig
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
X-List-Received-Date: Fri, 25 May 2018 13:37:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

the scenario we are using work and apply the kernel config segment on
top of the defconfig file.

Our BSP layer provide a "defconfig" using the source URI in the kernel
recipe; any layer that are based on this BSP can add their own kernel
config fragment.in a bbappend.

I am not sure if it is useful to also cover this scenario if we update
the documentation.


Sylvain Lemieux

On Fri, May 11, 2018 at 6:40 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Fri, May 11, 2018 at 6:17 PM, <chris.laplante@agilent.com> wrote:
>>
>> Hi Bruce,
>>
>>
>>
>> Thanks for your insights. The defconfig is coming from
>> KBUILD_DEFCONFIG_machinename =3D =E2=80=9Cour_defconfig=E2=80=9D in our =
machine conf. I
>> understand that the defconfig is just another configuration fragment, bu=
t
>> given that it has its own variable (KBUILD_DEFCONFIG) I guess I was
>> expecting a bit of =E2=80=9Cmagic=E2=80=9D out of it; namely, ordering s=
uch that the
>> fragment called =E2=80=9Cdefconfig=E2=80=9D comes first. Otherwise I don=
=E2=80=99t really see the
>> point in supporting in-tree defconfig + .scc/cfg fragments, since the fo=
rmer
>> will just wipe out the latter.
>>
>>
>>
>> That being said, your explanation of the current behavior makes sense, b=
ut
>> I think it should be emphasized somewhere in the manual. Care if I submi=
t a
>> documentation patch?
>
>
> Absolutely! Feel free to cc' me on the patch and I'll give it a review as
> well.
>
> Bruce
>
>>
>>
>>
>> Thanks,
>> Chris
>>
>>
>>
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Friday, May 11, 2018 5:09 PM
>> To: LAPLANTE,CHRIS (A-Little Falls,ex1) <chris.laplante@agilent.com>
>> Cc: Patches and discussions about the oe-core layer
>> <openembedded-core@lists.openembedded.org>; SMITH,JARED (A-Little Falls,=
ex1)
>> <jared.smith@agilent.com>
>> Subject: Re: [OE-core] do_kernel_configme and defconfig
>>
>>
>>
>>
>>
>>
>>
>> On Fri, May 11, 2018 at 3:28 PM, Chris Laplante via Openembedded-core
>> <openembedded-core@lists.openembedded.org> wrote:
>>
>> OK, I figured out why this happens. This line in kernel-yocto.bbclass:
>>
>>
>>
>> scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes}
>> ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>>
>>
>>
>> =E2=80=A6 passes the BSP def before the sccs. In my case, the BSP def is
>> mymachine.scc, and the sccs is the defconfig. So that=E2=80=99s why the =
defconfig
>> comes after the BSP.
>>
>>
>>
>> My takeaway is that a BSP plus a defconfig is not a supported use case. =
Is
>> that correct?
>>
>>
>>
>> A defconfig isn't magic, it is just another input to the configuration
>> merging. It will be applied as any other fragment. There is some special
>> processing only a defconfig is specified, but otherwise, it is the same.=
 So
>> in this case, whatever it sets would be applied after the BSP definition=
 and
>> would take precedence (last through the gate wins).
>>
>>
>>
>> If you have a BSP definition, you normally don't have a defconfig. Where
>> is the defconfig coming from in your scenario ? The SRC_URI ? You can ju=
st
>> include it from the .scc files to control the order, which is what is
>> expected when you have a BSP definition.
>>
>>
>>
>> Were you seeing none of your options set ? or something else ?
>>
>>
>>
>>
>>
>> If so, I think it=E2=80=99s important to add some sanity checking to
>> kernel-yocto.bbclass.
>>
>>
>>
>>
>>
>> There's really nothing that could be checked, since the intent of the
>> fragments isn't known, and for the most part, defconfigs are the same as=
 any
>> other fragment (from the point of view of the merging).
>>
>>
>>
>> Bruce
>>
>>
>>
>> Thanks,
>>
>> Chris
>>
>>
>>
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of C=
hris
>> Laplante via Openembedded-core
>> Sent: Friday, May 11, 2018 2:51 PM
>> To: openembedded-core@lists.openembedded.org
>> Cc: SMITH,JARED (A-Little Falls,ex1) <jared.smith@agilent.com>
>> Subject: [OE-core] do_kernel_configme and defconfig
>>
>>
>>
>> Hi all,
>>
>>
>>
>> Is it expected for do_kernel_configme to apply the defconfig last (after
>> configuration fragments introduced by sccs)?
>>
>>
>>
>> For some reason, in the call to merge_config,
>> =E2=80=9C.kernel-meta/configs//./defconfig=E2=80=9D is passed last where=
as I=E2=80=99d expect it
>> would be first (since that should be the base config). This is causing
>> problems, because config options that my config fragments are setting ar=
e
>> getting overridden by the defconfig =E2=80=93 it should be the other way=
 around.
>>
>>
>>
>> For reference, I=E2=80=99m using Rocko and have just updated to the late=
st commit.
>> We have an in-tree defconfig, and we set KBUILD_DEFCONFIG_machinename
>> appropriately. We are using the separate kernel-meta repository to store
>> kernel metadata. I have KMACHINE_machinename set up so that it finds the
>> correct BSP definition .scc file. Still seem to be missing something,
>> though.
>>
>>
>>
>> Thanks,
>>
>> Chris
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>>
>> --
>>
>> "Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
>> at its end"
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at
> its end"
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

