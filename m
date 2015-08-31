Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id A862274197;
	Mon, 31 Aug 2015 18:58:55 +0000 (UTC)
Received: by vkbf67 with SMTP id f67so38175664vkb.0;
	Mon, 31 Aug 2015 11:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=70ODNCvxspNqqMgoN+1CiwDb0jlfNYqrnwAP10m68AE=;
	b=PWKBlhzmEof7QUphtOqnj23uL1k6SdqSMxIhZztv7K8XCr3FBKWzSjnBpmkaSx21gG
	OML2vXrQtXM9MmqaT0KrRcaeUKfQSobMSrcjvrO7Q0jdh1FjE5POeE1D0jQh+1xxHEw6
	N+USBmrIBf/OyGuXaWTOts9+VOEUNhd//nns9m83WjP36tXamNHqR/mnI8wnh9HlkTo6
	O6q3scz3b82yf5u3fVTkHl+cFKBtRmVHWO/zwCBMuS1tvhjZT03cTSkq//tD8VtTEX0q
	pgVC82hnYaWEscxwLsKfqRCNwE11wg49AyipRMGMldInyCk8qB5y6MqunbeAcWFaIaQT
	8JKQ==
X-Received: by 10.52.108.103 with SMTP id hj7mr23307144vdb.96.1441047535252;
	Mon, 31 Aug 2015 11:58:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.31.203.2 with HTTP; Mon, 31 Aug 2015 11:58:35 -0700 (PDT)
In-Reply-To: <20150831184113.GF2465@jama>
References: <20150830114819.3628250369@opal.openembedded.org>
	<20150831184113.GF2465@jama>
From: Christopher Larson <chris_larson@mentor.com>
Date: Mon, 31 Aug 2015 11:58:35 -0700
X-Google-Sender-Auth: S2mvac2wtwXlWXn_95y6gznGNG8
Message-ID: <CABcZANmXpPbMNQqv9VekwzECOgWGuEb1St51zGs1umOX89=CaA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Christopher Larson : update-rc.d.bbclass: explicitly dep on initscripts
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
X-List-Received-Date: Mon, 31 Aug 2015 18:58:56 -0000
Content-Type: multipart/alternative; boundary=bcaec5486056717a98051ea00616

--bcaec5486056717a98051ea00616
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 11:41 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Sun, Aug 30, 2015 at 11:48:19AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 833302761df924bb503cc2ad04ecae1023381f8f
> > URL:
> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=833302761df924bb503cc2ad04ecae1023381f8f
> >
> > Author: Christopher Larson <chris_larson@mentor.com>
> > Date:   Mon Aug 24 15:18:34 2015 -0700
> >
> > update-rc.d.bbclass: explicitly dep on initscripts
> >
> > update-rc.d doesn't just want an initscripts package, it wants
> > initscripts-functions. In the case where VIRTUAL-RUNTIME_initscripts is
> set to
> > nothing, update-rc.d still needs initscripts-functions to satisfy its
> runtime
> > dependencies. Further, we shouldn't be using a *runtime* virtual in a
> *build
> > time* variable. This should resolve image creation failures with
> > configurations without sysv initscripts when a recipe inherits
> update-rc.d and
> > doesn't inherit systemd.
> >
> > (From OE-Core rev: e6642ae0849e5ac3174c643a7693af25d829d6d1)
>
> Unfortunately this means that I cannot PNBLACKLIST initscripts recipe in
> DISTRO which provides own initscripts implementation (which also
> provides initscripts-functions).
>
> What's even worse is that I'll have to overlay whole bbclass to get rid
> of this dependency :/
>

Of course you can. This is a build dependency. Add a PROVIDES +=
"initscripts" + appropriate preferences. Alternatively, we could introduce
a virtual/initscripts-functions.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--bcaec5486056717a98051ea00616
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 31, 2015 at 11:41 AM, Martin Jansa <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":296" =
class=3D"a3s" style=3D"overflow:hidden">On Sun, Aug 30, 2015 at 11:48:19AM =
+0000, <a href=3D"mailto:git@git.openembedded.org">git@git.openembedded.org=
</a> wrote:<br>
&gt; Module: openembedded-core.git<br>
&gt; Branch: master<br>
&gt; Commit: 833302761df924bb503cc2ad04ecae1023381f8f<br>
&gt; URL:=C2=A0 =C2=A0 <a href=3D"http://git.openembedded.org/?p=3Dopenembe=
dded-core.git&amp;a=3Dcommit;h=3D833302761df924bb503cc2ad04ecae1023381f8f" =
rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org/?p=3Dopene=
mbedded-core.git&amp;a=3Dcommit;h=3D833302761df924bb503cc2ad04ecae1023381f8=
f</a><br>
&gt;<br>
&gt; Author: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.c=
om">chris_larson@mentor.com</a>&gt;<br>
&gt; Date:=C2=A0 =C2=A0Mon Aug 24 15:18:34 2015 -0700<br>
&gt;<br>
&gt; update-rc.d.bbclass: explicitly dep on initscripts<br>
&gt;<br>
&gt; update-rc.d doesn&#39;t just want an initscripts package, it wants<br>
&gt; initscripts-functions. In the case where VIRTUAL-RUNTIME_initscripts i=
s set to<br>
&gt; nothing, update-rc.d still needs initscripts-functions to satisfy its =
runtime<br>
&gt; dependencies. Further, we shouldn&#39;t be using a *runtime* virtual i=
n a *build<br>
&gt; time* variable. This should resolve image creation failures with<br>
&gt; configurations without sysv initscripts when a recipe inherits update-=
rc.d and<br>
&gt; doesn&#39;t inherit systemd.<br>
&gt;<br>
&gt; (From OE-Core rev: e6642ae0849e5ac3174c643a7693af25d829d6d1)<br>
<br>
Unfortunately this means that I cannot PNBLACKLIST initscripts recipe in<br=
>
DISTRO which provides own initscripts implementation (which also<br>
provides initscripts-functions).<br>
<br>
What&#39;s even worse is that I&#39;ll have to overlay whole bbclass to get=
 rid<br>
of this dependency :/</div></blockquote></div><br>Of course you can. This i=
s a build dependency. Add a PROVIDES +=3D &quot;initscripts&quot; + appropr=
iate preferences. Alternatively, we could introduce a virtual/initscripts-f=
unctions.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christo=
pher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded,=
 OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graph=
ics</div></div>
</div></div>

--bcaec5486056717a98051ea00616--
