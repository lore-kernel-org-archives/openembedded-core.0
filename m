Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S2YDf-00032e-K9
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 02:20:39 +0100
Received: by daln34 with SMTP id n34so5942618dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 17:12:10 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.227.137 as permitted sender) client-ip=10.68.227.137; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.227.137 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.227.137])
	by 10.68.227.137 with SMTP id sa9mr18296pbc.29.1330477930781 (num_hops
	= 1); Tue, 28 Feb 2012 17:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=QfZl+SXYODO87r7LMe2qTlV11cKy4+aOu9M1LXwbq7g=;
	b=uHfoWjzfr837OWiUvEZtg1qqMfh1uIGJyrq72vDsRMBUVDrdYU49JjzYK5A9atu9jL
	ZeBMAYROAcHVPZZSrfGpmEB47PFxgbdRVaaR0du/v3wwP8Z05Uh8lrCH5FeBF12QygMC
	6V8++j4+6LKQevvHApYzNik7llCatYgpvx9II=
MIME-Version: 1.0
Received: by 10.68.227.137 with SMTP id sa9mr14541pbc.29.1330477930457; Tue,
	28 Feb 2012 17:12:10 -0800 (PST)
Received: by 10.143.67.8 with HTTP; Tue, 28 Feb 2012 17:12:10 -0800 (PST)
In-Reply-To: <CAP9ODKqRy=O1tdqUZUyq=_L0gFnwNr55e9-E-djx+hWda8G63A@mail.gmail.com>
References: <1330346629.4593.20.camel@ted>
	<D1E600DA-4C86-4459-8820-F8B2AE88AAEF@dominion.thruhere.net>
	<CAAQYJAvgS3gsZ8XCOcU89QgESvxsMsYYYfe_x-DF05m7ibeLwg@mail.gmail.com>
	<CAP9ODKqRy=O1tdqUZUyq=_L0gFnwNr55e9-E-djx+hWda8G63A@mail.gmail.com>
Date: Wed, 29 Feb 2012 02:12:10 +0100
Message-ID: <CAAQYJAvEq01D7rNYMM4icECyWFz5ETvvnmwrd8B2B6k-ZwBcRg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Refactor compression code into a generic compression solution
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
X-List-Received-Date: Wed, 29 Feb 2012 01:20:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 29, 2012 at 12:48 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Feb 28, 2012 at 20:41, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
>> | ln: failed to create symbolic link
>> `/oe/oe-core/build/tmp-eglibc/deploy/images/initramfs-kexecboot-klibc-im=
age-poodle.cpio.lzma':
>> File exists
>>
>> Looking at run.do_rootfs I see runimagecmd is called twice.
>>

Note that I set  INITRAMFS_FSTYPES ?=3D "cpio.gz cpio.lzma"
If I only have one single fstype (cpio.lzma) all is fine.

Cheers

Andrea


>> In the log.do_rootfs there is also a strange
>
> I found many issues with shell variable expanding in current bitbake;
> I described the issue in #yocto but it seems I am the only one to have
> those problems.
>
> Basically it seems:
>
> export FOO=3Dbar
>
> Parses fine but /don't work/.
>
> export FOO=3D"bar"
>
> Works.
>
>
> --
> Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.oss=
ystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


