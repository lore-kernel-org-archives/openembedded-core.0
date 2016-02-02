Return-Path: <diego.sueiro@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id D464A76230
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 16:13:10 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id l143so54819706lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 08:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=in0NmjD13DVoagVxR/qItfm9BanOMUYFikOcPrUsL7Q=;
	b=rz2AcegiSpgSbjMbrGXP6GSZhS8NFrT8RMYlUj9nz1jQUKBe3ts2dXiV6dMSTQjLhq
	mnf0XZB343DLOemnx0K0ny8HbkbgWd45J/NHBs9j9bfhPlzJvU0eaDWYEW48xouOWYOh
	NblNsBb9sZyB+vYK0GGm5WsYQyQD2ARgI0fz+ljyyKOVS8svskprPfGlUg6nkHAo4e5f
	DcmTrBBeddcNq4W2Y5BoQKfLJkKhInBx0x8lluS73XqummSuIETX3Hmk1u69WDGajf4T
	J0/7NiCrEUkHwpREMqXWy8SdIJSURxDHAYVd3eCNF5dXdYwN0Cg74IkEpBKc37+qcTVl
	d8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=in0NmjD13DVoagVxR/qItfm9BanOMUYFikOcPrUsL7Q=;
	b=d+MGKV/FL6NmXAA8FUIrCZBduVQDfQEc1gzZvPu7NFp4Dy3Lk0MD7xilj+lOdzPhNX
	MzF5kJLkRpLQqB1bnUarcNCePnTWhI3UrjFH2mRcacmUpFF2DMt+XIFYG2x+rPC7lQxT
	0N7CJFuW/gMUyJWmySJ75dSSvhywdPJZAEvMERziyiaBc+Iw5SAN90+7k0k9bE3AzMbe
	qeL8SXtojPBxa/MxeXykW7ERSPbsoZbneAnHtaCvBQ8c6OwcSHa1GopWhg1P9eo6mc7R
	h9+QWlovqfFx6vI37Ja+61VBARF2+GE1IM5WWHdzOXNIDeYYwfW7hDN382T1VnFnU+qo
	Unog==
X-Gm-Message-State: AG10YOSqhh9aZIzoKhGqYeOq6NxdSRXyhH4ehs9uIeoYyiAAxrrHAqfPj0SH9POzEPdAAgqLgvdV5U31zmBGiQ==
X-Received: by 10.25.15.226 with SMTP id 95mr12194080lfp.85.1454429590258;
	Tue, 02 Feb 2016 08:13:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.171.168 with HTTP; Tue, 2 Feb 2016 08:12:50 -0800 (PST)
In-Reply-To: <569EBB4B.7020606@gmail.com>
References: <CADkTA4PoDAgiJ2kdpT9HBnWLfGG-spLmSnF66BP33z520ig6wA@mail.gmail.com>
	<1450132548-31177-1-git-send-email-haris.okanovic@ni.com>
	<569EBB4B.7020606@gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 2 Feb 2016 16:12:50 +0000
Message-ID: <CAMCfZKFzUu7gRsgbw0rNBQZaRcLm7mbF=dZ9mvUx4DJfmSnynQ@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: Gratian Crisan <gratian.crisan@ni.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 02 Feb 2016 16:13:11 -0000
Content-Type: multipart/alternative; boundary=001a113fb4d4140b1a052acbc7ad

--001a113fb4d4140b1a052acbc7ad
Content-Type: text/plain; charset=UTF-8

Haris,


On 19 January 2016 at 22:40, Haris Okanovic <harisokn@gmail.com> wrote:

> Any concerns pulling this into master as-is?
>
> We briefly discussed the possibility of building out-of-tree modules
> against multiple kernels back in December, right before this thread
> died. This change certainly doesn't preclude that improvement if someone
> would like to implement it, nor does it change current behavior.
> More importantly, it provides a useful function as-is in our opinion --
> E.g. to provide a debug kernel in a feed for testing/development
> activities.
>
> Thread:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/72908
>


Could you please give examples how kernel recipes look like?

I'm particularly interested in this feature.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a113fb4d4140b1a052acbc7ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Haris,</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On 19 January 2016 at 22:40, Haris Okanovic <span dir=3D"ltr">&lt;<a href=
=3D"mailto:harisokn@gmail.com" target=3D"_blank">harisokn@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div id=3D":j4x" class=3D"" style=3D"ove=
rflow:hidden">Any concerns pulling this into master as-is?<br>
<br>
We briefly discussed the possibility of building out-of-tree modules<br>
against multiple kernels back in December, right before this thread<br>
died. This change certainly doesn&#39;t preclude that improvement if someon=
e<br>
would like to implement it, nor does it change current behavior.<br>
More importantly, it provides a useful function as-is in our opinion --<br>
E.g. to provide a debug kernel in a feed for testing/development activities=
.<br>
<br>
Thread: <a href=3D"http://thread.gmane.org/gmane.comp.handhelds.openembedde=
d.core/72908" rel=3D"noreferrer" target=3D"_blank">http://thread.gmane.org/=
gmane.comp.handhelds.openembedded.core/72908</a><br></div></blockquote></di=
v><br><br>Could you please give examples how kernel recipes look like?<br><=
br>I&#39;m particularly=C2=A0interested in this feature.<br><br><br clear=
=3D"all"><div><div class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,=
</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Emba=
rcados<br><a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_=
diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego=
" target=3D"_blank">www.embarcados.com.br</a><br><br>/*long live rock &#39;=
n roll*/<br></div></div></div>
</div></div>

--001a113fb4d4140b1a052acbc7ad--
