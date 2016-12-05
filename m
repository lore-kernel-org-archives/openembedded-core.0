Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 29B58607A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 10:56:50 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id c47so309795674qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 02:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9oIApOOzeG43IudO0clNo9kWID75k0Ytemrm957W++E=;
	b=gwv0RjfrzFGHvAS9/q+snZKBcDpx/Zia6diREuRasrYGWcGQMxu9t1doXhFJ2QVPsG
	c4iBToX02ma55BEGv5wmQfQXTd+0m386R3HzBBGUy1PW7zt0+C87kEmKzmxDyqiI79yB
	7gdI3WAkTumQbIhsdZSP7gZS4qCFmHDn2i1d5LEFbz4X/QcjB4OrzUqn17lijPpz1+qh
	zDmNWvJkkNaZRXpNQdH3awjd9t2oZe5YLvEzVvs6CBghMkGzpRhQ9c/QSqUM7P7vt7Qy
	hoYD6ofZNM18Q0NWuJ71cJdv5ECkdm/Lty3PwvsF2agobZamISiXEkAGIHwuk00XxLsO
	smew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9oIApOOzeG43IudO0clNo9kWID75k0Ytemrm957W++E=;
	b=mFDJbt0De0xcy9igHa1Or86ST8rNCaVFmeLlYYrEgFvzDORhWH4zwmALNVLUywxXwF
	C/bFlmKZ/3465w5aOFtdnLmqoqR9yHsUkkz0wG/qUAOW79U2tM66hDd6MoYARLycCpT1
	xrHqKwFzJ0HV93vJSa2cNTkNNU9BidXkQftom3HikNofJ9a0wy7YRz8si6uxWHJwo3re
	+qAEbdp+XkVWvpyNZMwVLySSYYmvEYuRnWOf0ts16PNf/UvgSfjkMgxIe9Ur3AydOa3a
	Kj7kmY71euYppUoouENEFa/jJ5lzn8ap4d/E6TwcqKbUp0uSIC5HfInOslAEG3tQjPSl
	hTrQ==
X-Gm-Message-State: AKaTC02aMx5XOwqkLoabNCiWw4tguOWsaz8Dq6epQ/iPa3zxflVJ98YxAcbb2EnuQMp9O6oRG5BN3kl+EwWWC+v/
X-Received: by 10.237.34.46 with SMTP id n43mr54240384qtc.105.1480935412116;
	Mon, 05 Dec 2016 02:56:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 5 Dec 2016 02:56:31 -0800 (PST)
In-Reply-To: <1478592704-10596-1-git-send-email-ed.bartosh@linux.intel.com>
References: <CAJTo0LbZ=dQWK7XyUOz5My8iKje8DYgCMmkLPCTXeEicWoj9xg@mail.gmail.com>
	<1478592704-10596-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Dec 2016 10:56:31 +0000
Message-ID: <CAJTo0LaODS73GuCL0z9Sz49EnQ5GiZF6FdJ+KHOUiCdfEhZJfQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] uninative: rebuild uninative for gcc 4.8 and 4.9
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
X-List-Received-Date: Mon, 05 Dec 2016 10:56:51 -0000
Content-Type: multipart/alternative; boundary=001a11377e182cc30f0542e7257f

--001a11377e182cc30f0542e7257f
Content-Type: text/plain; charset=UTF-8

This fails on the AB when generating a eSDK, eg
http://errors.yoctoproject.org/Errors/Details/110635/

I suspect the cause is that the sstate is generated using the (eg)
universal-4.9 name, but populate_sdk_ext still uses just "universal" when
creating a mirror of the sstate archive.

Ross

