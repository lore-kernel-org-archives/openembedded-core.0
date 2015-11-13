Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B4647772E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 12:11:55 +0000 (UTC)
Received: by wmww144 with SMTP id w144so26082571wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=53C6crLtozIQeThv6oK4TptoqtLUCdcLnbBlXCwh16g=;
	b=TMSqliohxHMaJgGbkkHDmyOcppM3F8D3ifjkYy+M5uoW5lKB0TYb3tKZLveqW5LQn2
	rnJt/I8cMRmWgikagpqo/WJnUWKLWhiy6gjHs9LHFiCC+SvxFYZFDuoi29YzwOZCDpnj
	yXhUtTvU1VXvUFnD2e1EXsLMCciousSQsvB6I+1fO4U+HPOqh7/cofDb1KjKtGiuqCLZ
	84EO19nvj9NBNEdFYa+9ipE4Sp+V85HOq6tP1206Qt0TdZ8BApbPNfYHg9gHQNffgs5J
	X44WBbvOsDxIrNOPStRbz0UppGHJk23cnUW2YlapiWrsaQWIUKUC0m+N/7y6gpZWmv/y
	zCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=53C6crLtozIQeThv6oK4TptoqtLUCdcLnbBlXCwh16g=;
	b=kULqxu38qiaJudhBow//V0dKK0o92k1QLU7Fm6l+tMPG+3bkmFyaqkS0mDdXHjhs/O
	fqM8inJRbQi0xmUHUoP/+tohsGz8PIrtI/bSa4OIsNCKcfz7NAWGTTBbzazoCld/P1jH
	f4rTg0dfHLYWn4u7/JmM6/Af2zPpw/h8gjVbY4FL7KDDfLWcTA+pMkYWbRxodZmSKHQq
	Y8Ey2jZi0SyZ1JmCpB5wjZtXQU2LhjMyFJ5Y3dIHYDFGGUDg9e+XHehYVOSB4M7PAr3o
	gJe4Clo+OtWUqszjpht4JfdB9T29OJ0gvfFL6Rt5l7GiMb42ndM5LHvpL3LpZ16WmdoD
	OOsA==
X-Gm-Message-State: ALoCoQnTygNfQvY3jPrjA242/8r7IZstDRUV06r8sV8M8jCq6AOPW3HJbTJlDzcbaF+E14LQ7huk
X-Received: by 10.194.105.38 with SMTP id gj6mr21168761wjb.130.1447416715102; 
	Fri, 13 Nov 2015 04:11:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.216.207 with HTTP; Fri, 13 Nov 2015 04:11:25 -0800 (PST)
In-Reply-To: <5c711f4f61c7a1481e415ec45290301141d45b48.1447412835.git.hongxu.jia@windriver.com>
References: <cover.1447412835.git.hongxu.jia@windriver.com>
	<5c711f4f61c7a1481e415ec45290301141d45b48.1447412835.git.hongxu.jia@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 13 Nov 2015 14:11:25 +0200
Message-ID: <CAHiDW_HddeP2fLOCBWSG7=cfS0Zuaoh0gnW3nBpLTtjH62huRA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] wpa-supplicant: Fix CVE-2015-8041
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
X-List-Received-Date: Fri, 13 Nov 2015 12:11:56 -0000
Content-Type: multipart/alternative; boundary=001a1130cd46256c8905246af7a3

--001a1130cd46256c8905246af7a3
Content-Type: text/plain; charset=UTF-8

On 13 November 2015 at 13:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Backport patch from http://w1.fi/security/2015-5/
> and rebase for wpa-supplicant 2.4


There's a thread about upgrading master to 2.5 (which should fix this)
already.

The patch probably still makes sense for jethro though.

 - Jussi



