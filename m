Return-Path: <kergoth@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6861165C5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 15:52:06 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id i145so64501622ywg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=dDmPZyZszJNegr3H8Rd0r+4gsdafP3dbNe7tQ1M8dIQ=;
	b=lj6pNcBN+P+NJFEmLop/t4nHa7wPbysUree8agIj8Tn+SQ5HSvhod1R4N5KBUVAog1
	3o/L/X7uKt/P6OrNY+sj5ZZ8svBsFL4Fo8uEBSVC/EtRoxjHF8LLTP0JXr6L1Sn2IZ2l
	OaHLB0dO7hgGEupON7lCIyYoFvFfjVc9/wACeFyaXFMAbGAY6kmijYpYoto4I1N1MoMB
	6on86XvnbSUKIM3rBZvSN89Qoi/iUb7ds+EinnOo7Q5wBZBrHXlNudwo0/6RBZxqO6Tb
	H+9ofSs/Oc31tkGU8ryMPB+bz8xxS4N9NuVfDEHjB8NF+isRQtfSixXNEiXWh5e7fOhg
	4q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=dDmPZyZszJNegr3H8Rd0r+4gsdafP3dbNe7tQ1M8dIQ=;
	b=S+CAiqrPaMtde20IAXHNzG/6+HIS2gPZqDBQt55LvH2DbBFFkvuCA5j9cFra9EMOHB
	ScK6V54VABba2zUlKYhCIJmEd1tG3tRY4VsiajoA0913UyMGG+8rVw6ZE+RqrwO3W5Po
	WAlrkbj/FwGiwmXCz071q8IEtj1/puXVgESZqq/SDfF9V820Bxr0/3l913AOFDJCt4TJ
	aETqmf8ABD4OQQnvfocal/aoZir+tCtLy4DKrX+3zyhMRyfwWW1TOYbI+An8lxw6JMF7
	bRivnVoGEu9+USKJ/FmxtsFIi8ci9OT7qOf9jLvYJ0mcxPkulUJIMZuor6qP19jHCyLA
	feag==
X-Gm-Message-State: ABUngvcNwCX5qGAd2+e5nzqJuHA9HbCBIPlR3ddP7WsDsrBHBV/5KS4GbRvjgzdrrnxEzO1wDvbyxcmgedLWIQ==
X-Received: by 10.202.84.74 with SMTP id i71mr7926064oib.93.1479138727459;
	Mon, 14 Nov 2016 07:52:07 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.29.137 with HTTP; Mon, 14 Nov 2016 07:51:47 -0800 (PST)
In-Reply-To: <95b4383a-727c-a022-9a9a-5398c7dabf36@topic.nl>
References: <95b4383a-727c-a022-9a9a-5398c7dabf36@topic.nl>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 14 Nov 2016 08:51:47 -0700
X-Google-Sender-Auth: On4BUMt2-EZE3TojsLNKZ2Dzl5c
Message-ID: <CABcZANn20ub4DGdsyCREm=3uATeB+hZYwpdjXMezocHJitdVJw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Creating 'wic' image
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
X-List-Received-Date: Mon, 14 Nov 2016 15:52:07 -0000
Content-Type: multipart/alternative; boundary=001a113ad7bc6c8c79054144d2a8

--001a113ad7bc6c8c79054144d2a8
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 14, 2016 at 8:23 AM, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> In order to make life easier for people, I was looking into creating
> images with the "wic" tool.
>
> There's just one big piece of documentation lacking: What's the format it
> wants my rootfs and boot files?
> http://www.yoctoproject.org/docs/2.2/mega-manual/mega-manual.html
>
> Basically I want an SD card with a FAT boot partition and an ext4 rootfs,
> and "sdimage-bootpart" is pretty close to that.
>
> Without "wic", I build a tar of the rootfs and copy the boot files using a
> bit of shell scripting.
>
> Adding "wic" to IMAGE_FSTYPES just results in an error that I should set
> WKS_FILE but I have no clue as to what file that should point to.
>
> Running wic manually just results in more missing variables that I can't
> find what to specify in them...
>

WKS_FILE is how you tell it to use sdimage-bootpart.wks. IMAGE_BOOT_FILES
Is how to add extra files to the fat boot partiiton.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ad7bc6c8c79054144d2a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 14, 2016 at 8:23 AM, Mike Looijmans <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topi=
c.nl</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6b=
t" class=3D"a3s aXjCH m15863834524be587">In order to make life easier for p=
eople, I was looking into creating images with the &quot;wic&quot; tool.<br=
>
<br>
There&#39;s just one big piece of documentation lacking: What&#39;s the for=
mat it wants my rootfs and boot files?<br>
<a href=3D"http://www.yoctoproject.org/docs/2.2/mega-manual/mega-manual.htm=
l" rel=3D"noreferrer" target=3D"_blank">http://www.yoctoproject.org/do<wbr>=
cs/2.2/mega-manual/mega-manual<wbr>.html</a><br>
<br>
Basically I want an SD card with a FAT boot partition and an ext4 rootfs, a=
nd &quot;sdimage-bootpart&quot; is pretty close to that.<br>
<br>
Without &quot;wic&quot;, I build a tar of the rootfs and copy the boot file=
s using a bit of shell scripting.<br>
<br>
Adding &quot;wic&quot; to IMAGE_FSTYPES just results in an error that I sho=
uld set WKS_FILE but I have no clue as to what file that should point to.<b=
r>
<br>
Running wic manually just results in more missing variables that I can&#39;=
t find what to specify in them...<br></div></blockquote></div><br>WKS_FILE =
is how you tell it to use sdimage-bootpart.wks. IMAGE_BOOT_FILES Is how to =
add extra files to the fat boot partiiton.<br>-- <br><div class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson a=
t kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintai=
ner - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113ad7bc6c8c79054144d2a8--
