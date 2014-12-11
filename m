Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id B0D2860232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 15:35:36 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id m20so4073055qcx.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 07:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D2XJ0TrFrS9vIovM/spR8EBvn9WTPimpawDfAeXYS+Q=;
	b=HwCsCTXED+6PLf2gn0zo7SRRdPNrOkQ8w8TyCQbt4/MwDXqfb1IbWV218VfQBJ89sA
	KB4kjDxRcRKSBFmjFGlXjkOvTTbF3cM/nP2jn+dSxhnTj1jeKBoMJRYT4ViZqwLrueXZ
	iOjXb06Oc7FJQL0ICUFrpVAS7z5AzDQSJ3tRvbxpCoZ+DrHpAzSN4FaFk1ihsmYpm1x5
	zhv3MhFuTjT1ZoZ2bnfvgyjE0l2/O3mCxPPpS+lCyxlkzzpT3D9CCkEeqVylNTh5VNw9
	47p5JLAY9gALOKcZsgW5rmLWBIytg3h4gtkavE3WFJ+C1xN8QTNDnd5F+GdHglaGDh3j
	jy5Q==
X-Gm-Message-State: ALoCoQl+r7Vg5/t0vV3TXuWrqF4LCuooLNvZ3moFU3rO/zIRx0VCUEFQ6dn1oe3mh41oVJxoHbVx
X-Received: by 10.140.94.229 with SMTP id g92mr19848289qge.77.1418312136682;
	Thu, 11 Dec 2014 07:35:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 11 Dec 2014 07:35:15 -0800 (PST)
In-Reply-To: <CADkTA4MHJm2RpHxSLy3cfVQEKfhMp6WBpJMWL28NByt0qnY4NA@mail.gmail.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0LaGa3ACsL+vLjzUDgEQDDxJ2L2m1WQgj1LHdbzpsJPLUg@mail.gmail.com>
	<CADkTA4P0XMtSxKop9vqr6SbS8KBmaGuZfKFs7Ej0CsDcqLt4DQ@mail.gmail.com>
	<1418306324.22903.72.camel@linuxfoundation.org>
	<1418309772.22903.74.camel@linuxfoundation.org>
	<CADkTA4MHJm2RpHxSLy3cfVQEKfhMp6WBpJMWL28NByt0qnY4NA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Dec 2014 15:35:15 +0000
Message-ID: <CAJTo0LY8B-GOaMbhv4iLZw8XvYLXqRX6ycYjRXv7qP3tc8foaA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH 0/9] kernel: version updates
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
X-List-Received-Date: Thu, 11 Dec 2014 15:35:40 -0000
Content-Type: multipart/alternative; boundary=001a113a0e8e1687cc0509f2874e

--001a113a0e8e1687cc0509f2874e
Content-Type: text/plain; charset=UTF-8

On 11 December 2014 at 15:26, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> Do we want to leave the series as is, and I can send it as an incremental
> patch, or would you rather it squashed and the branches updated ?
>

Squash and re-push would be best.

Cheers,
Ross

--001a113a0e8e1687cc0509f2874e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 December 2014 at 15:26, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3l=
1" class=3D"a3s" style=3D"overflow:hidden">Do we want to leave the series a=
s is, and I can send it as an incremental<br>
patch, or would you rather it squashed and the branches updated ?</div></bl=
ockquote></div><br>Squash and re-push would be best.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div class=3D"g=
mail_extra">Ross</div></div>

--001a113a0e8e1687cc0509f2874e--
