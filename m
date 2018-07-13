Return-Path: <vladzouth@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 54B04786A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 08:27:22 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id l7-v6so30649628ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 01:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f0tT2dl7uMaejmdnGN0ZwfxvwrkzTlgM6PIw/Q2w4GY=;
	b=rMxTd+8Dvt5/SY72t+q4Mq19AXx0aKG5uMWfIEDEKqFXO+dk0f0zbBdSxPBXNmareh
	pkKYHU9Sa6wFmhQHxZYeNVIhgdXKNaBJJrmo8Lj1eSQJn9Q1TTcj8dXdzvVCFZ5RWO0i
	7mUySbrtjf7YzJg3Eu0QTlAZPdcH5Vxc38B00/TybGshLDpS+JncjjBQVwcqFJqaH+Py
	WMdP5mtUvxi55f+6wwITpXKSIGC5nSZfxCoCieE2V28TCVx5/k2/D5/WUZxFcs6WDxH8
	JQhGpOZGQPztbQRffCuvPS04TdP3pTk6lN1MsbYJx94yod5gV+UNMuAfPc6KiTn/VDdv
	aFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f0tT2dl7uMaejmdnGN0ZwfxvwrkzTlgM6PIw/Q2w4GY=;
	b=TGKBTfX5j20+u1S6Diw5aayD6dohcIuUFw+c2Hjb1LesUiJMShbDv8q1xmjZ57ZlaG
	0vvQCm8ljMpfUoehUwEGTzDG2u+yNsDP9ueD7xlXblm4X16B+B/Axn7NdRfr39Qc5yUh
	4BnysZFXoMPmQoygj4V8DkqRYvOaR5aUTcr07OpenH2+BoIVfcnUufE6R9e03+nY9vaN
	IgH18r+NMs6qfm6OmKdX9YYnBJnYZ5hT1/kprsw2JGMwZbGJjZPvlVo99zCXnlYrBHSB
	f/H5vnAXPB4muDPUWF2SW0voliw+jfrKz3u4fhcvggdFnBZRhMWBO0YL677Qy1na+pHX
	la9Q==
X-Gm-Message-State: AOUpUlEuDZ7KOuSiw9ucWXHYMAm1IRXuweKnGaBqDdD5N5iwFv4sFCPK
	MG6nhOFfziPEqxJ85ZvVld34Ax1F6OKCZuOJGWQ=
X-Google-Smtp-Source: AAOMgpeEM7x9Ff7eHjq9N9D1uiE6i5x1mbpyEEzR7Wn4PixrnJtA/fH0Yf78DKHxpibOj6W9UfVt5cmC5pEjW3198E8=
X-Received: by 2002:a6b:b0c5:: with SMTP id
	z188-v6mr29749181ioe.220.1531470443173; 
	Fri, 13 Jul 2018 01:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <CACoJdSaG3UefHMXmfOhe0f7-2rHyfr8B7k4-BZ2iG5uKY_5UBA@mail.gmail.com>
	<CAJTo0LaNOgufq6L95XEGD2ChN5c-fbBLLY4UkUDd09=5g8vE-g@mail.gmail.com>
In-Reply-To: <CAJTo0LaNOgufq6L95XEGD2ChN5c-fbBLLY4UkUDd09=5g8vE-g@mail.gmail.com>
From: vlad zouth <vladzouth@gmail.com>
Date: Fri, 13 Jul 2018 10:31:21 +0200
Message-ID: <CACoJdSZgQQBCb0bjvneUYo=1J+39tMwoQgiihBU858D6J3BPuw@mail.gmail.com>
To: ross.burton@intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Building postgresql_9.4.5: Some Packages are missing in my rootfs
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
X-List-Received-Date: Fri, 13 Jul 2018 08:27:22 -0000
Content-Type: multipart/alternative; boundary="000000000000bfdc350570dd3f31"

--000000000000bfdc350570dd3f31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you !

Le jeu. 12 juil. 2018 =C3=A0 18:40, Burton, Ross <ross.burton@intel.com> a
=C3=A9crit :

> On 12 July 2018 at 17:36, vlad zouth <vladzouth@gmail.com> wrote:
> > Hi,
> > I am facing an issue about adding postgresql. Here is the recipe files:
> >
> >
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/postgresql/postgresql_9.4.5.bb?h=3Dkrogoth
> >
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/postgresql/postgresql.inc?h=3Dkrogoth
> >
> > In fact, when i build an image, all the packages included into this
> recipes
> > are present in the postgresql image directory but, for example all the
> > program added by the variable FILES_${PN}-client are not in my rootfs.
> > For more precision, i use fsl-community-bsp project and krogoth distro =
to
> > build an image for the tx6s-8035 karo board.
>
> If you want postgresql-client to be in your image, then you'll need to
> add postgresql-client to your image (IMAGE_INSTALL, etc).
>
> Ross
>

--000000000000bfdc350570dd3f31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you !=C2=A0</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">Le=C2=A0jeu. 12 juil. 2018 =C3=A0=C2=A018:40, Burton, Ross &lt=
;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 12 July 2018 a=
t 17:36, vlad zouth &lt;<a href=3D"mailto:vladzouth@gmail.com" target=3D"_b=
lank">vladzouth@gmail.com</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt; I am facing an issue about adding postgresql. Here is the recipe files=
:<br>
&gt;<br>
&gt; <a href=3D"http://cgit.openembedded.org/meta-openembedded/tree/meta-oe=
/recipes-support/postgresql/postgresql_9.4.5.bb?h=3Dkrogoth" rel=3D"norefer=
rer" target=3D"_blank">http://cgit.openembedded.org/meta-openembedded/tree/=
meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb?h=3Dkrogoth</a><br>
&gt; <a href=3D"http://cgit.openembedded.org/meta-openembedded/tree/meta-oe=
/recipes-support/postgresql/postgresql.inc?h=3Dkrogoth" rel=3D"noreferrer" =
target=3D"_blank">http://cgit.openembedded.org/meta-openembedded/tree/meta-=
oe/recipes-support/postgresql/postgresql.inc?h=3Dkrogoth</a><br>
&gt;<br>
&gt; In fact, when i build an image, all the packages included into this re=
cipes<br>
&gt; are present in the postgresql image directory but, for example all the=
<br>
&gt; program added by the variable FILES_${PN}-client are not in my rootfs.=
<br>
&gt; For more precision, i use fsl-community-bsp project and krogoth distro=
 to<br>
&gt; build an image for the tx6s-8035 karo board.<br>
<br>
If you want postgresql-client to be in your image, then you&#39;ll need to<=
br>
add postgresql-client to your image (IMAGE_INSTALL, etc).<br>
<br>
Ross<br>
</blockquote></div>

--000000000000bfdc350570dd3f31--
