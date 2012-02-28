Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2Wue-00010Q-Jl
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 00:56:56 +0100
Received: by vcbfl13 with SMTP id fl13so2673227vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 15:48:28 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.99.231 as permitted sender) client-ip=10.52.99.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.99.231 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.99.231])
	by 10.52.99.231 with SMTP id et7mr15344335vdb.114.1330472908212
	(num_hops = 1); Tue, 28 Feb 2012 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kuiDSHjG4hgV6a9+SqMX6hBN4KpSONrHRN/8TqU1u8U=;
	b=YohUtzD+6XEPUwVl7n8domQbLZiagcygr39O2cGGcO3yNMSrs4bvd6wNyegce5Tnms
	877HhBWQckArmYIKDzn5/SB9KSOqIy1f4naxoP4T3OUL9130Kbepwf8YgHxqBz+Z9ELL
	JrCaafC9dHn/HsXkZe8zpPqB8W2l6T4Qt++c4=
MIME-Version: 1.0
Received: by 10.52.99.231 with SMTP id et7mr12701953vdb.114.1330472908093;
	Tue, 28 Feb 2012 15:48:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 28 Feb 2012 15:48:28 -0800 (PST)
In-Reply-To: <CAAQYJAvgS3gsZ8XCOcU89QgESvxsMsYYYfe_x-DF05m7ibeLwg@mail.gmail.com>
References: <1330346629.4593.20.camel@ted>
	<D1E600DA-4C86-4459-8820-F8B2AE88AAEF@dominion.thruhere.net>
	<CAAQYJAvgS3gsZ8XCOcU89QgESvxsMsYYYfe_x-DF05m7ibeLwg@mail.gmail.com>
Date: Tue, 28 Feb 2012 20:48:28 -0300
X-Google-Sender-Auth: -qpxywsYp4qP_wR0c4zeiV9hK_I
Message-ID: <CAP9ODKqRy=O1tdqUZUyq=_L0gFnwNr55e9-E-djx+hWda8G63A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Tue, 28 Feb 2012 23:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 20:41, Andrea Adami <andrea.adami@gmail.com> wrote:
> | ln: failed to create symbolic link
> `/oe/oe-core/build/tmp-eglibc/deploy/images/initramfs-kexecboot-klibc-ima=
ge-poodle.cpio.lzma':
> File exists
>
> Looking at run.do_rootfs I see runimagecmd is called twice.
>
> In the log.do_rootfs there is also a strange

I found many issues with shell variable expanding in current bitbake;
I described the issue in #yocto but it seems I am the only one to have
those problems.

Basically it seems:

export FOO=3Dbar

Parses fine but /don't work/.

export FOO=3D"bar"

Works.


--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


