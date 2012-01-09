Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RkIZM-00065D-W1
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 17:59:38 +0100
Received: by lami14 with SMTP id i14so1411846lam.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 08:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=EKavOVAFJiEtanWmBPsC5LuacvSdqEr1r1QL1dIMlqc=;
	b=sapS5NskMkUG80cmd6yAgIocUTv8++DLEqLZlU+oT2mvP3/9oP8CQl8mbRDYI85+ZF
	vllIcabLk1f/QwR1UehhhEBk+CddR6sjqncfku6FD9WqfwfGVN5ccTIZJLiYftsW32o7
	LscxkiobMm+cqvvwrqQPshN9h9ieHEONwdYIw=
MIME-Version: 1.0
Received: by 10.112.101.163 with SMTP id fh3mr3529777lbb.97.1326127928023;
	Mon, 09 Jan 2012 08:52:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Mon, 9 Jan 2012 08:52:07 -0800 (PST)
In-Reply-To: <4F0B153D.4000602@windriver.com>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
	<CAEsOVNeAuF5u2J_MhZg9tVezexCNyK2rGsZ2sUgBpTeJ90ZVqw@mail.gmail.com>
	<1326096548.3234.3.camel@lenovo.internal.reciva.com>
	<4F0B153D.4000602@windriver.com>
Date: Mon, 9 Jan 2012 14:52:07 -0200
X-Google-Sender-Auth: NB8cReUBgeRYpzeDEW_YZxKbdTg
Message-ID: <CAP9ODKqGRj3DyZwwxCQrAGPX8mufX4NDAaMr2LiEHy1w6tHfPA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Mon, 09 Jan 2012 16:59:40 -0000
Content-Type: multipart/alternative; boundary=f46d04016b0f139beb04b61b38ea

--f46d04016b0f139beb04b61b38ea
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 9, 2012 at 14:26, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 1/9/12 2:09 AM, Phil Blundell wrote:
>
>> You could take a look at the busybox-config.inc stuff in oe-classic as a
>> starting point.  It doesn't do PACKAGECONFIG (since oe-classic doesn't
>> have that) but it can do the equivalent with DISTRO_FEATURES.
>>
>
> At Wind River we've discussed using the kernel configuration fragment
> patching process as a way to control busybox.  This would allow the recipe
> to provide a default fragment (configuration), with machines,
> architectures, and other configurations providing additional fragments --
> that together would produce the busybox that the end use wants.
>
> I think this is a better long term approach then hacking the defconfig
> file each time it's not quite right for a system.  (We may still need to
> modify it over time, but the modifications need to be considered "generic"
> based on the use of busybox in say core-image-minimal...)


I agree with the concept of the idea and long term solution however I also
think it needs to be well documented otherwise it is going to be a problem,
instead of a solution.

When I tried to use the kernel configuration fragment from Yocto I couldn't
figure it out by myself and it seems very undocumented thus its learn curve
is not as good as I'd hope for...

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d04016b0f139beb04b61b38ea
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Jan 9, 2012 at 14:26, Mark Hatle <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 1/9/12 2:09 AM, Phil Blundell wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
You could take a look at the busybox-config.inc stuff in oe-classic as a<br=
>
starting point. =A0It doesn&#39;t do PACKAGECONFIG (since oe-classic doesn&=
#39;t<br>
have that) but it can do the equivalent with DISTRO_FEATURES.<br>
</blockquote>
<br></div>
At Wind River we&#39;ve discussed using the kernel configuration fragment p=
atching process as a way to control busybox. =A0This would allow the recipe=
 to provide a default fragment (configuration), with machines, architecture=
s, and other configurations providing additional fragments -- that together=
 would produce the busybox that the end use wants.<br>

<br>
I think this is a better long term approach then hacking the defconfig file=
 each time it&#39;s not quite right for a system. =A0(We may still need to =
modify it over time, but the modifications need to be considered &quot;gene=
ric&quot; based on the use of busybox in say core-image-minimal...)</blockq=
uote>
<div><br></div><div>I agree with the concept of the idea and long term solu=
tion however I also think it needs to be well documented otherwise it is go=
ing to be a problem, instead of a solution.</div><div><br></div><div>When I=
 tried to use the kernel configuration fragment from Yocto I couldn&#39;t f=
igure it out by myself and it seems very undocumented thus its learn curve =
is not as good as I&#39;d hope for...</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d04016b0f139beb04b61b38ea--
