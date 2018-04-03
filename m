Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id CB343749D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 20:14:45 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id x4so37496683wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 13:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j5lUhe4m0NtwZzfiJXJzPZ0vTleApQvmgb9qXoJAasc=;
	b=LVKeV1z42cMc8a7ZrG437d7XoWOGmJVDY0lBOnt4Sv4RfFwG15M2ioBgkb1/rQnl5T
	BgWCpQ7RwElVTP0THA4lFDSRbaGlXlT5U64wDjAab0xxmHyuZIucgEKbfmAMh2it0J51
	RKIwxyEhYfi3ZPMK3nQ1//f8ydopkrJ5YyvT3mYRwhHlODm580dKU+HNmRYxNJsznQQc
	Pwkd22pAt3Co4du6//OeAwHYewuGSPTf8dcPFEHlHxpxfPsKPv3DbgfKRn1l+kCltjW/
	rBGGA+eeOws43fkCNTFa3AWXB6ux3zAwtURsWQeZTtpq4et/mukw7XTd1fLLoQbvPZ/D
	Arow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j5lUhe4m0NtwZzfiJXJzPZ0vTleApQvmgb9qXoJAasc=;
	b=c6TesSPFDfr5NBgyUXiNJ6s3LTWuSVTCqOfUEf7UgxELudFHdA0wVOm0EYimqkDniF
	9+rJE4DeEqgOkRSrahrmfbxYh26svRZI2c/J8/u6PdpY0B6dZTGSNANRo+XDDLO4ep3Y
	Nrvwcp3tEa1Gf4IHoHWMSObVJsvTULREbd3rYUwFT5CvPRKK/AnBmDrePv1eF+8Gzwpr
	oDxrZ7msRcn0k5H3pj3kH98Qyw3aH/9e+eGHrh4E3aqgnAkzUx/XuQ5xjNnSrIJal+FP
	mXfn5qASylsNg+fGLe4ZFcGmRdGCYC2yejth73vFnb3N9lav2WYic9geuZiYc61RaL7z
	EFlQ==
X-Gm-Message-State: ALQs6tANKGKJ5Dt+mnovZAD+PmtaVC/1CbB42hyr7SFhESXVDNJTCHW2
	nLixr7Dcr6LZBq4KnxCNi3dpDCTp06DZ1eOEEsw=
X-Google-Smtp-Source: AIpwx497pc2EIQAA34k3CjiEXBv/HnJrHz3bOO5X/vG+lmlrcpPxTsZ0luFOWsMvEq5PtHXBVYV0SvAGkXXFyMgFR5Q=
X-Received: by 10.28.216.70 with SMTP id p67mr1703314wmg.122.1522786486373;
	Tue, 03 Apr 2018 13:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Tue, 3 Apr 2018 13:14:45 -0700 (PDT)
In-Reply-To: <CAGVhguFaRNREK3U6ivU7Z6xc2tuTFPpZ6dtsBB6rYjD0wTp=_w@mail.gmail.com>
References: <CAGVhguFaRNREK3U6ivU7Z6xc2tuTFPpZ6dtsBB6rYjD0wTp=_w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Apr 2018 22:14:45 +0200
Message-ID: <CA+chaQeD9aNOzt-qmU6wX9kMqoBMJ2Ha-bLzF0H2_OBLgtBvUA@mail.gmail.com>
To: C Michael Sundius <msundius@sundius.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: netmap
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
X-List-Received-Date: Tue, 03 Apr 2018 20:14:46 -0000
Content-Type: multipart/alternative; boundary="001a11469ee096d10b0568f75b84"

--001a11469ee096d10b0568f75b84
Content-Type: text/plain; charset="UTF-8"

Use git log and you'll quickly
find 216e95669c6b884735f3f8a5ca1ee37a28d68b3e where it got blacklisted
couple years ago and then ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3 where
the blacklisted recipe was removed. Both commits contain a bit longer
explanation why.

On Tue, Apr 3, 2018 at 10:04 PM, C Michael Sundius <msundius@sundius.com>
wrote:

> I do not see netmap in the most recent version of meta-openembedded
> (i.e.  http://info.iet.unipi.it/~luigi/netmap )
>
> though, while googling around I see references to a recipe that existed
> some time ago.
>
> did this get removed for some reason  ... it didn't work well or there are
> better more reliable solutions for mapping network io data into userspace?
>
> thanks
> Mike Sundius
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11469ee096d10b0568f75b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Use git log and you&#39;ll quickly find=C2=A0216e95669c6b8=
84735f3f8a5ca1ee37a28d68b3e where it got blacklisted couple years ago and t=
hen=C2=A0ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3 where the blacklisted rec=
ipe was removed. Both commits contain a bit longer explanation why.</div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Apr 3, 2018=
 at 10:04 PM, C Michael Sundius <span dir=3D"ltr">&lt;<a href=3D"mailto:msu=
ndius@sundius.com" target=3D"_blank">msundius@sundius.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div><div=
>I do not see netmap in the most recent version of meta-openembedded<br></d=
iv><div>(i.e.=C2=A0 <a href=3D"http://info.iet.unipi.it/~luigi/netmap" targ=
et=3D"_blank">http://info.iet.unipi.it/~<wbr>luigi/netmap</a> )<br></div><d=
iv><br></div>though, while googling around I see references to a recipe tha=
t existed some time ago.<br><br></div>did this get removed for some reason=
=C2=A0 ... it didn&#39;t work well or there are better more reliable soluti=
ons for mapping network io data into userspace?<br><br></div>thanks<br></di=
v>Mike Sundius<br></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a11469ee096d10b0568f75b84--
