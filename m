Return-Path: <nick83ola@gmail.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 270A97F54C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 17:06:37 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id l21so6992986lje.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Vzsj/t/N9ND09cIqkwY1Nc/POfQC2zV0xFz9PX5KA1s=;
	b=KPkqkwv5cZtIhis8Ka//AJMQZAc8k1ylRjlg7m0ZqH/lJVkozwhqc2gEP1edT+nmpz
	F9U3YmnoWgRpTwGT3PCuNwjQBEqqvu750lPOgv45YeauEc6xnrsaNno7QyEvQiS/1NxT
	wHoW1YhfUG2O4Y53/YJmturcFHmXV4yLGzvQLHNwTTqVBGrjIzgoTUuZebgupU/RKdMm
	l79CTyUnh24BTxBsuLn9jHyS1WmWtmXdoy3N56T3+B/bXks3UbGT7lAQkbNmrI3Jl5f0
	vw2yiSpsj4YsMusF/whoA4nDSDvbMr2J465N//yVIL3J3iDkzW5IVEjjXwH0wroYk1uw
	ESrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Vzsj/t/N9ND09cIqkwY1Nc/POfQC2zV0xFz9PX5KA1s=;
	b=aloIygrazxXJN7sC0GVSMWQ0k/Aq5C8iDlTW9AKiFOhphif6RAifKunyp0PWdKRRA4
	ZMY38z9rZjGG/ym1b3+75/1oai4BpUtrEiycaLNNnMT1d8rJghN0kAaKD2Wpd0i1pnIf
	S4tXMrXp9hPGuSlqc5XWDf/hwGR0mXJ/Gt+AXUZxjEnJV5V/4ruSYfVO4HEbxpUWuJhm
	hCYVdVphzgszRtz6why96k0WTodqt1yCBpkdPx0IOjyN+DI3LbErcMyWEuCRThq38M/w
	C2qSJyVGEzxBMpJ6M6s+srWrNRhc7jG4/L+S3gnlhRyfp+ZGWBAoiCz94SRVjs/y0HCE
	523Q==
X-Gm-Message-State: APjAAAXIEdCOTjKeY667DBDnsIglTkIZqTGP0pBJ/2vxZT371tuJO6dk
	K9yTBCi3o/+L3/yiGFELLzWzSwDkqhuRZep33hn2Dw==
X-Google-Smtp-Source: APXvYqytZdoeT6daOqka3KNE0YppF/eU1zHBZRpGrHL95I7Y+dw5PBeODNCfEYMf8Mhn/60McbNySqTX7DAuLRYCPBw=
X-Received: by 2002:a2e:91c3:: with SMTP id u3mr6732201ljg.177.1570727196937; 
	Thu, 10 Oct 2019 10:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191003164043.17347-1-nicola.lunghi@jci.com>
	<3a61b4fb-de17-0222-100d-3fd27ce611f8@intel.com>
	<CABPh3UPM6TCnGp309VUNPw7gfyhVrZ4WsDACQ1DZ43djJU=gNA@mail.gmail.com>
In-Reply-To: <CABPh3UPM6TCnGp309VUNPw7gfyhVrZ4WsDACQ1DZ43djJU=gNA@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 10 Oct 2019 18:06:25 +0100
Message-ID: <CABPh3UMz=PRWc=G6qvHg3JXHWpSii338uiMh=+8Q76K+MfegdQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [meta][PATCH] ofono: run oe-stylize over recipe
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
X-List-Received-Date: Thu, 10 Oct 2019 17:06:37 -0000
Content-Type: multipart/alternative; boundary="0000000000009cd1e00594916cd2"

--0000000000009cd1e00594916cd2
Content-Type: text/plain; charset="UTF-8"

Hi Ross,
yes I was thinking the same thing.
Also the init file has some issue.

Last thing: there's any particular reason why is better to use a tar.gz
instead of git?
Because git makes creating patches a lot easier.

Thanks
Nick


On Fri, 4 Oct 2019 at 16:46, Ross Burton <ross.burton@intel.com> wrote:

> On 03/10/2019 17:40, Nicola Lunghi wrote:
> > From: Nicola Lunghi <nick83ola@gmail.com>
> >
> > Variable ordering changed slightly and add the SRC_URI to the inc file
>
> If you're tidying up the recipe we might as well merge the bb and inc
> file, as the inc is pointless.
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009cd1e00594916cd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr"><div>Hi Ro=
ss,</div><div>yes I was thinking the same thing.</div><div>Also the init fi=
le has some issue.</div><div><br></div><div>Last thing: there&#39;s any par=
ticular reason why is better to use a tar.gz instead of git?</div><div>Beca=
use git makes creating patches a lot easier.</div><div><br></div><div></div=
><div>Thanks</div><div>Nick<br></div><div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 4 Oct 2019 at 1=
6:46, Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_b=
lank">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On 03/10/2019 17:40, Nicola Lunghi wrote:<br>
&gt; From: Nicola Lunghi &lt;<a href=3D"mailto:nick83ola@gmail.com" target=
=3D"_blank">nick83ola@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Variable ordering changed slightly and add the SRC_URI to the inc file=
<br>
<br>
If you&#39;re tidying up the recipe we might as well merge the bb and inc <=
br>
file, as the inc is pointless.<br>
<br>
Ross<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</div></div>

--0000000000009cd1e00594916cd2--
