Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9B11F74694
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 15:07:32 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 66so4867669wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+5IrVLi+9Q1XEvmB+t9j7ltOxh1aU+gP70MAYL0EoOY=;
	b=cmzT6mA4QNpPAT21FWjMreGFepKjNEAiqASJc8wbQZsJKEJ4fNCpeOl189pbVgZfd5
	d0fZ8YHD+PpGwVXZvu1tzSDIf1cCf23LNnq0oXw30hAV5mXQySz9Mjab6R1UAUj0d04u
	AzuA06heTmaitaGjY2sDTjePfzTfrNGYSixcNv1t+zMstvq538mO0QBpuuXKQ9JZ0IKQ
	ITNzsxaSSeiZsWnxnRl9FC7YNbo4o8b7PyTVjGVkOkeAcu9dibxTJmbPcK6QIEPQrlYS
	RXVvM0cnpGDObL6pFzr4h33fp7woNIwwIoFUR3Wxo6i5tleVQ385lPs8OEbHvLp8WxaH
	QbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+5IrVLi+9Q1XEvmB+t9j7ltOxh1aU+gP70MAYL0EoOY=;
	b=WIo2iSXRRg1n0Tdn1lUzriu471aRbzq8kjvQyM7xnLagLgPcNcWs3ZVTi8z9Astv+W
	svdIhrQYyqXDcO6nqCuQYPuUzzWINbBFJRGJD0FzH6RggomFWf+6Sr/TwYzaVRc0Ob5q
	U82e3EdeKCz5zf/I9fzQZB3YFI8Wt/P3PfCz/ae+nwW0u0VBzkG7O3aD/9aTJJDkzatP
	acDpPL2sQdnp9ieH1SRZK17p6TlMjVpMuhdtd/8yMwyDPciQnuTg19TMRkqteqy1Yr2T
	eObUkzilTOx34uyxUAjUq8rAJkZOWzI/I/nzjEptn7SyCdi7WDrZAXnHYH9PW5QMXjXc
	vUfA==
X-Gm-Message-State: ALQs6tBVpND44EtSmiCz5cHX7D09LDls4lYFk+SuWGRPGyP3ZQeJU6Ra
	O5CsZCaNz7EVwChPp2bk+i2HoAZRcxuLxFPuGt0=
X-Google-Smtp-Source: AIpwx48C5lWiFD1AukwBo9YaWJJsxImWg+UVc6jIGLwDmgZA/ai0AbvBxOmqPH9uIAO/zWuRY4G9tWmurnQLmgaCaEg=
X-Received: by 10.28.15.15 with SMTP id 15mr2835920wmp.60.1523459252916; Wed,
	11 Apr 2018 08:07:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Wed, 11 Apr 2018 08:07:32 -0700 (PDT)
In-Reply-To: <CA+chaQeM2cRQZ+pHtjDQEBZZGydA8wnThTThsq-+HZmpjTkfjA@mail.gmail.com>
References: <cover.1522936224.git.akuster808@gmail.com>
	<CAJ86T=XmqNbTF+qXWhG5xFHNBUnRCaDx5DKeTQ_Y+wfqhgbiyg@mail.gmail.com>
	<CA+chaQf17H2+HKJ6V=+tGnL7xkH_ocPRj7j_hBWSG5e2AKV31w@mail.gmail.com>
	<1523023909.2942.8.camel@linuxfoundation.org>
	<CA+chaQeM2cRQZ+pHtjDQEBZZGydA8wnThTThsq-+HZmpjTkfjA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Apr 2018 17:07:32 +0200
Message-ID: <CA+chaQcyzHnOfQ5hSGbXKFOwocKObdbm98mZgxD0YMy42_2PxA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/38] Morty Next pull request
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
X-List-Received-Date: Wed, 11 Apr 2018 15:07:33 -0000
Content-Type: multipart/alternative; boundary="001a1145aa22999625056993ffc6"

