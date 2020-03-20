Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0456C6064E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 11:15:03 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id n13so4205827lfh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xGIaSlUSAYkZBJvKFmd9j5WCNekKnsPsQ44DM9WKRWY=;
	b=CVkh0ZBtZxePiN2F+325W4e/kjrPMUSKrSmN4torRZxfIDe3eipY5VACcNtjKvLV5X
	U85UPU2LpzNiyIikS4jJf3m2oK40ip1fHRBy8v5sSpFXvIIh2hqLDkPZ4vFy4BQczzNt
	7Yrvx259ow3E3hrsox1qdIAstMw1XCcPMkiSyp83s1xaOEMO2FMJXcOZs/kj+UVRupNG
	NDU+Bja4jRcIn6JpjR1BdcGhI7yaF/pi+uLztHq/DbmuOFh7W4InAp5yQuW6BIjoJS0P
	KRWLqQ6wCuvIG719w7put3V1B5ypbQA06eCFR0EfT2qrBn1L9o5el8+elNK0cRbYGPtf
	dTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xGIaSlUSAYkZBJvKFmd9j5WCNekKnsPsQ44DM9WKRWY=;
	b=N/VvYp+U0Nui538eFPTm9tTT1apfWUBW7cNuPX5XCzoQhsyKNZXAa/1z0+bRnGweeX
	UJhWKgDsUG+Yb14GIcV/Jyy/upXRnbYWxKBY2hWZ1XjBeKZqZM057U9EnKAV4ru4hkYE
	e+Qv21BRUOXE7t91wYCnC0+f79z7GJtTbPhU3AKURgz06NSHBbcKtts360/y3paYg2Mw
	PMSPqyjKLrsNm+/LEkpZOY3J7hUlnAVtjtWvCYnX4ODgBN3zifPhlcydyv9ZgWB2rkg7
	/Wvy7RTdKruGj1j10UGH+aIVSAJyJbgcqPXL1v1v4OBh83Ll++8aUkc/hA1XqWPlD2cF
	2Q3g==
X-Gm-Message-State: ANhLgQ0TC7XpserazSZPX0M/1qam13m+gPSVzDJcphxORQ/nmx2ztW8+
	4fko/y2tDP3b3y1yyRTFsKdy/sYi96PpaN/Tsi6KGw==
X-Google-Smtp-Source: ADFU+vtiphStKee2AB9f4zMODq5sBsREzDV6rIKQtjLq/LpLGcvk+bbgePHnx3QQCpD+YJJEMHvL+cFBM7iVPFBzix0=
X-Received: by 2002:a05:6512:49e:: with SMTP id
	v30mr4968781lfq.158.1584702904168; 
	Fri, 20 Mar 2020 04:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2003200649320.8492@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2003200649320.8492@localhost.localdomain>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 21 Mar 2020 00:15:40 +1300
Message-ID: <CADySD0EMgZoMWYjwcjXv_8AHD3p0nmytd8sgBVdfB8ddq9anJA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: recipe design curiosity: how to best install a package configuration file?
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
X-List-Received-Date: Fri, 20 Mar 2020 11:15:04 -0000
Content-Type: multipart/alternative; boundary="000000000000ad759305a147654d"

--000000000000ad759305a147654d
Content-Type: text/plain; charset="UTF-8"

what if sample file is updated in new version? Now you have to maintain the
copy in your "file/" as well.

If you are using sample file as it is, then keeping a copy is probably not
a good idea

Cheers
Ankur

