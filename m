Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1633C60132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 14:58:10 +0000 (UTC)
Received: by lfs39 with SMTP id 39so61347260lfs.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 06:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=E4rJ2y275Lz7v99IdSIm651RajrcBINiMOUK4zaa39Y=;
	b=KtPqOoH7D80puO9h6WzVgzxY7cvvZgg0vFEu3tZH3XsJbkVqZVbA4z0tXZLKaOgHrY
	3yCGiIGTNAdM9b/uuOv7BFotTdNTY4KLkRXZAuizCvF6FOI/VsZ+zErWUJZ5SLAtK5DF
	/L2hcuLRewTdXAnlx/aL4tICXCoruqPKkWsAafkmFgG0T9VzrPztZL+Nj6BeoN+gr7A2
	RD2sa+Q4zQ8POcH8fAv/xqKRL5VkhwIZ3lsub9XNBvONDIOgPmL7dRUojZar/ZKgUPHN
	POp6XvKsAsgyny+rb1/guqsZyPkyeVCUrqgvgBzeODCyp/QeMK6MwCxJVLK/7Awqa4c9
	y8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=E4rJ2y275Lz7v99IdSIm651RajrcBINiMOUK4zaa39Y=;
	b=DMwTd9qDj9AMsxmNckADcCvqQ8996SG8WHaLPenUMoF9f/YBlM2hGvyWRDZ8w6ThuR
	P8muC6iEfjqzbMsmB1c4kAYMzAWs/oZ8H4nybBbSFWXM9/AiQ/hkb8ZrQ2y+f+HDzyc5
	BRquTTCT62Cw2SUsX8By1zFr7nFimWYvZs6aoAcSS4DJRbzBW9o/bPLeCOd42/PUwoCK
	avjKl/Diqt4wyxPbWI9sVBvc8eP7FhDNicsa6lmKJCbCcpMWSi4dAuwSiasrmMB3AzBd
	lMqz1bSCmzt0xK7I9Zgyt07llTGRYksXqjtLquaU9MSdcq1IIju09XzCUFsrvxZ8C+XR
	tYtA==
X-Gm-Message-State: ALoCoQm1869Cq8SUBYo2g6ce4axH89tP4sgnaHvrXfC26IJ16oUdtW0aFxvVCD55JquaQtKPreIY
MIME-Version: 1.0
X-Received: by 10.25.29.202 with SMTP id d193mr12877881lfd.55.1448463490162;
	Wed, 25 Nov 2015 06:58:10 -0800 (PST)
Received: by 10.114.122.72 with HTTP; Wed, 25 Nov 2015 06:58:09 -0800 (PST)
In-Reply-To: <20151125124151.GO17303@jama>
References: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
	<56557491.4010809@windriver.com> <20151125103453.GM17303@jama>
	<CAD3vsf5rOZXj6oxQ4eaEdCW9bMcFJ-He4VyZy4dJ6KScW1S7dQ@mail.gmail.com>
	<20151125124151.GO17303@jama>
Date: Wed, 25 Nov 2015 20:28:09 +0530
Message-ID: <CAD3vsf7T2rOeO5n+XdwzFrT_pEecHPQMOPGxH6CJEMD5FvLn2A@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Wed, 25 Nov 2015 14:58:12 -0000
Content-Type: multipart/alternative; boundary=001a114013a8cd4d0c05255eaf36

--001a114013a8cd4d0c05255eaf36
Content-Type: text/plain; charset=UTF-8

>
>
> is os.getuid() and os.getgid() the correct value you want to use? I
> would expect root:root.
>
>
Yes, since copy_license_files() function is executed within the pseudo
environement (fakeroot), both os.getuid() and os.getgid() return 0, which
resembles to uid and gid of root user. Also, os.chown accepts integer
values for 2nd and 3rd arguments.

Regards,
Jagadeesh

> > > >               else:
> > > > >                   shutil.copyfile(src, dst)
> > > > >           except Exception as e:
> > > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a114013a8cd4d0c05255eaf36
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddi=
ng-left:1ex"><div class=3D""><div class=3D"h5"><br>
</div></div>is os.getuid() and os.getgid() the correct value you want to us=
e? I<br>
would expect root:root.<br>
<div class=3D""><div class=3D"h5"><br></div></div></blockquote><div>=C2=A0<=
/div><div>Yes, since=C2=A0<span style=3D"font-size:12.8000001907349px">copy=
_license_files() function is executed within the pseudo environement (faker=
oot), both=C2=A0</span>os.getuid() and os.getgid() return 0, which resemble=
s to uid and gid of root user. Also, os.chown accepts integer values for 2n=
d and 3rd arguments.</div><div><br></div><div>Regards,</div><div>Jagadeesh<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div class=3D""><div class=3D"h5">
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
lse:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0shutil.copyfile(src, dst)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exceptio=
n as e:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">=
Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/op=
enembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembe=
dded.org/mailman/listinfo/openembedded-core</a><br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D=
"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
&gt; &gt;<br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div></blockquote></div><br></div></div>

--001a114013a8cd4d0c05255eaf36--
