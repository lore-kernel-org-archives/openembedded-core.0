Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id E3FB3730DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 15:02:50 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id v125so120478680qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 07:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w3usIZ+47VBBTrIEUPx9XYILL4h3tPwn9aOBFfI+N4g=;
	b=K1kjm1VtgvkjA/kRd5iAEyD/To57ayLCZMcpyWRDskmLPvXCxohecXYC5lIYu3K7G9
	zE35MphO9esxCENAP91z8w+DU3FBuUwfPNfwqvJ18s+Jufk3rAnMrOFlQQDcQxb/pYy8
	+RUKmO6izLfZ/ZAfZQKBWdIvdeQOuJdvbzliDeW8wnsmfn/ImhGIMWEvIFNw8zUFFN/G
	7HO5jtCHYwPcv1rnLZ9a3jLgxXAQ27AzxdSBnR78PdPUa9fMkP3x+u1ZqOrZDppBMMrP
	u+UwcFacNcx0JZKOCdYLyqJTDJVaO+pD2pVxq0xoGhZiL95KS7bZayj7P3Bu8YOJ0P4f
	I9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w3usIZ+47VBBTrIEUPx9XYILL4h3tPwn9aOBFfI+N4g=;
	b=steJ3RlCyx13ICztaLhLSz339n5OX85qPtr0SpklrX2H/VuCWepCrWcmQZYqwputl0
	Zpqgmpw5PYeZM/rsWDifDom/w+KyTyL6BAiXKB2+OR728MhWxC9qNJjVmNGdCaTH8gTJ
	isg4LmdySDuI4GlSHWNTYlldDvZAPFDZJf6uiPKVo6IqPPybVpzixP7xgn2GWoH6AnLH
	SdurO5qpSxcv2CLPUoeSDomVwnxBIFKFgOnl9EU31h1uEGlM4o6w83iUP9hYLm/toaiF
	29F2o6bcd86bIYNRqu5EFz6kuY6BZloiFD0neTPCUk9Uu3mOA8U7jQyT1g1jWybvJ9XR
	LEqw==
X-Gm-Message-State: AFeK/H2hQHnV/FokgfCVe1sQa8rituNF8xqyMJMREldQzraP9wXVLujVsnG7Sy8B9lCyWuRyDq668KE2BySSUhwh
X-Received: by 10.55.175.195 with SMTP id y186mr13953502qke.26.1489071771815; 
	Thu, 09 Mar 2017 07:02:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 9 Mar 2017 07:02:31 -0800 (PST)
In-Reply-To: <1489064618.22968.106.camel@linuxfoundation.org>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
	<CAJTo0LZeOiwCJzMdeSCkHuj9mfHBbjwCAKZkeAsbziHBaVhmMg@mail.gmail.com>
	<1489064618.22968.106.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Mar 2017 15:02:31 +0000
Message-ID: <CAJTo0La7XEspCPQygaGsyi6ofMUVWC2YshSxp2YXcYDuHAsHvA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Thu, 09 Mar 2017 15:02:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c013fd7054a4d8a5c

--94eb2c06093c013fd7054a4d8a5c
Content-Type: text/plain; charset=UTF-8

On 9 March 2017 at 13:03, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> I worry that making it support generic scms may make it fragile and
> hard to extend if we do end up needing to do scm specific work in here
> so I'm torn. Having a class per scm would also be annoying...
>

So I have this so far:

CLASSOVERRIDE = "class-gitupstream"

# TODO doesn't let you gitupstream a native recipe yet