>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...load-length-validation-in-NDEF-record-par.patch | 64
> ++++++++++++++++++++++
>  .../wpa-supplicant/wpa-supplicant_2.4.bb           |  1 +
>  2 files changed, 65 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
>
> diff --git
> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
> new file mode 100644
> index 0000000..bc1d1e5
> --- /dev/null
> +++
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
> @@ -0,0 +1,64 @@
> +From c13401c723a039971bcd91b3856d76c6041b15f2 Mon Sep 17 00:00:00 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Fri, 13 Nov 2015 05:54:18 -0500
> +Subject: [PATCH] NFC: Fix payload length validation in NDEF record parser
> +
> +It was possible for the 32-bit record->total_length value to end up
> +wrapping around due to integer overflow if the longer form of payload
> +length field is used and record->payload_length gets a value close to
> +2^32. This could result in ndef_parse_record() accepting a too large
> +payload length value and the record type filter reading up to about 20
> +bytes beyond the end of the buffer and potentially killing the process.
> +This could also result in an attempt to allocate close to 2^32 bytes of
> +heap memory and if that were to succeed, a buffer read overflow of the
> +same length which would most likely result in the process termination.
> +In case of record->total_length ending up getting the value 0, there
> +would be no buffer read overflow, but record parsing would result in an
> +infinite loop in ndef_parse_records().
> +
> +Any of these error cases could potentially be used for denial of service
> +attacks over NFC by using a malformed NDEF record on an NFC Tag or
> +sending them during NFC connection handover if the application providing
> +the NDEF message to hostapd/wpa_supplicant did no validation of the
> +received records. While such validation is likely done in the NFC stack
> +that needs to parse the NFC messages before further processing,
> +hostapd/wpa_supplicant better be prepared for any data being included
> +here.
> +
> +Fix this by validating record->payload_length value in a way that
> +detects integer overflow. (CID 122668)
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +Upstream-Status: Backport [from http://w1.fi/security/2015-5/]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/wps/ndef.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/wps/ndef.c b/src/wps/ndef.c
> +index d45dfc8..f7f729b 100644
> +--- a/src/wps/ndef.c
> ++++ b/src/wps/ndef.c
> +@@ -48,6 +48,8 @@ static int ndef_parse_record(const u8 *data, u32 size,
> +               if (size < 6)
> +                       return -1;
> +               record->payload_length = ntohl(*(u32 *)pos);
> ++                if (record->payload_length > size - 6)
> ++                       return -1;
> +               pos += sizeof(u32);
> +       }
> +
> +@@ -68,7 +70,8 @@ static int ndef_parse_record(const u8 *data, u32 size,
> +       pos += record->payload_length;
> +
> +       record->total_length = pos - data;
> +-      if (record->total_length > size)
> ++      if (record->total_length > size ||
> ++          record->total_length < record->payload_length)
> +               return -1;
> +       return 0;
> + }
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-connectivity/wpa-supplicant/
> wpa-supplicant_2.4.bb b/meta/recipes-connectivity/wpa-supplicant/
> wpa-supplicant_2.4.bb
> index a124cf2..6e4d028 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
> @@ -32,6 +32,7 @@ SRC_URI = "
> http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
>
> file://0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch \
>
> file://0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch \
>
> file://0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch \
> +
>  file://0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch \
>            "
>  SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"
>  SRC_URI[sha256sum] =
> "058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1130cd46256c8905246af7a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 November 2015 at 13:08, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Backport patch from <a =
href=3D"http://w1.fi/security/2015-5/" rel=3D"noreferrer" target=3D"_blank"=
>http://w1.fi/security/2015-5/</a><br>
and rebase for wpa-supplicant 2.4</blockquote><div><br></div><div>There&#39=
;s a thread about upgrading master to 2.5 (which should fix this) already.<=
/div><div>=C2=A0</div><div>The patch probably still makes sense for jethro =
though.</div><div><br></div><div>=C2=A0- Jussi</div><div><br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">=C2=A0<br></blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0...load-length-validation-in-NDEF-record-par.patch |=
 64 ++++++++++++++++++++++<br>
=C2=A0.../wpa-supplicant/<a href=3D"http://wpa-supplicant_2.4.bb" rel=3D"no=
referrer" target=3D"_blank">wpa-supplicant_2.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 65 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppl=
icant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch<br>
<br>
</span>diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant=
/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch b/meta/rec=
ipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length=
-validation-in-NDEF-record-par.patch<br>
new file mode 100644<br>
index 0000000..bc1d1e5<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-=
payload-length-validation-in-NDEF-record-par.patch<br>
@@ -0,0 +1,64 @@<br>
+From c13401c723a039971bcd91b3856d76c6041b15f2 Mon Sep 17 00:00:00 2001<br>
+From: Jouni Malinen &lt;<a href=3D"mailto:j@w1.fi">j@w1.fi</a>&gt;<br>
+Date: Fri, 13 Nov 2015 05:54:18 -0500<br>
+Subject: [PATCH] NFC: Fix payload length validation in NDEF record parser<=
br>
+<br>
+It was possible for the 32-bit record-&gt;total_length value to end up<br>
+wrapping around due to integer overflow if the longer form of payload<br>
+length field is used and record-&gt;payload_length gets a value close to<b=
r>
+2^32. This could result in ndef_parse_record() accepting a too large<br>
+payload length value and the record type filter reading up to about 20<br>
+bytes beyond the end of the buffer and potentially killing the process.<br=
>
+This could also result in an attempt to allocate close to 2^32 bytes of<br=
>
+heap memory and if that were to succeed, a buffer read overflow of the<br>
+same length which would most likely result in the process termination.<br>
+In case of record-&gt;total_length ending up getting the value 0, there<br=
>
+would be no buffer read overflow, but record parsing would result in an<br=
>
+infinite loop in ndef_parse_records().<br>
+<br>
+Any of these error cases could potentially be used for denial of service<b=
r>
+attacks over NFC by using a malformed NDEF record on an NFC Tag or<br>
+sending them during NFC connection handover if the application providing<b=
r>
+the NDEF message to hostapd/wpa_supplicant did no validation of the<br>
+received records. While such validation is likely done in the NFC stack<br=
>
+that needs to parse the NFC messages before further processing,<br>
+hostapd/wpa_supplicant better be prepared for any data being included<br>
+here.<br>
+<br>
+Fix this by validating record-&gt;payload_length value in a way that<br>
+detects integer overflow. (CID 122668)<br>
+<br>
+Signed-off-by: Jouni Malinen &lt;<a href=3D"mailto:j@w1.fi">j@w1.fi</a>&gt=
;<br>
+<br>
+Upstream-Status: Backport [from <a href=3D"http://w1.fi/security/2015-5/" =
rel=3D"noreferrer" target=3D"_blank">http://w1.fi/security/2015-5/</a>]<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ src/wps/ndef.c | 5 ++++-<br>
+ 1 file changed, 4 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/wps/ndef.c b/src/wps/ndef.c<br>
+index d45dfc8..f7f729b 100644<br>
+--- a/src/wps/ndef.c<br>
++++ b/src/wps/ndef.c<br>
+@@ -48,6 +48,8 @@ static int ndef_parse_record(const u8 *data, u32 size,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size &lt; 6)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0record-&gt;payload_=
length =3D ntohl(*(u32 *)pos);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (record-&gt;pa=
yload_length &gt; size - 6)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos +=3D sizeof(u32=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+@@ -68,7 +70,8 @@ static int ndef_parse_record(const u8 *data, u32 size,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pos +=3D record-&gt;payload_length;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0record-&gt;total_length =3D pos - data;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (record-&gt;total_length &gt; size)<br>
++=C2=A0 =C2=A0 =C2=A0 if (record-&gt;total_length &gt; size ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 record-&gt;total_length &lt; record-&g=
t;payload_length)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-connectivity/wpa-supplicant/<a href=3D"http://wpa=
-supplicant_2.4.bb" rel=3D"noreferrer" target=3D"_blank">wpa-supplicant_2.4=
.bb</a> b/meta/recipes-connectivity/wpa-supplicant/<a href=3D"http://wpa-su=
pplicant_2.4.bb" rel=3D"noreferrer" target=3D"_blank">wpa-supplicant_2.4.bb=
</a><br>
index a124cf2..6e4d028 100644<br>
--- a/meta/recipes-connectivity/wpa-supplicant/<a href=3D"http://wpa-suppli=
cant_2.4.bb" rel=3D"noreferrer" target=3D"_blank">wpa-supplicant_2.4.bb</a>=
<br>
+++ b/meta/recipes-connectivity/wpa-supplicant/<a href=3D"http://wpa-suppli=
cant_2.4.bb" rel=3D"noreferrer" target=3D"_blank">wpa-supplicant_2.4.bb</a>=
<br>
@@ -32,6 +32,7 @@ SRC_URI =3D &quot;<a href=3D"http://hostap.epitest.fi/rel=
eases/wpa_supplicant-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">htt=
p://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-EAP-pwd-peer-Fix-Tota=
l-Length-parsing-for-fragment-r.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-EAP-pwd-server-Fix-To=
tal-Length-parsing-for-fragment.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-EAP-pwd-peer-Fix-asym=
metric-fragmentation-behavior.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-NFC-Fix-payload-lengt=
h-validation-in-NDEF-record-par.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;f0037dbe03897dcaf2ad2722e659095d&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;058dc832c096139a059e6df814080f50251a8d31=
3c21b13364c54a1e70109122&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div></div>

--001a1130cd46256c8905246af7a3--
