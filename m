Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0B32072361
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 13:16:27 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id v10so383794qac.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 05:16:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d7VHQn8xz/9OrKp4bmZ/68CV8IsE5H5pmlnVi49nnG0=;
	b=mcxByMJoQmLahFq+IVZgRw6ILoiLnTkxKDSPwW79K7Ne0b8NdzGKz/e4dT6Gor3ORJ
	/AemJ3A8t26qOcp1FaYWBLFAHS4JvyoYtzzOw3RXlakSxeEFET6c0tN+gDQibbC7Jlib
	53CgHxC8h7WzB/7sxaM1MDse4NfP6YBrp32t26PSxUJkcUzc0B9b6qmlUQVTHVO8L7F4
	OI/Pxbo9vNKhaxxwBVZdb8EMe9QPqEFj6M1xucbNYOtdJJw4NxobiC1vWqa6mi6INT/2
	NUPDfiSx38nCzgBVkmkyK9ROmgigM4IJaUJYJl31jXbgh34G30dhK2GMT8qfAS9Dqca+
	DDdQ==
X-Gm-Message-State: ALoCoQmCv9Xave8A+RH9SENlHyKzAPBoLXPiRPDVxXyDN58omHnEoIloWI/A2D7448Jl+U9p4SnL
X-Received: by 10.140.102.144 with SMTP id w16mr21181723qge.59.1417785387547; 
	Fri, 05 Dec 2014 05:16:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Fri, 5 Dec 2014 05:16:07 -0800 (PST)
In-Reply-To: <1417779643-18350-1-git-send-email-awais_belal@mentor.com>
References: <1417779643-18350-1-git-send-email-awais_belal@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Dec 2014 13:16:07 +0000
Message-ID: <CAJTo0LZ1=H4Gz90Ni0sFjL29LMgqMXR18ZTv0uOjLCtsziboEg@mail.gmail.com>
To: Awais Belal <awais.belal@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcb: fix socket writes
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
X-List-Received-Date: Fri, 05 Dec 2014 13:16:29 -0000
Content-Type: multipart/alternative; boundary=001a11c16bc2649a1d050977e2f6

--001a11c16bc2649a1d050977e2f6
Content-Type: text/plain; charset=UTF-8

On 5 December 2014 at 11:40, Awais Belal <awais.belal@gmail.com> wrote:

> The patch has been picked up from libxcb git and is only
> applicable to v1.10 while it gets fixed in mainstream v1.11.
>

If it's fixed in 1.11 then an upgrade to 1.11 is preferred.

Ross

--001a11c16bc2649a1d050977e2f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 December 2014 at 11:40, Awais Belal <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:awais.belal@gmail.com" target=3D"_blank">awais.belal@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3zy" class=3D=
"a3s" style=3D"overflow:hidden">The patch has been picked up from libxcb gi=
t and is only<br>
applicable to v1.10 while it gets fixed in mainstream v1.11.</div></blockqu=
ote></div><br>If it&#39;s fixed in 1.11 then an upgrade to 1.11 is preferre=
d.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a11c16bc2649a1d050977e2f6--
