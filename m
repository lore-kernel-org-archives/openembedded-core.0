Return-Path: <leon@sidebranch.com>
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
	[209.85.222.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6E87C965
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:13:25 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id k5so2399497uao.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FRYlnZ9x4n/fAwcGHk/PS7SU0CqM9hCkZb8mYU+axfs=;
	b=DYSe7cQxf01TidUXrlM6MLEAreuq10RJibOWLXClkr2hzx638iws43mmL8MLgc8T6+
	S27WxPUwjFdWmrIst7rW+Jyi3xeliagI8d1b/uNncprKYiFn/ApEE4V/4mFRCt01p1JE
	9HaIZb10k2W+csftp1em5ZLg0kOw/yKRH3ItoLT7MyffjU6lgMmDP46bAmdzs0JV6rDZ
	6FLHyBkLKrIKM62KTPzpf6/LqlFJjY+T9W0pRjJvL5u25fHyAXvf+v0x4lXWFX6FvdBG
	hXjDeYbQDPAmvav4r2l9hf8wQkCqAr1EgUWp5myZo4SIPKI6husllxPuOa4/8HX+/IRe
	IITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FRYlnZ9x4n/fAwcGHk/PS7SU0CqM9hCkZb8mYU+axfs=;
	b=AJE3KDqNIRW6SUZXMzN4T7+33z5cOoMvkpzNSnvhOidfKd/NQXQjjVlCR+Nxwor+LA
	jBlyvglW113r82sIkJzKXsfq+ZWRJuqqHXBUx0OCrx0CxZQGBeXlZwMLD7CaofNnQ8cX
	KNVURpMp8ErlQL/9gHc2cyQn6w0pFHM82ekTOQMc0lo4iWkoUuDm1GJ11jFftI111M46
	Sb4RGEMvhm0pcPjg76ILRf9XCEf8/Nd0BkCmQ2/8ixXxHL66qrwBG3J16aLhysYQafGN
	ogGw7Wm6Mz/3cL5Aa30eRgWLCrFE3+sWFPJB5RUThLpuq0SHxLT6GJjtvtm9KZvpuac1
	iz7w==
X-Gm-Message-State: AHQUAuajM7jbAdMnwLruwgrXiYmKgpTdjRKwnX75pV7+YfgQ3LlxxyP3
	P59r5PrV9jXXEMddIj2k359pmGg78tVjZCa1P5NagH0bloo=
X-Google-Smtp-Source: AHgI3IZiXrST2hODnLniaIOfxNeVgOWPivFQrsRmp5Onp6NyWsKSm9CTPLOJmQKRSJrGg/zgzBIOOMsVgSn54Uuq/0U=
X-Received: by 2002:a9f:300d:: with SMTP id h13mr15092819uab.80.1550596406689; 
	Tue, 19 Feb 2019 09:13:26 -0800 (PST)
MIME-Version: 1.0
References: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
In-Reply-To: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Tue, 19 Feb 2019 18:13:15 +0100
Message-ID: <CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: wic creates ext4 images that read really slow in u-boot
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
X-List-Received-Date: Tue, 19 Feb 2019 17:13:26 -0000
Content-Type: multipart/alternative; boundary="00000000000002d6f30582425c0f"

--00000000000002d6f30582425c0f
Content-Type: text/plain; charset="UTF-8"

Hello Mike,

sounds familiar.

On Tue, 19 Feb 2019 at 17:55, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> Took me a while to figure out why my board took 90 seconds to boot
> suddenly.
>
> The issue turned out to be the ext4 partition created by wic.


I suspect it's not WIC's fault.


> ZynqMP> load mmc 0:2 0x100000 /lib/firmware/fpga.bin
> 19311092 bytes read in 85529 ms (219.7 KiB/s)
>
> Now if I boot the board rename and copy that file onto itself, then it's
> suddenly normal again when I reboot the board:
>
> ZynqMP> load mmc 0:2 0x10000
> I'm not knowledgeable on ext4, so any ideas what's being passed onto the
> image
> creation tool that causes this?


I suspect your version of U-Boot does not handle files spread across
multiple filesystems (allocation) extends efficiently.

Copying the file makes the copy being layed out in one extend probably.

I am aware of two fixes for U-Boot. I will look them up, and reply again to
this thread.

Regards, Leon
-- 
Leon Woestenberg
leon@sidebranch.com
T: +31 40 711 42 76
M: +31 6 472 30 372

Sidebranch
Embedded Systems
Eindhoven, The Netherlands
http://www.sidebranch.com

--00000000000002d6f30582425c0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hello Mike,</div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">sounds familiar.</div><div dir=3D"auto"><br></div><div><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 19 Fe=
b 2019 at 17:55, Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.=
nl">mike.looijmans@topic.nl</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Took me a while to figure out why my board took 90 seconds to boot =
suddenly.<br>
<br>
The issue turned out to be the ext4 partition created by wic.</blockquote><=
div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote><div=
 dir=3D"auto">I suspect it&#39;s not WIC&#39;s fault.</div><div dir=3D"auto=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
ZynqMP&gt; load mmc 0:2 0x100000 /lib/firmware/fpga.bin<br>
19311092 bytes read in 85529 ms (219.7 KiB/s)<br><br>
Now if I boot the board rename and copy that file onto itself, then it&#39;=
s <br>
suddenly normal again when I reboot the board:<br>
<br>
ZynqMP&gt; load mmc 0:2 0x10000<br>
I&#39;m not knowledgeable on ext4, so any ideas what&#39;s being passed ont=
o the image <br>
creation tool that causes this?</blockquote><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I suspect your v=
ersion of U-Boot does not handle files spread across multiple filesystems (=
allocation) extends efficiently.=C2=A0</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Copying the file makes the copy being layed out in one exten=
d probably.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I am aware o=
f two fixes for U-Boot. I will look them up, and reply again to this thread=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards, Leon</div></d=
iv></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"color:rgb(0,0,0);font-f=
amily:Helvetica">Leon Woestenberg</div><div style=3D"color:rgb(0,0,0);font-=
family:Helvetica"><a href=3D"mailto:leon@sidebranch.com" style=3D"color:rgb=
(17,85,204)" target=3D"_blank">leon@sidebranch.com</a></div><div style=3D"c=
olor:rgb(0,0,0);font-family:Helvetica"><div>T: +31 40 711 42 76</div><div>M=
: +31 6 472 30 372</div></div><div style=3D"color:rgb(0,0,0);font-family:He=
lvetica"><br></div><div style=3D"color:rgb(0,0,0);font-family:Helvetica">Si=
debranch</div><div style=3D"color:rgb(0,0,0);font-family:Helvetica">Embedde=
d Systems</div><div style=3D"color:rgb(0,0,0);font-family:Helvetica">Eindho=
ven, The Netherlands</div><a href=3D"http://www.sidebranch.com/" style=3D"c=
olor:rgb(17,85,204);font-family:Helvetica" target=3D"_blank">http://www.sid=
ebranch.com</a><div><br></div><div><img src=3D"http://www.sidebranch.nl/sit=
es/default/files/images/unnamed.png" style=3D"color:rgb(0,0,0);font-family:=
Helvetica"><br></div><div><br><div><br></div></div></div></div>

--00000000000002d6f30582425c0f--