python gitupstream_virtclass_handler () {
    # Do nothing if this is inherited, as it's for BBCLASSEXTEND
    if "gitupstream" not in (d.getVar('BBCLASSEXTEND') or ""):
        bb.error("Don't inherit gitupstream, use BBCLASSEXTEND")
        return

    variant = d.getVar("BBEXTENDVARIANT")
    if variant not in ("target"):
        bb.error("Pass the variant when using gitupstream, for example
gitupstream:target")

    src_uri = d.getVar("SRC_URI").split()[0]
    uri = bb.fetch2.URI(src_uri)

    d.setVar("DEFAULT_PREFERENCE", "-1")

    if uri.scheme == "git":
        d.setVar("S", "${WORKDIR}/git")
    elif uri.scheme == "svn":
        d.setVar("S", "${WORKDIR}/" + uri.params["module"])

    # Modify the PV if the recipe hasn't already overridden it
    pv = d.getVar("PV")
    proto_marker = "+" + uri.scheme
    if proto_marker not in pv:
        d.setVar("PV", pv + proto_marker + "${SRCPV}")
}

addhandler gitupstream_virtclass_handler
gitupstream_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"


(obviously s/gitupstream/devupstream/ still needs to happen)

It's useful in that it adjust S automatically for svn fetches, but the
problem is that bitbake looks for svn: URIs too early and so this doesn't
cause subversion-native to be built.

I'm thinking I'll finish renaming this to devupstream, remove the svn
specific part, and make a note about attempting to fix the fetcher problem.

Ross

--94eb2c06093c013fd7054a4d8a5c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2017 at 13:03, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gm=
ail-:s9" class=3D"gmail-a3s gmail-aXjCH gmail-m15ab32c40988c0a4">I worry th=
at making it support generic scms may make it fragile and<br>
hard to extend if we do end up needing to do scm specific work in here<br>
so I&#39;m torn. Having a class per scm would also be annoying...</div></bl=
ockquote></div><br>So I have this so far:</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">CLASSOVERRID=
E =3D &quot;class-gitupstream&quot;</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra"># TODO doesn&#39;t let you gitupstream a nati=
ve recipe yet</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">python gitupstream_virtclass_handler () {</div><div class=3D"gmail_=
extra">=C2=A0 =C2=A0 # Do nothing if this is inherited, as it&#39;s for BBC=
LASSEXTEND</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 if &quot;gitupstre=
am&quot; not in (d.getVar(&#39;BBCLASSEXTEND&#39;) or &quot;&quot;):</div><=
div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;Don&#3=
9;t inherit gitupstream, use BBCLASSEXTEND&quot;)</div><div class=3D"gmail_=
extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 return</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 variant =3D d.getVar(&quo=
t;BBEXTENDVARIANT&quot;)</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 if v=
ariant not in (&quot;target&quot;):</div><div class=3D"gmail_extra">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 bb.error(&quot;Pass the variant when using gitupstream=
, for example gitupstream:target&quot;)</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 src_uri =3D d.getVar(&quot;=
SRC_URI&quot;).split()[0]</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 uri=
 =3D bb.fetch2.URI(src_uri)</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">=C2=A0 =C2=A0 d.setVar(&quot;DEFAULT_PREFERENCE&quot;=
, &quot;-1&quot;)</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">=C2=A0 =C2=A0 if uri.scheme =3D=3D &quot;git&quot;:</div><div c=
lass=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;S&quot;, &q=
uot;${WORKDIR}/git&quot;)</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 eli=
f uri.scheme =3D=3D &quot;svn&quot;:</div><div class=3D"gmail_extra">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;S&quot;, &quot;${WORKDIR}/&quot; + uri=
.params[&quot;module&quot;])</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">=C2=A0 =C2=A0 # Modify the PV if the recipe hasn&#39=
;t already overridden it</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 pv =
=3D d.getVar(&quot;PV&quot;)</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =
proto_marker =3D &quot;+&quot; + uri.scheme</div><div class=3D"gmail_extra"=
>=C2=A0 =C2=A0 if proto_marker not in pv:</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;PV&quot;, pv + proto_marker + &q=
uot;${SRCPV}&quot;)</div><div class=3D"gmail_extra">}</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">addhandler gitupstream_virt=
class_handler</div><div class=3D"gmail_extra">gitupstream_virtclass_handler=
[eventmask] =3D &quot;bb.event.RecipePreFinalise&quot;</div><div><br></div>=
<div><br></div><div>(obviously s/gitupstream/devupstream/ still needs to ha=
ppen)</div><div><br></div><div>It&#39;s useful in that it adjust S automati=
cally for svn fetches, but the problem is that bitbake looks for svn: URIs =
too early and so this doesn&#39;t cause subversion-native to be built.</div=
><div><br></div><div>I&#39;m thinking I&#39;ll finish renaming this to devu=
pstream, remove the svn specific part, and make a note about attempting to =
fix the fetcher problem.</div><div><br></div><div>Ross</div></div></div>

--94eb2c06093c013fd7054a4d8a5c--
