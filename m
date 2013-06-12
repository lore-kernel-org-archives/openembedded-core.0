Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 34D3E6A874
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:47:29 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id va7so13667585obc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=MqF1+gtlcfN3eo71T5V2j2iY0/VSzNcdG/sCMRAEnuE=;
	b=j6NUrCB5UqBCHRax3Y++GSPBzPzHck2BmnBnWRarLAzLf6BkX/aaefoh4uDqKBdf7a
	nOlIscsH0dePFTVLTpM6xiXyFwnSh6eBIaeDXPjTYm6F9092LCt0+UGrtLN9pu1HVmNo
	bdf0JGMfLVC7EwZJjzmCOaYZoqm3HWuoUBUgYRHj2NBZbpmTPK6Rx4Wslix0i7OGyv8I
	n1P+Fr/uK0HYTC4gG6tkxRRKJRn+ENbwFtnBCdJ+vjWlxXLa9pg4UcUUstcCfYMGGfsB
	MqwM+vq2kvSxEq/JzTbKvwPgpL2ZGXojx9A72tyxYhpnqDP+cuWGcoYU2poFbesJj8Z+
	PxCg==
MIME-Version: 1.0
X-Received: by 10.60.57.101 with SMTP id h5mr16381928oeq.0.1371055649991; Wed,
	12 Jun 2013 09:47:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Wed, 12 Jun 2013 09:47:29 -0700 (PDT)
In-Reply-To: <1371055081-15301-1-git-send-email-andy.voltz@timesys.com>
References: <1371055081-15301-1-git-send-email-andy.voltz@timesys.com>
Date: Wed, 12 Jun 2013 13:47:29 -0300
X-Google-Sender-Auth: Xvp5bBiaNe22qtkIsr2Oyct3ZnI
Message-ID: <CAP9ODKoAbdb8DSzewk8sQfqNB8bu=C0RwUkHmd_B_Xan1ooi=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andy Voltz <andy.voltz@timesys.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines.
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
X-List-Received-Date: Wed, 12 Jun 2013 16:47:29 -0000
Content-Type: multipart/alternative; boundary=089e0141abacfc314204def7c4f9

--089e0141abacfc314204def7c4f9
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 12, 2013 at 1:38 PM, Andy Voltz <andy.voltz@timesys.com> wrote:

> Using CORTEX_ID variable reference in the tuning overrides did not work.
> This reverts those changes, and adds a tuning file for the cortex-a5.
>
> Revert "tune-cortexa5.inc: Add tune file for cortex-a5"
> Revert "tune-cortexa.inc: create a common include for cortex-a armv7a
> tuning"
>
> Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
>

Thanks for fixing this.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0141abacfc314204def7c4f9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jun 12, 2013 at 1:38 PM, Andy Voltz <span dir=3D"ltr">&lt;<=
a href=3D"mailto:andy.voltz@timesys.com" target=3D"_blank">andy.voltz@times=
ys.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Using CORTEX_ID variable reference in the tu=
ning overrides did not work.<br>
This reverts those changes, and adds a tuning file for the cortex-a5.<br>
<br>
Revert &quot;tune-cortexa5.inc: Add tune file for cortex-a5&quot;<br>
Revert &quot;tune-cortexa.inc: create a common include for cortex-a armv7a =
tuning&quot;<br>
<br>
Signed-off-by: Andy Voltz &lt;<a href=3D"mailto:andy.voltz@timesys.com">and=
y.voltz@timesys.com</a>&gt;<br></blockquote><div><br></div><div style>Thank=
s for fixing this.</div><div style><br></div><div style>Acked-by: Otavio Sa=
lvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.=
br</a>&gt;=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e0141abacfc314204def7c4f9--
