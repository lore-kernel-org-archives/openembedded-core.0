Return-Path: <nick83ola@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3A93260103
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 08:40:52 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id d189-v6so73247831oib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZUJP1hSU/2NzS4oZEUbv8YdSVI2MOi8GZuZkZy1+bBQ=;
	b=B2MdwE3fPDXQX/jdTCEqvfAS0CD7AIiegwJ2f2Y0eYFNZJAckRJW9iNTnXZkzVcOXQ
	hlu4zHRuxC2exMOW+DpH3h9pnPgiveL1DIhWE80CnS1cOqLu/bGYTF3hleCD65Hl75Hh
	/TWsuaPKCk1FDc1IqMdJrY4fXhRGBN8yKXfgHvHwI1Ie4msK/f2yoQ+mvZRCT3qn4oF5
	wTVvFSnjRAj1DkqrCvBijz8UotPCvhqZpO3eDHFV37dxzNBcDCqOTsY5Eqi+pTQFOooo
	4dW2ybBnxqh20ykv7/1QZLU+soJHG3LVm4sec5TrASqVrhsDR6aGcB6+HBCguaOwppLj
	99hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZUJP1hSU/2NzS4oZEUbv8YdSVI2MOi8GZuZkZy1+bBQ=;
	b=B26CwOZNNaB+Me8zyr4ONw4hQYA+fpbQ2rjiu9m1uawKU0q5RKWqJrhGN5OlkeswbE
	f5eLu3/ab37SUcT0e7Ux36sdRSrjZcNHo8kbwuhkz0ZRJpFpjbgs2AxvgwIzLkamydBc
	Sk/qi/dqF0woRAjc1JPV3FuB9zJvs7/Dag/ZSLB1z1zeKlSXdJK5L4F5BYAVbnxnej3C
	Ae5xaMtVRSBlRZ9/S3kn/wvy29Q4lnQkE/Amb2PhvvO62P6EzqteW2xCxLlc6lEilSYd
	0ZEumqkJiCIL7CUagCmvKGZA7sLT0tL/vhoF1m+AXXttberBuiD9RVD4jdzmVzj/AwxX
	tvOg==
X-Gm-Message-State: AOUpUlHE78zqvqT/NtfraTVknipLU4gZZN+yuUtbR+2JE2DU7vjOtUzZ
	QyuabHjTEW0b/UZqNEwhC3uUmaYJT/EEzUL9itQ=
X-Google-Smtp-Source: AAOMgpcx6PtNF0mDmWtuBizKmM5FnGfb9NbTJ3CAhBcdNgnW7bdAV+M2jkdg8Or7g/vVtTl/yuxtkcXLbinxwumNCT8=
X-Received: by 2002:aca:5e02:: with SMTP id
	s2-v6mr17421823oib.176.1531730453270; 
	Mon, 16 Jul 2018 01:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <CABPh3UMZTQwbOhJc0MN9HOg4hThYqG5tcg-sS7OhFjbgrPAhww@mail.gmail.com>
	<CANNYZj_M=6Ku76j2y=fvdEyN2xvv=8avg4NK-zmg9gs5Ur5nXw@mail.gmail.com>
In-Reply-To: <CANNYZj_M=6Ku76j2y=fvdEyN2xvv=8avg4NK-zmg9gs5Ur5nXw@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 16 Jul 2018 09:40:41 +0100
Message-ID: <CABPh3UNKtJ-Nd9r1VtFfeOMAHome5xJGmh-Hfw_qGCbjMxWoig@mail.gmail.com>
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [HELP] ptest & ptest
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
X-List-Received-Date: Mon, 16 Jul 2018 08:40:52 -0000
Content-Type: multipart/alternative; boundary="0000000000008f1741057119c9e4"

--0000000000008f1741057119c9e4
Content-Type: text/plain; charset="UTF-8"

Hi Alex,
thanks for your response.

Do you or anyone else have an example about an actual python package that
use ptest (possibily using distutils/nose/py.test)?

Thanks
Nick

On Tue, 26 Jun 2018 at 16:07, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> The Yocto documentation has general information:
>
>
> https://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest
>
> Alex
>
>
> 2018-06-26 14:57 GMT+02:00 nick83ola <nick83ola@gmail.com>:
> > Hi all,
> >
> > I have a python3 package that launch a py.test test suite from
> > setup.py and I have created a recipe for it using setuptools3
> >
> > Anyone has some hint about how to add a ptest target to run the tests
> > into the final image (or better in a qemu test image)?
> >
> > there are some recipe/documentation that I can look at about creating
> > -ptest target for python packages?
> >
> > Regards
> > Nicola Lunghi
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000008f1741057119c9e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex, <br></div><div>thanks for your response.</di=
v><div><br></div><div>Do you or anyone else have an example about an actual=
 python package that use ptest (possibily using distutils/nose/py.test)?</d=
iv><div><br></div><div>Thanks<br></div><div>Nick<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">On Tue, 26 Jun 2018 at 16:07, Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The Yocto docume=
ntation has general information:<br>
<br>
<a href=3D"https://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.h=
tml#testing-packages-with-ptest" rel=3D"noreferrer" target=3D"_blank">https=
://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-pack=
ages-with-ptest</a><br>
<br>
Alex<br>
<br>
<br>
2018-06-26 14:57 GMT+02:00 nick83ola &lt;<a href=3D"mailto:nick83ola@gmail.=
com" target=3D"_blank">nick83ola@gmail.com</a>&gt;:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I have a python3 package that launch a py.test test suite from<br>
&gt; setup.py and I have created a recipe for it using setuptools3<br>
&gt;<br>
&gt; Anyone has some hint about how to add a ptest target to run the tests<=
br>
&gt; into the final image (or better in a qemu test image)?<br>
&gt;<br>
&gt; there are some recipe/documentation that I can look at about creating<=
br>
&gt; -ptest target for python packages?<br>
&gt;<br>
&gt; Regards<br>
&gt; Nicola Lunghi<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000008f1741057119c9e4--
