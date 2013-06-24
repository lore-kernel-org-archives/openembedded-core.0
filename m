Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id C3DAE6A961
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 17:57:31 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id fe20so10594999lab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 10:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=+KzNcIZriZ/qVcmQfEbwP+x8O2Qdid/ppGZk54s6YAs=;
	b=AhVvKkNqHvomf0TelSOA6bVy/uajGlWGEoQhdy2YXDxVxVGmT8EUKi/L35RmmCyeTd
	plnCE3BGjq+2sKoH7yDhWgke6Dq/Ycuom7eAaPfYAOJ8NcXfBzVmdSpzl5Z71zIvV27h
	7tSSq5aj7bWqRGrAMiCMPfDa3BHOBzg+15WvhEyYDkNG080i0KuvlfFO7O3SIIpcZJ2T
	f1OtNbVa+hSDiBZgu6c5UO5vSAeX1X4Jq36rgNuvcRx77mkxsni7Y8ecwIFyQdj/GZMM
	XpklwpHo/J/w6jwx08k6qNETw9nvRkhk+RnwQApCwzIqLhEJxN/6ZRcN5iM44d511rqG
	R2Fg==
X-Received: by 10.152.22.42 with SMTP id a10mr12072370laf.30.1372096651199;
	Mon, 24 Jun 2013 10:57:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.3.5 with HTTP; Mon, 24 Jun 2013 10:57:11 -0700 (PDT)
In-Reply-To: <154B64CD119D7843A9EC39EC45EE7CD88A8DA547@ALA-MBB.corp.ad.wrs.com>
References: <154B64CD119D7843A9EC39EC45EE7CD88A8DA547@ALA-MBB.corp.ad.wrs.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 24 Jun 2013 10:57:11 -0700
X-Google-Sender-Auth: xe_hfxT6OGnwEXaxPbP6toNA9JM
Message-ID: <CABcZANngsmX7eqKihQh_rGhBvoDPL34ramJMOpJTyLr+PoLBkQ@mail.gmail.com>
To: "Hatle, Mark" <mark.hatle@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildtools-tarball: Change the way the SDK is sanitized
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
X-List-Received-Date: Mon, 24 Jun 2013 17:57:32 -0000
Content-Type: multipart/alternative; boundary=089e0158b7947e0adc04dfea2537

--089e0158b7947e0adc04dfea2537
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 24, 2013 at 9:10 AM, Hatle, Mark <mark.hatle@windriver.com>wrote:

> Stupid phone will only allow me to top post. Anyway, that line was copied
> out of the populate_sdk bbclass. So if it is a bash-ism then it needs to be
> fixed there as well.
>
>
> -----Original Message-----
> *From: *Paul Eggleton [paul.eggleton@linux.intel.com]
> *Sent: *Monday, June 24, 2013 08:31 AM Pacific Standard Time
> *To: *Hatle, Mark
> *Cc: *openembedded-core@lists.openembedded.org
> *Subject: *Re: [OE-core] [PATCH] buildtools-tarball: Change the way the
> SDK is sanitized
>
> On Monday 24 June 2013 09:47:15 Mark Hatle wrote:
> > +     script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
>
> I could be wrong but I think this may be a bashism...
>

It isn't, afaik. From SuSv4, Shell & Utilities->Shell Command
Language->2.6.2 Parameter Expansion:

${*parameter*:-*word*} *Use Default Values*. If *parameter* is unset or
null, the expansion of *word* shall be substituted; otherwise, the value of
*parameter* shall be substituted.--
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0158b7947e0adc04dfea2537
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jun 24, 2013 at 9:10 AM, Hatle, Mark <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver=
.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>Stupid phone will only allow me to top post. Anyway, =
that line was copied out of the populate_sdk bbclass. So if it is a bash-is=
m then it needs to be fixed there as well.<div class=3D"im">

<br>
<br>
-----Original Message-----<br>
<b>From:=C2=A0</b>Paul Eggleton [<a href=3D"mailto:paul.eggleton@linux.inte=
l.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>]<br>
<b>Sent:=C2=A0</b>Monday, June 24, 2013 08:31 AM Pacific Standard Time<br>
<b>To:=C2=A0</b>Hatle, Mark<br>
<b>Cc:=C2=A0</b><a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:=C2=A0</b>Re: [OE-core] [PATCH] <span class=3D"">buildtools</spa=
n>-tarball: Change the way the SDK is sanitized<br>
<br>

</div><p><font></font></p><div class=3D"im"><font>On Monday 24 June 2013 09=
:47:15 Mark Hatle wrote:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 script=3D${1:-${SDK_OUTPUT}/${SDKPATH}/envir=
onment-setup-${SDK_SYS}}<br>
<br>
I could be wrong but I think this may be a bashism...<br></font></div></div=
></blockquote></div><br>It isn&#39;t, afaik. From SuSv4, Shell &amp; Utilit=
ies-&gt;Shell Command Language-&gt;2.6.2 Parameter Expansion:</div><div cla=
ss=3D"gmail_extra">

<br></div><div class=3D"gmail_extra"><dt style=3D"color:rgb(0,0,0);font-fam=
ily:Verdana,Arial,Helvetica,sans-serif;font-size:13px">${<i>parameter</i>:-=
<i>word</i>}</dt><dd style=3D"color:rgb(0,0,0);font-family:Verdana,Arial,He=
lvetica,sans-serif;font-size:13px">

<b>Use Default Values</b>. If=C2=A0<i>parameter</i>=C2=A0is unset or null, =
the expansion of=C2=A0<i>word</i>=C2=A0shall be substituted; otherwise, the=
 value of=C2=A0<i>parameter</i>=C2=A0shall be substituted.</dd>-- <br>Chris=
topher Larson<br>clarson at kergoth dot com<br>

Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics
</div></div>

--089e0158b7947e0adc04dfea2537--
