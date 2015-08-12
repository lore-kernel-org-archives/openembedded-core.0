Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFE6607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 17:46:48 +0000 (UTC)
Received: by igfj19 with SMTP id j19so19067776igf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 10:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=YYbZqkDQtXXjzvWG2vn2Ac/9iur9l8SJeTc2EUyDGmE=;
	b=nxiaDj0n6pnodI6ri3l1Kql42kELwov/A0ys8pwLtjuPGoMHge05oHOzpH8H4BYWmn
	CZgIaLImjbE0sUpGNIHbjx3CjIPV2koptwWZ0CVHEc0iXB7HfiMRo08rZdqdqaWWRcCO
	Vsq9l86NJZwVp1kwdszFcM5SLc2yGWUZZ6iOkWGiVyEygzC5xvcIDgIGpU/PQ8piFDJx
	o0eZ532WJcT1ApvngSDXFIjACywV/fuIGAjRkxrjJ024fSBdfK9tU4kqqop6AO/93ZXP
	XEwAzUBaNawRDSFD11/zbZcD2scdaLV03FmXOzDBeWXUaqEPDrMRghpd+0JEY4OFPbBz
	X+Wg==
X-Received: by 10.50.153.112 with SMTP id vf16mr25069528igb.79.1439401608934; 
	Wed, 12 Aug 2015 10:46:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Wed, 12 Aug 2015 10:46:29 -0700 (PDT)
In-Reply-To: <CAMKF1squ7h9gzvrX8u3m2_K_BeO7gto_ji5f4UBdJxnuNMyLZA@mail.gmail.com>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
	<1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
	<20150812094953.GL6102@loska>
	<CAMKF1squ7h9gzvrX8u3m2_K_BeO7gto_ji5f4UBdJxnuNMyLZA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 12 Aug 2015 10:46:29 -0700
X-Google-Sender-Auth: cgTCPWoUSZh7TA9gIY_fRAdM594
Message-ID: <CABcZANmtCK18u2m2R51SmZN3Xrq7+FxY8PXMXJ4Y6-WVA3tGMQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: shell script guidelines in oe-core? (was Re: [PATCH v4] create-pull-request: cleanup bashisms)
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
X-List-Received-Date: Wed, 12 Aug 2015 17:46:49 -0000
Content-Type: multipart/alternative; boundary=089e01536c1097049c051d20cdbf

--089e01536c1097049c051d20cdbf
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 12, 2015 at 9:56 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Aug 12, 2015 at 2:49 AM,  <Mikko.Rapeli@bmw.de> wrote:
> > This reminded me of the problems I've seen with various oe-core shell
> scripts:
> > they are missing systematic error handling.
> >
> > IMO using bash and 'set -euxo pipefail' are a good approach to catch
> errors
> > early in shell scripts. Manually checking for $? is error prone and
> things
> > like pipes can hide them. Using undefined variables is another thing
> > which should fail early before things go horribly wrong. And in build
> automation
> > I'd rather see output of -x since things can fail in mysterious ways.
> > And then there's quoting....
> >
> > One useful guide is to use shellcheck as static analysis tool for shell
> scripts.
> >
> > I guess internally bitbake uses at least set -e.
> >
> > Comments?
>
> all these are good suggestions, I would recommend to open bugs for all
> of these some of them might need
> to cite the scripts which need fixing.


Agreed, it's important to check the behavior of shell scripts is kosher and
standards-compliant. shellcheck is extremely useful, I recommend it as
well, but combined with the vim syntastic plugin, so every time you save
the file all the errors and warnings are identified :) Makes it harder to
ignore or forget about.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01536c1097049c051d20cdbf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Aug 12, 2015 at 9:56 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Aug 12, 2=
015 at 2:49 AM,=C2=A0 &lt;<a href=3D"mailto:Mikko.Rapeli@bmw.de">Mikko.Rape=
li@bmw.de</a>&gt; wrote:<br>
&gt; This reminded me of the problems I&#39;ve seen with various oe-core sh=
ell scripts:<br>
&gt; they are missing systematic error handling.<br>
&gt;<br>
&gt; IMO using bash and &#39;set -euxo pipefail&#39; are a good approach to=
 catch errors<br>
&gt; early in shell scripts. Manually checking for $? is error prone and th=
ings<br>
&gt; like pipes can hide them. Using undefined variables is another thing<b=
r>
&gt; which should fail early before things go horribly wrong. And in build =
automation<br>
&gt; I&#39;d rather see output of -x since things can fail in mysterious wa=
ys.<br>
&gt; And then there&#39;s quoting....<br>
&gt;<br>
&gt; One useful guide is to use shellcheck as static analysis tool for shel=
l scripts.<br>
&gt;<br>
&gt; I guess internally <span class=3D"il">bitbake</span> uses at least set=
 -e.<br>
&gt;<br>
&gt; Comments?<br>
<br>
</span>all these are good suggestions, I would recommend to open bugs for a=
ll<br>
of these some of them might need<br>
to cite the scripts which need fixing.</blockquote></div><br>Agreed, it&#39=
;s important to check the behavior of shell scripts is kosher and standards=
-compliant. shellcheck is extremely useful, I recommend it as well, but com=
bined with the vim syntastic plugin, so every time you save the file all th=
e errors and warnings are identified :) Makes it harder to ignore or forget=
 about.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clar=
son at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Ma=
intainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e01536c1097049c051d20cdbf--
