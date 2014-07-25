Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 457A770688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 13:32:21 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so6113240pab.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 06:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=AzY7qr4vrrCyRICPZoRmPM/1bdy2x9B8CfQ0elOa2fA=;
	b=YljBSEIshleNzLq4UrkLWNXfmE9TyJjrhBJvtnd+WagRfNEfkB8pI4DlMRO3lpf8+q
	ZbmGMdT8uMuGrSlp5p+2aGtCt/62X2xtDUSggyuqryuwU3qe2mXHLa8d5A10NnQ/+wW0
	5mgH0GGH4XkisL3HUZD73l/S/zxHAy54LKwWe1kLRkaoYhuC1aO5OaBhmvNO5vfBaB4l
	jaeL3gWuSfjVjWBCC3p3bSUpmTQGmryFbN1FBX64Hr1lUhmqUUcHM+fkF/+WXoATeBHK
	37xTcpXpXHAyZFZ/90eoB0L2MJ4LVydJ6Itkx14xS1H0iCcaFxJI+QkiUhHMpcRIEApB
	vwXQ==
X-Gm-Message-State: ALoCoQlnd1cZ2TicVPzM7jtrs9GbNlqTKlJTIYYZkRS5s3NfsRa5eOWvpjY/QXeBPyW7sA5juwOs
MIME-Version: 1.0
X-Received: by 10.68.181.67 with SMTP id du3mr18745034pbc.96.1406295143084;
	Fri, 25 Jul 2014 06:32:23 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.75.3 with HTTP; Fri, 25 Jul 2014 06:32:23 -0700 (PDT)
In-Reply-To: <CAOMwXhO3q3ZWmJ3mc==FV=S3t9fa7of9+449KGjQt4v=FQ=RRA@mail.gmail.com>
References: <CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
	<CAOMwXhMDOma1N73M5n64G2T-FaH+Zevo2r8baenFsX9EZiFa5Q@mail.gmail.com>
	<CAJTo0LYuTsUkt8E0oTn0CGG+JFQhM67eCAHBRiX8W_1Fw67ErQ@mail.gmail.com>
	<CAOMwXhNqH76QKt9hsqpeOeRTBjKUix4e0GCy8PZVkrjCdm+OAA@mail.gmail.com>
	<20140321143939.GI3726@jama>
	<CAOMwXhO3q3ZWmJ3mc==FV=S3t9fa7of9+449KGjQt4v=FQ=RRA@mail.gmail.com>
Date: Fri, 25 Jul 2014 14:32:23 +0100
X-Google-Sender-Auth: V7fMi0Ewalb51cCeCm3BINECY5E
Message-ID: <CAOMwXhOtSitBvR=v0AVJbcK8HBsfxsU-4wrEkBd=tjX-UhEX1g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Fri, 25 Jul 2014 13:32:30 -0000
Content-Type: multipart/alternative; boundary=047d7b33c81274124104ff049af0

--047d7b33c81274124104ff049af0
Content-Type: text/plain; charset=UTF-8

Any reason why this feature has never got in? It was submitted more than
five months ago, and it would have added some feature to the system even if
not _everything_ right from the beginning?


On Sat, Mar 22, 2014 at 2:03 PM, Laszlo Papp <lpapp@kde.org> wrote:

> On Fri, Mar 21, 2014 at 2:39 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Fri, Mar 21, 2014 at 01:59:15PM +0000, Laszlo Papp wrote:
> >> On Thu, Mar 20, 2014 at 7:59 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >> > On 20 March 2014 19:01, Laszlo Papp <lpapp@kde.org> wrote:
> >> >> This init script is adding support for sysv and no more. This is also
> >> >> indicated in the first line of the commit message. I am sorry, but I
> >> >> will not test it systemd and with other systems
> >> >
> >> > You're not being asked to test with systemd.  You're being asked to
> >> > add LSB-standard sysvinit-specific headers to a sysvinit script.
> >>
> >> In my understanding, people were referring to two issues:
> >>
> >> 1) not working with systemd and what not compat modes. This is not
> >> something I will test any soon.
> >
> > Other people already know it's causing the issues without LSB headers,
> > so if you just add them, you don't need to test it with systemd, other
> > people who care about systemd will do that for you or at least be OK
> > with adding this script, because it will have LSB headers (so it should
> > work fine in systemd world).
>
> If someone is really interested in systemd, et al, unlike me at this
> point, I guess it is not a big deal to get an LSB header from someone
> to get it integrated into my change?
>
> If no one cares about that, then why bother? So, if someone sends this
> to me I will integrate it, otherwise there is no point since that
> means no one cares.
>
> But then again, this should not still block the change as it can be
> added incrementally. I am not sure if it is a good idea to block a
> feature because it does not provide another feature, too.
>

--047d7b33c81274124104ff049af0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Any reason why this feature has never got in? It was submi=
tted more than five months ago, and it would have added some feature to the=
 system even if not _everything_ right from the beginning?</div><div class=
=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Sat, Mar 22, 2014 at 2:03 PM, Laszlo =
Papp <span dir=3D"ltr">&lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_blan=
k">lpapp@kde.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"">On Fri, Mar 21, 2014 at 2:39 PM, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br=
>
&gt; On Fri, Mar 21, 2014 at 01:59:15PM +0000, Laszlo Papp wrote:<br>
&gt;&gt; On Thu, Mar 20, 2014 at 7:59 PM, Burton, Ross &lt;<a href=3D"mailt=
o:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt; &gt; On 20 March 2014 19:01, Laszlo Papp &lt;<a href=3D"mailto:lpa=
pp@kde.org">lpapp@kde.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; This init script is adding support for sysv and no more. =
This is also<br>
&gt;&gt; &gt;&gt; indicated in the first line of the commit message. I am s=
orry, but I<br>
&gt;&gt; &gt;&gt; will not test it systemd and with other systems<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; You&#39;re not being asked to test with systemd. =C2=A0You&#3=
9;re being asked to<br>
&gt;&gt; &gt; add LSB-standard sysvinit-specific headers to a sysvinit scri=
pt.<br>
&gt;&gt;<br>
&gt;&gt; In my understanding, people were referring to two issues:<br>
&gt;&gt;<br>
&gt;&gt; 1) not working with systemd and what not compat modes. This is not=
<br>
&gt;&gt; something I will test any soon.<br>
&gt;<br>
&gt; Other people already know it&#39;s causing the issues without LSB head=
ers,<br>
&gt; so if you just add them, you don&#39;t need to test it with systemd, o=
ther<br>
&gt; people who care about systemd will do that for you or at least be OK<b=
r>
&gt; with adding this script, because it will have LSB headers (so it shoul=
d<br>
&gt; work fine in systemd world).<br>
<br>
</div>If someone is really interested in systemd, et al, unlike me at this<=
br>
point, I guess it is not a big deal to get an LSB header from someone<br>
to get it integrated into my change?<br>
<br>
If no one cares about that, then why bother? So, if someone sends this<br>
to me I will integrate it, otherwise there is no point since that<br>
means no one cares.<br>
<br>
But then again, this should not still block the change as it can be<br>
added incrementally. I am not sure if it is a good idea to block a<br>
feature because it does not provide another feature, too.<br>
</blockquote></div><br></div>

--047d7b33c81274124104ff049af0--
