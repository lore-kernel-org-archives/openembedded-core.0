Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
	[209.85.222.50])
	by mail.openembedded.org (Postfix) with ESMTP id C89DD7F76D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 19:04:51 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id s14so5633932uad.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 11:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=kWGl0LnGnKcQAFaEofgZ1BuqoCM4JhF8tMdRDviFZz0=;
	b=VZS4sIEOox64EVaF4aB2fWTgroElyXKoi2Ni5kBPUQmPEWp2ZqMVInEhce1vWbIeRz
	KtOyYMzgdVugoB8U9Yl/e/fDsVPAvoBA3dG8W9+fSGrcqc+uZ5gUMg/BKWxOfwRf/a1v
	hgd2bnKdkDKT+WLu6nuSTtQZO30ARaQiXnQ9v8nobYXlW4zYheRIHdEMc5mn6TmFhMqo
	l8ts26AsfrVMozeV67Mi42NNpApil2D0pKiuEPb0TD3tiwvA1ecH2bz5XDs8ktYFBlu/
	4cj7kC9VC3sZ4IC86p4UPV9VkhJmEnhbAEt6aK5kkE20Du8q0FgaqyS/zR8ffDuZ9cHi
	oc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=kWGl0LnGnKcQAFaEofgZ1BuqoCM4JhF8tMdRDviFZz0=;
	b=VnMwVrBDBiBjpaw+SWZyDSOyJIwJ9Ea9Lliu8xaOFqisVL0xpY00RgsivbYfGFxFc1
	X41IeWLeCG5IgRXHHTj/B3AbKIiJJIJCQzu19vaDvaFqLRtvMarIOIP1hTor9dl2FrBi
	5fdTpI5M2UI+RgZLpy3lHOPBdjd0xCxH0p1oM6D5NM2RkmJI+qs6DZHfZWsdrATLxTQI
	xbzwUQeNjmdJGVE5NWmsJRvGtcXJWwR5keM13aiK7CcBY45JRF0hRDuXx+rjEZpp44Kt
	PqsljMRzKMtdqGCRrnxKJ/Y7s0Y5KOcczuFukj4dFG30ckO2hvc2yaSD5ljAym5ER432
	1KQA==
X-Gm-Message-State: APjAAAUhmj2eyq8NhPBb7k+gYH+qsHDe1F3ImYes+eHg8z4aGP6emmKk
	zhdNvdr31kpGnIRb+Vw46rvs9Kw6ottWQotU3YvdIw==
X-Google-Smtp-Source: APXvYqx+fsw4856U1k+RRAM3IvBulN3/anR0gw/Mg+NWERFDU0XrAY2AQMtwAGIwvzEv+KhMzsw1ShI4jbzE2IlpVMw=
X-Received: by 2002:ab0:49e9:: with SMTP id f38mr17365217uad.71.1574103892435; 
	Mon, 18 Nov 2019 11:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20191118185903.18087-1-alex.kanavin@gmail.com>
	<20191118190208.2329.69139@do>
In-Reply-To: <20191118190208.2329.69139@do>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Nov 2019 20:04:41 +0100
Message-ID: <CANNYZj-3ZQCofDLHeEbprR0P=dHHZ_H4moGM=OtXYTJwifmujQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJjYWlybzogdGhlIGNvbXBvbmVudCBpcyBkdWFsIGwuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Mon, 18 Nov 2019 19:04:52 -0000
Content-Type: multipart/alternative; boundary="0000000000005928bf0597a39fdb"

--0000000000005928bf0597a39fdb
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Nov 2019 at 20:02, Patchwork <
patchwork@patchwork.openembedded.org> wrote:

>
> * Issue             A patch file has been added, but does not have a
> Signed-off-by tag [test_signed_off_by_presence]
>   Suggested fix    Sign off the added patch file
> (meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch)
>
> * Issue             Added patch file is missing Upstream-Status in the
> header [test_upstream_status_presence_format]
>   Suggested fix    Add Upstream-Status: <Valid status> to the header of
> meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate
> [reason], Submitted [where]
>

Both are false positives, as the patch is in meta-selftest and is used only
for selftests.

Alex

--0000000000005928bf0597a39fdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 18 Nov 2019 at 20:02, Patchwork &=
lt;<a href=3D"mailto:patchwork@patchwork.openembedded.org">patchwork@patchw=
ork.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A patch file has bee=
n added, but does not have a Signed-off-by tag [test_signed_off_by_presence=
] <br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Sign off the added patch file (meta-selft=
est/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch)<br>
<br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Added patch file is =
missing Upstream-Status in the header [test_upstream_status_presence_format=
] <br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Add Upstream-Status: &lt;Valid status&gt;=
 to the header of meta-selftest/recipes-test/devtool/devtool-upgrade-test1-=
1.5.3/backported.patch<br>
=C2=A0 Standard format=C2=A0 Upstream-Status: &lt;Valid status&gt;<br>
=C2=A0 Valid status=C2=A0 =C2=A0 =C2=A0Pending, Accepted, Backport, Denied,=
 Inappropriate [reason], Submitted [where]<br></blockquote><div><br></div><=
div>Both are false positives, as the patch is in meta-selftest and is used =
only for selftests.</div><div><br></div><div>Alex<br></div></div></div>

--0000000000005928bf0597a39fdb--
