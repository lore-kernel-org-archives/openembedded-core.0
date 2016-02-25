Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id D161F77337
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 18:50:01 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id k196so56867409vka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 10:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vZy+kUrqS623riiSH3WIFhI3wxRbUldRbTeo3wJpwVU=;
	b=sVChwd0Kmmu5sgwrKmuo1aiCcBhZZcMPEqjy0KDdbxLgRQhU2HRrltEqWcjNkVaHIJ
	iUEMkK/MIkPByMo8irHnx7gxBsh0EZukzeRPp6Fn74ZM9ZaJUsps4mI2MSBieF4aCWc8
	bO3ShxoWKA8+SEgjX3X9j2xxxfzAGz/VZgS7HrZsZ6hcrnXPefYs/9fdKTvP8k3KrVPI
	iWT9An6tXRd+TVTMa8eGpIoWqRrlLM2ePbvO2c38Fx9otcOFB2p8QSROCfmhw80SG29y
	MA/3kgdtfSuTJPn9l4WrShXVGzUfyeKUFqBHr/TSFsbCvoCZBQ1AilyVSfZVCkySufvk
	WqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=vZy+kUrqS623riiSH3WIFhI3wxRbUldRbTeo3wJpwVU=;
	b=TShz8LoY+G7pfvbPv2msqpgcXYPsenBnz+fzRUGe7kEadFglNPLw8Sjxc9JbpTCKlH
	lpT8F95xeVx4jI+tc4FvRW8RVrJaNi8p22QP8N4cBExqRy+0BYUqXx5Nqg7rhEI/HGS0
	92zM0rPLXStcaBdmZ6ba3Wj8lLFy9htcuwGKUN32k09BsEk5wv6RYg+ujoG+4da9m86I
	KM4P9oXlRRhCGGJPZ4nFGdVLuwuS/qZ2krmBkHt2lilu9syv4LvDffKb+/bPZZOLox5n
	zrQCfkHqKnZEWJGNCDkv9DMBEuQJ/pMpPaPz2G7Yi+o8JEnh7ECZYypuKzzZf///T5aF
	VRgg==
X-Gm-Message-State: AG10YOSq6eWxlSh4qYV7q53UKKgxwDQHm3IewpdLYifW1xh/vCVgV7e91NiIFTsQmpawJzJhbi9E+XVyETQmOA==
MIME-Version: 1.0
X-Received: by 10.31.141.194 with SMTP id p185mr33920975vkd.57.1456426201948; 
	Thu, 25 Feb 2016 10:50:01 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Thu, 25 Feb 2016 10:50:01 -0800 (PST)
In-Reply-To: <CADkTA4PM1AYzUH9d8RGOyaeMmQmr+iSXRjcEQGpqWj7TCXNcwQ@mail.gmail.com>
References: <56CED925.5090700@windriver.com>
	<CADkTA4PM1AYzUH9d8RGOyaeMmQmr+iSXRjcEQGpqWj7TCXNcwQ@mail.gmail.com>
Date: Thu, 25 Feb 2016 13:50:01 -0500
Message-ID: <CADkTA4P3y2VBJRXuMkxMA0VX47HNzWm0eeKXTVCv3osBkTvhfQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Darren Hart <dvhart@linux.intel.com>, Saul Wold <saul.wold@intel.com>,
	California Sullivan <california.l.sullivan@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu needs target kernel sets CONFIG_SCSI_VIRTIO=y to boot vmdk qcow2 and vdi
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
X-List-Received-Date: Thu, 25 Feb 2016 18:50:02 -0000
Content-Type: multipart/alternative; boundary=001a1142621468a501052c9ca631

--001a1142621468a501052c9ca631
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 25, 2016 at 7:42 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Thu, Feb 25, 2016 at 5:36 AM, Robert Yang <liezhi.yang@windriver.com>
> wrote:
>
>> Hi Bruce and Darren,
>>
>> We need enable target kernel's CONFIG_SCSI_VIRTIO=y to make native qemu
>> can boot hdddirect, vmdk, qcow2 and vdi, otherwise, the scsi drive can't
>> work in qemu since our vm image's root default to /dev/sda2, or we can
>> change it default to /dev/hda2, then we don't have to make any changes
>> on kernel, but I prefer scsi since ide is going to be out of date.
>>
>
> The IDE fragment was on for compatibility reasons, but we dropped that
> compatibility about a year ago. I was under the impression that we had
> fully dropped all the IDE fragments.
>

Adding Cal and Saul, since we are working through all these configs in
another effort, so I wanted to get their thoughts as well.

I had a chance to go back and look at the configs, and even though I can
find the email where it has been proposed, and I've agreed, to shoot
CONFIG_IDE
in the head, and use generic SCSI instead .. config IDE is still in
 common-pc-drivers.cfg
which means that x86 board, and the x86 kvm guest are picking it up.

Cal/Saul: does this match what you are seeing ?


>
>>
>> I've tried to enable it by menuconfig, it works well, would you please
>> enable it by default ?
>>
>
>
> Send a patch to the linux-yocto mailing list to change the virtio
> configuration
> fragment.
>
> You are already set up to test it out, so it is much easier.
>
> I don't see why this shouldn't follow the normal patch flow for
> configuration
> frag changes.
>

