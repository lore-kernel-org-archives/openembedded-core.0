Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 644CC771EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 21:13:34 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id l127so191409180iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sxkWNVSMsi2N75pge54ek1tPN5AkfNu/OBRXe5TrksE=;
	b=AIOv4j+KYP6rtP0f9z//JGwmTRA9nYnz/zp7xiWkSzhoQrT85yaYsZWBRCnJHIeGU1
	WoGCupNwscBUwDB4y4jxf3GeUUoi8KZIenTZChYnNkSwLM+8+lLpH/SjOjDCvim8to6B
	iBx28TsMe0C2nVeZkYV7PHzEtPQhrBYSpWzJhM9/GxkzpPFNmftygQAuvNdI/rDHmzxK
	VpSld+X+Km4eetGyI3KzLogemSKTMP0f0ift85NFXJnm6DxMIt1c19zHTXWVDsmCRW8I
	9J4Tsc5FuoaAlZwFUtVfc3pYy2IeTlj5oWCHeLEQdjqFKxSCViJTiCCnBbNOpRvtFzLi
	Vi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sxkWNVSMsi2N75pge54ek1tPN5AkfNu/OBRXe5TrksE=;
	b=U3eOw1smf9Rs/6HBLvsL2/yB3YI3BiqgT9/Act2NqN3Z2rcQFxP4ooMXUj6bOmTIWO
	TB2NF4rgviPC51WzVfpDGHChLcFk6M+wff7JWuR9dCfhMgUmOIoNhicnpWiBsCJJGlGX
	RsaOJQa26lWXXpOBkiS2HZbkfpWUFkzU2ezzcsd9yTYzP+55zsXaKgXdYhQsvkEAb0hN
	2b2gfJqqFKiGh1SedVDAtV5UjB4f5P3aVH4U+YyP89W7Svmozj69p5t9LLw73976R0bP
	dOs2ply2Z++/RWQVrLnaGrhEQ9jjPNQvLH+5IHsYu7w63pllaDS/KzbdVXfBFcIYo1AB
	h8Ng==
X-Gm-Message-State: AG10YOSn4bc+IoNAOl7y8wg3N7xi6gCqJ9FxIz/bFD15cmqyBvwq3VM/qZxm5y1aZtMmG5MYaz1cimYboL3Afkrx
X-Received: by 10.107.3.220 with SMTP id e89mr28559644ioi.99.1456175614766;
	Mon, 22 Feb 2016 13:13:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 22 Feb 2016 13:13:15 -0800 (PST)
In-Reply-To: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
References: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Feb 2016 21:13:15 +0000
Message-ID: <CAJTo0LaZajepL6zERZe792uJZzV2O=RO4J7X2WOAUhPDOASXgQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fetcher broken?
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
X-List-Received-Date: Mon, 22 Feb 2016 21:13:36 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c3fcbf2052c624ef8

--001a113f0e7c3fcbf2052c624ef8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 February 2016 at 21:06, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> after all these scary changes in master oe-core I wanted to see what's
> left over working since jethro for my images.
>
> On thing noticed immediately: I see
>
> WARNING: flex-native-2.6.0-r0 do_fetch: Checksum failure encountered
> with download of
> http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2 - will
> attempt other sources if available
> WARNING: flex-native-2.6.0-r0 do_fetch: Renaming
> /home/superandy/data/download/flex-2.6.0.tar.bz2 to
>
> /home/superandy/data/download/flex-2.6.0.tar.bz2_bad-checksum_0103b909e19=
ca9c6497a7ae696c16480
>

Well jethro only has flex 2.5.39, so where is this flex-2.6.0 recipe coming
from?

Ross

--001a113f0e7c3fcbf2052c624ef8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2016 at 21:06, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":b55" class=3D"a3s" style=3D"overflow:hidden">after all these scar=
y changes in master oe-core I wanted to see what&#39;s<br>
left over working since jethro for my images.<br>
<br>
On thing noticed immediately: I see<br>
<br>
WARNING: flex-native-2.6.0-r0 do_fetch: Checksum failure encountered<br>
with download of<br>
<a href=3D"http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2" rel=3D=
"noreferrer" target=3D"_blank">http://downloads.sourceforge.net/flex/flex-2=
.6.0.tar.bz2</a> - will<br>
attempt other sources if available<br>
WARNING: flex-native-2.6.0-r0 do_fetch: Renaming<br>
/home/superandy/data/download/flex-2.6.0.tar.bz2 to<br>
/home/superandy/data/download/flex-2.6.0.tar.bz2_bad-checksum_0103b909e19ca=
9c6497a7ae696c16480<br></div></blockquote></div><br>Well jethro only has fl=
ex 2.5.39, so where is this flex-2.6.0 recipe coming from?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f0e7c3fcbf2052c624ef8--
