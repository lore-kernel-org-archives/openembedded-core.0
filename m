Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 09D3F60125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 08:22:59 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id n59so232362368uan.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 01:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LuswilHS9HU93FIzDhBAHk4Bw9XYzbqM5TWc0z3y1CY=;
	b=A8CdwxLRpbJBT99VqcQrYke0XkKNcjR4pCyWk9UuQrt56HCjO6ynmjnVmJd/D+7NLs
	+sbEmqh994R9pXZiHW0UF7m3ys2/h1hOgiDPc4Kqe+qiUEW4JAAiRABzggGcle7PVJko
	m1omswdGqEWuvJUYBjpUZJJh/1zrly3kH4nV3C6g5WFBW4PFw83c1m7xnAAt3HOl1odR
	DHarPRrCA0lm/KJOP97WUFcHRUx1bUPzFG2axHroVW1YEI2M8CmqqothEy47FIyxbIKX
	LX8TqjfeAk5vM7PsEY3ao6Hl5pQnqAe6GP1xm8JNfzNC/ba+I88NHuoMLXi2+JN2gCv0
	G9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LuswilHS9HU93FIzDhBAHk4Bw9XYzbqM5TWc0z3y1CY=;
	b=PpyT3MHo9Bpnjxlj4zwImjZunZKGGT3/RvL+lkBPJ/kaCCGoMOn49cyAswuthfJ0ZD
	0yKc3uiJrtObA4mPT6PXkyyB9215GT+P6ExFHGqzlBYQxStiLTSAjU1fz2rWt8kftYxH
	Yb/WCa+jlENGXFT6nQkuQapC06lPiZ95v1LaNN9DdhT4l27oW7CQRq2qupeElzv/azKO
	ZTqecYWYA9XzXF1o4j9rZGdNM78A7BdEarIXddTRpVOJ1K9ayRwqrkxnL9wZ1FByhWhn
	1SBPOHpixctmEvZD5lrsoH6uiVxWFhsr+Pe13f/ZXx9V3oFZTYZ67742P6adOkmZsCZi
	jbgw==
X-Gm-Message-State: AEkoouuewOGhNvzDEli28TkIPt5U4wU7GpRQMagnrXKZxZKY+ihTIE18nP0p4Jxkscnp8ZOzITauggJS47eqRQ==
X-Received: by 10.31.12.72 with SMTP id 69mr13722152vkm.62.1471940580200; Tue,
	23 Aug 2016 01:23:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.82.197 with HTTP; Tue, 23 Aug 2016 01:22:59 -0700 (PDT)
In-Reply-To: <57BBEACF.5070107@topic.nl>
References: <57BBEACF.5070107@topic.nl>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 23 Aug 2016 10:22:59 +0200
Message-ID: <CAFkk2KSxLv=fycmLNxXh5skagfsscF3VAq7F9+90YnppB_3WEw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Broken "bitbake -S printdiff" in current OE
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
X-List-Received-Date: Tue, 23 Aug 2016 08:23:02 -0000
Content-Type: multipart/alternative; boundary=001a1142ede269d7f4053ab8df34

--001a1142ede269d7f4053ab8df34
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 23, 2016 at 8:18 AM, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> Was attempting to figure out why something wasn't being grabbed from the
> sstate-cache, but running "bitbake -S printdiff qt4-embedded" only yields
> tons
> of lines like this:
>
> WARNING: /home/mike/.../bitbake/lib/bb/runqueue.py:1347: ResourceWarning:
> unclosed file <_io.BufferedReader
> name='/home/mike/.../build/tmp-glibc/stamps/cortexa9hf-
> neon-oe-linux-gnueabi/tiff/4.0.6-r0.do_populate_sysroot.sigdata.
> 868460a5d532ef809db9bfa7ce2a89e4'>
>   out2 = bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2],
> recursecb)
>
> Left it running for about fifteen minutes, but nothing useful came out.
>

Not a fix for the original issue, but for what it's worth, I just added
more comprehensive documentation on how to view task signatures here:

http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#usingpoky-viewing-task-variable-dependencies

Running bitbake-diffsigs instead of 'bitbake -S diffsigs' would be an
alternative.

I also had trouble getting 'bitbake -S diffsigs' and 'bitbake -S none'
to work as advertised. They write a file locked-sigs.inc too, which
seems to be undocumented. I relegated the bitbake -S documentation to
the end of the new section and kept it as it was before.

Cheers,
Ulf

--001a1142ede269d7f4053ab8df34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Aug 23, 2016 at 8:18 AM, Mike Looijmans <span dir=
=3D"ltr">&lt;<a href=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">m=
ike.looijmans@topic.nl</a>&gt;</span> wrote:<br><div class=3D"gmail_extra">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">


<div>
<p></p><div>Was attempting to figure out why something wasn&#39;t being gra=
bbed from the <br>sstate-cache, but running &quot;bitbake -S printdiff qt4-=
embedded&quot; only yields tons <br>of lines like this:<br><br>WARNING: /ho=
me/mike/.../bitbake/lib/bb/<wbr>runqueue.py:1347: ResourceWarning: <br>uncl=
osed file &lt;_io.BufferedReader <br>name=3D&#39;/home/mike/.../build/<wbr>=
tmp-glibc/stamps/cortexa9hf-<wbr>neon-oe-linux-gnueabi/tiff/4.<wbr>0.6-r0.d=
o_populate_sysroot.<wbr>sigdata.<wbr>868460a5d532ef809db9bfa7ce2a89<wbr>e4&=
#39;&gt;<br> =C2=A0=C2=A0out2 =3D bb.siggen.compare_sigfiles(<wbr>hashfiles=
[hash1], hashfiles[hash2], <br>recursecb)<br><br>Left it running for about =
fifteen minutes, but nothing useful came out.<br></div></div></blockquote><=
div><br>Not a fix for the original issue, but for what it&#39;s worth, I ju=
st added<br>more comprehensive documentation on how to view task signatures=
 here:<br><br><a href=3D"http://www.yoctoproject.org/docs/2.2/ref-manual/re=
f-manual.html#usingpoky-viewing-task-variable-dependencies">http://www.yoct=
oproject.org/docs/2.2/ref-manual/ref-manual.html#usingpoky-viewing-task-var=
iable-dependencies</a><br><br>Running bitbake-diffsigs instead of &#39;bitb=
ake -S diffsigs&#39; would be an<br>alternative.<br><br>I also had trouble =
getting &#39;bitbake -S diffsigs&#39; and &#39;bitbake -S none&#39;<br>to w=
ork as advertised. They write a file locked-sigs.inc too, which<br>seems to=
 be undocumented. I relegated the bitbake -S documentation to<br>the end of=
 the new section and kept it as it was before.<br><br>Cheers,<br>Ulf<br></d=
iv></div></div></div>

--001a1142ede269d7f4053ab8df34--