On 8 November 2016 at 08:11, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> Some c++ libraries fail to build if uninative is built
> with gcc 5.x and host gcc version is either 4.8 or 4.9.
>
> The issue should be solved by making separate uninative sstate
> directory structure sstate-cache/universal-<gcc version> for host gcc
> versions 4.8 and 4.9. This causes rebuilds of uninative if host gcc
> is either 4.8 or 4.9 and it doesn't match gcc version used to build
> uninative.
>
> [YOCTO #10441]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/uninative.bbclass | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.
> bbclass
> index 89cec07..3862b31 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -95,11 +95,25 @@ python uninative_event_enable() {
>      enable_uninative(d)
>  }
>
> +def gcc_version(d):
> +    compiler = d.getVar("BUILD_CC", True)
> +    retval, output = oe.utils.getstatusoutput("%s --version" % compiler)
> +    if retval:
> +        bb.fatal("Error running %s --version: %s" % (compiler, output))
> +
> +    import re
> +    match = re.match(".* (\d\.\d)\.\d.*", output.split('\n')[0])
> +    if not match:
> +        bb.fatal("Can't get compiler version from %s --version output" %
> compiler)
> +
> +    version = match.group(1)
> +    return "-%s" % version if version in ("4.8", "4.9") else ""
> +
>  def enable_uninative(d):
>      loader = d.getVar("UNINATIVE_LOADER", True)
>      if os.path.exists(loader):
>          bb.debug(2, "Enabling uninative")
> -        d.setVar("NATIVELSBSTRING", "universal")
> +        d.setVar("NATIVELSBSTRING", "universal%s" % gcc_version(d))
>          d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
>          d.prependVar("PATH", "${STAGING_DIR}-uninative/${
> BUILD_ARCH}-linux${bindir_native}:")
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11377e182cc30f0542e7257f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails on the AB when generating a eSDK, eg=C2=A0<a hr=
ef=3D"http://errors.yoctoproject.org/Errors/Details/110635/">http://errors.=
yoctoproject.org/Errors/Details/110635/</a><div><br></div><div>I suspect th=
e cause is that the sstate is generated using the (eg) universal-4.9 name, =
but populate_sdk_ext still uses just &quot;universal&quot; when creating a =
mirror of the sstate archive.</div><div><br></div><div>Ross</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 8 November 2016 at=
 08:11, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailto:ed.bartosh@linux=
.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">Some c++ libraries f=
ail to build if uninative is built<br>
with gcc 5.x and host gcc version is either 4.8 or 4.9.<br>
<br>
The issue should be solved by making separate uninative sstate<br>
directory structure sstate-cache/universal-&lt;gcc version&gt; for host gcc=
<br>
versions 4.8 and 4.9. This causes rebuilds of uninative if host gcc<br>
is either 4.8 or 4.9 and it doesn&#39;t match gcc version used to build<br>
uninative.<br>
<br>
[YOCTO #10441]<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/uninative.bbclass | 16 +++++++++++++++-<br>
=C2=A01 file changed, 15 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/uninative.<wbr>bbclass b/meta/classes/uninative.<=
wbr>bbclass<br>
</span>index 89cec07..3862b31 100644<br>
<span class=3D"">--- a/meta/classes/uninative.<wbr>bbclass<br>
+++ b/meta/classes/uninative.<wbr>bbclass<br>
@@ -95,11 +95,25 @@ python uninative_event_enable() {<br>
=C2=A0 =C2=A0 =C2=A0enable_uninative(d)<br>
=C2=A0}<br>
<br>
+def gcc_version(d):<br>
+=C2=A0 =C2=A0 compiler =3D d.getVar(&quot;BUILD_CC&quot;, True)<br>
+=C2=A0 =C2=A0 retval, output =3D oe.utils.getstatusoutput(&quot;%s --versi=
on&quot; % compiler)<br>
+=C2=A0 =C2=A0 if retval:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Error running %s --version: %s&=
quot; % (compiler, output))<br>
+<br>
+=C2=A0 =C2=A0 import re<br>
</span>+=C2=A0 =C2=A0 match =3D re.match(&quot;.* (\d\.\d)\.\d.*&quot;, out=
put.split(&#39;\n&#39;)[0])<br>
<div class=3D"HOEnZb"><div class=3D"h5">+=C2=A0 =C2=A0 if not match:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Can&#39;t get compiler version =
from %s --version output&quot; % compiler)<br>
+<br>
+=C2=A0 =C2=A0 version =3D match.group(1)<br>
+=C2=A0 =C2=A0 return &quot;-%s&quot; % version if version in (&quot;4.8&qu=
ot;, &quot;4.9&quot;) else &quot;&quot;<br>
+<br>
=C2=A0def enable_uninative(d):<br>
=C2=A0 =C2=A0 =C2=A0loader =3D d.getVar(&quot;UNINATIVE_LOADER&quot;, True)=
<br>
=C2=A0 =C2=A0 =C2=A0if os.path.exists(loader):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(2, &quot;Enabling uninative&quot=
;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;NATIVELSBSTRING&quot;, &quot;un=
iversal&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;NATIVELSBSTRING&quot;, &quot;un=
iversal%s&quot; % gcc_version(d))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;<wbr>SSTATEPOSTUNPACKFU=
NCS&quot;, &quot; uninative_changeinterp&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.prependVar(&quot;PATH&quot;, &quot;${ST=
AGING_DIR}-uninative/${<wbr>BUILD_ARCH}-linux${bindir_<wbr>native}:&quot;)<=
br>
<br>
--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11377e182cc30f0542e7257f--
