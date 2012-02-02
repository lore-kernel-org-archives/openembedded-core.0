Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rsp8A-0003nf-Vj
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 06:22:47 +0100
Received: by lahc1 with SMTP id c1so1072199lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 21:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=eZu1apAG0l9YAGKO+Bji8RuKdzf/VrpvPMlxkpSFDNE=;
	b=fKrPUxIGBhOYxDEg1vXNdmSKUwoBH8MYsIrb4yGohH0Nm0WvJ08bMpzMoYyf8hpcgu
	Uepkzp+NHIgCCnv1Ehdp3fs28qB8NXWnrD37EMjHAJS9AVjAa7mTzhUhsfXTHIn6kxYn
	3PQZF8Hi3I44Gns4X19CTzTHrd4EcfE5KZW24=
Received: by 10.152.114.169 with SMTP id jh9mr698584lab.20.1328159691223; Wed,
	01 Feb 2012 21:14:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 1 Feb 2012 21:14:21 -0800 (PST)
In-Reply-To: <CADkTA4P4_=Sge32w4UrP+CM5n5wvoV_G_5LcoZiWGPbNdYd-pg@mail.gmail.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
	<6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<5c0971fd58af250c14b7eeaa3206e1b8c5bff840.1328133261.git.nitin.a.kamble@intel.com>
	<CAMKF1spB8Sji8p5ZY-czfLn44axDKNYUxgkb7PA2D-rNmVTfZw@mail.gmail.com>
	<CADkTA4P4_=Sge32w4UrP+CM5n5wvoV_G_5LcoZiWGPbNdYd-pg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2012 21:14:21 -0800
Message-ID: <CAMKF1sp=xQVj6ujdnTXKLE9NSivwmZpWXxwmLQBsNSvw77TQPA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] linux-libc-headers: new recipes for latest upstream 3.2.2
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
X-List-Received-Date: Thu, 02 Feb 2012 05:22:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2012 at 5:01 PM, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> On Wed, Feb 1, 2012 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Feb 1, 2012 at 1:55 PM, =C2=A0<nitin.a.kamble@intel.com> wrote:
>>> +SRC_URI +=3D " file://connector-msg-size-fix.patch"
>>
>> I happen to peek into this patch. It seems this patch should not be appl=
ied
>> since its specific to a wrs kernel and linux-yocto does not apply this p=
atch
>> as well.
>
> The latter is true (this isn't applied to linux-yocto), but the former
> isn't quite true.
> It was required in 2.6.34, where we used the Wind River kernel
> directly. It wasn't
> specific to the Wind River kernel, it was associated with the kernel vers=
ion.
>

in nutshell it can be dropped now. Right  ?

> Cheers,
>
> Bruce
>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


