Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1EE78684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 10:18:54 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id j7so1257657ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 02:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5dunRJOyktkN6MIfk0pp3/H6rphNXYeXNd3LAzGuWJQ=;
	b=Ux2hxsd327kqLMz9wTreXa9YKr9NWk6WGLy8IG/efCx7hepvPQzFaQ+i3vgTGGHnBi
	+nYj1bY6GbFG6hJzcCPeOzsdo3zeCT2FDx/gkNkttD3eI40IwX31H/8DrvYXFIyhSSts
	tidhWV2ux0B9mjadcbiryua66bjoAlAf4DWjOp3rkd5zKt+d0pXKeTj6Lj2leDZBsqau
	iBiB9jt+pJFxPtqUXnmVp0VCLR2vWCSsIXrnHt3PNkUpZ51D1X4HrjRiR9a9JuS4kGPf
	FyejuU16YDWuoJYlEb9+LFANsRlQnf1OrpiZSt6mZ9tX/RtW0mdvQ4IV2M2sBBvwXGcE
	/whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5dunRJOyktkN6MIfk0pp3/H6rphNXYeXNd3LAzGuWJQ=;
	b=CnKybMP++kKkH3gvIE0DUA6uXUkdAm4rOQa/nNZRUBjD519Rc1KrfdXZWX2ZK8eM54
	l/fyHoGqbBMUgs7ToBTa17sq7irDvZonvBhY//ns3+UbQoDU5gZ6t0cE2tfAnHypzHvP
	tCQ+A+KDJB+jpy5VWV0Tg5Kk9a1UyBoJxxgw8Mb/LDyWUblU5gbwGx/Go9pR0Lz4tjSi
	2wyzGX868aR8XmypcCyriTtBKIIhcGp3+AlhChYZ/eFmpTrnGoiIWSj4W455L6MaRx9R
	HkZBB/Nd1SBuLxY9BoK5TX6g2rqIcgyHgOBfVQIiWKpyA4D+iW1ECfCsvbXriflOBHn4
	iY2Q==
X-Gm-Message-State: APf1xPDaEzXLfE81bHk1awSwbI0AzL2t0sjatXlVdYMpoQiXqqcY6Pll
	nyEuJqkHv2BHhH8WnnrNUcX3oHS5/YNPiA1EcWc=
X-Google-Smtp-Source: AG47ELvZdRoP0qkEZHlgELqy39AmSylU8Q+QxO3Cw62gGAZ3yIlnIXXXTRszqNVSE49nt15RFCLa8UoJp3Gyj5FqsN8=
X-Received: by 10.36.7.198 with SMTP id f189mr1704406itf.114.1519381135538;
	Fri, 23 Feb 2018 02:18:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.96.23 with HTTP; Fri, 23 Feb 2018 02:18:35 -0800 (PST)
In-Reply-To: <9671a8bf-0e27-f182-6d8f-4b248dcac860@windriver.com>
References: <20180222141537.229103-1-hongzhi.song@windriver.com>
	<CAP9ODKrAmVyqUa8Kw5JcLCZNP3wMQTKMxhFuPO36crWy=330dQ@mail.gmail.com>
	<9671a8bf-0e27-f182-6d8f-4b248dcac860@windriver.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 23 Feb 2018 11:18:35 +0100
Message-ID: <CAB2nKc8wG5iLR3WrmGimmgeRYQBd2=UozPhep71oCZuiS3KLjA@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Fri, 23 Feb 2018 10:18:54 -0000
Content-Type: multipart/alternative; boundary="001a1143d932dcbc2b0565de7c3f"

--001a1143d932dcbc2b0565de7c3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have MountFlags=3Dslave defined, and I use the following recipe to
automount usb stick without right issues:
https://github.com/nefethael/meta-random/blob/master/recipes-support/usbmou=
nt/usbmount_git.bb
I think we should keep this settings as it is.

What is the problematic use case?

Best regards,
Vincent

2018-02-23 2:23 GMT+01:00 Hongzhi, Song <hongzhi.song@windriver.com>:

> If MountFlags=3Dslave, systemd-udevd mounts all block device,  such as
>
> '/dev/sda1' '/dev/mmcblk*' , in itself unit namespace. So other namespace=
,
>
> such as 'root user', has no access to use block device mentioned above.
>
>
> On 2018=E5=B9=B402=E6=9C=8823=E6=97=A5 08:50, Otavio Salvador wrote:
>
>> On Thu, Feb 22, 2018 at 11:15 AM, Hongzhi.Song
>> <hongzhi.song@windriver.com> wrote:
>>
>>> MountFlags's default value is shared in systemd-udevd.service. But
>>> upstream
>>> sets MountFlags with slave just for keeping mounts done by udev private
>>> to
>>> udevd, which causes block device mounted by udev unvisable but being
>>> busy for
>>> host. So we revert it to shared to be propagated to host.
>>>
>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>>
>> This is what the mountflag does. This does not explain WHY you need this
>> change.
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143d932dcbc2b0565de7c3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div>I have MountFlags=3Dslave=
 defined, and I use the following recipe to automount usb stick without rig=
ht issues:=C2=A0<div><a href=3D"https://github.com/nefethael/meta-random/bl=
ob/master/recipes-support/usbmount/usbmount_git.bb">https://github.com/nefe=
thael/meta-random/blob/master/recipes-support/usbmount/usbmount_git.bb</a><=
br></div><div>I think we should keep this settings as it is.=C2=A0</div><di=
v><br></div><div>What is the problematic use case?</div><div><br></div><div=
>Best regards,</div><div>Vincent</div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">2018-02-23 2:23 GMT+01:00 Hongzhi, Song <span di=
r=3D"ltr">&lt;<a href=3D"mailto:hongzhi.song@windriver.com" target=3D"_blan=
k">hongzhi.song@windriver.com</a>&gt;</span>:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">If MountFlags=3Dslave, systemd-udevd mounts all block device,=C2=A0 su=
ch as<br>
<br>
&#39;/dev/sda1&#39; &#39;/dev/mmcblk*&#39; , in itself unit namespace. So o=
ther namespace,<br>
<br>
such as &#39;root user&#39;, has no access to use block device mentioned ab=
ove.<span class=3D"im HOEnZb"><br>
<br>
<br>
On 2018=E5=B9=B402=E6=9C=8823=E6=97=A5 08:50, Otavio Salvador wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Thu, Feb 22, 2018 at 11:15 AM, Hongzhi.Song<br>
&lt;<a href=3D"mailto:hongzhi.song@windriver.com" target=3D"_blank">hongzhi=
.song@windriver.com</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
MountFlags&#39;s default value is shared in systemd-udevd.service. But upst=
ream<br>
sets MountFlags with slave just for keeping mounts done by udev private to<=
br>
udevd, which causes block device mounted by udev unvisable but being busy f=
or<br>
host. So we revert it to shared to be propagated to host.<br>
<br>
Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.co=
m" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
</blockquote>
This is what the mountflag does. This does not explain WHY you need this ch=
ange.<br>
<br>
</blockquote>
<br>
-- <br></span><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1143d932dcbc2b0565de7c3f--
