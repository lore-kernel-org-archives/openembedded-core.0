Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 71A886B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:33:36 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id l6so1029493oag.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DgA608H5pCUZsG7d/T0Nu8xmBIqUbAp7IYOTtevJZso=;
	b=bLD0+h0haAv8ug0Vw5Wg34Iac3urlwd8B1qwiIXVl8OSBJdEhaz9ZHxUmysXRK3in3
	2fLcuQCcqidXpQ+/iYaT7DD8/h8sK6Z3yXkPFCPQUqYVmATdj1FP/CeEAu56Czlskvrk
	KcW9A+CfzIuE52FIuvKWxK4t6MzmAEsCMNnHMO3NYKYo8oIFEuntQTVWbcRsBTbHXEQw
	pH4e+6Zi8SLJtREVNiVYYhVnS4sX36XA/8AWM+8cL4SDxbueUqNnkEbH39yvEOYyNKJb
	A0Vo4QOmznvhrcdwAWlznFhuBwC3Ms3kXLDrkeud4NkuS+0wcrwyt8mD55zhjGO2XG3S
	deLw==
MIME-Version: 1.0
X-Received: by 10.60.33.7 with SMTP id n7mr1304096oei.25.1389785617280; Wed,
	15 Jan 2014 03:33:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:33:37 -0800 (PST)
In-Reply-To: <1389785224-56756-1-git-send-email-krzysztof.m.sywula@intel.com>
References: <1389785224-56756-1-git-send-email-krzysztof.m.sywula@intel.com>
Date: Wed, 15 Jan 2014 09:33:37 -0200
X-Google-Sender-Auth: DERxAG0HdHp2OztmwVHLJD8SggQ
Message-ID: <CAP9ODKoSaJTQogSf68bOmGhv7FPW5C6SULyc20-ospkcvkavFw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: krzysztof.m.sywula@intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initrdscripts: add $CMDLINE to init-live switch_root
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
X-List-Received-Date: Wed, 15 Jan 2014 11:33:36 -0000
Content-Type: multipart/alternative; boundary=089e01182c7e08349104f000ae7c

--089e01182c7e08349104f000ae7c
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 9:27 AM, <krzysztof.m.sywula@intel.com> wrote:

> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>
> init-live.sh: $CMDLINE variable should be provided to switch_root
> to let user specify runlevel on grub command line.
> Feeding with -c /dev/console as well as busybox switch_root enables that
> option.
>
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e01182c7e08349104f000ae7c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Wed, Jan 15, 2014 at 9:27 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:k=
rzysztof.m.sywula@intel.com" target=3D"_blank">krzysztof.m.sywula@intel.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: Krzysztof Sywula &lt;<a href=3D"mailto:krzysztof.m.s=
ywula@intel.com">krzysztof.m.sywula@intel.com</a>&gt;<br>

<br>
init-live.sh: $CMDLINE variable should be provided to switch_root<br>
to let user specify runlevel on grub command line.<br>
Feeding with -c /dev/console as well as busybox switch_root enables that op=
tion.<br>
<br>
Signed-off-by: Krzysztof Sywula &lt;<a href=3D"mailto:krzysztof.m.sywula@in=
tel.com">krzysztof.m.sywula@intel.com</a>&gt;<br></blockquote><div><br></di=
v><div>Reviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br">otavio@ossystems.com.br</a>&gt;</div>
<div><br></div></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e01182c7e08349104f000ae7c--
