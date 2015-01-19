Return-Path: <kergoth@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7151E721E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 19:16:22 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id t59so16131952yho.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 11:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kF3Qn++AXiFyGUN0HJJFKzNWsLngPRIic7iZj1PTVik=;
	b=dVtxNDa0RkauIPhPzuk/FmPbgWwZEwyu2KrnbyfirSZrg36ZI0AM+HexcZyme4aZJM
	m+RxJkxLfQhw2Enje+Br/3oZu+EZLinZrufijN2ku1V6qYxiSzv3B9Q5uQB1ujQmt3V0
	HS1g50tOC9akX7Kt+01SfJTaBxkKexNlbWZZI+te9HTGbefpr/D6QkvLQmLdKxnyfHQD
	Ue/FW5BqAJ4fFeofEgt1M6K8F5oOr4qF1Uje5cRwl7O/SfvNbFhiau1B5ha+tmyiWqMJ
	1Wi9x5+ytVpA0iMlyRG7rOaOGKK0BHWGCQGxZGlc9NlfmpOeYHFUy6zNmTAIFZr2J3sq
	nNyA==
X-Received: by 10.170.173.78 with SMTP id p75mr21986001ykd.66.1421694982258;
	Mon, 19 Jan 2015 11:16:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.170.190.16 with HTTP; Mon, 19 Jan 2015 11:16:02 -0800 (PST)
In-Reply-To: <1421693551-17611-1-git-send-email-kergoth@gmail.com>
References: <1421693551-17611-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 19 Jan 2015 12:16:02 -0700
Message-ID: <CABcZANnspPqPEgts_D2DCdHAawG-EueWCS2oaK5B1j=jv6ypvg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCHv2 0/2] recipetool: add python buildsystem support
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
X-List-Received-Date: Mon, 19 Jan 2015 19:16:31 -0000
Content-Type: multipart/alternative; boundary=001a113abd0265862f050d0628d4

--001a113abd0265862f050d0628d4
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 19, 2015 at 11:52 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> Changes from v1:
>
> - Drops the 'your responsibility' message, per Paul's request
> - Pulls in sys.builtin_module_names from the host python for now
> - Handles extra_requires both in requires.txt and setup.py. This is
> currently
>   implemented by a naive conversion of the optional features to
>   packageconfigs.
> - Improves the way we extract the setup keywords to make it easier to grab
> the
>   non-literal values, such as calls to `find_packages`, so we can implement
>   that in the future.
>


See https://gist.github.com/kergoth/c6b6e08fd24cdde8adc5 for just this
code, for the curious.



> - Alters the existing LICENSE line from recipetool rather than adding
>   a duplicated one, by poking at `lines_before`.
> - Moves the HOMEPAGE/SUMMARY/etc below the license info but above SRC_URI,
> to
>   comply with our conventions.
> - Defaults to python- prefixing the dependencies we add.
> - Fixes numerous bugs.
>


Also:
- Removes extensions provided by this package from the unmapped deps list,
assuming fully literal definition of the keyword in setup.py. E.g. this is
handled: `ext_modules=[Extension('async.mod.zlib', ['mod/zlibmodule.c'])]`.
- Fixes it so 'GPL' stays as 'GPL' rather than becoming 'GPL-1.0' -- We
can't assume version specifics when the license classifiers are version
independent. This was true already for most cases, now it's consistent.
- Doesn't bother setting LICENSE if the value we obtained is 'UNKNOWN'.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113abd0265862f050d0628d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jan 19, 2015 at 11:52 AM, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><div id=3D":bu" class=3D"" style=3D=
"overflow:hidden">Changes from v1:<br>
<br>
- Drops the &#39;your responsibility&#39; message, per Paul&#39;s request<b=
r>
- Pulls in sys.builtin_module_names from the host python for now<br>
- Handles extra_requires both in requires.txt and setup.py. This is current=
ly<br>
=C2=A0 implemented by a naive conversion of the optional features to<br>
=C2=A0 packageconfigs.<br>
- Improves the way we extract the setup keywords to make it easier to grab =
the<br>
=C2=A0 non-literal values, such as calls to `find_packages`, so we can impl=
ement<br>
=C2=A0 that in the future.<br></div></blockquote><div><br></div><div><div><=
br></div><div>See <a href=3D"https://gist.github.com/kergoth/c6b6e08fd24cdd=
e8adc5">https://gist.github.com/kergoth/c6b6e08fd24cdde8adc5</a> for just t=
his code, for the curious.</div></div><div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddin=
g-left:1ex"><div id=3D":bu" class=3D"" style=3D"overflow:hidden">
- Alters the existing LICENSE line from recipetool rather than adding<br>
=C2=A0 a duplicated one, by poking at `lines_before`.<br>
- Moves the HOMEPAGE/SUMMARY/etc below the license info but above SRC_URI, =
to<br>
=C2=A0 comply with our conventions.<br>
- Defaults to python- prefixing the dependencies we add.<br>
- Fixes numerous bugs.<br></div></blockquote></div><div class=3D"gmail_extr=
a"><br></div><br><div style=3D"color:rgb(33,33,33);font-family:&#39;Helveti=
ca Neue&#39;,Helvetica,Arial,sans-serif;font-size:13px;line-height:20px">Al=
so:</div><div style=3D"color:rgb(33,33,33);font-family:&#39;Helvetica Neue&=
#39;,Helvetica,Arial,sans-serif;font-size:13px;line-height:20px">- Removes =
extensions provided by this package from the unmapped deps list, assuming f=
ully literal definition of the keyword in setup.py. E.g. this is handled: `=
ext_modules=3D[Extension(&#39;async.mod.zlib&#39;, [&#39;mod/zlibmodule.c&#=
39;])]`.</div><div style=3D"color:rgb(33,33,33);font-family:&#39;Helvetica =
Neue&#39;,Helvetica,Arial,sans-serif;font-size:13px;line-height:20px">- Fix=
es it so &#39;GPL&#39; stays as &#39;GPL&#39; rather than becoming &#39;GPL=
-1.0&#39; -- We can&#39;t assume version specifics when the license classif=
iers are version independent. This was true already for most cases, now it&=
#39;s consistent.</div><div style=3D"color:rgb(33,33,33);font-family:&#39;H=
elvetica Neue&#39;,Helvetica,Arial,sans-serif;font-size:13px;line-height:20=
px">- Doesn&#39;t bother setting LICENSE if the value we obtained is &#39;U=
NKNOWN&#39;.</div>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Ch=
ristopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbe=
dded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor =
Graphics</div></div>
</div></div>

--001a113abd0265862f050d0628d4--
