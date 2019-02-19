Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
	[209.85.222.51])
	by mail.openembedded.org (Postfix) with ESMTP id 694DA7C991
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 19:28:20 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id j8so7330324uae.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 11:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Lt3UoY0LtjpfhQfPq7+p82uR+HstfmeFW8XnJXvYqaU=;
	b=hLq4mKoZQkGJfFixj49J7bhhQwffqw+NIdLfQP72poHuK70Y6GDa2W33GxlTCEKUPE
	LpNqsiLqBqG6uEip8DUChDFTlYTwmheHAOViHUMoNVaaauM6IXigxepSAXcObpjUJgZV
	37SXbXAuey5PzVpAFEsvJczN48ZlpDBAUI95tvo812yWePFMJQFvaA3xwLqdNxRO4ti7
	ojirYNE6w5fXCak5Zde1zFLbCfnUo1tLJnx0hTtqWvog/WYuSPrIys3sscYVV2v2mDf5
	GB3D+9MqNm0TKUxr1iByG4dUhyjK12/k5t3hYOwpcQgvSXVNVwHkzg0LtV4arBNsM1hn
	ZdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Lt3UoY0LtjpfhQfPq7+p82uR+HstfmeFW8XnJXvYqaU=;
	b=bBxxQQltdZDEvSOGcMwIo4YlpvcXMiQ12g0PGDbZjV/4oAssqb+HtPoMRmZqeCzms4
	YyV7InEhJyETjTB3WOEvPCYLGBlPxadbH0Ny5PwKT7Iy4+TDwnmKFYl1Pctu6Q852bc6
	OmJvna7fAng4AYDN5cQGm958QheOEvKZdZpvsrHmHCMB7CXNrVJ/stZ/5Ggf4+1u8vY4
	LLaSYdJrkaLDRwfIy4ioQK5H6FeeEQzlgy7EvYuYFbpuTRlVMIoHCJr6gRi7uEpmhJjb
	Lj54Ta7g1+cSD5nBLOKLGbvM1CC7HVxzrZwW5Ghp4uUr3TV4j6yenYG9MCJd5mvbn07r
	Pb2A==
X-Gm-Message-State: AHQUAubHXT8dNUnAhhOy1Oi2GG9GuYz/FY4iXndJ+h+OviS+Im2zC/lS
	5Imin7t+CwAKoz4jic7yk+S+ZmSjR+dYt/GvPyrAWA==
X-Google-Smtp-Source: AHgI3IbmPVdZ2d3zZQi/XiiJeQGxZdBqqX7qJoAoauv6ilvTbdvB7rchrMMrP2KELU9wNWDsxKjSI6zpKEdYzUV5xJQ=
X-Received: by 2002:ab0:4a1:: with SMTP id 30mr14805082uaw.86.1550604501063;
	Tue, 19 Feb 2019 11:28:21 -0800 (PST)
MIME-Version: 1.0
References: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
	<CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
In-Reply-To: <CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 19 Feb 2019 11:28:09 -0800
Message-ID: <CAJ86T=Vy6AMbJ0J23V_9K+GJxwCFjD-Gq7NQwZ7AeJSW5Lum_A@mail.gmail.com>
To: Leon Woestenberg <leon@sidebranch.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Tue, 19 Feb 2019 19:28:20 -0000
Content-Type: multipart/alternative; boundary="000000000000791a0e0582443eb8"

--000000000000791a0e0582443eb8
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 19, 2019 at 9:13 AM Leon Woestenberg <leon@sidebranch.com>
wrote:

