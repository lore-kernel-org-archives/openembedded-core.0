Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96C40797C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 13:26:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e1-v6so10611293wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 06:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nNqW6Wf/BjCtpm77+1YpcsaTB9bj8ymOIZge6ZV7MMM=;
	b=NHO5ig9HK7l4DSew6S71KRw1Kp25mCPPj8t2L5WvfsBn+Ha6OS7RoXwtv6lVjstgAB
	nf6g0MdxX/CshPkjqPpLQNmMTA3paH9tAPebHoigWi9cGBZ5O5qLKHp9r7xwh5qI8UDS
	h1xivYcLZpDBrlD0UaaZRS98gcgIZaBdmiFwsOWgKflu2A0dmE73QaQcUJ+0zN56cbIs
	ILmulIsCyls1rWZtv77rs3W2rpmRavH9NwNWEB5Bj9y1BUARnqfvQ8Xk6bhbcPUkg6TC
	gQCo8Q+rlpIXsurx3Mg4zlIiGaDf0SOA3Wf3QaYLhj5ikAvIbdQlOdeU/nCtQiaUNVLU
	saMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nNqW6Wf/BjCtpm77+1YpcsaTB9bj8ymOIZge6ZV7MMM=;
	b=qEbJCCW/39ab05zZ0xSnu9Bd0iIC8ztf9n8Cp04t+khEUtQWTd6LEtpNRlqdoUjdGr
	KlH6JNsVEsFvJMge40vYrQ1IFvf8D0XIUVfkplzHo0K3G9dmt5oSli9OEZdw+Boj7khQ
	OIAbZCec+pTIrUCQFf0dFi+julokOH2OvSVH6Qu2LN5CL90TPN7sqGg/nvhnJzCM2oRf
	fnFnrwAkkuXT4bq9L19T5FFDPjSRQys7FvHo1To8EeRKJSXUac/L+nf/tGuRC1OC4dDS
	hjrXxUdMQM/gYuFng14sDkyRbP4vk7BbiGRqtXAGvFBO7cYfTQHT+f1TPYNbRAkG/0zk
	mOIQ==
X-Gm-Message-State: APzg51CrCmaDxEE4VVXoTHecVkAlpsIv7Xl6t2DCzViFOOzuP1Vvy1wG
	tlSu1ekMEJCV0+u//q/fI3cvNbAXoJLTfqqcHORJMQ1j
X-Google-Smtp-Source: ANB0Vda3HvB3QeaWqAqXz8YKLT7mC/ueOs4CHk/KEYz74cPgUZyYw8kqcyxkzGDseVKTwpjgT5rjah2I7H0y1gHqTy8=
X-Received: by 2002:adf:f28c:: with SMTP id
	k12-v6mr10134152wro.263.1536931568083; 
	Fri, 14 Sep 2018 06:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1536130313.git.liezhi.yang@windriver.com>
	<44bc8e8162a345bc10eb206b7858fd9f2bd91881.1536130313.git.liezhi.yang@windriver.com>
In-Reply-To: <44bc8e8162a345bc10eb206b7858fd9f2bd91881.1536130313.git.liezhi.yang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 14 Sep 2018 15:25:58 +0200
Message-ID: <CA+chaQccRwckqnoA601TNz-qr5QHLw+2uCigHKTS4D2b4DP_Yg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] bitbake.conf: Make BUILD_OPTIMIZATION respect to DEBUG_BUILD
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
X-List-Received-Date: Fri, 14 Sep 2018 13:26:08 -0000
Content-Type: multipart/alternative; boundary="00000000000028e6d90575d4c4e0"

--00000000000028e6d90575d4c4e0
Content-Type: text/plain; charset="UTF-8"

This seems to cause nativesdk-glibc failures when DEBUG_BUILD is used, it
fails like this:

../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_jnl':
../sysdeps/ieee754/ldbl-96/e_jnl.c:146:20: error: 'temp' may be used
uninitialized in this function [-Werror=maybe-uninitialized]
      b = invsqrtpi * temp / sqrtl (x);
          ~~~~~~~~~~^~~~~~

