Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Qul2o-00038p-MV
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 14:52:58 +0200
Received: by yxl11 with SMTP id 11so603056yxl.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2011 05:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=MaJBJ67h3G6PR7dNdGQDRDUOIB8vRwYT2hWKRyksuEk=;
	b=ET9E4oxI4AMbtPp6oxKaCmYiauRl0y4q7EK385oVzRY8kMzy2FVpZm8xIIN7ZSnjMQ
	zTMj5EsXbDPXo+uCuH4ZKUdy6TpnmXnB0fk5uXkoi9yQ2mTnh9eup6orTl9N8RVnv2y3
	GUWJkDYd7xPjeaW3fQdorrCRFQY4HIgulD3rE=
MIME-Version: 1.0
Received: by 10.101.163.16 with SMTP id q16mr427232ano.76.1313844496346; Sat,
	20 Aug 2011 05:48:16 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Sat, 20 Aug 2011 05:48:16 -0700 (PDT)
In-Reply-To: <CAP9ODKq92dq0Su1RpkT3AkZb8esfe=5_VK-Gc+=xLAAtkSQqMA@mail.gmail.com>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<fe4a8f56697a9915ca59d0dd4bc3f06a4072d7dc.1313816148.git.otavio@ossystems.com.br>
	<CADkTA4PBJLxUQx3PAkuzBxo+hp3B_=hPkx0rZ2_GuUvjQgDbMA@mail.gmail.com>
	<CAP9ODKq92dq0Su1RpkT3AkZb8esfe=5_VK-Gc+=xLAAtkSQqMA@mail.gmail.com>
Date: Sat, 20 Aug 2011 08:48:16 -0400
Message-ID: <CADkTA4MYqPu+8nNpuJqOs4t+AKdiY-SHdDkXgrepPUj5uTmM2g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] kernel.bbclass: move uboot image generation to a specific class
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
X-List-Received-Date: Sat, 20 Aug 2011 12:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 20, 2011 at 1:12 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sat, Aug 20, 2011 at 02:07, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>> These aren't equivalent. We should maintain what is already in kernel.bb=
class
>> and just move it over. If there already a uImage in the build tree, ther=
e's no
>> need to run all the objcopy "mess" below. I found that it created useles=
s binary
>> blobs forme in the past.
>
> In this case can you take a look on this and also fix it in meta-oe?
> The class had some differences and I do think we ought to avoid those
> as much as possible since it only makes debugging harder.

I'm not a meta-oe user. I can look into this, but it will be some time, sin=
ce
my plate is full with yocto 1.1 release items. I just wanted to point out t=
hat
this patch isn't just a movement of code and can't go in as-is, without a g=
ood
reason.

Cheers,

Bruce

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
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