Back to this. We just need a patch to the linux-yocto list, for the
configuration
change, and we can evaluate it like any other patch!

Cheers,

Bruce


>
> Cheers,
>
> Bruce
>
>
>>
>>
>> $ diff .config.old .config -Nur
>> --- .config.old 2016-02-25 01:04:25.816381913 -0800
>> +++ .config     2016-02-25 01:16:31.332232759 -0800
>> @@ -1479,7 +1479,7 @@
>>  # CONFIG_SCSI_DEBUG is not set
>>  # CONFIG_SCSI_PMCRAID is not set
>>  # CONFIG_SCSI_PM8001 is not set
>> -# CONFIG_SCSI_VIRTIO is not set
>> +CONFIG_SCSI_VIRTIO=y
>>  # CONFIG_SCSI_DH is not set
>>  # CONFIG_SCSI_OSD_INITIATOR is not set
>>  CONFIG_ATA=y
>>
>> $ du bzImage bzImage_new
>> 6752    bzImage
>> 6756    bzImage_new
>>
>> It nearly has no impact on the size.
>>
>> --
>> Thanks
>>
>> Robert
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1142621468a501052c9ca631
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Feb 25, 2016 at 7:42 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><br><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">O=
n Thu, Feb 25, 2016 at 5:36 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex">Hi Bruce and Darren,<br>
<br>
We need enable target kernel&#39;s CONFIG_SCSI_VIRTIO=3Dy to make native qe=
mu<br>
can boot hdddirect, vmdk, qcow2 and vdi, otherwise, the scsi drive can&#39;=
t<br>
work in qemu since our vm image&#39;s root default to /dev/sda2, or we can<=
br>
change it default to /dev/hda2, then we don&#39;t have to make any changes<=
br>
on kernel, but I prefer scsi since ide is going to be out of date.<br></blo=
ckquote><div><br></div></span><div>The IDE fragment was on for compatibilit=
y reasons, but we dropped that</div><div>compatibility about a year ago. I =
was under the impression that we had</div><div>fully dropped all the IDE fr=
agments.</div></div></div></div></blockquote><div><br></div><div>Adding Cal=
 and Saul, since we are working through all these configs in</div><div>anot=
her effort, so I wanted to get their thoughts as well.</div><div><br></div>=
<div>I had a chance to go back and look at the configs, and even though I c=
an</div><div>find the email where it has been proposed, and I&#39;ve agreed=
, to shoot CONFIG_IDE</div><div>in the head, and use generic SCSI instead .=
. config IDE is still in =C2=A0common-pc-drivers.cfg</div><div>which means =
that x86 board, and the x86 kvm guest are picking it up.</div><div><br></di=
v><div>Cal/Saul: does this match what you are seeing ?</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><span class=3D""><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-c=
olor:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<br>
I&#39;ve tried to enable it by menuconfig, it works well, would you please<=
br>
enable it by default ?<br></blockquote><div><br></div><div><br></div></span=
><div>Send a patch to the linux-yocto mailing list to change the virtio con=
figuration</div><div>fragment.</div><div><br></div><div>You are already set=
 up to test it out, so it is much easier.</div><div><br></div><div>I don&#3=
9;t see why this shouldn&#39;t follow the normal patch flow for configurati=
on</div><div>frag changes.</div></div></div></div></blockquote><div><br></d=
iv><div>Back to this. We just need a patch to the linux-yocto list, for the=
 configuration</div><div>change, and we can evaluate it like any other patc=
h!</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div class=3D"gmail_quote"><div><br></div><div>Cheers,</div><div><br></div>=
<div>Bruce</div><span class=3D""><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<br>
<br>
$ diff .config.old .config -Nur<br>
--- .config.old 2016-02-25 01:04:25.816381913 -0800<br>
+++ .config=C2=A0 =C2=A0 =C2=A02016-02-25 01:16:31.332232759 -0800<br>
@@ -1479,7 +1479,7 @@<br>
=C2=A0# CONFIG_SCSI_DEBUG is not set<br>
=C2=A0# CONFIG_SCSI_PMCRAID is not set<br>
=C2=A0# CONFIG_SCSI_PM8001 is not set<br>
-# CONFIG_SCSI_VIRTIO is not set<br>
+CONFIG_SCSI_VIRTIO=3Dy<br>
=C2=A0# CONFIG_SCSI_DH is not set<br>
=C2=A0# CONFIG_SCSI_OSD_INITIATOR is not set<br>
=C2=A0CONFIG_ATA=3Dy<br>
<br>
$ du bzImage bzImage_new<br>
6752=C2=A0 =C2=A0 bzImage<br>
6756=C2=A0 =C2=A0 bzImage_new<br>
<br>
It nearly has no impact on the size.<span><font color=3D"#888888"><br>
<br>
-- <br>
Thanks<br>
<br>
Robert<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></span></div><span class=3D""><font color=3D"#88=
8888"><br><br clear=3D"all"><div><br></div>-- <br><div>&quot;Thou shalt not=
 follow the NULL pointer, for chaos and madness await thee at its end&quot;=
</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a1142621468a501052c9ca631--
