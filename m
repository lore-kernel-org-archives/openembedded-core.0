Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.5297.1620859022735362523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 15:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WSqwhvlk;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id v5so17827254edc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 15:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n1CeGEKfmfAuN7+SnbWkGjzE82fuK7iKpZ0ulj07Crk=;
        b=WSqwhvlkiLeNoD0xrsJ3xZZbb5MPS07MO6MIZhru6lf1dqv7O3WbGdh/y3leGkbvdM
         /9cyP5qMUmhD82hDh/95rPLGYjk4TOz2xj8TTiLy2/pzROa/l3bkbDQe3LKBeYNAfOjF
         RspvMbGly9AXFGjSz79TR/rGB3HOkukNSCB8gIgx0QYlnCdcsdASEcTd62XIpIDWem7l
         XdCiWZX29gmwf9WSG87NRiXJruiao01Xi2GJp7DeHxUIrHnkfa0f44f8jxn7nlFIQvzi
         uknOLPUoM6IlYQl7r/uP9YGCZFx0L2SmG4sQ4DEv0Ejlu6UtVtNbwH18lstLq4hzj7Zi
         1ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n1CeGEKfmfAuN7+SnbWkGjzE82fuK7iKpZ0ulj07Crk=;
        b=FpyZ/zAqITdYlAnys7LJuPqbB4e6Uij/1dGrHgZRHT7SUjL4gRmW4WarExAY8BI1xy
         RjD33OqRhQX6iNbN5hTRNSqdpQ27D21jZudmfT0SW8q/1vRpxgNMTB1DFFUFxOA2do+O
         Ek6EeuCJygOa5h49qdZ1fDm5rPwRER5nQgIPdwUx6KhP5WMIxP5hKb3aGUqNa+38ZI68
         O+lXrIY6GOhRcrrNjqGREqiwOjBzVCwJXOzxLXtVMhPfliAYy0Y/TWw4TfNIjJvAlKfi
         aGCj5YQr6N8Sta+dlojdW3/6hWlRjxgWRnJSpOGoPvypRBqInZEUSFJRjPgWktLt/H8+
         pNGg==
X-Gm-Message-State: AOAM531M+kW475W2PY1i1LjtifOrvloSHaQYpe290F96iSe9OF2dbvou
	g1g18Ve6gF69wB3qWEAWkW7UF8UcSKJitTGS2sE=
X-Google-Smtp-Source: ABdhPJyUW4YgMaBMbCEH4Wr7AB6x8NGnT+Hg6EQO/5t6qS9zUb6eEwM/5JstnEnUP/jRzsd/4UMvmxDpDOZwPmGssE4=
X-Received: by 2002:aa7:c349:: with SMTP id j9mr45432617edr.230.1620859021128;
 Wed, 12 May 2021 15:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com> <20210505151850.660512-24-alex.kanavin@gmail.com>
In-Reply-To: <20210505151850.660512-24-alex.kanavin@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 13 May 2021 00:36:50 +0200
Message-ID: <CA+chaQfQBUphmMXsbOmM4Z82D75hZQUQMPMzKAzCctYudqAq6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/61] webkitgtk: update 2.30.6 -> 2.32.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002f77d405c229a6ef"

--0000000000002f77d405c229a6ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021 at 5:20 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Drop 0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
> (merged upstream).
>
> Rebase other patches.
>

This version fails to build in default oe-core setup (with x11 and without
opengl in DISTRO_FEATURES), see:
http://errors.yoctoproject.org/Errors/Details/581086/

In file included from
TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.32.0-r0/webkitgtk-2.32.=
0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinat=
edGraphics.cpp:32,
                 from
DerivedSources/WebKit/unified-sources/UnifiedSource-54928a2b-35.cpp:5:
TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.32.0-r0/webkitgtk-2.32.=
0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:216:=
13:
error: no declaration matches 'bool
WebKit::LayerTreeHost::forceRepaintAsync(WTF::CompletionHandler<void()>&)'
  216 | inline bool
LayerTreeHost::forceRepaintAsync(CompletionHandler<void()>&) { return
false; }
      |             ^~~~~~~~~~~~~
TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.32.0-r0/webkitgtk-2.32.=
0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:82:1=
0:
note: candidate is: 'void
WebKit::LayerTreeHost::forceRepaintAsync(WTF::CompletionHandler<void()>&&)'
   82 |     void forceRepaintAsync(CompletionHandler<void()>&&);
      |          ^~~~~~~~~~~~~~~~~
TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.32.0-r0/webkitgtk-2.32.=
0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:61:7=
:
note: 'class WebKit::LayerTreeHost' defined here
   61 | class LayerTreeHost
      |       ^~~~~~~~~~~~~

This upstream change should probably fix that:

commit 834f335bb3e63e0bf78eed0520df33d5c55e5e8a
Author: commit-queue@webkit.org <commit-queue@webkit.org
@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
Date:   Sat Apr 10 22:02:50 2021 +0000

    Properly use CompletionHandler when USE_OPENGL_OR_ES is set to OFF
    https://bugs.webkit.org/show_bug.cgi?id=3D224149

    Patch by Charl=C3=A8ne Wendling <julianaito@posteo.jp> on 2021-04-10
    Reviewed by Fujii Hironori.

    * WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:
    (WebKit::LayerTreeHost::forceRepaintAsync):

    git-svn-id: http://svn.webkit.org/repository/webkit/trunk@275802
