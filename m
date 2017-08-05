Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id E962271971
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Aug 2017 23:37:46 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id z18so25153108qka.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Aug 2017 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VL4WlZXtBzrTYJeZ8iREmkg5+ZfHa2QXs4eepHdnaDE=;
	b=sPlqTsmPFTRDnLgpzT4UzXcPG99iCjV81U+PJYy7C9ETCuoEoEtFRR5lup/ct6oXn8
	YAlQlWFx91261Yi9RB5fS0J44RbaYg8VNLnlwT8GRo0/uU4qJI4GPW6nDhUeJM2A+a+0
	GVfNQi1TMOWciC+wl/npzptmLKrBXZ6DycJmAQAwk6GvYRIPxwhVrwWsVMX/JByV+s13
	bBg+uq1hbWLUGP16M4cgFLaXbDH/HcpLLSKmcIWCMa607zq+VmILEefE+5UrWsp0ijkA
	s+pa5DEtXOyqdSXggPCLo5dT9eKTpO+hpSks8oR/9/+SPmhZIwIrLL2I3wOhmE+GGvZf
	9/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VL4WlZXtBzrTYJeZ8iREmkg5+ZfHa2QXs4eepHdnaDE=;
	b=ETOUfhyUicmSuPyZD/8MW6tMmX+ht1w6Y/QWzFSioGdtHHwzCq8xKiTgnNeiCV+wkK
	kIA2J5mhB4RO8DUGu9iyuJOO67SNsipG/neDNBjxyEq1dpUS03H6/v7ZWPMgtVwci8f5
	AUpv/cuq/gQiaPq8hnkrgT4Kxuq4LJKn6d4mqu/uhQ6wjjheu/liY8TmD1B9u2QO9t31
	tljtRKoObdAOTdLdmT2piihuLiAm5QQPYCsRjOw4aR3Bg2qbKbCrSxWNCUdwU6wHgg9X
	+/eJeUNkLJiFfDKiz4Maqkt1W84rnAmPj49hkU+bDPvKERpuFOrUxWj/iAgbPqS+Snhn
	7Gig==
X-Gm-Message-State: AHYfb5hgUXUa/4bgbrxrVMXN/PmW6as5smIpCrW/bRQ7Pn+yTbRa9KaK
	2wk8wGOemRtQ7025szVIqF5YNZL29w==
X-Received: by 10.55.99.86 with SMTP id x83mr9141645qkb.334.1501976268031;
	Sat, 05 Aug 2017 16:37:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.32.6 with HTTP; Sat, 5 Aug 2017 16:37:27 -0700 (PDT)
In-Reply-To: <20170805220752.2047-1-JPEWhacker@gmail.com>
References: <20170805220752.2047-1-JPEWhacker@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Sat, 5 Aug 2017 16:37:27 -0700
Message-ID: <CABcZANnmwq6BKEYwxHf4NgnHBXUPLZOKGOegOEf5qRLdjYEFsw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] externalsrc: Handle .git not being a directory
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
X-List-Received-Date: Sat, 05 Aug 2017 23:37:47 -0000
Content-Type: multipart/alternative; boundary="001a1148300eeacd0705560a19de"

--001a1148300eeacd0705560a19de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 5, 2017 at 3:07 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> If EXTERNALSRC points to a git submodule, the .git entry will not be a
> directory, but rather a file that points to the actual .git location (in
> the parent repository). If this still can't be resolved to a directory,
> ignore it and fall back to the non-git method for hashing.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>

We shouldn=E2=80=99t be assuming knowledge of how .git works, IMO we should=
 call
out to git rev-parse to query the info we need.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a1148300eeacd0705560a19de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Sat, Aug 5, 2017 at 3:07 PM, Joshua Watt <span dir=3D"l=
tr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacke=
r@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">If EXTERNALSRC points to a =
git submodule, the .git entry will not be a<br>
directory, but rather a file that points to the actual .git location (in<br=
>
the parent repository). If this still can&#39;t be resolved to a directory,=
<br>
ignore it and fall back to the non-git method for hashing.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEW=
hacker@gmail.com</a>&gt;<br></blockquote><div><br></div><div>We shouldn=E2=
=80=99t be assuming knowledge of how .git works, IMO we should call out to =
git rev-parse to query the info we need.</div></div>-- <br><div class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><di=
v dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - B=
itBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graphi=
cs</div></div></div></div>
</div></div>

--001a1148300eeacd0705560a19de--
