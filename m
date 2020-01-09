Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0BC7CDAC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 15:34:08 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id y23so2661572ual.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 07:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qsqXubQ3Mue2Ct0CIvw6cry2vyEBnVvUGasc2hmqrhA=;
	b=aF/Y8stayS29o//Css/lb3ns+cdN5PElGXj4JHm4nJRQHcrRoZak/4Y8+Z01Jdfio4
	oCctaeQzcZbI/q82IrFJdWd42mYpktItTP5KNi4HxUL737cGtX7TD8Od7pZVjuiSJle/
	kgMbOZbG8cXGDqb/hw/qRUvf0ila90jnNz/smeMSf5ugQyP2emxM327i+j0Fvz1yH+JR
	ej31hFS7+PdnbsYjw3pMcmOLAM98viRKHAhJjRJ9xkIJ6SE3yp7sjNsXSxVb68uh1UQy
	a7XPqspasPI+UzWcI7tpfkhA7N+Vk/h2kFoygp1/FZpZx/e9MxvgRFPDuOTPBupmERde
	EMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qsqXubQ3Mue2Ct0CIvw6cry2vyEBnVvUGasc2hmqrhA=;
	b=gSipjOEh94gc+0hCVBAWLJJ0D3hbxJPLT71wzkOst86/BSNoMsavIYnuLNmGW4Z6wh
	8FesHPydM3LpClWLkfQbzbxGnZaOyDSg4PHfRV6DGDZoX0EARINrAOTmsH54hKpunHru
	nP+b9o/9ZMQt6rabaDjOmqxyJD02DcSP7lDysf4hUQSxR5uCx5WVMfooxCzB/ih8KL6l
	HQOdAJhWHfMMbMqHDSe0I3ClBxzaPiyy8AZ0pTJi0wtu9OGcJyPqglMSYaum+/oSp0Fg
	bqlo3aWAFXUhd63KpFMMka2PXD4xVaWx6MD/rvIYu+2ZVkMhOEYecCQUXuj+/5fGaBP5
	v5rg==
X-Gm-Message-State: APjAAAWHx6jKCWEh+cqE/dNTVeYWyuJRHY3KlIOFBUUIfXEVJabzV+Z3
	opsflYCNn+r8JM29fjVH/po5M/AeZEnMnwBfoKJDvX86
X-Google-Smtp-Source: APXvYqwzKE6jUc5DsMkxP9PmKzpksXhxog1OpFfVqeleHcQuLnOiA6WwvetLlGAbN6KjIKh4ri1q2929lFccp+qzgII=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr7686012uar.100.1578584049895; 
	Thu, 09 Jan 2020 07:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
	<CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
	<e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
	<CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
	<20200109144454.GB31026@bill-the-cat>
	<CANNYZj_rB4cPnGTqoO4MX1iwj2N0a6bhP3jvxCwOuO9mfMRSLA@mail.gmail.com>
	<20200109150148.GC31026@bill-the-cat>
In-Reply-To: <20200109150148.GC31026@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 16:33:58 +0100
Message-ID: <CANNYZj-UjHc=f-yvfGXhqRH_4AKKzrAdgaX1i_jpzDSAEFfnRQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 09 Jan 2020 15:34:09 -0000
Content-Type: multipart/alternative; boundary="0000000000008ad942059bb6bd98"

--0000000000008ad942059bb6bd98
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2020 at 16:01, Tom Rini <trini@konsulko.com> wrote:

> On Thu, Jan 09, 2020 at 03:47:24PM +0100, Alexander Kanavin wrote:
> > On Thu, 9 Jan 2020 at 15:44, Tom Rini <trini@konsulko.com> wrote:
> >
> > > The problem here would have been caught with systemd-free and
> > > busybox-free being a check in lib/oeqa/selftest/cases/imagefeatures.py
> > > yes?
> >
> > Yes, and you'd also need to do -c testimage on the image to make sure it
> > boots and has the network up and working.
>
> Yes, but I'm thinking in terms of what to change / add so that it would
> be part of the standard suite.  busybox-free but systemd is today, yes?
>

I can't parse your question :)

Alex

--0000000000008ad942059bb6bd98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 16:01, Tom Rini &lt=
;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Jan 09, 2020 at 03:47:24PM +0100, Alexander Kanavin wrot=
e:<br>
&gt; On Thu, 9 Jan 2020 at 15:44, Tom Rini &lt;<a href=3D"mailto:trini@kons=
ulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; The problem here would have been caught with systemd-free and<br>
&gt; &gt; busybox-free being a check in lib/oeqa/selftest/cases/imagefeatur=
es.py<br>
&gt; &gt; yes?<br>
&gt; <br>
&gt; Yes, and you&#39;d also need to do -c testimage on the image to make s=
ure it<br>
&gt; boots and has the network up and working.<br>
<br>
Yes, but I&#39;m thinking in terms of what to change / add so that it would=
<br>
be part of the standard suite.=C2=A0 busybox-free but systemd is today, yes=
?<br></blockquote><div><br></div><div>I can&#39;t parse your question :)</d=
iv><div><br></div><div>Alex<br></div></div></div>

--0000000000008ad942059bb6bd98--
