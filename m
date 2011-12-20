Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RcxKU-00044k-BE
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 11:53:54 +0100
Received: by eaal1 with SMTP id l1so5600115eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 02:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=0ml1Nez3t6ApR5zjYgUpIw10JJ57/hJIdibAL54yFgk=;
	b=DiFh33eg/6CSpwrlnel8DUk06hzPDAdKJxmqDr8xbZF7CsR4NuQ3d5jr1qNofOs/WZ
	mi08y0UnsqH/lLyd+M3mfuZpldxtZAQ10plxyjJV0kpRZXshTx/3AEDA5Flivp1ELjur
	sisUsV8UBOQbyda0IZaY6pjW2MzW2c0LdW85I=
MIME-Version: 1.0
Received: by 10.205.122.68 with SMTP id gf4mr368220bkc.5.1324378010795; Tue,
	20 Dec 2011 02:46:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Tue, 20 Dec 2011 02:46:50 -0800 (PST)
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12ED44B60F@shsmsx501.ccr.corp.intel.com>
References: <cover.1323292966.git.otavio@ossystems.com.br>
	<0ab4225dfaee3c59d5200f9d73d75e4b44f3a498.1323292966.git.otavio@ossystems.com.br>
	<4EE0FEEA.7080806@linux.intel.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12ED44B60F@shsmsx501.ccr.corp.intel.com>
Date: Tue, 20 Dec 2011 08:46:50 -0200
X-Google-Sender-Auth: AX6raAdGGVcXa5gadogaxx6W1n0
Message-ID: <CAP9ODKqC1TzB+rw4HDoRZFPoOqnpo3zhGqvY5Ap5afq14LAXkg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] initramfs-framework: provides a modular initramfs
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
X-List-Received-Date: Tue, 20 Dec 2011 10:53:54 -0000
Content-Type: multipart/alternative; boundary=000e0cdf7124e1c09f04b483c87f

--000e0cdf7124e1c09f04b483c87f
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 19, 2011 at 11:02, Xu, Dongxiao <dongxiao.xu@intel.com> wrote:

> Hi Otavio and Saul,
>
> I tried to build initramfs-framework in Yocto master, and it reports the
> following multiple provider issue:
>
> ERROR: Multiple .bb files are due to be built which each provide udev
> (/home/dongxiao/poky/meta/recipes-core/udev/udev_164.bb/home/dongxiao/poky/meta/recipes-core/udev/
> udev_145.bb).
>

The proper fix IMO is to update udev to what we are using at meta-oe.


> I saw initramfs-framework RDEPENDS on package udev-utils, which doesn't
> exist in latest udev-164, thus it will try to include udev-145. This caused
> the multiple provider issue.
>
> Could you help to have a look at that?
>

Sure.

Sau, you told me you were looking at udev IIRC. Did you checked it?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdf7124e1c09f04b483c87f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Dec 19, 2011 at 11:02, Xu, Dongxiao <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:dongxiao.xu@intel.com">dongxiao.xu@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Hi Otavio and Saul,<br>
<br>
I tried to build initramfs-framework in Yocto master, and it reports the fo=
llowing multiple provider issue:<br>
<br>
ERROR: Multiple .bb files are due to be built which each provide udev (/hom=
e/dongxiao/poky/meta/recipes-core/udev/<a href=3D"http://udev_164.bb" targe=
t=3D"_blank">udev_164.bb</a> /home/dongxiao/poky/meta/recipes-core/udev/<a =
href=3D"http://udev_145.bb" target=3D"_blank">udev_145.bb</a>).<br>
</blockquote><div><br></div><div>The proper fix IMO is to update udev to wh=
at we are using at meta-oe.</div><div>=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">

I saw initramfs-framework RDEPENDS on package udev-utils, which doesn&#39;t=
 exist in latest udev-164, thus it will try to include udev-145. This cause=
d the multiple provider issue.<br>
<br>
Could you help to have a look at that?<br></blockquote><div><br></div><div>=
Sure.</div><div><br></div><div>Sau, you told me you were looking at udev II=
RC. Did you checked it?</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--000e0cdf7124e1c09f04b483c87f--
