Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 83CFD772E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:42:51 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id e6so45946928vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 04:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4od8KZoG0V9ZBZm4NJGmE11V3SE80cUNmLIT1MlvTD8=;
	b=H6cx6XLMFDOQnegJBOrx6QWO4e3lefFWHDvUk8WULPmTSofRsxO4BlHsgAeEnbmxs0
	5PiFVbGCrofIZ7OdNqDLqY7DL1zZgIUIqUaAaiqOm5kkhTr7B+ts3xtY80mDyGSmyTmZ
	1x0yYOSm67KWg8rNat/RMONdTz3JCHA+VbTCZLZyb+sbzypZL3ey1iCk8bdBJT+Gagqw
	9X1hVPFuP+SLzj+H0RAfUB5WJ3PiDFXpZQXMaCiXqBvQzVo6FPxjY0UAyH0xP2CCFAig
	S0gX2MIP0ItHAvz6geiGD//OVbaOmRu6xEkFyqWCn5sQ+NnbBhIahYUMYJ0upvmYjzNt
	IMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4od8KZoG0V9ZBZm4NJGmE11V3SE80cUNmLIT1MlvTD8=;
	b=c+TqZ10UWFw3oqYf3Pq3eUizjwEGxljVZTcMu8ibLL5qTEEg2Pw2rTLGXpubvtrn6s
	BkEe/GOjmyZ6jT9TW19rpnp+QLWCfAPZQVzuTGJ5OEO/9H8qjtgPXONBgN6Ur5AUS0pz
	MaX1ZGO+B82rUXLlrb+70F4XBelUAT9L1nw3z0Ad+9JJiTKbpEyu8mfOib2z9kxzB+V2
	kgVmenCoHKLnF+lr9mVAhehAsAiNREsbJcoeoUo4zRCGg4LBnLnj/qg9nSigd3ized9u
	b5+Fkd854Zb83JK+9LUUCbPH2kPpFbMM8pjlnYoy39TIxKq6zkjSrUqctWjCKhFCjvg/
	UmFQ==
X-Gm-Message-State: AG10YOQw1UnzRKgfobW0Ma9LEod6kcLtpYBtyI3+gCQ/HAtPxhQeatL8uAVsZW8k52VnCfuXau921QwlXf7zAQ==
MIME-Version: 1.0
X-Received: by 10.31.141.194 with SMTP id p185mr32651034vkd.57.1456404171755; 
	Thu, 25 Feb 2016 04:42:51 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Thu, 25 Feb 2016 04:42:51 -0800 (PST)
In-Reply-To: <CAJTo0La3R6rUxvNvvPCrXje-QYLtV6LH2wnLnL2gc6iMhLFV5A@mail.gmail.com>
References: <56CED925.5090700@windriver.com>
	<CAJTo0La3R6rUxvNvvPCrXje-QYLtV6LH2wnLnL2gc6iMhLFV5A@mail.gmail.com>
Date: Thu, 25 Feb 2016 07:42:51 -0500
Message-ID: <CADkTA4NrW5QdDyibfDeDmv313-w=p_NkxKjJq_eUpZVogug_SA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 25 Feb 2016 12:42:51 -0000
Content-Type: multipart/alternative; boundary=001a114262144e97d5052c978553

--001a114262144e97d5052c978553
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 25, 2016 at 7:10 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 25 February 2016 at 10:36, Robert Yang <liezhi.yang@windriver.com>
> wrote:
>
>> We need enable target kernel's CONFIG_SCSI_VIRTIO=y to make native qemu
>> can boot hdddirect, vmdk, qcow2 and vdi, otherwise, the scsi drive can't
>> work in qemu since our vm image's root default to /dev/sda2, or we can
>> change it default to /dev/hda2, then we don't have to make any changes
>> on kernel, but I prefer scsi since ide is going to be out of date.
>>
>
> Are there any other virtio drivers that we really should be enabling in
> the qemu kernels?
>

We already have a fragment for this, and a set of virtio drivers enabled ..
which
is why I find this entire thread confusing :)

Bruce


>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114262144e97d5052c978553
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Feb 25, 2016 at 7:10 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote"=
>On 25 February 2016 at 10:36, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"o=
verflow:hidden">We need enable target kernel&#39;s CONFIG_SCSI_VIRTIO=3Dy t=
o make native qemu<br>
can boot hdddirect, vmdk, qcow2 and vdi, otherwise, the scsi drive can&#39;=
t<br>
work in qemu since our vm image&#39;s root default to /dev/sda2, or we can<=
br>
change it default to /dev/hda2, then we don&#39;t have to make any changes<=
br>
on kernel, but I prefer scsi since ide is going to be out of date.</div></b=
lockquote></div><br></span>Are there any other virtio drivers that we reall=
y should be enabling in the qemu kernels?</div></div></blockquote><div><br>=
</div><div>We already have a fragment for this, and a set of virtio drivers=
 enabled .. which</div><div>is why I find this entire thread confusing :)</=
div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr"><span class=3D"HOEnZb"><font color=3D"#888888"><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></fo=
nt></span></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end&quot;</div>
</div></div>

--001a114262144e97d5052c978553--
