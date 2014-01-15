Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 688046E362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:37:58 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so1007578obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=dC52vseYPcqfmU5tLZ6ih/d/vEyM42QEn/lZyNYm8Ds=;
	b=A9QUYqsje1AK9DMFeSeynd1DL38wfv4Fm9QgcjT9ZDarTXa/w3kS7GH6vciUsWNhJ+
	21dFUc+WgeHBwLtLFa1sHgLeP7zeQ/PqfVibSwuHoST0Jte+YC8GuruzbQPaI/StgZDR
	JPbfTieJeFIYZkLrL++LrYeYZXoYgFoeS9tVi3PWhsr6J1oziSvWkIM96FCo/UR4KxZm
	trNbVeSXxZmOtDE35rHIRqf03AHc1AfCQVaz6n2+CwaB2xdz0n1k3Gr8df+85vsaik25
	0rm3bHED0DUW6LYY+HDH13/xqUJAC/3YIrUEzhBWu2V6M6DHxrCeNXwLfzs76n1PQ/iW
	IJRw==
MIME-Version: 1.0
X-Received: by 10.182.18.102 with SMTP id v6mr526954obd.71.1389785879334; Wed,
	15 Jan 2014 03:37:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:37:59 -0800 (PST)
In-Reply-To: <c66dfbf119c73bbb6585287daa376ab14bf11662.1389770944.git.anders@chargestorm.se>
References: <cover.1389770944.git.anders@chargestorm.se>
	<c66dfbf119c73bbb6585287daa376ab14bf11662.1389770944.git.anders@chargestorm.se>
Date: Wed, 15 Jan 2014 09:37:59 -0200
X-Google-Sender-Auth: NWudAZRCEatO3BLgYOoZkpdGgKU
Message-ID: <CAP9ODKqEe-tYm1XtwUQ5PV6Sh6pqFypr9WP0yEQbo35rU4B2Tg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Anders Darander <anders@chargestorm.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd-compat-units: remove dnsmasq from sysv disabled list
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
X-List-Received-Date: Wed, 15 Jan 2014 11:37:58 -0000
Content-Type: multipart/alternative; boundary=001a11c339e6a6d46e04f000bd49

--001a11c339e6a6d46e04f000bd49
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 5:31 AM, Anders Darander <anders@chargestorm.se>wrote:

> The dnsmasq recipe in meta-networking ships a dnsmasq.service file, that
> will
> correctly override the SysV init script. Thus, as pointed out by Ross
> Burton,
> we should remove dnsmasq from the list.
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c339e6a6d46e04f000bd49
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 15, 2014 at 5:31 AM, Anders Darander <span dir=3D"ltr">=
&lt;<a href=3D"mailto:anders@chargestorm.se" target=3D"_blank">anders@charg=
estorm.se</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">The dnsmasq recipe in meta-networking ships a dnsmasq.serv=
ice file, that will<br>

correctly override the SysV init script. Thus, as pointed out by Ross Burto=
n,<br>
we should remove dnsmasq from the list.<br>
<br>
Signed-off-by: Anders Darander &lt;<a href=3D"mailto:anders@chargestorm.se"=
>anders@chargestorm.se</a>&gt;<br></blockquote><div><br></div><div>Reviewed=
-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@=
ossystems.com.br</a>&gt;</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--001a11c339e6a6d46e04f000bd49--