268f45cc-cd09-0410-ab3c-d52691b4dbfc

There is 2.32.1 which might contain this fix but it's not explicitly
mentioned in https://webkitgtk.org/2021/05/10/webkitgtk2.32.1-released.html

--0000000000002f77d405c229a6ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>On Wed, May 5, 2021 at 5:20 PM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Drop 0001-Extend-atomics-check-to-in=
clude-1-byte-CAS-test.patch<br>
(merged upstream).<br>
<br>
Rebase other patches.<br></blockquote><div><br></div>This version fails to =
build in default oe-core setup (with x11 and without opengl in DISTRO_FEATU=
RES), see:<div><a href=3D"http://errors.yoctoproject.org/Errors/Details/581=
086/">http://errors.yoctoproject.org/Errors/Details/581086/</a><br></div><d=
iv><br></div><div>In file included from TOPDIR/tmp-glibc/work/core2-64-oe-l=
inux/webkitgtk/2.32.0-r0/webkitgtk-2.32.0/Source/WebKit/WebProcess/WebPage/=
CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp:32,<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from DerivedSources/WebKit=
/unified-sources/UnifiedSource-54928a2b-35.cpp:5:<br>TOPDIR/tmp-glibc/work/=
core2-64-oe-linux/webkitgtk/2.32.0-r0/webkitgtk-2.32.0/Source/WebKit/WebPro=
cess/WebPage/CoordinatedGraphics/LayerTreeHost.h:216:13: error: no declarat=
ion matches &#39;bool WebKit::LayerTreeHost::forceRepaintAsync(WTF::Complet=
ionHandler&lt;void()&gt;&amp;)&#39;<br>=C2=A0 216 | inline bool LayerTreeHo=
st::forceRepaintAsync(CompletionHandler&lt;void()&gt;&amp;) { return false;=
 }<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~=
~~~~~~~~~<br>TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.32.0-r0/we=
bkitgtk-2.32.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTr=
eeHost.h:82:10: note: candidate is: &#39;void WebKit::LayerTreeHost::forceR=
epaintAsync(WTF::CompletionHandler&lt;void()&gt;&amp;&amp;)&#39;<br>=C2=A0 =
=C2=A082 | =C2=A0 =C2=A0 void forceRepaintAsync(CompletionHandler&lt;void()=
&gt;&amp;&amp;);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~~~~~~~~~~<br>TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2=
.32.0-r0/webkitgtk-2.32.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraph=
ics/LayerTreeHost.h:61:7: note: &#39;class WebKit::LayerTreeHost&#39; defin=
ed here<br>=C2=A0 =C2=A061 | class LayerTreeHost<br></div><div>=C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~</div><div><br></div><div>Th=
is upstream change should probably fix that:</div><div><br></div><div>commi=
t 834f335bb3e63e0bf78eed0520df33d5c55e5e8a<br>Author: <a href=3D"mailto:com=
mit-queue@webkit.org">commit-queue@webkit.org</a> &lt;commit-queue@webkit.o=
rg@268f45cc-cd09-0410-ab3c-d52691b4dbfc&gt;<br>Date: =C2=A0 Sat Apr 10 22:0=
2:50 2021 +0000<br><br>=C2=A0 =C2=A0 Properly use CompletionHandler when US=
E_OPENGL_OR_ES is set to OFF<br>=C2=A0 =C2=A0 <a href=3D"https://bugs.webki=
t.org/show_bug.cgi?id=3D224149">https://bugs.webkit.org/show_bug.cgi?id=3D2=
24149</a><br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Patch by Charl=C3=A8ne Wendlin=
g &lt;<a href=3D"mailto:julianaito@posteo.jp">julianaito@posteo.jp</a>&gt; =
on 2021-04-10<br>=C2=A0 =C2=A0 Reviewed by Fujii Hironori.<br>=C2=A0 =C2=A0=
 <br>=C2=A0 =C2=A0 * WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h=
:<br>=C2=A0 =C2=A0 (WebKit::LayerTreeHost::forceRepaintAsync):<br>=C2=A0 =
=C2=A0 <br>=C2=A0 =C2=A0 git-svn-id: <a href=3D"http://svn.webkit.org/repos=
itory/webkit/trunk@275802">http://svn.webkit.org/repository/webkit/trunk@27=
5802</a> 268f45cc-cd09-0410-ab3c-d52691b4dbfc<br></div><div><br></div><div>=
There is 2.32.1 which might contain this fix but it&#39;s not explicitly me=
ntioned in <a href=3D"https://webkitgtk.org/2021/05/10/webkitgtk2.32.1-rele=
ased.html">https://webkitgtk.org/2021/05/10/webkitgtk2.32.1-released.html</=
a></div></div></div>

--0000000000002f77d405c229a6ef--
