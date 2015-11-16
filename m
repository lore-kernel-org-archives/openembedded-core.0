Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 507D06E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:57:20 +0000 (UTC)
Received: by ioir85 with SMTP id r85so123194334ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=xvINiObDBfDTfItX7eYQ7YZdDk9VWenGOFIR8x2FQwo=;
	b=xmAmkN2w2w+9h6D96RW472OeCNd0GopCeQSgXAhUIX7ZQDGIU72RyZ+19IkA5nbYyq
	TMqpFiQZ7I+omM3MGmIjtT7s+si8dub0dN0bQm9OHhSThIZQHADk24F50zh01ZnhLsub
	uhfzE+WIWSvlI5Soz2R4j8wkdD/IpLogBcjek9gpabn64AOLkxm5CprKH8xmwLhsQvNL
	7U4CdeN6gEZtC12vDXo4faHz+E//HxZ+wfiAyUpgydIbgHT9nFZl/v4UHTq2q4qR7KNT
	aHtXzwwswcorZM0hFIXade5V8wzWxCc7lFw4PrI5+pNCmepg7AYShvpUcfQJOHhDra7E
	J/5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=xvINiObDBfDTfItX7eYQ7YZdDk9VWenGOFIR8x2FQwo=;
	b=hIBoNZ0nxIahfLmSwxMpuNXomKvje9CvMiUDlklCMXAQBDIJ+pZAXKMmFajdf1h3SB
	Wb0dtMNXEZ63htXrVUsr1RBx6YVn2q3D3jzsVLipCFC094YZg4249asjsPof9XW+Mack
	gFg8d0SykoYAsoYsE3KbimWR68K06rbK6pykWJ8o+524uTvUxeq/1gIPyYMGcZY1uVsc
	fyPgqFPdcAR9vj93IV/jcBuJ8vf/x2UqFbCrRTBumMImkDCn8EZnesGtVOGV5DerkMDg
	OcKV5btaiBcNI2El/8WBwRMs6yxIl6gicqQdvcsotyZHbHmBxRrzzUPm2EQXUJPBVk5E
	VAPA==
X-Received: by 10.107.3.42 with SMTP id 42mr32875705iod.83.1447689441110; Mon,
	16 Nov 2015 07:57:21 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Mon, 16 Nov 2015 07:57:01 -0800 (PST)
In-Reply-To: <CALbNGRQVDT0mdYJUrhP5A-Tkzoo1pE-L=ApsidqJXsHyenNz1w@mail.gmail.com>
References: <CALbNGRQVDT0mdYJUrhP5A-Tkzoo1pE-L=ApsidqJXsHyenNz1w@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 16 Nov 2015 08:57:01 -0700
X-Google-Sender-Auth: _qmF0SouHFDyqoVV6xytRAMgqao
Message-ID: <CABcZANknN7g5b5k+tBh=S9u8uGZPCDgR58be3PK4R8_A7n5DkQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: hostname issues
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
X-List-Received-Date: Mon, 16 Nov 2015 15:57:21 -0000
Content-Type: multipart/alternative; boundary=001a113ed344e1f31f0524aa762f

--001a113ed344e1f31f0524aa762f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2015 at 7:14 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> for xfce-session we have some very bad workaround entering machine
> name to /etc/hosts [1]
>
> I looked into this and found (let's assume ${MACHINE}=3D'foomachine'):
>
> * basefiles: By default /etc/hostname contains 'foomachine'
> * netbase: /etc/hosts contains '127.0.0.1    localhost.localdomain
>    localhost'
>
> Shouldn't this be
>
> /etc/hosts: '127.0.0.1    foomachine        localhost'
> or
> /etc/hostname: 'localhost.localdomain'
>
> To test do
>
> 'ping foomachine'
> or
> hostname -f
>
> What do experts say?
>
> [1]
> https://github.com/openembedded/meta-openembedded/blob/master/meta-xfce/r=
ecipes-xfce/xfce4-session/machine-host.bb
>

I'd suggest just installing nss-myhostname for sysvinit, and for systemd,
systemd already includes the myhostname nss plugin, so it just needs
enabling in nsswitch.conf (I submitted a patch recently to make it do that
by default).
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ed344e1f31f0524aa762f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Nov 16, 2015 at 7:14 AM, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony=
@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":u1" class=3D"a3s" style=3D"overflow:hidden">for xfce-session we ha=
ve some very bad workaround entering machine<br>
name to /etc/hosts [1]<br>
<br>
I looked into this and found (let&#39;s assume ${MACHINE}=3D&#39;foomachine=
&#39;):<br>
<br>
* basefiles: By default /etc/hostname contains &#39;foomachine&#39;<br>
* netbase: /etc/hosts contains &#39;127.0.0.1=C2=A0 =C2=A0 localhost.locald=
omain<br>
=C2=A0 =C2=A0localhost&#39;<br>
<br>
Shouldn&#39;t this be<br>
<br>
/etc/hosts: &#39;127.0.0.1=C2=A0 =C2=A0 foomachine=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 localhost&#39;<br>
or<br>
/etc/hostname: &#39;localhost.localdomain&#39;<br>
<br>
To test do<br>
<br>
&#39;ping foomachine&#39;<br>
or<br>
hostname -f<br>
<br>
What do experts say?<br>
<br>
[1] <a href=3D"https://github.com/openembedded/meta-openembedded/blob/maste=
r/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/openembedded/meta-openembedded/blob/ma=
ster/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb</a></div></blockq=
uote></div><br>I&#39;d suggest just installing nss-myhostname for sysvinit,=
 and for systemd, systemd already includes the myhostname nss plugin, so it=
 just needs enabling in nsswitch.conf (I submitted a patch recently to make=
 it do that by default).<br>-- <br><div class=3D"gmail_signature">Christoph=
er Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded,=
 OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graph=
ics</div>
</div></div>

--001a113ed344e1f31f0524aa762f--