> Hello Mike,
>
> sounds familiar.
>
> On Tue, 19 Feb 2019 at 17:55, Mike Looijmans <mike.looijmans@topic.nl>
> wrote:
>
>> Took me a while to figure out why my board took 90 seconds to boot
>> suddenly.
>>
>> The issue turned out to be the ext4 partition created by wic.
>
>
> I suspect it's not WIC's fault.
>
>
>> ZynqMP> load mmc 0:2 0x100000 /lib/firmware/fpga.bin
>> 19311092 bytes read in 85529 ms (219.7 KiB/s)
>>
>> Now if I boot the board rename and copy that file onto itself, then it's
>> suddenly normal again when I reboot the board:
>>
>> ZynqMP> load mmc 0:2 0x10000
>> I'm not knowledgeable on ext4, so any ideas what's being passed onto the
>> image
>> creation tool that causes this?
>
>
> I suspect your version of U-Boot does not handle files spread across
> multiple filesystems (allocation) extends efficiently.
>
> Copying the file makes the copy being layed out in one extend probably.
>

If WIC is generating filesystem images from scratch there's no excuse for
files to be unnecessarily fragmented.

Even if some of all of the boot time can be recovered by a patch to u-boot
that won't help systems which have already been deployed and don't have a
way to update the bootloader.

I am aware of two fixes for U-Boot. I will look them up, and reply again to
> this thread.
>
> Regards, Leon
> --
> Leon Woestenberg
> leon@sidebranch.com
> T: +31 40 711 42 76
> M: +31 6 472 30 372
>
> Sidebranch
> Embedded Systems
> Eindhoven, The Netherlands
> http://www.sidebranch.com
>

--000000000000791a0e0582443eb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 19, 2019 at 9:13 AM Leon Woes=
tenberg &lt;<a href=3D"mailto:leon@sidebranch.com">leon@sidebranch.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div><div dir=3D"auto">Hello Mike,</div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">sounds familiar.</div><div dir=3D"au=
to"><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, 19 Feb 2019 at 17:55, Mike Looijmans &lt;<a href=3D"mailto=
:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Took me =
a while to figure out why my board took 90 seconds to boot suddenly.<br>
<br>
The issue turned out to be the ext4 partition created by wic.</blockquote><=
div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"></blockquote><div dir=3D"auto">I suspect it&#39;s not WIC&#39;s fault.</d=
iv><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"></blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I suspect your version of U-Boot does not handle files spread across mul=
tiple filesystems (allocation) extends efficiently.=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Copying the file makes the copy being lay=
ed out in one extend probably.</div></div></div></blockquote><div><br></div=
><div>If WIC is generating filesystem images from scratch there&#39;s no ex=
cuse for files to be unnecessarily fragmented.<br></div><div><br></div><div=
>Even if some of all of the boot time can be recovered by a patch to u-boot=
 that won&#39;t help systems which have already been deployed and don&#39;t=
 have a way to update the bootloader.<br></div><br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto"=
>I am aware of two fixes for U-Boot. I will look them up, and reply again t=
o this thread.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards, =
Leon</div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail-m_-82634879305=
86811828gmail_signature"><div dir=3D"ltr"><div style=3D"color:rgb(0,0,0);fo=
nt-family:Helvetica">Leon Woestenberg</div><div style=3D"color:rgb(0,0,0);f=
ont-family:Helvetica"><a href=3D"mailto:leon@sidebranch.com" style=3D"color=
:rgb(17,85,204)" target=3D"_blank">leon@sidebranch.com</a></div><div style=
=3D"color:rgb(0,0,0);font-family:Helvetica"><div>T: +31 40 711 42 76</div><=
div>M: +31 6 472 30 372</div></div><div style=3D"color:rgb(0,0,0);font-fami=
ly:Helvetica"><br></div><div style=3D"color:rgb(0,0,0);font-family:Helvetic=
a">Sidebranch</div><div style=3D"color:rgb(0,0,0);font-family:Helvetica">Em=
bedded Systems</div><div style=3D"color:rgb(0,0,0);font-family:Helvetica">E=
indhoven, The Netherlands</div><a href=3D"http://www.sidebranch.com/" style=
=3D"color:rgb(17,85,204);font-family:Helvetica" target=3D"_blank">http://ww=
w.sidebranch.com</a><br>
</div></div></blockquote></div></div>

--000000000000791a0e0582443eb8--
