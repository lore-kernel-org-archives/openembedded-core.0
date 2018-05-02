Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id C5599747C7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 15:51:38 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id b23-v6so21584367lfg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=P2krimfdkqR+OSP3H9LZn+435fzF1noLFLN481jgck4=;
	b=SJWJZO8fqId7f0mbmlDNR4GsHB8rh+yC0KicyLyzUBHN1PmxNiwVFktN4j8MVPlLbN
	w9LPEjbcFd4Vb5JX9mMyP+rHxbeCEWP0hXcs/uVmmpZxpzYidYUsp351bU9PpLeu/6gf
	pNgpR3W24s50qPF2JaE+CT4UHImtEfIQwtAmIZEIyhWNTK+QpyIsHQaguL30Kiy/7OIk
	XOh2iHteQ4rwIH4SI39yqiztGqKZMZF4duMeBvSNZr9+XrkAlS08EXJjNMGuKpC3iSve
	03FqcbdVQjuxQCf1AYpSM8XftJwIkFOXHZRh4LAQnDba6lt5PVKNN2J6yyeMw2YGLxy7
	UPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=P2krimfdkqR+OSP3H9LZn+435fzF1noLFLN481jgck4=;
	b=G6NAmsL0562On9Uskw8/ilL2P2U7NnDRrLLFUxBOmfoiSp68stQNsBnJYLtUv8zRFV
	6/D4PpHE9h87RhvADAfoD+/EgYdRlEzj9utr42zT0qXVLy1NkdPjoFx2EBYZq6paOLEC
	M1NR4KOjQdr13ohU4RTnu0VtgOpRp/r9nnVMH2j3X3qCvoWINydK9lBLEoS1q3K7mlE3
	0Ib+3hKtSG9eGSwggRea+BNC/8aVSgDvI2sYDhgweCKPbKTxLya6/k2HoSkhBzsS6GcB
	A8mIgWRJXHOEfDgHOaUY/cpIBMm5SBZCf7gMYXGMpdPf4k8KFfmDxktzbQZM0xmf/EeF
	MViw==
X-Gm-Message-State: ALQs6tDD3ulUlTAx8h2Y5IlqdONe6rJxLPN9Qek2jhTxs9EJeRL3ofK6
	TvJ5hVu/5qjVKKOY+MAjB/8LNl7pvGoCBHvLHyBFDQ==
X-Google-Smtp-Source: AB8JxZqPpKfI91T/LnNMjrLgQ7FAb3O/PRgNN928yx7z8Q2o9IUli9foo038FMuJ+keveVO0YQpOBGxRejC4ogt1z5A=
X-Received: by 2002:a2e:760a:: with SMTP id
	r10-v6mr13367922ljc.144.1525276299074; 
	Wed, 02 May 2018 08:51:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:6a0e:0:0:0:0:0 with HTTP;
	Wed, 2 May 2018 08:51:18 -0700 (PDT)
In-Reply-To: <83aa6f73-2835-4b53-621b-4b9fd3b66b15@digitalendoscopy.de>
References: <9536e25b-bbf9-8c21-e44a-c96dd79a848c@digitalendoscopy.de>
	<83aa6f73-2835-4b53-621b-4b9fd3b66b15@digitalendoscopy.de>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 2 May 2018 17:51:18 +0200
Message-ID: <CAPybu_1RMqH4q96Xm6ekNarz015++49Yu4sSP1SMcj1Yn3D-5A@mail.gmail.com>
To: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Question about multi rootfs UIDs when using wic
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
X-List-Received-Date: Wed, 02 May 2018 15:51:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

I just got hit by this one. It is specially nasty because nfsroot
fails to boot if the uids are wrong.

What is the status on this?

On Mon, Jan 22, 2018 at 11:39 AM, Volker Vogelhuber
<v.vogelhuber@digitalendoscopy.de> wrote:
> I finally found out, what's the reason why the included recovery rootfs h=
as
> the wrong UIDs, while the main image has the correct one. The reason seem=
s
> to be the PSEUDO_LOCALSTATEDIR variable that is set to the state dir of t=
he
> main image in both cases.
> I debugged all the calls up to the environment setup in partition.py's
> prepare_rootfs method where a check for an existing PSEUDO_LOCALSTATEDIR
> environment variable is done. That seems to be the problem.
> Instead of using the correct value passed to the prepare_rootfs method, a=
n
> existing ENV value is used that points to the state dir of the main image
> instead of the recovery one's. I guess the reason is that in bitbake.conf
> the PSEUDO_LOCALSTATEDIR is set to the image currently build (which is th=
e
> main image and not the recovery image only referenced by the main image).=
 So
