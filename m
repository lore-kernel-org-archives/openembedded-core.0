Return-Path: <alexander.j.kube@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8467FBAF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 21:31:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n7so3648819wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Co9iBjERv8GFMTJcS2rAhvEEZ/HENue1SR1eLq2Xs18=;
	b=dPu972+j7KzJCcBrBnTIUQSZuK7OdsQY6RjmYlW9nVWyVAbI0goIlXsjIYq2eopcgV
	mvj9AOtHVtXznMj1CsgYegd7e3BUohRG+bwsTXxxuqyIHnkl96XxiGnh3KD2+4aAh6hB
	WTBcoP4Vt1Z+Nc3zHeUNDUshwdKdayhsmfiNBjO4n6492C3aZkbuKcuhLui2Z2+IZ/42
	aYreX9b/lyEPV5KWogI9eiFMXZCyA3M6H5Oh+8MxnsUb/lb3yQUXctYvHE6frhcgxF6E
	8tTom47I/dgjY4LQeFnmIYkzbSK9+c0YLg61/SAomSwUAEu/zrgJGIsbRRw7Nqdwkd52
	Kx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Co9iBjERv8GFMTJcS2rAhvEEZ/HENue1SR1eLq2Xs18=;
	b=rW/VY2g65/oyxgauSOINzR/U7C9rQrBAO7ilf7Y4uduTFJOUl+B4i+1oVoTqtnFVgT
	h9yBi2808ggjI7fJcsOLBE6aSpQxjusWluI8ZpMlB3t0zhQflrPxndLSZ17D80L5tJGq
	skLtf5Rcv3N2C/IPok7Ov9b6DC41w/MzWYkOh+lFMvXNFBNCy1arwvbXcPO0vuf1Gen7
	rSEMEZP1+4/GfXYC5F1Mp4Y1Kagy5lAWoeLI1aLk/m9a/lHrbcgNsLGMc7FJJGCcnBR2
	v2cBdBg3CP58WutDGimL9tD59OH8TLRlsPNcnT0xTs4ALBoGJ8tjXje+V+5p17e+tHcT
	8DIQ==
X-Gm-Message-State: APjAAAUsF461eNZ9iPnb++ziCQjXAxBALWR23brBA8wUQpyPm0UvWtFQ
	2dpRaXtG3OMmhTOm2kSdN2x9/my9PjRJb5rQJV4=
X-Google-Smtp-Source: APXvYqzUt0lDDyIaHd/plfhUyS9lbapFyPegxwi9hAbXXHjYesAFz7sFkla14h7D4sdUkA/Q5XxbdVkxqpSqRtASXzw=
X-Received: by 2002:a1c:1d10:: with SMTP id d16mr5552990wmd.14.1572039081014; 
	Fri, 25 Oct 2019 14:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
	<CAMKF1srShdu_W4S5pnFJNwtFWptPnho1cteCW4NsNvKG0eVF2w@mail.gmail.com>
In-Reply-To: <CAMKF1srShdu_W4S5pnFJNwtFWptPnho1cteCW4NsNvKG0eVF2w@mail.gmail.com>
From: Alexander Kube <alexander.j.kube@gmail.com>
Date: Sat, 26 Oct 2019 02:00:44 +0430
Message-ID: <CAO7qD-u5PBR9SVGt8WM4_cad8FiNb5G8GNc6mrT9dp63hDyj8Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Add recipes for Go v1.13
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
X-List-Received-Date: Fri, 25 Oct 2019 21:31:20 -0000
Content-Type: multipart/alternative; boundary="000000000000ff38b00595c2de54"

--000000000000ff38b00595c2de54
Content-Type: text/plain; charset="UTF-8"

Done. The latest patchset removes go-1.12 and cleans up the rest of the
1.13 recipes.

On Fri, Oct 25, 2019 at 1:49 PM Khem Raj <raj.khem@gmail.com> wrote:

> 1.12 should be removed along with this
>
> On Thu, Oct 24, 2019 at 6:29 PM Alexander Kube <alexander.j.kube@gmail.com>
> wrote:
>
>> This patch set adds various go-1.13 recipes and changes the
>> poky GOVERSION to 1.13%. It leaves the existing go-1.12
>> recipes untouched and available for existing users of
>> those recipes.
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000ff38b00595c2de54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Done. The latest patchset removes go-1.12 and cleans up th=
e rest of the 1.13 recipes.</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, Oct 25, 2019 at 1:49 PM Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"auto"=
>1.12 should be removed along with this=C2=A0</div></div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 24, 201=
9 at 6:29 PM Alexander Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.co=
m" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">This patch set adds various =
go-1.13 recipes and changes the<br>
poky GOVERSION to 1.13%. It leaves the existing go-1.12<br>
recipes untouched and available for existing users of<br>
those recipes.<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>
</blockquote></div>

--000000000000ff38b00595c2de54--
