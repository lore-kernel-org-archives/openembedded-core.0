Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1D98F772ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:42:19 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id e185so45982065vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 04:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EuInbi//XNWY4hLdi1EkcNp5NNibXiO9SAJts/9nxWw=;
	b=Ro6aMQMrXJ2qavdKzmRetLeZLVi/IiGCs0ibMgDti623Iancx42bOrdKBiT9HbneB9
	OHgRdFTTWq3cTdpt7h56aovnJc+cc2JG4SVj8jCAVsMcakEQqqqZftAUUI1QmqTuChcO
	fHZA1i0NnGcDeUSkhHZ7st2ieTH3TxaksL7FF2ozfWyeN3dTXxj8U/cvt52XQn8M6THw
	OSzOGd+cFwSwtCk4N+QRv67DfXAmImBr8esTvE8TYbcKLloFwFrAmcyP1pbizBrcO0jT
	QD4jO/s5tMUjM1SJVM0O8Nxxk0Oqm0XGn5jqJmN5Ux3PshVJAiKHulqlAap4M5Q/4+FF
	isRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=EuInbi//XNWY4hLdi1EkcNp5NNibXiO9SAJts/9nxWw=;
	b=inBxppf/cR4jHIA2E9hhte9HCXOqxfe72l0QarB5KeS0n1X4LyPeG2AAc+I5pEuzpG
	S0f2rqxLsktm+kvAM3u9lh10LWnx0gKyj8c4iOjiuozzniBWREO84+JABPM8PI7DSVcg
	yedOuJurnshGX2f3iywmteR3WYZGt7KvJrZSWUqFCu7xbvqpLL+I/4tvyGj4YvSp4wk+
	c2WbBtA/mVNZeROARfoVJKYm05kxywbyx8ROy/QKXVVrRQqSnhrB+nZMHRmRHp7YNtMr
	NdDmUArGII713N2+HDr+ejZnTbK/dgd1fbbbrBFNTU56oEePhFZkDsUx3Gn8WnYITLZV
	6h+A==
X-Gm-Message-State: AG10YOTuZPyotwn3kxegPTp225yWaLsRbIo133S5gvl8zimZf+NI6DRr4eRYYPMrsxlW1PnzVN5aZUYHCSuSRA==
MIME-Version: 1.0
X-Received: by 10.31.167.195 with SMTP id q186mr35648869vke.113.1456404140247; 
	Thu, 25 Feb 2016 04:42:20 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Thu, 25 Feb 2016 04:42:20 -0800 (PST)
In-Reply-To: <56CED925.5090700@windriver.com>
References: <56CED925.5090700@windriver.com>
Date: Thu, 25 Feb 2016 07:42:20 -0500
Message-ID: <CADkTA4PM1AYzUH9d8RGOyaeMmQmr+iSXRjcEQGpqWj7TCXNcwQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
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
X-List-Received-Date: Thu, 25 Feb 2016 12:42:21 -0000
Content-Type: multipart/alternative; boundary=001a11425fba6dd09f052c9783ca

--001a11425fba6dd09f052c9783ca
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 25, 2016 at 5:36 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Hi Bruce and Darren,
>
> We need enable target kernel's CONFIG_SCSI_VIRTIO=y to make native qemu
> can boot hdddirect, vmdk, qcow2 and vdi, otherwise, the scsi drive can't
> work in qemu since our vm image's root default to /dev/sda2, or we can
> change it default to /dev/hda2, then we don't have to make any changes
> on kernel, but I prefer scsi since ide is going to be out of date.
>

The IDE fragment was on for compatibility reasons, but we dropped that
compatibility about a year ago. I was under the impression that we had
fully dropped all the IDE fragments.


>
> I've tried to enable it by menuconfig, it works well, would you please
> enable it by default ?
>


Send a patch to the linux-yocto mailing list to change the virtio
configuration
fragment.

You are already set up to test it out, so it is much easier.

I don't see why this shouldn't follow the normal patch flow for
configuration
frag changes.

Cheers,

Bruce


>
>
> $ diff .config.old .config -Nur
> --- .config.old 2016-02-25 01:04:25.816381913 -0800
> +++ .config     2016-02-25 01:16:31.332232759 -0800
> @@ -1479,7 +1479,7 @@
>  # CONFIG_SCSI_DEBUG is not set
>  # CONFIG_SCSI_PMCRAID is not set
>  # CONFIG_SCSI_PM8001 is not set
> -# CONFIG_SCSI_VIRTIO is not set
> +CONFIG_SCSI_VIRTIO=y
>  # CONFIG_SCSI_DH is not set
>  # CONFIG_SCSI_OSD_INITIATOR is not set
>  CONFIG_ATA=y
>
> $ du bzImage bzImage_new
> 6752    bzImage
> 6756    bzImage_new
>
> It nearly has no impact on the size.
>
> --
> Thanks
>
> Robert
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11425fba6dd09f052c9783ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Feb 25, 2016 at 5:36 AM, Robert Yang <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Bruce=
 and Darren,<br>
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
ckquote><div><br></div><div>The IDE fragment was on for compatibility reaso=
ns, but we dropped that</div><div>compatibility about a year ago. I was und=
er the impression that we had</div><div>fully dropped all the IDE fragments=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I&#39;ve tried to enable it by menuconfig, it works well, would you please<=
br>
enable it by default ?<br></blockquote><div><br></div><div><br></div><div>S=
end a patch to the linux-yocto mailing list to change the virtio configurat=
ion</div><div>fragment.</div><div><br></div><div>You are already set up to =
test it out, so it is much easier.</div><div><br></div><div>I don&#39;t see=
 why this shouldn&#39;t follow the normal patch flow for configuration</div=
><div>frag changes.</div><div><br></div><div>Cheers,</div><div><br></div><d=
iv>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
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
It nearly has no impact on the size.<span class=3D"HOEnZb"><font color=3D"#=
888888"><br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11425fba6dd09f052c9783ca--