the target build suffers from the same, that's why I was using this for a
while:
# glibc-2.21 fails to build with:
# iso-2022-cn-ext.c:501:4: error: 'tmpbuf' may be used uninitialized in
this function [-Werror=maybe-uninitialized]
# connections.c:1916:1: error: inlining failed in call to 'clear_db_cache':
call is unlikely and code size would grow [-Werror=inline]
# add few -Wno-error like meta/recipes-core/glibc/glibc.inc is trying to
doin get_optimization function,
# but fails because we append -Os at the end and -O2 is found first
SELECTED_OPTIMIZATION_append_pn-glibc =
"${@bb.utils.contains('TUNE_FEATURES', 'webos-minsize', '
-Wno-error=maybe-uninitialized -Wno-error=inline', '', d)}"


There is some logic in meta/recipes-core/glibc/glibc.inc to
append -Wno-error to SELECTED_OPTIMIZATION when "-O", "-O1", "-Os" is used,
but the same would be needed for BUILD_OPTIMIZATION now.

Or maybe it would be worth marking those uninitialized/unused variables
with #pragma instead of injecting -Wno-error?

Then we can get rid of:
python () {
    opt_effective = "-O"
    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
            opt_effective = opt
    if opt_effective == "-O0":
        bb.fatal("%s can't be built with %s, try -O1 instead" %
(d.getVar('PN'), opt_effective))
    if opt_effective in ("-O", "-O1", "-Os"):
        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to
SELECTED_OPTIMIZATION" % (d.getVar('PN'), opt_effective))
        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
}
from meta/recipes-core/glibc/glibc.inc (not use about -O0 case) and remove
following notes:
NOTE: glibc doesn't build cleanly with -O, adding -Wno-error to
SELECTED_OPTIMIZATION
NOTE: nativesdk-glibc doesn't build cleanly with -O, adding -Wno-error to
SELECTED_OPTIMIZATION
from every build with DEBUG_BUILD enabled.

What would be the preferred fix?

On Wed, Sep 5, 2018 at 9:05 AM Robert Yang <liezhi.yang@windriver.com>
wrote:

> We may also need debug native tools, so make BUILD_OPTIMIZATION respect to
> DEBUG_BUILD, otherwise, we need set CFLAGS in the recipe which isn't
> convenient.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index dbadeb3..93aee1a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -612,7 +612,7 @@ FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
>  DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
>  SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD',
> 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>  SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
> -BUILD_OPTIMIZATION = "-O2 -pipe"
> +BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g
> -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pipe"
>
>  ##################################################################
>  # Settings used by bitbake-layers.
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000028e6d90575d4c4e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r">This seems to cause nativesdk-glibc failures when DEBUG_BUILD is used, i=
t fails like this:<div><br></div><div><div>../sysdeps/ieee754/ldbl-96/e_jnl=
.c: In function &#39;__ieee754_jnl&#39;:</div><div>../sysdeps/ieee754/ldbl-=
96/e_jnl.c:146:20: error: &#39;temp&#39; may be used uninitialized in this =
function [-Werror=3Dmaybe-uninitialized]</div><div>=C2=A0 =C2=A0 =C2=A0 b =
=3D invsqrtpi * temp / sqrtl (x);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ~~~~~~~~~~^~~~~~</div></div><div><br></div><div>the target build suffer=
s from the same, that&#39;s why I was using this for a while:</div><div><di=
v># glibc-2.21 fails to build with:</div><div># iso-2022-cn-ext.c:501:4: er=
ror: &#39;tmpbuf&#39; may be used uninitialized in this function [-Werror=
=3Dmaybe-uninitialized]</div><div># connections.c:1916:1: error: inlining f=
ailed in call to &#39;clear_db_cache&#39;: call is unlikely and code size w=
ould grow [-Werror=3Dinline]</div><div># add few -Wno-error like meta/recip=
es-core/glibc/glibc.inc is trying to doin get_optimization function,</div><=
div># but fails because we append -Os at the end and -O2 is found first</di=
v><div>SELECTED_OPTIMIZATION_append_pn-glibc =3D &quot;${@bb.utils.contains=
(&#39;TUNE_FEATURES&#39;, &#39;webos-minsize&#39;, &#39; -Wno-error=3Dmaybe=
-uninitialized -Wno-error=3Dinline&#39;, &#39;&#39;, d)}&quot;</div></div><=
div><br></div><div><br></div><div>There is some logic in=C2=A0meta/recipes-=
core/glibc/glibc.inc to append=C2=A0-Wno-error to=C2=A0SELECTED_OPTIMIZATIO=
N when=C2=A0&quot;-O&quot;, &quot;-O1&quot;, &quot;-Os&quot; is used, but t=
he same would be needed for BUILD_OPTIMIZATION now.</div><div><br></div><di=
v>Or maybe it would be worth marking those uninitialized/unused variables w=
ith #pragma instead of injecting -Wno-error?</div><div><br></div><div>Then =
we can get rid of:</div><div><div>python () {</div><div>=C2=A0 =C2=A0 opt_e=
ffective =3D &quot;-O&quot;</div><div>=C2=A0 =C2=A0 for opt in d.getVar(&#3=
9;SELECTED_OPTIMIZATION&#39;).split():</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if opt in (&quot;-O0&quot;, &quot;-O&quot;, &quot;-O1&quot;, &quot;-O2&=
quot;, &quot;-O3&quot;, &quot;-Os&quot;):</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 opt_effective =3D opt</div><div>=C2=A0 =C2=A0 if opt_e=
ffective =3D=3D &quot;-O0&quot;:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.f=
atal(&quot;%s can&#39;t be built with %s, try -O1 instead&quot; % (d.getVar=
(&#39;PN&#39;), opt_effective))</div><div>=C2=A0 =C2=A0 if opt_effective in=
 (&quot;-O&quot;, &quot;-O1&quot;, &quot;-Os&quot;):</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bb.note(&quot;%s doesn&#39;t build cleanly with %s, addin=
g -Wno-error to SELECTED_OPTIMIZATION&quot; % (d.getVar(&#39;PN&#39;), opt_=
effective))</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&quot;SELECTE=
D_OPTIMIZATION&quot;, &quot; -Wno-error&quot;)</div><div>}</div></div><div>=
from meta/recipes-core/glibc/glibc.inc (not use about -O0 case) and remove =
following notes:<br></div><div><div>NOTE: glibc doesn&#39;t build cleanly w=
ith -O, adding -Wno-error to SELECTED_OPTIMIZATION</div><div>NOTE: nativesd=
k-glibc doesn&#39;t build cleanly with -O, adding -Wno-error to SELECTED_OP=
TIMIZATION</div></div><div>from every build with DEBUG_BUILD enabled.</div>=
<div><br></div><div>What would be the preferred fix?</div></div></div></div=
></div></div></div></div></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Wed, Sep 5, 2018 at 9:05 AM Robert Yang &lt;<a href=3D"mailto:=
liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">We may also need debug native tools, so ma=
ke BUILD_OPTIMIZATION respect to<br>
DEBUG_BUILD, otherwise, we need set CFLAGS in the recipe which isn&#39;t<br=
>
convenient.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index dbadeb3..93aee1a 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -612,7 +612,7 @@ FULL_OPTIMIZATION =3D &quot;-O2 -pipe ${DEBUG_FLAGS}&qu=
ot;<br>
=C2=A0DEBUG_OPTIMIZATION =3D &quot;-O -fno-omit-frame-pointer ${DEBUG_FLAGS=
} -pipe&quot;<br>
=C2=A0SELECTED_OPTIMIZATION =3D &quot;${@d.getVar(oe.utils.vartrue(&#39;DEB=
UG_BUILD&#39;, &#39;DEBUG_OPTIMIZATION&#39;, &#39;FULL_OPTIMIZATION&#39;, d=
))}&quot;<br>
=C2=A0SELECTED_OPTIMIZATION[vardeps] +=3D &quot;FULL_OPTIMIZATION DEBUG_OPT=
IMIZATION&quot;<br>
-BUILD_OPTIMIZATION =3D &quot;-O2 -pipe&quot;<br>
+BUILD_OPTIMIZATION =3D &quot;${@oe.utils.vartrue(&#39;DEBUG_BUILD&#39;, &#=
39;-O -g -feliminate-unused-debug-types -fno-omit-frame-pointer&#39;, &#39;=
-O2&#39;, d)} -pipe&quot;<br>
<br>
=C2=A0##################################################################<br=
>
=C2=A0# Settings used by bitbake-layers.<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000028e6d90575d4c4e0--
