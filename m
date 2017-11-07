Return-Path: <ngompa13@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 14E1D7199D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 21:17:55 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b15so830417qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 13:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+bWoHX9dJd/bA6aS9eNQ3Az6sjevWAq6lV9G60LDU5g=;
	b=uOvoYxAiw0Wgp7omcD0eF77eNa5PP2Gcu18fO5uPc/BSTHzcyPjJTGzLgqaHPu9lwf
	Obtlg9zx5UKROG4AVd/5LRkhM18PxHaSrKVtAiJyoJSeU4gq4Lj01rOvstOOksY3DBxl
	Z4qrkz7xP330OTbYP2dpbVUuG7Xb94gk5iaew5V5gVqc8O+4jLsccFgSsUThWWA3FGG9
	U/T8MRmvqEbsRTNPH12uHQrXx3q+bfm7v+8kbH97Y67AELMnHNsGzRzXOu+Af3w+jMRO
	XwzknaCfwUOhyuXIHAUhDHYFpbZMaRkHx+O0wWJnRw2CjLPTP8pTSLyx0VgALXL57SWv
	tKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+bWoHX9dJd/bA6aS9eNQ3Az6sjevWAq6lV9G60LDU5g=;
	b=qTOIs/78EgznMJwM1DtGbilEgJn+5eJhxXKOzkoatHcl15IETFZX+f/FlvKXJshkOY
	zKm0gAYthOSzZbDrDuq5oxfv9z1V0zOYbzycUFl0a7zjCmNGy9zmrs//Ev331vfUOoZX
	x1DJedstetboVMk/9f5k7v8H+mGjKJxYl9aWRCm6yy05qywZYq6bXWd25CG6bEsfceow
	4y3vGcW7ock5251vqF5AEnrn6NMehnD1UmjgRm2c/gM/vhtUc0/zbnQ6y+8zqsBwfvUk
	7p8a6THa4dpC59jcaSetoXqvKGs9eXMMdDeVZzVlJyE03ekXrpx8txmBu8qLohqiCSg8
	dZWw==
X-Gm-Message-State: AJaThX46ntDp9HzGaWRBLm5P5TnRXgBPNYvR5eruWfRqGIsMjSsxb+LR
	5rBCy1lUHPklqbwf39G3N+2/kC7PKM9sQmjulY0=
X-Google-Smtp-Source: AGs4zMZPuaHjAnjYoEZOD6MM4VXlRMwPGSMekCo4AZ0I3gOsD+km4NoZn3U48YyjLHTOhRQWMiDnN3xyrku1HbapqIk=
X-Received: by 10.55.207.207 with SMTP id v76mr138233qkl.243.1510089477019;
	Tue, 07 Nov 2017 13:17:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.41.130 with HTTP; Tue, 7 Nov 2017 13:17:16 -0800 (PST)
In-Reply-To: <d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
	<d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
From: Neal Gompa <ngompa13@gmail.com>
Date: Tue, 7 Nov 2017 16:17:16 -0500
Message-ID: <CAEg-Je-MW3k897aKZmmjh4Q-eFD8Kko=7FLRByv19sGYK1ZxRg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Mark Wielaard <mjw@redhat.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Tue, 07 Nov 2017 21:17:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2017 at 11:00 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/03/2017 07:58 PM, Mark Hatle wrote:
>>>
>>> Unfortunately, this also breaks grub and grub-efi:
>>>
>>> x86_64-poky-linux-musl-objcopy:
>>>
>>> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/gr=
ub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_aranges):
>>> relocation 1 has invalid symbol index 2053731167
>>> x86_64-poky-linux-musl-objcopy:
>>>
>>> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/gr=
ub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module:
>>> invalid relocation type 69
>>> x86_64-poky-linux-musl-objcopy: BFD (GNU Binutils) 2.29.0.20170912
>>> assertion fail ../../bfd/elf64-x86-64.c:351
>>> x86_64-poky-linux-musl-objcopy:
>>>
>>> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/gr=
ub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_info):
>>> relocation 0 has invalid symbol index 1634754402
>>>
>>
>> Look at debugedit.  This is the program used to adjust some of the debug
>> references.
>
>
> Thanks, this is the offending commit:
>
> https://github.com/rpm-software-management/rpm/commit/88989572fff1f31e0c4=
f972a6895585e4742ef4b
>
> Looks like they added sophisticated in-place processing/rewriting of the
> actual binary (that is not possible to switch off). And it fails in case =
of
> grub modules.
>
> We, on the other hand, only need to extract the list of debug source code
> files. Any hint on how to do that without the use of rpm/debugedit? Perha=
ps
> something from binutils/elfutils?
>

This is the first time I'm hearing of this. Has anyone talked to Mark
Wielaard (CC'd to this email) about fixing this properly for you guys?



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

