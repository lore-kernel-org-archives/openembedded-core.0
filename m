Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9927826B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 11:01:19 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id m47so18745968iti.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1LkgT1G+pApfolLj97IRhv/3f4PbRkq7kwvLmZuOQI8=;
	b=SOnKigbuoILFAUfTwJ1kMOkb0CFhFxqLI7V4xcgHteTMyV49bxH4XLdLlEZ8WhYGZk
	IfvapbmwcGg3KcwQsxAaKtQsOB2EO7JgTCaZmPTeV1lif+tdPqNZ71zigmO+OWJzRe58
	urvk7V2g31GWqojJP+akPHuJCdwSN76t8cDlIuFfvlRGRflQPux/PKBVtsSuS9ZBF5Z3
	1rIREkP2aQcp5mJFjN5d2LET+ul/FRZdri1O4W3qCfOVMuAatn8+nyPiddXMfCevtoF0
	cyP+l2d3Y7t4kMbWJFWNbawWqHqjWw4OUTN9VC3rHpZdW4nh5wxweZip83FlqFD7I45k
	yHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1LkgT1G+pApfolLj97IRhv/3f4PbRkq7kwvLmZuOQI8=;
	b=bGVtQ3lGDeViTTrqikLJP4IImKbPifbuXwBY/MghiMJAbtJ/+ZlMphFRz8rkheaSNb
	Zp/CkJ94nQps0/VhxKEYFjTNKHVlUIgF5oM4efJjlJ7xgBnVD4jSyIf/n3Jii3jjAJt7
	ohrkTK3zwtyQCbJpQUWqPpD3Dsepm2lv+UWmSWHCEe/zENyn7Yqk0gG9wQGCTwrijTI0
	13EDJZGhO/2klKl+sYP2gCZm8FPQYYaFBIR4FxKNERIYq5FFns9/Nt24M5HHm4myFflO
	G3chOSkZHmMqJmyv3W+zmR0I5ku9nEBsA2qCK8ZfNE5fh8T0ScY9C8Uz2lrTRbl3LUgl
	rdEA==
X-Gm-Message-State: AODbwcCQxuAjCPOKENI1TkNlI2vv0mG+I9dR5czQaxp3mCjtih8SzQWQ
	nKdkXVfziNmBoRa70cFGEYqQ51A0k6WN
X-Received: by 10.36.17.6 with SMTP id 6mr11191545itf.17.1497265281174; Mon,
	12 Jun 2017 04:01:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.130 with HTTP; Mon, 12 Jun 2017 04:00:50 -0700 (PDT)
In-Reply-To: <1497262008.3942.4.camel@linuxfoundation.org>
References: <cover.1496993458.git.jussi.kukkonen@intel.com>
	<0c83f6d3e761aa93c07528c5a3730e2ddc43d748.1496993458.git.jussi.kukkonen@intel.com>
	<1497262008.3942.4.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 12 Jun 2017 14:00:50 +0300
Message-ID: <CAHiDW_EUkhm3fhda+mwhq=jPx6L_qqA6adnA+jW84cHEt-ZiqA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Enable parallel compilation for python3-numpy
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
X-List-Received-Date: Mon, 12 Jun 2017 11:01:20 -0000
Content-Type: multipart/alternative; boundary="001a1143eb483828e50551c13de4"

--001a1143eb483828e50551c13de4
Content-Type: text/plain; charset="UTF-8"

On 12 June 2017 at 13:06, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> On Fri, 2017-06-09 at 10:36 +0300, Jussi Kukkonen wrote:
> > Support for "-j N" does not seem like a generic distutils thing
> > but numpy supports it.
> >
> > This improves compile time by 2 minutes (real time).
>
> Sorry:
>
> https://autobuilder.yocto.io/builders/nightly-musl/builds/
> 298/steps/BuildImages/logs/stdio
>
> Appears to have races?
>


Indeed, thanks. I'll have a look but could be that there will be no v2 (I
couldn't reproduce earlier and distutils isn't really my cup of tea).

Jussi

--001a1143eb483828e50551c13de4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
2 June 2017 at 13:06, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linu=
xfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Fri, 2017-06-09 at 10:36 +0300, Jussi Kukkonen wrote:<br>
&gt; Support for &quot;-j N&quot; does not seem like a generic distutils th=
ing<br>
&gt; but numpy supports it.<br>
&gt;<br>
&gt; This improves compile time by 2 minutes (real time).<br>
<br>
</span>Sorry:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-musl/builds/298/st=
eps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yocto.io/<wbr>builders/nightly-musl/builds/<wbr>298/steps/BuildIm=
ages/logs/<wbr>stdio</a><br>
<br>
Appears to have races?<br></blockquote><div><br></div><div><br></div><div>I=
ndeed, thanks. I&#39;ll have a look but could be that there will be no v2 (=
I couldn&#39;t reproduce earlier and distutils isn&#39;t really my cup of t=
ea).</div><div><br></div><div>Jussi</div></div></div></div>

--001a1143eb483828e50551c13de4--