--001a1145aa22999625056993ffc6
Content-Type: text/plain; charset="UTF-8"

I think I've found the reason why it was failing for me.

glibc is now the only component in morty release which is using
TMPDIR/sysroots-components (normally used only after RSS):
oe-core$ git grep "\${STAGING_DIR}-components"
meta/recipes-core/glibc/glibc-locale.inc:LOCALETREESRC =
"${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
meta/recipes-core/glibc/glibc-mtrace.inc:SRC =
"${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
meta/recipes-core/glibc/glibc-package.inc:do_stash_locale[sstate-outputdirs]
= "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
meta/recipes-core/glibc/glibc-package.inc:do_stash_locale[sstate-fixmedir]
= "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
meta/recipes-core/glibc/glibc-scripts.inc:SRC =
"${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale/scripts"

and the workspace of my jenkins jobs is still running test-dependencies
jobs for morty, which does only selective pruning of TMPDIR:
http://git.openembedded.org/openembedded-core/tree/scripts/test-dependencies.sh#n165

which left TMPDIR/sysroots-components files from qlibc.do_stash_locale
behind and when next build started in the same workspace it failed, because
it was trying to overwrite files already there.

Every time I wiped whole TMPDIR and restarted the jobs it worked for a
while and then it got broken again during first test-dependencies job in
each workspace.

I can obviously change test-dependencies.sh to
delete TMPDIR/sysroots-components as well and I'll send update for it after
a bit more testing.

Ross's oe-core/scripts/wipe-sysroot and maybe some other scripts/tools need
similar fix as well.

Regards,


