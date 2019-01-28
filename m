Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id C193F7C5B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 18:26:12 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id h15so13867125edb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 10:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5gifCk6mdIR8uaANNpv1wc6K+G2UBcOhvSrFIeL+wDQ=;
	b=nuhW+NgX79ZxPoEIGafLCsqq9cisN9+IjFMHM9l50SVZZ1UJx5r0pCZZ+cNwOzSFIN
	aNLmvzIJf7xWkAgN4eR/5SSbhwSusmP3rhEMQ2GcUUx2klO3+hADqEoOJlANe1OuIHqr
	S5yKb6E/AVfLV2GRfN50LZYmGTjQDPOeiyRr230m8WeNpzuHe/jDnmM8Ftlzwb9w9JA8
	EL2K4CKpUpklMX7trkrUojKij4gEERBAW65DJALAGh9U78xzGeO6gvfdW8CH9D6fWTvY
	AEfuxGhYL6k/eYLx9G9Sg3e8x7FylpHIOXxjU5d3EZw5Q3+cRJWyqNcALXT9332pwo3N
	t0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5gifCk6mdIR8uaANNpv1wc6K+G2UBcOhvSrFIeL+wDQ=;
	b=J0uS3IWin6mcazBWAvrtQHg8hr7Ae739Ynmc4QhvZkmBuZJn+NKpYC0EJC7HQJHrrJ
	RRm3FZqv0j3LGOF95q2P8KDItKF3uza7vlly5ds22cfH4FANUUkAu4p0jIzM9ag81SNr
	rcvCmWm81I7240zg7PAZcKMXC+FfMTxu34BZyTlJXuSEid4NlPR9P3g63J3oBm46b4N2
	moWq9TROmhziN2gE2qTIkR9Cpdf/wadAH4lzApU1y8OBi4FGM8ffu0n8kEYObW3UDl9/
	2nP8jtKJFaQQVv5QSOKsAwwESd7QKjxj+BwnXT9hecZkY+1ZZewPJDvn1G/cq0F+2WDx
	F9Xg==
X-Gm-Message-State: AJcUukchfzrmRy4+ja7lOLN/jJaAPDIz7sXamGBM7V7EwruoK4+WgTDR
	TcxmLpJUEOQATipAJVQ5b2Udhsgy5cvukOV8Dc8=
X-Google-Smtp-Source: ALg8bN5M3QYEBDwo/Lqe7bnvPwGJBp3DgH/IWDjQ28xVcuyGqu6WdpUW+/jSPc28Iys7DVKzibUXF0EjHIbTMIDfZtY=
X-Received: by 2002:a50:af21:: with SMTP id g30mr21507560edd.234.1548699973414;
	Mon, 28 Jan 2019 10:26:13 -0800 (PST)
MIME-Version: 1.0
References: <9c52c249e8b3dcc2e0ef2f14ba04378bedc50a9b.camel@linuxfoundation.org>
In-Reply-To: <9c52c249e8b3dcc2e0ef2f14ba04378bedc50a9b.camel@linuxfoundation.org>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Mon, 28 Jan 2019 10:26:01 -0800
Message-ID: <CAFNP8OsfznxxHaCH57M24zBSnVd1Cx=tAurs51wBGjrYY9MLNw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Help needed with ptest
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
X-List-Received-Date: Mon, 28 Jan 2019 18:26:13 -0000
Content-Type: multipart/alternative; boundary="000000000000c7769a058088cfac"

--000000000000c7769a058088cfac
Content-Type: text/plain; charset="UTF-8"

Hmm... do we want to expand on the "running ptests" section in the
documentation to include some stuff about viewing and analyzing results?
We currently have this section here ...
https://yoctoproject.org/docs/2.7/mega-manual/mega-manual.html#testing-packages-with-ptest

Scott

