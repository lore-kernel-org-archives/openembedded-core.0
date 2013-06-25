Return-Path: <giuseppe.condorelli@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 09FA4605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 14:44:02 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h1so13450083oag.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Xo2X4TWyYiesvxpSn6zKe4JxztHJ45dQU/zYpHZwCt8=;
	b=xIMdnbwEBVhOWS0pUr8MxEUdQnK7m6yMAQKlmaMqxlxKucULWKPN+q+I1fbI6XaKqr
	bTwdCS3K495Kmep3G884ooE0uNxkXoh5dHI55dzc7a1j3Obo6F/ZYEIYnAO7BaTDciPT
	gpJO/pN5gXAsOmbriFdkJjZZTq21l6G6/syeaeRsCzwMr8zXFxHeM0w4zsylHIxRjG/v
	E8dOolnjsjcmW5v3EY1oK8/jCm+b74KAFGkdF8YtEkCf1NsogQ/9FOSO0qGnjssnLBZr
	a5FWwRQqQ4b+cNRh1UZXL77BknLmwYx1Oa25gAzrE72cXVKQ69w6KIm1P18nsumV5jWb
	QKuA==
MIME-Version: 1.0
X-Received: by 10.60.52.15 with SMTP id p15mr12861386oeo.87.1372171443168;
	Tue, 25 Jun 2013 07:44:03 -0700 (PDT)
Received: by 10.182.142.65 with HTTP; Tue, 25 Jun 2013 07:44:03 -0700 (PDT)
In-Reply-To: <CAOHjBZuT=59w2VQRUtRfYyEvn7iO_hUuw_pova-jVRSGdgu1PA@mail.gmail.com>
References: <CAOHjBZuT=59w2VQRUtRfYyEvn7iO_hUuw_pova-jVRSGdgu1PA@mail.gmail.com>
Date: Tue, 25 Jun 2013 16:44:03 +0200
Message-ID: <CAOHjBZvpKQ2+g5Zi+hQp=7OgNpxLpfiVtcCL7hcVwUNg1CQ9Pg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: csl_versions issue on latest update
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
X-List-Received-Date: Tue, 25 Jun 2013 14:44:03 -0000
Content-Type: multipart/alternative; boundary=001a113309ce70ea1e04dffb8f1a

--001a113309ce70ea1e04dffb8f1a
Content-Type: text/plain; charset=ISO-8859-1

Solved, updating bitbake to commit
3d8044bc79c482c5ea008ddf12a8128dcd1527ee<http://cgit.openembedded.org/bitbake/commit/?id=3d8044bc79c482c5ea008ddf12a8128dcd1527ee>
solved
the issue.
Since now I've worked against the commit
6acd444a557bba977ae1772371fdadf5f510e3b6<http://cgit.openembedded.org/bitbake/commit/?id=6acd444a557bba977ae1772371fdadf5f510e3b6>,
which indicates the new 1.19.1 version.

Thanks,
Giuseppe
2013/6/25 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> Hi All,
>
> I'm working with the best so far master openembedded-core repository plus
> the bitbake version 1.19.1
> Using the external toolchain csl I'm in trouble because it seems the
> latest modification in the csl-versions.inc
> breaks the csl_get_version routine. I mean, it is not able to find the gcc
> version due to wrong binary name:
> it doesn't attach the TARGET_PREFIX so it finds for gcc only (failing).
> The issue seems located to the csl_versions_handler routine, backporting
> it solves the issue.
>
> Please can you look at that routine and let me know if I'm wrong in
> something?
>
> Cheers,
> Giuseppe
>

--001a113309ce70ea1e04dffb8f1a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Solved, updating bitbake to commit=A0 <a href=3D"http://cgit.openembed=
ded.org/bitbake/commit/?id=3D3d8044bc79c482c5ea008ddf12a8128dcd1527ee">3d80=
44bc79c482c5ea008ddf12a8128dcd1527ee</a>=A0solved the issue.</div><div>Sinc=
e now I&#39;ve worked against the commit <a href=3D"http://cgit.openembedde=
d.org/bitbake/commit/?id=3D6acd444a557bba977ae1772371fdadf5f510e3b6">6acd44=
4a557bba977ae1772371fdadf5f510e3b6</a>, which indicates the new 1.19.1 vers=
ion.</div>
<div>=A0</div><div>Thanks,</div><div>Giuseppe<br></div><div class=3D"gmail_=
quote">2013/6/25 Giuseppe Condorelli <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:giuseppe.condorelli@gmail.com" target=3D"_blank">giuseppe.condorelli@gmai=
l.com</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div>Hi All,</div><div>=A0</div><div>I&#39;m working with =
the best so far master openembedded-core repository plus the bitbake versio=
n=A01.19.1</div>
<div>Using the external toolchain csl I&#39;m in trouble because it seems t=
he latest modification in the csl-versions.inc</div>

<div>breaks the csl_get_version routine. I mean, it is not able to find the=
 gcc version due to wrong binary name:</div><div>it doesn&#39;t attach the =
TARGET_PREFIX so it finds for gcc only (failing).</div><div>The issue seems=
 located to the csl_versions_handler routine, backporting it=A0solves the i=
ssue.</div>


<div>=A0</div><div>Please can you look at that routine and let me know if I=
&#39;m wrong in something?</div><div>=A0</div><div>Cheers,</div><div>Giusep=
pe</div>
</blockquote></div><br>

--001a113309ce70ea1e04dffb8f1a--