On Fri, Apr 6, 2018 at 4:15 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> In this build I was starting with empty TMPDIR, there shouldn't be any old
> files, but will retry manually in different builds.
>
> On Fri, Apr 6, 2018 at 4:11 PM, Richard Purdie <richard.purdie@
> linuxfoundation.org> wrote:
>
>> On Fri, 2018-04-06 at 16:07 +0200, Martin Jansa wrote:
>> > > Is it safe to backport to morty, which doesn't have RSS?
>> >
>> > It doesn't work well for me, all the builds are now failing with:
>> >
>> > ERROR: glibc-2.24-r0 do_stash_locale_setscene: The recipe glibc is
>> > trying to install files into a shared area when those files already
>> > exist. Those files and their manifest location are:
>> >    TMPDIR/sysroots-components/aarch64/glibc-stash-locale/SUPPORTED
>> >  Matched in b''
>> >    TMPDIR/sysroots-components/aarch64/glibc-stash-
>> > locale/lib/libnss_nisplus.so.2
>> >  Matched in b''
>> >    TMPDIR/sysroots-components/aarch64/glibc-stash-locale/lib/ld-
>> > 2.24.so
>> >  Matched in b''
>> > ...
>>
>> I suspect using its own sstate task is ok in morty even if it didn't
>> have RSS. What may have broken is the existing TMPDIR upgrade path
>> though :(
>>
>> If the files are removed, I suspect things will then work out ok. There
>> were manifest handling changes in later versions which dealt with this
>> kind of issue better (removals before installations).
>>
>> Cheers,
>>
>> Richard
>>
>
>

--001a1145aa22999625056993ffc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think I&#39;ve found the reason why it was failing for m=
e.<div><br></div><div>glibc is now the only component in morty release whic=
h is using TMPDIR/sysroots-components (normally used only after RSS):</div>=
<div><div>oe-core$ git grep &quot;\${STAGING_DIR}-components&quot;</div><di=
v>meta/recipes-core/glibc/glibc-locale.inc:LOCALETREESRC =3D &quot;${STAGIN=
G_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale&quot;</div><div>meta/r=
ecipes-core/glibc/glibc-mtrace.inc:SRC =3D &quot;${STAGING_DIR}-components/=
${PACKAGE_ARCH}/glibc-stash-locale/scripts&quot;</div><div>meta/recipes-cor=
e/glibc/glibc-package.inc:do_stash_locale[sstate-outputdirs] =3D &quot;${ST=
AGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale&quot;</div><div>me=
ta/recipes-core/glibc/glibc-package.inc:do_stash_locale[sstate-fixmedir] =
=3D &quot;${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale&quot=
;</div><div>meta/recipes-core/glibc/glibc-scripts.inc:SRC =3D &quot;${STAGI=
NG_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale/scripts&quot;</div></=
div><div><br></div><div>and the workspace of my jenkins jobs is still runni=
ng test-dependencies jobs for morty, which does only selective pruning of T=
MPDIR:</div><div><a href=3D"http://git.openembedded.org/openembedded-core/t=
ree/scripts/test-dependencies.sh#n165">http://git.openembedded.org/openembe=
dded-core/tree/scripts/test-dependencies.sh#n165</a><br></div><div><br></di=
v><div>which left=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">TMPDIR/sysroots-components=
 files from qlibc.do_stash_locale behind and when next build started in the=
 same workspace it failed, because it was trying to overwrite files already=
 there.</span></div><div><span style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline"><br></span></div><div>Ev=
ery time I wiped whole TMPDIR and restarted the jobs it worked for a while =
and then it got broken again during first test-dependencies job in each wor=
kspace.</div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline"><br></span></div><div><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">I can obviously change test-dependencies.sh to delete=C2=
=A0TMPDIR/sysroots-components as well and I&#39;ll send update for it after=
 a bit more testing.</span></div><div><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline"><br></span>=
</div><div><span style=3D"text-align:start;text-indent:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">Ross&#39;s oe-core/scripts/wipe-sysroot and m=
aybe some other scripts/tools need similar fix as well.<br></span></div><di=
v><br></div><div>Regards,</div><div><br></div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Fri, Apr 6, 2018 at 4:15 PM, Martin J=
ansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr">In this build I was starting with empty TM=
PDIR, there shouldn&#39;t be any old files, but will retry manually in diff=
erent builds.</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 6, 2018 at 4:11 PM, R=
ichard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@<wbr>linuxfoundation.org</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Fri, 2018-04=
-06 at 16:07 +0200, Martin Jansa wrote:<br>
&gt; &gt;=C2=A0Is it safe to backport to morty, which doesn&#39;t have RSS?=
<br>
&gt;<br>
&gt; It doesn&#39;t work well for me, all the builds are now failing with:<=
br>
&gt;<br>
&gt; ERROR: glibc-2.24-r0 do_stash_locale_setscene: The recipe glibc is<br>
&gt; trying to install files into a shared area when those files already<br=
>
&gt; exist. Those files and their manifest location are:<br>
&gt; =C2=A0 =C2=A0TMPDIR/sysroots-components/aa<wbr>rch64/glibc-stash-local=
e/SUPPO<wbr>RTED<br>
&gt; =C2=A0Matched in b&#39;&#39;<br>
&gt; =C2=A0 =C2=A0TMPDIR/sysroots-components/aa<wbr>rch64/glibc-stash-<br>
&gt; locale/lib/libnss_nisplus.so.2<br>
&gt; =C2=A0Matched in b&#39;&#39;<br>
&gt; =C2=A0 =C2=A0TMPDIR/sysroots-components/aa<wbr>rch64/glibc-stash-local=
e/lib/<wbr>ld-<br>
&gt; <a href=3D"http://2.24.so" rel=3D"noreferrer" target=3D"_blank">2.24.s=
o</a><br>
&gt; =C2=A0Matched in b&#39;&#39;<br>
&gt; ...<br>
<br>
</span>I suspect using its own sstate task is ok in morty even if it didn&#=
39;t<br>
have RSS. What may have broken is the existing TMPDIR upgrade path<br>
though :(<br>
<br>
If the files are removed, I suspect things will then work out ok. There<br>
were manifest handling changes in later versions which dealt with this<br>
kind of issue better (removals before installations).<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a1145aa22999625056993ffc6--
