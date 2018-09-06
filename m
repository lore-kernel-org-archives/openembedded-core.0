Return-Path: <emmanuel.roullit@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 476B7792B0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:17:15 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id y134-v6so3904838ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AJqMzPaLGgzJUTeDtjhu51Zp71Ehez8XR/WwQV+zp+o=;
	b=mTZyCOKn7rZe2rxMsDtDxdTGqL9YxEIgL+Y1Pv/himQNrp4yCQkFKd1t7W5Pvtw+u+
	uTGQQEsphRQjd+adXe8gY7z9ormwnGbiNxzTR5NDbePW8am8bP1BzKnMXKpPe2FOA/i5
	TOaeDrp2pkkaSf5Up+tEB17eMOYc6Q5KNI3WalxDNqK7cNK8rTrNAWVJXBwWO62X8tY9
	3fDxMCZ1DNsbd7R2hQQSMyRTk0f4EcnFm35hdOi0cHA9v0W4MlkSjF7zKB5vSTeCqh0x
	KYRVvEtfACUHzWEKvRXMr0TceuQxJAowoR6xi4EXJAQbPu5SQOoHyZv7W3oVdaoYkf7n
	MXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AJqMzPaLGgzJUTeDtjhu51Zp71Ehez8XR/WwQV+zp+o=;
	b=RLxrSX86CkOwiSEev0G7uJj2CXlywv8me1s3V0fhNvfI2Xd2maBARG3XRHlsy9jrpt
	cRPmZRExLitCGexEeyotNos432syxdanDrVNGz5QZjbav80fIgaziP2fD08WTe4AWHek
	ee3g9fzeJld9O3+mPRIKpEQ5/kf5hNmDwCwTw3fKJRmxmzGYrFHMcvcDOOSMSZy0FWTt
	CnAe5slrpszNjDJj2OjrJ2b4p2UpN7kkJkCUxUIiMhFZI1Zhe3lEziybQGDemWXNMsg7
	Js9099Ybh6/DNTMg3xzNIVBdElXRBOwPoLLbcIp2LT3N/+u6WW2vmuKmGunFcS69IPOt
	xv7A==
X-Gm-Message-State: APzg51Adhy0zh1YP5y0801QBvIBC/4Jo+WwgyEcsAIsOTGav0Jojc6gr
	GK9LdrGDs6owzSqsA6yCGExhKYIhuILmzgkIcU8=
X-Google-Smtp-Source: ANB0VdbIdJOjWgEIV1hQJTXpZwFXHcxHShuGL8l1bp2O2ZXBkiGqFkKO9sl7r/qTX1RCeXkUH5BjlloVDSgGvc/gwi0=
X-Received: by 2002:a81:8402:: with SMTP id u2-v6mr1011272ywf.99.1536232636151;
	Thu, 06 Sep 2018 04:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <1536177205-505-1-git-send-email-emmanuel.roullit@gmail.com>
	<20180905220721.GM26633@bill-the-cat>
In-Reply-To: <20180905220721.GM26633@bill-the-cat>
From: Emmanuel Roullit <emmanuel.roullit@gmail.com>
Date: Thu, 6 Sep 2018 13:17:04 +0200
Message-ID: <CADpiqMYRmV5nE43GeB5ntPqJ-w24CiR=fmC8ObH131ziRuJ+6A@mail.gmail.com>
To: trini@konsulko.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: squashfs does support partition uuid
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
X-List-Received-Date: Thu, 06 Sep 2018 11:17:15 -0000
Content-Type: multipart/alternative; boundary="00000000000091fcec0575320805"

--00000000000091fcec0575320805
Content-Type: text/plain; charset="UTF-8"

Got it.
I will tweak it and resubmit a PATCHv2 once I got it right.

On Thu, Sep 6, 2018 at 12:07 AM Tom Rini <trini@konsulko.com> wrote:

> On Wed, Sep 05, 2018 at 09:53:25PM +0200, Emmanuel Roullit wrote:
>
> > wic allows the user to create disk image and reference each created
> > partitions via its partition UUID.
> >
> > squashfs does not support filesystem UUID but it does offer support for
> > partition UUID.
> >
> > $ lsblk -o NAME,FSTYPE,UUID,PARTUUID
> > NAME   FSTYPE   UUID                                 PARTUUID
> > sda
> > |-sda1 vfat     6078-ACD0
> 95aa4ffb-741d-4d99-adf6-0358bc890046
> > |-sda2 squashfs
> 7d46da2d-29cc-4d5a-9e39-d0381c4abb0c
> > |-sda3 squashfs
> d4a3e24e-410a-4f2c-8ad5-8f8321de177b
> > |-sda4 ext4     d72ec529-78e4-4cd3-b39b-781b6b1cb47c
> f3edc990-f4f6-4536-9587-44dae4ceb99f
> > `-sda5 ext4     a0b265aa-e935-40b8-9c6b-e9e58ad3890f
> 6e72ebaa-29ed-41cd-844c-3f76976cf41d
> >
> > Removing this constrain allows a user to create squashfs-based rootfs
> and boot
> > from it with such kernel argument
> 'root=PARTUUID=7d46da2d-29cc-4d5a-9e39-d0381c4abb0c'
> >
> > Signed-off-by: Emmanuel Roullit <emmanuel.roullit@gmail.com>
>
> Please add in:
> Fixes: 2fbdcf4e59c8 ("wic: kparser.py: Check for SquashFS and use-uuid")
>
> > ---
> >  scripts/lib/wic/ksparser.py | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > index e590b2f..92f0b6d 100644
> > --- a/scripts/lib/wic/ksparser.py
> > +++ b/scripts/lib/wic/ksparser.py
> > @@ -196,11 +196,6 @@ class KickStart():
> >                          raise KickStartError('%s:%d: %s' % \
> >                                               (confpath, lineno, err))
> >                      if line.startswith('part'):
> > -                        # SquashFS does not support UUID
> > -                        if parsed.fstype == 'squashfs' and
> parsed.use_uuid:
> > -                            err = "%s:%d: SquashFS does not support
> UUID" \
> > -                                  % (confpath, lineno)
> > -                            raise KickStartError(err)
> >                          # using ArgumentParser one cannot easily tell
> if option
> >                          # was passed as argument, if said option has a
> default
> >                          # value; --overhead-factor/--extra-space cannot
> be used
>
> So I got this logic slightly wrong then.  We should correct the check
> that we don't have parsed.fsuuid rather than use_uuid.  Thanks!
>
> --
> Tom
>

--00000000000091fcec0575320805
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it.<br><div>I will tweak it and resubmit a PATCHv2 onc=
e I got it right.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">On Thu, Sep 6, 2018 at 12:07 AM Tom Rini &lt;<a href=3D"mailto:trini@kons=
ulko.com">trini@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On Wed, Sep 05, 2018 at 09:53:25PM +0200, Emmanuel Roullit wrote:<=
br>
<br>
&gt; wic allows the user to create disk image and reference each created<br=
>
&gt; partitions via its partition UUID.<br>
&gt; <br>
&gt; squashfs does not support filesystem UUID but it does offer support fo=
r<br>
&gt; partition UUID.<br>
&gt; <br>
&gt; $ lsblk -o NAME,FSTYPE,UUID,PARTUUID<br>
&gt; NAME=C2=A0 =C2=A0FSTYPE=C2=A0 =C2=A0UUID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0PARTUUID<br>
&gt; sda<br>
&gt; |-sda1 vfat=C2=A0 =C2=A0 =C2=A06078-ACD0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 95aa4=
ffb-741d-4d99-adf6-0358bc890046<br>
&gt; |-sda2 squashfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 7d46da2d-29cc-4d5a-9e39-d0381c4abb0c<br>
&gt; |-sda3 squashfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 d4a3e24e-410a-4f2c-8ad5-8f8321de177b<br>
&gt; |-sda4 ext4=C2=A0 =C2=A0 =C2=A0d72ec529-78e4-4cd3-b39b-781b6b1cb47c f3=
edc990-f4f6-4536-9587-44dae4ceb99f<br>
&gt; `-sda5 ext4=C2=A0 =C2=A0 =C2=A0a0b265aa-e935-40b8-9c6b-e9e58ad3890f 6e=
72ebaa-29ed-41cd-844c-3f76976cf41d<br>
&gt; <br>
&gt; Removing this constrain allows a user to create squashfs-based rootfs =
and boot<br>
&gt; from it with such kernel argument &#39;root=3DPARTUUID=3D7d46da2d-29cc=
-4d5a-9e39-d0381c4abb0c&#39;<br>
&gt; <br>
&gt; Signed-off-by: Emmanuel Roullit &lt;<a href=3D"mailto:emmanuel.roullit=
@gmail.com" target=3D"_blank">emmanuel.roullit@gmail.com</a>&gt;<br>
<br>
Please add in:<br>
Fixes: 2fbdcf4e59c8 (&quot;wic: kparser.py: Check for SquashFS and use-uuid=
&quot;)<br>
<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/wic/ksparser.py | 5 -----<br>
&gt;=C2=A0 1 file changed, 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py=
<br>
&gt; index e590b2f..92f0b6d 100644<br>
&gt; --- a/scripts/lib/wic/ksparser.py<br>
&gt; +++ b/scripts/lib/wic/ksparser.py<br>
&gt; @@ -196,11 +196,6 @@ class KickStart():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 raise KickStartError(&#39;%s:%d: %s&#39; % \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(confpath, lineno, err))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if line.startswith(&#39;part&#39;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 # SquashFS does not support UUID<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if parsed.fstype =3D=3D &#39;squashfs&#39; and parsed.use_uu=
id:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D &quot;%s:%d: SquashFS does not support=
 UUID&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (confpath, lineno)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise KickStartError(err)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # using ArgumentParser one cannot easily tell if optio=
n<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # was passed as argument, if said option has a default=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # value; --overhead-factor/--extra-space cannot be use=
d<br>
<br>
So I got this logic slightly wrong then.=C2=A0 We should correct the check<=
br>
that we don&#39;t have parsed.fsuuid rather than use_uuid.=C2=A0 Thanks!<br=
>
<br>
-- <br>
Tom<br>
</blockquote></div>

--00000000000091fcec0575320805--
