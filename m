Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4C4A96C801
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 14:24:43 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so10075456iec.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Y+DTFt6mOnQ3ygXEcNJnJbx581VPksWx3/jXOGa1OfI=;
	b=oaI/2HJA0yI7g0OBs5baqBTaRnDyigPEQ+tNaOAPt14vsjrey4Nb+L2ZGtCwhQXTiI
	Gnf4c+eG+ikS6nsJCKmKTS1+3ViBrrB4t/qxehempLwnfgi8Wu1KzGart7B5WZ5tW4+K
	d9q24sDzHbExMJSgnnS3dRfp2XykQ3GzTCdxWhRf6uX6sgM4c3i/KQL7z7bG9SOvAqqT
	Hmh4kfqebF8/2oHGJN4D7+90K9v8XzhocPgOzWIwsGfcz2hSY4Ccjmw5ZIjINi7fCtVp
	A/8ht4OLoAr8r11N4j4J7lLtN1PkbNG30ytXqWTW7P/dgbLx+h9609yth2CFwtoq7GPo
	PTvQ==
MIME-Version: 1.0
X-Received: by 10.50.118.105 with SMTP id kl9mr1129289igb.3.1379427884555;
	Tue, 17 Sep 2013 07:24:44 -0700 (PDT)
Received: by 10.50.216.195 with HTTP; Tue, 17 Sep 2013 07:24:44 -0700 (PDT)
In-Reply-To: <CAJTo0LaL_rxVQRdd8r1dkG5zV5FFLk5xBnWP34ME4P2oxu=Gnw@mail.gmail.com>
References: <cover.1379329974.git.hongxu.jia@windriver.com>
	<dd0104c4f2811038c1ee78605e6b81a50045f5f6.1379329974.git.hongxu.jia@windriver.com>
	<C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com>
	<5237C039.4080001@windriver.com>
	<CAJTo0LaL_rxVQRdd8r1dkG5zV5FFLk5xBnWP34ME4P2oxu=Gnw@mail.gmail.com>
Date: Tue, 17 Sep 2013 07:24:44 -0700
Message-ID: <CAMKF1sr6vktFkfBSySwn3OYqaOd0FY6sy59bHz1GfEJUqOoL=Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] libxml2: fix LSB desktop-xml tests failure
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
X-List-Received-Date: Tue, 17 Sep 2013 14:24:44 -0000
Content-Type: multipart/alternative; boundary=089e011769cf0d6c6704e69515cc

--089e011769cf0d6c6704e69515cc
Content-Type: text/plain; charset=UTF-8

On Tuesday, September 17, 2013, Burton, Ross wrote:

> On 17 September 2013 03:36, Hongxu Jia <hongxu.jia@windriver.com<javascript:;>>
> wrote:
> > The upstream of libxml2 has not fixed this issue:
> > git clone git://git.gnome.org/libxml2
> >
> > And I have filed a bug to them
> > https://bugzilla.gnome.org/show_bug.cgi?id=708205
> >
> > After this is fixed and released, also need to report another
> > bug to LSB to update their libxml2 source code.
> >
> > The time cycle is long, should we mark this bug as "Waiting For Upstream"
> > or accept this patch to workaround for LSB test.
>
> Using my amazing ability of talking to the upstream maintainer (DV in
> #xml on irc.gnome.org) I've sorted this out.
>
> The CVE is for *Chromium's fork of libxml*.  Not upstream libxml2.
> The patch changes a public structure by adding fields *in the middle*,
> so that broke the ABI.  That's two good reasons to revert the patch.
> As Daniel has said in the bug, this patch was the quick fix that
> Chromium did as they statically link to libxml2 so the API breakage
> isn't an issue, the proper fix is already in libxslt.  As long as we
> have libxml 2.9.0 and libxslt 1.1.27 onwards (which we do), the issue
> is correctly fixed.


Thanks for sorting this out in real good way

>
> So, NAK to this patch, and a revert incoming.
>
> Ross
>

--089e011769cf0d6c6704e69515cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, September 17, 2013, Burton, Ross  wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On 17 September 2013 03:36, Hongxu Jia &lt;<a href=3D"j=
avascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;hongxu.jia@windriver=
.com&#39;)">hongxu.jia@windriver.com</a>&gt; wrote:<br>

&gt; The upstream of libxml2 has not fixed this issue:<br>
&gt; git clone git://<a href=3D"http://git.gnome.org/libxml2" target=3D"_bl=
ank">git.gnome.org/libxml2</a><br>
&gt;<br>
&gt; And I have filed a bug to them<br>
&gt; <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D708205" target=
=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D708205</a><br>
&gt;<br>
&gt; After this is fixed and released, also need to report another<br>
&gt; bug to LSB to update their libxml2 source code.<br>
&gt;<br>
&gt; The time cycle is long, should we mark this bug as &quot;Waiting For U=
pstream&quot;<br>
&gt; or accept this patch to workaround for LSB test.<br>
<br>
Using my amazing ability of talking to the upstream maintainer (DV in<br>
#xml on <a href=3D"http://irc.gnome.org" target=3D"_blank">irc.gnome.org</a=
>) I&#39;ve sorted this out.<br>
<br>
The CVE is for *Chromium&#39;s fork of libxml*. =C2=A0Not upstream libxml2.=
<br>
The patch changes a public structure by adding fields *in the middle*,<br>
so that broke the ABI. =C2=A0That&#39;s two good reasons to revert the patc=
h.<br>
As Daniel has said in the bug, this patch was the quick fix that<br>
Chromium did as they statically link to libxml2 so the API breakage<br>
isn&#39;t an issue, the proper fix is already in libxslt. =C2=A0As long as =
we<br>
have libxml 2.9.0 and libxslt 1.1.27 onwards (which we do), the issue<br>
is correctly fixed.</blockquote><div><br></div><div>Thanks for sorting this=
 out in real good way=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
So, NAK to this patch, and a revert incoming.<br>
<br>
Ross<br>
</blockquote>

--089e011769cf0d6c6704e69515cc--
