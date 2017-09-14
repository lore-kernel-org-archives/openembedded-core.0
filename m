Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id BC4CB781F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:13:05 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id c19so141814vke.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ehDhGT2UJhTOcLSXIFDil1byE8CDJZyrtNTCY9EenVQ=;
	b=mLBPtLE49gg7gmvg5QH7Q1jd9ayrxpAThM6W+uxXZeVpH/Kcss21vdkKjbTp/Nu1ag
	n5SL4H9v53aQVPl20ySY+trmHnK7WQI1aM03JdSArf83rcvxfeY5W+INpb04/+A5au5q
	o2CXx+Um8rKoItmrN86lm70AK8Q2tinBrFhkrduF9SEs7GeiiDomR3Im+DPqLkKIha2j
	C9TVha6J6sZ/TmpWMaBq4rIjBkn5Vn/o/R51NNi/MnsZ/n0P1JCz8KjLCFvz4AbT7U7k
	RoFA2KgAU3Khj1xFd1U92lYlCH0cigeqO4A0G398BDvsxaOyc5EJyzKg2JaTnJwG41Cp
	oYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ehDhGT2UJhTOcLSXIFDil1byE8CDJZyrtNTCY9EenVQ=;
	b=KPoCj/PzcGIRFOC90bKHxuAsNM5ocQf9iBrw9/2SkBjPUAL2wl0teQ8wvusQKzZniy
	8jZNp6y338Vk3lC6PmDmFQmumWw6P7njt3MLqq44FbkiJNW85GbJs1PbqFhrG3dd91aN
	U6nDoTTRvAJM9HqLh2SKIL/AabuWqtHHJMXBXRtme6d6Vzzeznd1g9v9paN0YfHVZu12
	shpC+DJqMINY4BDfMYr1zx/bF/W0DAZesrRO6t68ylXIfSadV55OHs1HRkaa8NFHY5wI
	Yin8OYXy0u4hYBs24gcJtYaHF1Z6VmyLVIQUY/HUqb8nTFOdRZQOSBDbqwejMWUH7xuj
	GJOw==
X-Gm-Message-State: AHPjjUiO8r1W9txJXvHN30CKxpx1iYb6U5Y3Ok0HQyk1IgWzWLULVinM
	TebaP7c136ESPyaLvoVqyn+lsmEupP6upGoardY=
X-Google-Smtp-Source: AOwi7QCf/Eg+JyhwWX2tPxuhETK6miIAB0pbBo+/6RA4Qwu7yTrbQcwntXuAfM/CaU3J5sJvB4njQyKhMKl8++DEewY=
X-Received: by 10.31.95.210 with SMTP id t201mr14871546vkb.168.1505394786751; 
	Thu, 14 Sep 2017 06:13:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.59.18 with HTTP; Thu, 14 Sep 2017 06:13:06 -0700 (PDT)
In-Reply-To: <20170914122753.12713-1-ross.burton@intel.com>
References: <20170914122753.12713-1-ross.burton@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Sep 2017 09:13:06 -0400
Message-ID: <CADkTA4Mn14dpJTV65T90dqN3h8cQ_tDiq7dRxV1SxJySCxsazQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty] bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Thu, 14 Sep 2017 13:13:06 -0000
Content-Type: multipart/alternative; boundary="001a114e2b8082d9b10559260913"

--001a114e2b8082d9b10559260913
Content-Type: text/plain; charset="UTF-8"

.. and if anyone notices, there's a kernel part to this CVE as well.

I've applied to fix to all the active linux-yocto kernels, and the change
will be part
of my consolidated pull request that comes out later today.

Cheers,

Bruce

On Thu, Sep 14, 2017 at 8:27 AM, Ross Burton <ross.burton@intel.com> wrote:

