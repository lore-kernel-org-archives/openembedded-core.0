Return-Path: <lw@hqv.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9430C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:05:30 +0000 (UTC)
Subject: Re: python3: Allow to specify which pyc files to keep
To: openembedded-core@lists.openembedded.org
From: "Lukas Woodtli" <lw@hqv.ch>
X-Originating-Location: Zurich, CH (185.132.16.78)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 06:05:21 -0700
References: <CANNYZj9r9D7PzkGm-5tPQVTyU_MkyQngS+RbZii6+4YToGNLVg@mail.gmail.com>
In-Reply-To: <CANNYZj9r9D7PzkGm-5tPQVTyU_MkyQngS+RbZii6+4YToGNLVg@mail.gmail.com>
Message-ID: <31851.1744290321098835072@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ktMlFJEGRiN9UaVnrEYt"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214665

--ktMlFJEGRiN9UaVnrEYt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
>=20
>=20
>> The key question is whether this level of configuration is generally
>> useful enough to be worth us maintaining it in OE-Core. I don't know if
>> this is something you needed for a one off investigation or that people
>> need it in general.
>=20
> I think it would be good to step back and look at what these
> optimization levels actually do. Upstream clearly treats them as
> optional opt-in via python interpreter command line switch or
> environment variable, which means they don't think picking a higher
> default level is something python users should be doing. So why would
> we be going against this approach?
>=20
>=20

The reason to use these features of the Python interpreter is that we devel=
op for
resource restricted devices. The target device should not need to compile t=
he Python
files to byte-code at runtime (which happens regardless of the optimization=
 level).
We can do this work at build time. Moreover, Embedded devices usually
have restricted storage size. So using the optimization level 2 for pyc fil=
es is sensible.
Most embedded devices don't need the docstrings in the Python files (simmil=
ar to
not needing the man pages). So we can get rid of them (that is what optimiz=
ation
level 2 does, apart from disabling asserts).

Lukas

--ktMlFJEGRiN9UaVnrEYt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<div><br />
<blockquote>The key question is whether this level of configuration is gene=
rally<br />useful enough to be worth us maintaining it in OE-Core. I don't =
know if<br />this is something you needed for a one off investigation or th=
at people<br />need it in general.</blockquote>
I think it would be good to step back and look at what these<br />optimizat=
ion levels actually do. Upstream clearly treats them as<br />optional opt-i=
n via python interpreter command line switch or<br />environment variable, =
which means they don't think picking a higher<br />default level is somethi=
ng python users should be doing. So why would<br />we be going against this=
 approach?</div>
<div>&nbsp;</div>
</blockquote>
<div>&nbsp;</div>
<div>The reason to use these features of the Python interpreter is that we =
develop for</div>
<div>resource restricted devices. The target device should not need to comp=
ile the Python</div>
<div>files to byte-code at runtime (which happens regardless of the optimiz=
ation level).</div>
<div>We can do this work at build time. Moreover, Embedded devices usually<=
/div>
<div>have restricted storage size. So using the optimization level 2 for py=
c files is sensible.</div>
<div>Most embedded devices don't need the docstrings in the Python files (s=
immilar to</div>
<div>not needing the man pages). So we can get rid of them (that is what op=
timization</div>
<div>level 2 does, apart from disabling asserts).</div>
<div>&nbsp;</div>
<div>Lukas</div>
<div>&nbsp;</div>

--ktMlFJEGRiN9UaVnrEYt--