> because that environment variable is already set, the call to mkfs.ext4 f=
or
> the recovery image uses the wrong PSEUDO_LOCALSTATEDIR and does not apply
> the correct UID.
>
> Any ideas how to fix that? I tend to just remove the patch introduced by =
Ed
> Bartosh three years ago (https://patchwork.openembedded.org/patch/90419/)
> because I don't need a custom PSEUDO_PREFIX. But maybe not everyone agree=
s.
>
> On 19.01.2018 17:00, Volker Vogelhuber wrote:
>>
>> I'm currently trying to create a multi RootFS WIC image as mentioned in
>> directdisk-multi-rootfs.wks. For that I have two image recipes. One that
>> is creating only an ext4 image (image-recovery), and the second that is =
also
>> creating a WIC image (image-main). I used the IMAGE_FSTYPES variable for
>> that. The WKS file for the second image is integrating the recovery imag=
e by
>> specifying --rootfs-dir=3Dimage-recovery in it's part description.
>>
>> # primary / recovery image
>> part / --source rootfs --rootfs-dir=3Dimage-main --exclude-path mnt/data=
/
>> mnt/data2/ --fstype=3Dext4 --label primary_rootfs --align 1024 --size 70=
0
>> --overhead-factor=3D1.0
>> part /recovery --source rootfs --rootfs-dir=3Dimage-recovery --fstype=3D=
ext4
>> --label recovery_rootfs --align 1024 --size 640 --overhead-factor=3D1.0
>>
>> The UIDs of the second rootfs (image-main) are correctly set to 0 within
>> the file system when calling mkfs.ext4 during prepare_rootfs_ext. For th=
e
>> recovery rootfs the UID is always set to my own (host) one which is of
>> course not valid for the image where that UID does not exist.
>> I tried calling the mkfs.ext4 command myself from a terminal and for
>> whatever reason an image created out of the rootfs folder of the second
>> image (image-main) recipe is deployed with the correct UID 0, while the
>> rootfs folder of the first image (image-recovery) recipe always uses the=
 UID
>> of the source folder/files.
>>
>> I search the code of e2fsprogs for the line that sets the UID and added =
a
>> printf in set_inode_extra. There I can see clearly that the source UID f=
or
>> the file is 0 for the rootfs of the image-main rootfs folder while it is
>> 10000 (my own UID) for the image-recovery. I wonder how the UID of the
>> image-main rootfs folder can be zero when I don't call any command with =
root
>> permissions. I searched for a preparation step where the UIDs are manage=
d in
>> the scripts folder of Yocto, but didn't found any hint for the whole
>> behavior. So while it is good that the rootfs partition of the main root=
fs
>> has the UID set correctly to zero, I can't understand why it happens. On=
 the
>> other side I can understand why the UID of the recovery rootfs is set to=
 my
>> own one, but it stops me from booting that rootfs because the UIDs of th=
e
>> files and folders are set to a user that does not exist on the target
>> system.
>>
>> Can someone please explain to me, how that UID handling is meant to be
>> done?
>
>
> --
>
>
>
>
> * *
>
> *Volker Vogelhuber* | Head of Software Design
>
>
>
> *PENTAX**Medical
> */Excellence in Focus/
>
>
>
> *T:* // +49 (0)821 650566-18  | *F:* +49 (0)821 650566-20
>
>
>
> Hoya Corporation =E2=80=93 Pentax Medical Division
>
> *Digital Endoscopy GmbH*
>
> Paul-Lenz-Str. 5
>
> 86316 Friedberg =E2=80=93 Germany
>
> pentaxmedical.com
>
>
>
> *Curious*about new *PENTAX*Medical products and activities?
>
> *Follow us*on our Social Media channels!
>
>
>
>   <https://www.linkedin.com/company/pentax-medical-company>
> <https://www.youtube.com/channel/UCn2Ge1Wr7YsPZQiZ25nCkuA>
>
>
>
> Handelsregister HRB 27226
>
> Amtsgericht Augsburg
>
> Gesch=C3=A4ftsf=C3=BChrer: Michael Drexel, Gerald Bottero
>
> _____________________________________
>
>
>
> This e-mail may contain confidential and/or privileged information. If
> you are not the intended recipient (or have received this e-mail in
> error) please notify the sender immediately and destroy this e-mail. Any
> unauthorized copying, disclosure or distribution of the material in this
> e-mail is strictly forbidden.
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
Ricardo Ribalda