On Sat, Mar 21, 2020, 12:04 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   got into a discussion yesterday about the "cleanest" way to design a
> .bbappend file to install a package's configuration file, so i'm
> curious about best practices, and here's an example. (and i'm asking
> as it looks like this will be an issue for a number of recipes i'm
> looking at.)
>
>   current recipe for conntrack-tools:
>
>
> http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb
>
> note how the recipe install step installs a conntrack.conf.sample
> file:
>
> do_install_append() {
>   install -d ${D}/${sysconfdir}/conntrackd
>   install -d ${D}/${sysconfdir}/init.d
>   install -m 0644 ${S}/doc/sync/ftfw/conntrackd.conf
> ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
>   ...
>
> so far, so good. now, in cases where a sample conf file is provided,
> there is, of course, no guarantee that it will be applicable out of
> the box -- one *expects* that it might be necessary to tweak such a
> file and install it as part of a .bbappend file. and here's the point
> of contention.
>
>   in this current situation, it turns out that that sample conf file
> just happens to be appropriate, so the entire .bbappend file for this
> recipe consists of:
>
> do_install_append () {
>     install -m 0644  \
>     ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample \
>     ${D}/${sysconfdir}/conntrackd/conntrackd.conf
> }
>
>   yes, that will work, but i suggested that, even though it's
> convenient, the problem with that approach is that looking at the
> .bbappend file doesn't show you the contents of the file that will be
> installed. to see the actual conf file, you'd have to peruse the
> source, or check the final result ... you get the idea.
>
>   i suggested that, even though the sample file in *this* case was
> perfectly appropriate, i would choose to make a copy of it under
> files/, and install the conf file from *there*, the advantage being
> that the actual file being installed is immediately readable.
>
>   does anyone have any strong opinions on this? it seems mundane, but
> i think the latter approach is still superior, especially since i
> suspect most sample configuration files would have to be adjusted,
> anyway.
>
>   thoughts? just trying to collect some best practices to apply to
> this project.
>
> rday
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ad759305a147654d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>what if sample file is updated in new version? Now y=
ou have to maintain the copy in your &quot;file/&quot; as well.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">If you are using sample file as it =
is, then keeping a copy is probably not a good idea</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Cheers</div><div dir=3D"auto">Ankur<br><br><div=
 class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat, Mar 21, 2020, 12:04 AM Robert P. J. Day &lt;<a href=3D"mailto:rpjday=
@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><br>
=C2=A0 got into a discussion yesterday about the &quot;cleanest&quot; way t=
o design a<br>
.bbappend file to install a package&#39;s configuration file, so i&#39;m<br=
>
curious about best practices, and here&#39;s an example. (and i&#39;m askin=
g<br>
as it looks like this will be an issue for a number of recipes i&#39;m<br>
looking at.)<br>
<br>
=C2=A0 current recipe for conntrack-tools:<br>
<br>
<a href=3D"http://cgit.openembedded.org/meta-openembedded/tree/meta-network=
ing/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">http://cgit.openembedded.org/meta-openemb=
edded/tree/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1=
.4.5.bb</a><br>
<br>
note how the recipe install step installs a conntrack.conf.sample<br>
file:<br>
<br>
do_install_append() {<br>
=C2=A0 install -d ${D}/${sysconfdir}/conntrackd<br>
=C2=A0 install -d ${D}/${sysconfdir}/init.d<br>
=C2=A0 install -m 0644 ${S}/doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir=
}/conntrackd/conntrackd.conf.sample<br>
=C2=A0 ...<br>
<br>
so far, so good. now, in cases where a sample conf file is provided,<br>
there is, of course, no guarantee that it will be applicable out of<br>
the box -- one *expects* that it might be necessary to tweak such a<br>
file and install it as part of a .bbappend file. and here&#39;s the point<b=
r>
of contention.<br>
<br>
=C2=A0 in this current situation, it turns out that that sample conf file<b=
r>
just happens to be appropriate, so the entire .bbappend file for this<br>
recipe consists of:<br>
<br>
do_install_append () {<br>
=C2=A0 =C2=A0 install -m 0644=C2=A0 \<br>
=C2=A0 =C2=A0 ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample \<br>
=C2=A0 =C2=A0 ${D}/${sysconfdir}/conntrackd/conntrackd.conf<br>
}<br>
<br>
=C2=A0 yes, that will work, but i suggested that, even though it&#39;s<br>
convenient, the problem with that approach is that looking at the<br>
.bbappend file doesn&#39;t show you the contents of the file that will be<b=
r>
installed. to see the actual conf file, you&#39;d have to peruse the<br>
source, or check the final result ... you get the idea.<br>
<br>
=C2=A0 i suggested that, even though the sample file in *this* case was<br>
perfectly appropriate, i would choose to make a copy of it under<br>
files/, and install the conf file from *there*, the advantage being<br>
that the actual file being installed is immediately readable.<br>
<br>
=C2=A0 does anyone have any strong opinions on this? it seems mundane, but<=
br>
i think the latter approach is still superior, especially since i<br>
suspect most sample configuration files would have to be adjusted,<br>
anyway.<br>
<br>
=C2=A0 thoughts? just trying to collect some best practices to apply to<br>
this project.<br>
<br>
rday<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000ad759305a147654d--
