Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1Tm2Cy-0004U7-Tx
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 14:00:14 +0100
Received: from mail-ob0-f198.google.com ([209.85.214.198])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 04:44:25 -0800
Received: by mail-ob0-f198.google.com with SMTP id un3so19228589obb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 04:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=dDeZ27xAoXfY48p8+O54DlSn5O9GSkEFCzouSOEfM10=;
	b=hayBtxvrt5ByVA+heE2fquh9WoYIiKTAInBkKGynxTcOBVIN3Mv4fJc0Whxr/9cEer
	krXI2T/XFkAAGVKVqBJUj65+59vUEEoKn/G/6M36qmG3Xm+ww837f/3YdV+IXTnGEUDA
	Zs56coZXa8OnekBjd8BvkFtOunaalH4vdEh++in2j2X0bApT5ofVXAB0sMBVVQQpkRXX
	jUFyhZK2vQNP0z6x8TKmlTmZy1cK1syXuqN2XJ3bV8S7Zo57PSWhibL0B4Lt+7355npv
	c9uo/hkiJL3w0WYZpok4hX5Etcjfdh2iUwaSzRhXl+grET1v25c3wXn61gWZvV9kd8xq
	mC4A==
X-Received: by 10.42.139.74 with SMTP id f10mr11542868icu.4.1356093917607;
	Fri, 21 Dec 2012 04:45:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.139.74 with SMTP id f10mr11542859icu.4.1356093917517; Fri,
	21 Dec 2012 04:45:17 -0800 (PST)
Received: by 10.64.49.164 with HTTP; Fri, 21 Dec 2012 04:45:17 -0800 (PST)
In-Reply-To: <CAJTo0LaUveLeohPNW2ADAUPJeVmqOC8EHNNL6S5n0jRW7m7dSw@mail.gmail.com>
References: <cover.1356021837.git.alexandru.damian@intel.com>
	<CAJTo0LbiAedLWj7YNHEjXyS9XhUPpOWcHuB+RUuXhMBkWFSAiQ@mail.gmail.com>
	<CAJ2CSBuAX8OZbCMmiscgUmpTqyxvHf9Nz_DrVVzucKVB=bqWdQ@mail.gmail.com>
	<CAJTo0LaUveLeohPNW2ADAUPJeVmqOC8EHNNL6S5n0jRW7m7dSw@mail.gmail.com>
Date: Fri, 21 Dec 2012 14:45:17 +0200
Message-ID: <CAJ2CSBt5-XuhYeUFahfPewfQ7RupMaHD41F5-QweRBDiaaHvDA@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQncvYAXIIC9Gi+dWZXLdz4nbsfy+Y1fsaGRh+4f/Fw/R6J7kimQb2PI01aNUAQvKNAhMCdYEU4YRQrxb1xy+2kCTC9A9vqgjYU6EmKPYsLNZDPAN/tavLvI4gZRwyYCKESd/BD3B3O0EAv0tKW1c4xTMMcxsZWrtBQCeZcWiDUT9JskPCKN2+/xSjdpw5SooBKZMzLK
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Initial wayland integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 13:00:14 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8db43c575e04d15c381e

--90e6ba6e8db43c575e04d15c381e
Content-Type: text/plain; charset=ISO-8859-1

Incoming reordered patches.


On Fri, Dec 21, 2012 at 2:43 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 21 December 2012 12:38, Damian, Alexandru <alexandru.damian@intel.com>
> wrote:
> > Actually, I'm thinking like this:
> >
> > - wayland, weston - initial commits
> > - mesa-dri - only patches.
> >
> > It makes sense in my mind to add first the commits and then enable the
> > recipe change,
> > especially when it's not gonna work by default anyway (since mesa-git
> isn't
> > enabled).
>
> At patch 2/3 you have a weston package that doesn't build.  Reodering
> to wayland/mesa/weston means you:
>
> - add wayland protocol
> - enable wayland in mesa
> - add weston
>
> It's a logical series of patches, the categorisation of patches vs new
> recipes is irrelevant.
>
> Ross
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>

--90e6ba6e8db43c575e04d15c381e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Incoming reordered patches.</div><div class=3D"gmail_extra=
"><br><br><div class=3D"gmail_quote">On Fri, Dec 21, 2012 at 2:43 PM, Burto=
n, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" targ=
et=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 21 December 2012 12:38,=
 Damian, Alexandru &lt;<a href=3D"mailto:alexandru.damian@intel.com">alexan=
dru.damian@intel.com</a>&gt; wrote:<br>

&gt; Actually, I&#39;m thinking like this:<br>
&gt;<br>
&gt; - wayland, weston - initial commits<br>
&gt; - mesa-dri - only patches.<br>
&gt;<br>
&gt; It makes sense in my mind to add first the commits and then enable the=
<br>
&gt; recipe change,<br>
&gt; especially when it&#39;s not gonna work by default anyway (since mesa-=
git isn&#39;t<br>
&gt; enabled).<br>
<br>
</div>At patch 2/3 you have a weston package that doesn&#39;t build. =A0Reo=
dering<br>
to wayland/mesa/weston means you:<br>
<br>
- add wayland protocol<br>
- enable wayland in mesa<br>
- add weston<br>
<br>
It&#39;s a logical series of patches, the categorisation of patches vs new<=
br>
recipes is irrelevant.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Ross<br>
---------------------------------------------------------------------<br>
Intel Corporation (UK) Limited<br>
Registered No. 1134945 (England)<br>
Registered Office: Pipers Way, Swindon SN3 1RJ<br>
VAT No: 860 2173 47<br>
<br>
This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.<br>
</div></div></blockquote></div><br></div>

--90e6ba6e8db43c575e04d15c381e--
