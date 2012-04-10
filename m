Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHdht-00083p-Nl
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 18:14:13 +0200
Received: by wera1 with SMTP id a1so3320432wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 09:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=e8GpklJcI/ltVWJvcYtQhdiwIA531y1yqBSrxgBMhTs=;
	b=jrkmVsg6DdxWGAgC0MjhPITnFVcOeczGUwqlhL/XPkfgE9AFZDE9INO96Kq2/mMy8r
	Yw317HzxKIYZgbe+bolpX8gcxenBTS9rotG4uzNUOOtiTZ+Krld6+QVnOEaQ2PNj2xwr
	APpKntoieMdBttefw1lZclSV5FJ7cHkbPITBD3EeMd4mxVaWkWVgCYOo/1btD/M+AYxU
	ZDJ3d9O6Bn8eJqLd0nFjr3juU58o7qV2IJTP7NhmbLmwXJPxGSfzd/zyF5z3oj2fMRWl
	PKltS03b3CBdEyng8OJmTifX3PkyopwX2ax8C3VNCubaPRnJ+oHsTQYmafAY1M7spHWB
	5QVA==
Received: by 10.180.104.231 with SMTP id gh7mr8300702wib.10.1334073896046;
	Tue, 10 Apr 2012 09:04:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.158.16 with HTTP; Tue, 10 Apr 2012 09:04:35 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <A5A4632D-2BD8-486E-A7E5-BCBA23334368@dominion.thruhere.net>
References: <20120406001738.706A810217@opal>
	<20120410083815.GC3583@jama.jama.net> <1334048766.6861.2.camel@ted>
	<A5A4632D-2BD8-486E-A7E5-BCBA23334368@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 10 Apr 2012 19:04:35 +0300
Message-ID: <CAK18fxGOdxzvQJPXTga2P2CGbR69qt2JLSHYhv-QJagYAxdgxA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkT9yQxqNxKuFulFhsqa6o0t+Dn6UJx63ZwU5lvdf/HkxSEJWyP5g43E5DFYZ0pkvojQqoj
Subject: Re: [oe-commits] Andrei Gherzan : gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/ gdbm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 16:14:13 -0000
Content-Type: multipart/alternative; boundary=f46d044288bcad928004bd5548c1

--f46d044288bcad928004bd5548c1
Content-Type: text/plain; charset=ISO-8859-1

Thanks a lot for your observations. I will go with the third option as the
majority voted. :)

On Tue, Apr 10, 2012 at 12:11, Koen Kooi <koen@dominion.thruhere.net> wrote:

>
> Op 10 apr. 2012, om 11:06 heeft Richard Purdie het volgende geschreven:
>
> > On Tue, 2012-04-10 at 10:38 +0200, Martin Jansa wrote:
> >> On Fri, Apr 06, 2012 at 12:17:38AM +0000, git@git.openembedded.orgwrote:
> >>> Module: openembedded-core.git
> >>> Branch: master
> >>> Commit: e4d2ee00419f675ba8b7fb5d75256762253d8b32
> >>> URL:
> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e4d2ee00419f675ba8b7fb5d75256762253d8b32
> >>>
> >>> Author: Andrei Gherzan <andrei@gherzan.ro>
> >>> Date:   Fri Mar 23 17:56:29 2012 +0200
> >>>
> >>> gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in
> include/gdbm
> >>>
> >>> ndbm.h is needed by python for dbm module. This is why
> -enable-libgdbm-compat was added
> >>> to configure.
> >>> The second change is because python is looking for the gdbm headers in
> include/gdbm.
> >>> The easiest way to solve this issue is to add symlinks in include/gdbm.
> >>>
> >>> [YOCTO #1937]
> >>>
> >>> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> >>
> >> This breaks every package in feed which depends on old package name
> >> libgdbm4 (>= 1.10)
> >>
> >> Because now there are 2 .so files in ${PN} and no LEAD_SONAME defined.
> >>
> >> Are you going to
> >>
> >> 1) send PR bumps to all packages which depends on libgdbm4
> >>   (e.g. apr-util python pulseaudio perl gst-plugins-good and probably
> more)
> >> 2) define LEAD_SONAME and bump PR in gdbm recipe
> >> 3) move -compat libs to ${PN}-compat or some other package name, so that
> >>   old libgdbm4 still exists (and maybe + 1) because some people could
> >>   build those with gdbm as dependency now)
> >
> > I like the idea of putting the compat libs into a separate package...
>
> me too
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d044288bcad928004bd5548c1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">Thanks a lot for your observations. I will go wi=
th the third option as the majority voted. :)</div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">On Tue, Apr 10, 2012 at 12:11, Koen=
 Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" t=