On Mon, Jan 28, 2019 at 3:39 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We now have better data than ever before on the status of the project
> from a test results perspective. In particular we can now easily
> collect ptest data.
>
> I triggered the tests for qemux86-64 on the autobuilder yesterday, the
> results are published and you can see them with:
>
> wget
> https://autobuilder.yocto.io/pub/non-release/20190127-9/testresults/qemux86-64-ptest/testresults.json
>
> To show the raw logs you can quickly hack to make then more readable:
>
> cat testresults.json  | sed 's/\\n/\n/g'  > testresults1.json
>
> and there are numerous worrying things when you read them such as if
> you grep for "TIMEOUT:".
>
> I also have a suspicion that some ptest runners are exiting without
> cleaning up all processes resulting in corrupted output later in the
> logs too, I saw something like that locally, I think for perl. More
> investigation is needed for that.
>
> There are multiple areas that could do with help:
>
> a) investigate/fix the timeouts
> b) improve the test results tool Ee Peng has posted to include ptest
> processing tools:
>  i) view the logs
>  ii) compare the results
>  iii) highlight timeouts
>  iv) summarise durations
> c) Split logs into individual ptest runs instead of one block
> d) record the timings for the individual ptest blocks
> e) Add timeout status for tests into the json so we can explicitly test
> for it.
>
> I'd welcome help from anyone in any of the above areas, we probably
> need to create feature enhancement bugs for them.
>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c7769a058088cfac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hmm... do we want to expand on the &quot;=
running ptests&quot; section in the documentation to include some stuff abo=
ut viewing and analyzing results?=C2=A0 We currently have this section here=
 ... <a href=3D"https://yoctoproject.org/docs/2.7/mega-manual/mega-manual.h=
tml#testing-packages-with-ptest">https://yoctoproject.org/docs/2.7/mega-man=
ual/mega-manual.html#testing-packages-with-ptest</a></div><div dir=3D"ltr">=
<br></div><div>Scott<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jan 28, 2019 at 3:39 AM Richard Purdi=
e &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">We now have better data than ever before on the status o=
f the project<br>
from a test results perspective. In particular we can now easily<br>
collect ptest data.<br>
<br>
I triggered the tests for qemux86-64 on the autobuilder yesterday, the<br>
results are published and you can see them with:<br>
<br>
wget <a href=3D"https://autobuilder.yocto.io/pub/non-release/20190127-9/tes=
tresults/qemux86-64-ptest/testresults.json" rel=3D"noreferrer" target=3D"_b=
lank">https://autobuilder.yocto.io/pub/non-release/20190127-9/testresults/q=
emux86-64-ptest/testresults.json</a> <br>
<br>
To show the raw logs you can quickly hack to make then more readable:<br>
<br>
cat testresults.json=C2=A0 | sed &#39;s/\\n/\n/g&#39;=C2=A0 &gt; testresult=
s1.json <br>
<br>
and there are numerous worrying things when you read them such as if<br>
you grep for &quot;TIMEOUT:&quot;.<br>
<br>
I also have a suspicion that some ptest runners are exiting without<br>
cleaning up all processes resulting in corrupted output later in the<br>
logs too, I saw something like that locally, I think for perl. More<br>
investigation is needed for that.<br>
<br>
There are multiple areas that could do with help:<br>
<br>
a) investigate/fix the timeouts<br>
b) improve the test results tool Ee Peng has posted to include ptest<br>
processing tools:<br>
=C2=A0i) view the logs<br>
=C2=A0ii) compare the results<br>
=C2=A0iii) highlight timeouts <br>
=C2=A0iv) summarise durations<br>
c) Split logs into individual ptest runs instead of one block<br>
d) record the timings for the individual ptest blocks<br>
e) Add timeout status for tests into the json so we can explicitly test<br>
for it.<br>
<br>
I&#39;d welcome help from anyone in any of the above areas, we probably<br>
need to create feature enhancement bugs for them.<br>
<br>
Cheers,<br>
<br>
Richard<br>
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
</blockquote></div>

--000000000000c7769a058088cfac--