> All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to
> an
> information disclosure vulnerability which allows remote attackers to
> obtain
> sensitive information from the bluetoothd process memory. This
> vulnerability
> lies in the processing of SDP search attribute requests.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
>  .../bluez5/bluez5/cve-2017-1000250.patch           | 34
> ++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-
> 1000250.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> index ecefb7b593e..3421c382063 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -23,6 +23,7 @@ SRC_URI = "\
>      file://run-ptest \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '',
> 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch',
> d)} \
>      file://0001-tests-add-a-target-for-building-tests-without-runnin.patch
> \
> +    file://cve-2017-1000250.patch \
>  "
>  S = "${WORKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
> b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
> new file mode 100644
> index 00000000000..9fac961bcf6
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
> @@ -0,0 +1,34 @@
> +All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable
> to an
> +information disclosure vulnerability which allows remote attackers to
> obtain
> +sensitive information from the bluetoothd process memory. This
> vulnerability
> +lies in the processing of SDP search attribute requests.
> +
> +CVE: CVE-2017-1000250
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 9e009647b14e810e06626dde7f1bb9ea3c375d09 Mon Sep 17 00:00:00 2001
> +From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> +Date: Wed, 13 Sep 2017 10:01:40 +0300
> +Subject: sdp: Fix Out-of-bounds heap read in service_search_attr_req
> function
> +
> +Check if there is enough data to continue otherwise return an error.
> +---
> + src/sdpd-request.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/sdpd-request.c b/src/sdpd-request.c
> +index 1eefdce..318d044 100644
> +--- a/src/sdpd-request.c
> ++++ b/src/sdpd-request.c
> +@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_req_t *req,
> sdp_buf_t *buf)
> +       } else {
> +               /* continuation State exists -> get from cache */
> +               sdp_buf_t *pCache = sdp_get_cached_rsp(cstate);
> +-              if (pCache) {
> ++              if (pCache && cstate->cStateValue.maxBytesSent <
> pCache->data_size) {
> +                       uint16_t sent = MIN(max, pCache->data_size -
> cstate->cStateValue.maxBytesSent);
> +                       pResponse = pCache->data;
> +                       memcpy(buf->data, pResponse + cstate->cStateValue.maxBytesSent,
> sent);
> +--
> +cgit v1.1
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114e2b8082d9b10559260913
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">.. and if anyone notices, there&#39;s a kernel part to thi=
s CVE as well.<div><br></div><div>I&#39;ve applied to fix to all the active=
 linux-yocto kernels, and the change will be part</div><div>of my consolida=
ted pull request that comes out later today.</div><div><br></div><div>Cheer=
s,</div><div><br></div><div>Bruce<br><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Thu, Sep 14, 2017 at 8:27 AM, Ross Burton <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to =
an<br>
information disclosure vulnerability which allows remote attackers to obtai=
n<br>
sensitive information from the bluetoothd process memory. This vulnerabilit=
y<br>
lies in the processing of SDP search attribute requests.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/<wbr>bluez5/bluez5.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
=C2=A0.../bluez5/bluez5/cve-2017-<wbr>1000250.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++++++++<br>
=C2=A02 files changed, 35 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2=
017-<wbr>1000250.patch<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc b/meta/recipe=
s-connectivity/<wbr>bluez5/bluez5.inc<br>
index ecefb7b593e..3421c382063 100644<br>
--- a/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc<br>
+++ b/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc<br>
@@ -23,6 +23,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;systemd&#39;, &#39;&#39;, &#39;file://0001-Allow-using-<wbr>obexd-withou=
t-systemd-in-the-<wbr>user-sessio.patch&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-tests-add-a-<wbr>target-for-building-tests-=
<wbr>without-runnin.patch \<br>
+=C2=A0 =C2=A0 file://cve-2017-1000250.patch \<br>
=C2=A0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/bluez-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>100=
0250.patch b/meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>100=
0250.patch<br>
new file mode 100644<br>
index 00000000000..9fac961bcf6<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>1000250.pa=
tch<br>
@@ -0,0 +1,34 @@<br>
+All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to=
 an<br>
+information disclosure vulnerability which allows remote attackers to obta=
in<br>
+sensitive information from the bluetoothd process memory. This vulnerabili=
ty<br>
+lies in the processing of SDP search attribute requests.<br>
+<br>
+CVE: CVE-2017-1000250<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
+<br>
+From 9e009647b14e810e06626dde7f1bb9<wbr>ea3c375d09 Mon Sep 17 00:00:00 200=
1<br>
+From: Luiz Augusto von Dentz &lt;<a href=3D"mailto:luiz.von.dentz@intel.co=
m">luiz.von.dentz@intel.com</a>&gt;<br>
+Date: Wed, 13 Sep 2017 10:01:40 +0300<br>
+Subject: sdp: Fix Out-of-bounds heap read in service_search_attr_req funct=
ion<br>
+<br>
+Check if there is enough data to continue otherwise return an error.<br>
+---<br>
+ src/sdpd-request.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/sdpd-request.c b/src/sdpd-request.c<br>
+index 1eefdce..318d044 100644<br>
+--- a/src/sdpd-request.c<br>
++++ b/src/sdpd-request.c<br>
+@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_<wbr>req_t *req=
, sdp_buf_t *buf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* continuation Sta=
te exists -&gt; get from cache */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdp_buf_t *pCache =
=3D sdp_get_cached_rsp(cstate);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pCache) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pCache &amp;&amp; cs=
tate-&gt;cStateValue.<wbr>maxBytesSent &lt; pCache-&gt;data_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint16_t sent =3D MIN(max, pCache-&gt;data_size - cstate-&gt;cSta=
teValue.<wbr>maxBytesSent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pResponse =3D pCache-&gt;data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0memcpy(buf-&gt;data, pResponse + cstate-&gt;cStateValue.<wbr>maxB=
ytesSent, sent);<br>
+--<br>
+cgit v1.1<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div></div>

--001a114e2b8082d9b10559260913--
