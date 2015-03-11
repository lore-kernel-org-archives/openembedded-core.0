Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 89172739AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 14:53:07 +0000 (UTC)
Received: by igkb16 with SMTP id b16so12696549igk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 07:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=a8TN5jbh7UZxiHvYvMAM4idX9hVeQLNGQzHKf7pi9j8=;
	b=ypJXWSxSWexH4Wf5FejuisztbPYc6hu5LPSmZXXH5pEYc8T6yfaAfqVrQwRORqvZVF
	VFydSs+FlKyKcdOuEMzEfpm7ph5wjtL7hb2mIHesMpgdkiHAIZJCS0KOVxKLHvMANtTT
	ebj+Yp4R+CKa9eeZTXjbRH5Rz1yGqWbbU8EwWk65V8HyXj94rTCXTNbNkUuOSlx3vR2X
	OkI4aARMLDrJtyVUe2cLqbHHD6gIqGWS1IVWT+lwQjEOVd2mfwROMHxeWXXyqZLqbjBp
	7WhpSTJmrTQVCrqpzxzDCw2QdtQf/+dc6F2KV4A24iscfmrEGGeo6zlXtItrGBPm96Uk
	u02w==
MIME-Version: 1.0
X-Received: by 10.50.32.71 with SMTP id g7mr80905497igi.4.1426085588235; Wed,
	11 Mar 2015 07:53:08 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Wed, 11 Mar 2015 07:53:08 -0700 (PDT)
In-Reply-To: <1426069160.9114.41.camel@linuxfoundation.org>
References: <1426062809-1844-1-git-send-email-raj.khem@gmail.com>
	<1426069160.9114.41.camel@linuxfoundation.org>
Date: Wed, 11 Mar 2015 07:53:08 -0700
Message-ID: <CAMKF1soiYrSG_MARzY0hLj+WbvHnBci5MmupLhdps6oo9=UkVg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] var/volatile: Mount it if doing ro-rfs
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
X-List-Received-Date: Wed, 11 Mar 2015 14:53:10 -0000
Content-Type: multipart/alternative; boundary=047d7b10cb2de7fa8d0511046c62

--047d7b10cb2de7fa8d0511046c62
Content-Type: text/plain; charset=UTF-8

On Wednesday, March 11, 2015, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2015-03-11 at 08:33 +0000, Khem Raj wrote:
> > - Do not mount /var/volatile to be tmpfs always only when generating
> >   readonly rootfs
> > - Generate var-volatile.mount unit when using system in readonly-rootfs
> >   to mount /var/volatile as tmpfs
> > - for sysvinit, mount /var/volatile to be tmpfs if its not already
> >   mounted so
> > - Use RequiresMountsFor instead of After=, so systemd figures out the
> >   needed dependencies for making /var/volatile accessible for journald
> >   and not us.
> >
> > Change-Id: I0b176b3e1c1e88e84d2c93154aac04cef565d8ea
> > Signed-off-by: Khem Raj <raj.khem@gmail.com <javascript:;>>
> > ---
> >  meta/classes/image.bbclass
>  | 1 +
> >  meta/recipes-core/base-files/base-files/fstab
> | 1 -
> >  meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> | 2 +-
> >  meta/recipes-core/systemd/systemd/journald-volatile.conf
>  | 2 +-
> >  4 files changed, 3 insertions(+), 3 deletions(-)
>
> Which combinations has this been tested with? Given the time the patch
> has existed for, I'm sceptical all the combinations we need have been
> tested, I'd love to be wrong.
>
> This is a pretty major change of behaviour and given the problems
> previous changes have caused, I'm very very very nervous about what
> issues this is going to cause :(.


Systemd in both ways but not sysvinit

>
> Cheers,
>
> Richard
>
>

--047d7b10cb2de7fa8d0511046c62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, March 11, 2015, Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Wed, 2015-03-11 at 08:33 +0=
000, Khem Raj wrote:<br>
&gt; - Do not mount /var/volatile to be tmpfs always only when generating<b=
r>
&gt;=C2=A0 =C2=A0readonly rootfs<br>
&gt; - Generate var-volatile.mount unit when using system in readonly-rootf=
s<br>
&gt;=C2=A0 =C2=A0to mount /var/volatile as tmpfs<br>
&gt; - for sysvinit, mount /var/volatile to be tmpfs if its not already<br>
&gt;=C2=A0 =C2=A0mounted so<br>
&gt; - Use RequiresMountsFor instead of After=3D, so systemd figures out th=
e<br>
&gt;=C2=A0 =C2=A0needed dependencies for making /var/volatile accessible fo=
r journald<br>
&gt;=C2=A0 =C2=A0and not us.<br>
&gt;<br>
&gt; Change-Id: I0b176b3e1c1e88e84d2c93154aac04cef565d8ea<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail.com</a>&g=
t;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 meta/recipes-core/base-files/base-files/fstab=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1 -<br>
&gt;=C2=A0 meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-h=
ook.sh | 2 +-<br>
&gt;=C2=A0 meta/recipes-core/systemd/systemd/journald-volatile.conf=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 4 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
Which combinations has this been tested with? Given the time the patch<br>
has existed for, I&#39;m sceptical all the combinations we need have been<b=
r>
tested, I&#39;d love to be wrong.<br>
<br>
This is a pretty major change of behaviour and given the problems<br>
previous changes have caused, I&#39;m very very very nervous about what<br>
issues this is going to cause :(.</blockquote><div><br></div><div>Systemd i=
n both ways but not sysvinit=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote>

--047d7b10cb2de7fa8d0511046c62--