arget=3D"_blank">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
Op 10 apr. 2012, om 11:06 heeft Richard Purdie het volgende geschreven:<br>
<div><div><br>
&gt; On Tue, 2012-04-10 at 10:38 +0200, Martin Jansa wrote:<br>
&gt;&gt; On Fri, Apr 06, 2012 at 12:17:38AM +0000, <a href=3D"mailto:git@gi=
t.openembedded.org" target=3D"_blank">git@git.openembedded.org</a> wrote:<b=
r>
&gt;&gt;&gt; Module: openembedded-core.git<br>
&gt;&gt;&gt; Branch: master<br>
&gt;&gt;&gt; Commit: e4d2ee00419f675ba8b7fb5d75256762253d8b32<br>
&gt;&gt;&gt; URL: =A0 =A0<a href=3D"http://git.openembedded.org/?p=3Dopenem=
bedded-core.git&amp;a=3Dcommit;h=3De4d2ee00419f675ba8b7fb5d75256762253d8b32=
" target=3D"_blank">http://git.openembedded.org/?p=3Dopenembedded-core.git&=
amp;a=3Dcommit;h=3De4d2ee00419f675ba8b7fb5d75256762253d8b32</a><br>



&gt;&gt;&gt;<br>
&gt;&gt;&gt; Author: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro=
" target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
&gt;&gt;&gt; Date: =A0 Fri Mar 23 17:56:29 2012 +0200<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; gdbm: Activate -enable-libgdbm-compat and add symlinks to head=
ers in include/gdbm<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ndbm.h is needed by python for dbm module. This is why -enable=
-libgdbm-compat was added<br>
&gt;&gt;&gt; to configure.<br>
&gt;&gt;&gt; The second change is because python is looking for the gdbm he=
aders in include/gdbm.<br>
&gt;&gt;&gt; The easiest way to solve this issue is to add symlinks in incl=
ude/gdbm.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [YOCTO #1937]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@ghe=
rzan.ro" target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; This breaks every package in feed which depends on old package nam=
e<br>
&gt;&gt; libgdbm4 (&gt;=3D 1.10)<br>
&gt;&gt;<br>
&gt;&gt; Because now there are 2 .so files in ${PN} and no LEAD_SONAME defi=
ned.<br>
&gt;&gt;<br>
&gt;&gt; Are you going to<br>
&gt;&gt;<br>
&gt;&gt; 1) send PR bumps to all packages which depends on libgdbm4<br>
&gt;&gt; =A0 (e.g. apr-util python pulseaudio perl gst-plugins-good and pro=
bably more)<br>
&gt;&gt; 2) define LEAD_SONAME and bump PR in gdbm recipe<br>
&gt;&gt; 3) move -compat libs to ${PN}-compat or some other package name, s=
o that<br>
&gt;&gt; =A0 old libgdbm4 still exists (and maybe + 1) because some people =
could<br>
&gt;&gt; =A0 build those with gdbm as dependency now)<br>
&gt;<br>
&gt; I like the idea of putting the compat libs into a separate package...<=
br>
<br>
</div></div>me too<br>
<br>
regards,<br>
<br>
Koen<br>
<div><div>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--f46d044288bcad928004bd5548c1--
