Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 82AE57FC85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 19:33:19 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id j6so8276539lja.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 11:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xbKTRqARgt15gjeZJTHFan8A61MhtvjRSm1U4gckmIk=;
	b=TFG0ozQBhQnFN5hNb/8QWnGeP+tMy7sCtLIZvJDP9NKsIZtjmllylQNi4R0HcWjm5O
	cstt8iwhpqDXQdGaRa7jBOG2EM+V1WhJ4b1nRaN/McjCgrTfFlS2BxfsVHNJk9tOA2zX
	vy7GJmBYiVm95hbDYcZMIoHN74gC7CKHKF0d+pdXEFJmSFfrz6WR+84ElREJrT8zM0Ve
	bL2fNty8Hz7EP5rUl5/eW6uFYx3SMsdmliJJQDbTX3/f74y7bUTL78Z31lLA3RP/DwoK
	FgJV18jENOHU3cZ12exBRQ3FYzz1v5pcUSimIxK31kfC61DGPiVj4V/f1G999NR2iQ0A
	iHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xbKTRqARgt15gjeZJTHFan8A61MhtvjRSm1U4gckmIk=;
	b=bv9ZKoiZQq974sPVon02y8Qz1RAmSFNGv8bJ/5rtx2lMCNkJwvp82TZfx03Ds+d8lY
	MvBqcLLUVTSgcwcZbSywn3lrCUvD+5aGGXVyG8cy/ThZB7Gv7oqmo9lXZacE5FzkB27q
	3dvgX29odf86lXEpdFYlfJAlDlztoCeBzT+7hJx8yTAtmQ19gKIvO4lrnEbptV8rtNFA
	WjqnikG/kbB5UqsYHW2+fDCtNeDcPdNU3niZSfwcx4nBOvHILM8qqoH7WBgS+BkdJvN3
	bIJFHG7kMHKCSxfoHSlgzqv8hjmcATDlsJwMasWqyt7rXmMI3rGOQ9KWRP3oK8h+tcQG
	HGEg==
X-Gm-Message-State: APjAAAXNXWCqnTdDxVRqi0NEDr3fXpjnJxhS5p5FI94osho7szZbPJLs
	VJasEFQlqDXNLI6BiqfEvbhCv2JPO0bbMzJQBTo=
X-Google-Smtp-Source: APXvYqxJvrUa6oGggqfwmsfgYCw27xsSCzPPSqG03kco7V+oVl5PDWJgxPfWtuJaVUa9Pk+HrgcGqoa/IsTlEuu8T/E=
X-Received: by 2002:a2e:890e:: with SMTP id d14mr23009961lji.6.1574710399681; 
	Mon, 25 Nov 2019 11:33:19 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
In-Reply-To: <e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 26 Nov 2019 08:33:08 +1300
Message-ID: <CADySD0GqssgFeMVj72iV+R3EjUOY=hqJLe7tVTNFbwnmRNzeiQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Mon, 25 Nov 2019 19:33:19 -0000
Content-Type: multipart/alternative; boundary="000000000000ff4788059830d5fe"

--000000000000ff4788059830d5fe
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

Thanks for the suggestion.
But curious why libs are so big now?

Regards
Ankur

On Tue, Nov 26, 2019 at 8:27 AM Ross Burton <ross.burton@intel.com> wrote:

> On 25/11/2019 18:37, Ankur Tyagi wrote:
> > Hi,
> >
> > Based upon "thud" branch, I created core-image-minimal for am335x-evm
> > board and resulting image size is very big(71M)
>
> If disk size is important then a good first step is to use musl instead
> of glibc:
>
> TCLIBC = "musl"
>
> The C++ runtime is also giant, so see if you can not use C++?
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ff4788059830d5fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">Hi Ross,<br></div></div><div><br></div><div><d=
iv style=3D"font-family:verdana,sans-serif" class=3D"gmail_default">Thanks =
for the suggestion.</div><div style=3D"font-family:verdana,sans-serif" clas=
s=3D"gmail_default">But curious why libs are so big now?</div><div style=3D=
"font-family:verdana,sans-serif" class=3D"gmail_default"><br></div><div sty=
le=3D"font-family:verdana,sans-serif" class=3D"gmail_default">Regards</div>=
<div style=3D"font-family:verdana,sans-serif" class=3D"gmail_default">Ankur=
</div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Nov 26, 2019 at 8:27 AM Ross Burton &lt;<a href=3D"mailto:ros=
s.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 25/11/2019 18:37, Ankur Tyagi w=
rote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Based upon &quot;thud&quot; branch, I created core-image-minimal for a=
m335x-evm <br>
&gt; board and resulting image size is very big(71M)<br>
<br>
If disk size is important then a good first step is to use musl instead <br=
>
of glibc:<br>
<br>
TCLIBC =3D &quot;musl&quot;<br>
<br>
The C++ runtime is also giant, so see if you can not use C++?<br>
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
</blockquote></div></div>

--000000000000ff4788059830d5fe--
