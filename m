Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4D90D6132B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 20:24:40 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id z8so6205195ioh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yf1KOO4TOV5LDLPpEkeQiBkuzha39CKpEpHUjYOpcY0=;
	b=FT9nl8Ycz0vP+Olk5uTXBXrFErArSB54Ba9OWY35D4e8+yGGCPDVXdvH/ChlKc6Xi2
	26hlIhAmSGlFV6HIKBtRCjTk6YxXqMzQPY+DsivFOAMSj4rRKRVZ+aXFtHsIE4wRLeom
	RVs+0HAjZiQSTbd40ObH7SE6x3fXAu3Jptsl9NtjcWnCCZ83fPzMUoMivJXH+6Ncl8+e
	QmaVpw65anL6zA1WB+Xx/VnZ+PlH3NP0/ShWw2ZDfSM4wZe/5AciOt41VAtPgBRjHpDl
	r99hhKPpMgEaOaisLJvNcGzQmQRj1fBm3kORlKPxuk6XP60RIAM+iQM8SmwodsKvYujt
	Cyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yf1KOO4TOV5LDLPpEkeQiBkuzha39CKpEpHUjYOpcY0=;
	b=A1vdP9XhOBsmYHIItheneRLAjFspWKUMWtgLdeq1VZkd31ImJhwvDenHakt5TEHolr
	xRUw0v1xE+cZ0G3SuQLnCNYsr7+zqL6h6mIIlGi7Lr6IzByxnRBCmOp79IrIFgixZWXD
	iw4Y2IXe6c0U8UXXqk0j7s5xjGD9DSf0UjX0C9Isp+NT5dVxpMrIt7lsUZOPlwMkXSRl
	AKCLJkdkshNRsUijwmhYVe+GShHHnDp+TNFejnhb+BI2gSjiZsiG4U8HR0RtTylggasE
	fh1VJLv62ngF05Uhguzsl+JzwtRoMDIt+ZN8v/IZWz+MXzEmv3vqiAbVLP5bmnd9rG9Q
	D/QQ==
X-Gm-Message-State: APjAAAUJ3LBqXH0+NmWipVgJ2QAVuOTQaG6pPScpodwm58+iza8udoZW
	7GZpbjVrNLUYo3KUxttle98WsVC1H3obzgSydxE=
X-Google-Smtp-Source: APXvYqyBZyqIQcgHYaFqW3YrY7ykv08c7QRxvNaSl+G1QK3TnHlC/aFHd4rRcscEDQIxOmoGqA+N3x4hSB87ASgEYWs=
X-Received: by 2002:a6b:7846:: with SMTP id h6mr27659375iop.224.1582230281224; 
	Thu, 20 Feb 2020 12:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20200220002849.9126-1-schnitzeltony@gmail.com>
	<CANNYZj9pFMxP7nYkUOyQ4wcejkr4j+EBqa3OdJZXgEKB7ZtX=Q@mail.gmail.com>
	<CALbNGRTruaPGSJTNd816++UuYJTyL1=r2KHeKquENLTa=08UWA@mail.gmail.com>
In-Reply-To: <CALbNGRTruaPGSJTNd816++UuYJTyL1=r2KHeKquENLTa=08UWA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 20 Feb 2020 21:24:29 +0100
Message-ID: <CALbNGRSFZcsh0ZKBgyRX+eg3ThZbRf1ryiVbHU5Y0vZgd0BkTg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] webkitgtk: add PACKAGECONFIG gobject-introspection
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
X-List-Received-Date: Thu, 20 Feb 2020 20:24:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 1:45 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Thu, Feb 20, 2020 at 11:07 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > You need to at the same time drop the introspection enablement logic fr=
om EXTRA_OECMAKE I think?
> > This line:
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-sato/w=
ebkit/webkitgtk_2.26.4.bb?h=3Dmaster-next#n70
> >
> > And for consistency, it would be good to do the same for gtk-doc.
>
> This is odd: I fell over this because there was no gir created. Did
> not notice it was few lines below. Need to check that - maybe I am a
> bit off-sync to master or something is wrong elsewhere.
>
> Will sync to master and send V2 then.
>
Finally had time to look into again. In the recipe there is

GI_DATA_ENABLED_armv7a =3D "False"
GI_DATA_ENABLED_armv7ve =3D "False"

=3D> My patch is wrong it overrides above accidentally - thanks Alex!

Since webkit builds gir fine (my machine is armv7ve) that does not
seem necessary any more. I would like to send out a patch removing at
least armv7ve - shall I take the risk to remove armv7a - maybe as two
patches?

Andreas

