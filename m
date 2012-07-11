Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SozBT-0006LP-5s
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 17:50:35 +0200
Received: by qabg1 with SMTP id g1so3411419qab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 08:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=RyReY8OhOJANfiSqziRM54Mh1xhyhQwSmTC4OqhqkW0=;
	b=cffZeDI7vohPM1i2oimAUhzb/a9ZGqcdlPAkTbEpEPKMQwdXDSaMkHs/1m2NWNa0zD
	tJTLJd0GAm+d9OZFv77UYY2s6ZPMa5GeR9YfwHprmgH/t5jVdFhD1Ut8eWp9sJv/XnnS
	/jrXqFc4qLGPqo5N08IJxRkCSyQdiWJ47nYG9wmN7vjpvZE/wnBfd2KPZp1l5zjk6XIy
	7tFd/pzR3G7FUUHGOK4HVgppHe7RTGH1TgRooQP+zmirf96PSUW2EkulJCXNVGAK33vc
	O8ukLEBm5aaoL/eKYbMWkUx8L5/9vzAmMn/oLMYOQh5njaTDsnKCiEkAS8E0h45/P1wu
	DF/A==
Received: by 10.43.59.71 with SMTP id wn7mr14620215icb.0.1342021161302; Wed,
	11 Jul 2012 08:39:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Wed, 11 Jul 2012 08:39:01 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1342020803-4197-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1342020803-4197-1-git-send-email-bogdan.a.marinescu@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 11 Jul 2012 18:39:01 +0300
Message-ID: <CAK18fxH4LLJs3ZeSSKUyyvevcA2_TaE+fwTonx_TD0yQMiX1Xg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnqGjcRt6iZ0AexAgYS1qIHoz+hXWtXzWLo0bPfbflRe4wOUfT8FRPleXmN9Sgq5AMcGS/q
Subject: Re: [PATCH] python-dbus: upgrade to 1.1.0
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
X-List-Received-Date: Wed, 11 Jul 2012 15:50:35 -0000
Content-Type: multipart/alternative; boundary=bcaec51ddaa799b8af04c48fa641

--bcaec51ddaa799b8af04c48fa641
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 11, 2012 at 6:33 PM, Bogdan Marinescu <
bogdan.a.marinescu@intel.com> wrote:

> Tested by compiling core-image-basic
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  .../{python-dbus_1.0.0.bb => python-dbus_1.1.0.bb} |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python-dbus_1.0.0.bb =>
> python-dbus_1.1.0.bb} (82%)
>
> diff --git a/meta/recipes-devtools/python/python-dbus_1.0.0.bbb/meta/recipes-devtools/python/
> python-dbus_1.1.0.bb
> similarity index 82%
> rename from meta/recipes-devtools/python/python-dbus_1.0.0.bb
> rename to meta/recipes-devtools/python/python-dbus_1.1.0.bb
> index 1b174eb..a10fda3 100644
> --- a/meta/recipes-devtools/python/python-dbus_1.0.0.bb
> +++ b/meta/recipes-devtools/python/python-dbus_1.1.0.bb
> @@ -4,12 +4,12 @@ HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f5612614133e9a2f2dad527d97554670"
>  DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
> -PR = "r1"
> +PR = "r0"
>

PR is by default r0 so i don't think this is needed anymore.

@g

--bcaec51ddaa799b8af04c48fa641
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Jul 11, 2012 at 6:33 PM, Bogdan Marinesc=
u <span dir=3D"ltr">&lt;<a href=3D"mailto:bogdan.a.marinescu@intel.com" tar=
get=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">

Tested by compiling core-image-basic<br>
<br>
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0.../{<a href=3D"http://python-dbus_1.0.0.bb" target=3D"_blank">python-db=
us_1.0.0.bb</a> =3D&gt; <a href=3D"http://python-dbus_1.1.0.bb" target=3D"_=
blank">python-dbus_1.1.0.bb</a>} | =A0 =A06 +++---<br>
=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=A0rename meta/recipes-devtools/python/{<a href=3D"http://python-dbus_1.0.0=
.bb" target=3D"_blank">python-dbus_1.0.0.bb</a> =3D&gt; <a href=3D"http://p=
ython-dbus_1.1.0.bb" target=3D"_blank">python-dbus_1.1.0.bb</a>} (82%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.0=
.0.bb" target=3D"_blank">python-dbus_1.0.0.bb</a> b/meta/recipes-devtools/p=
ython/<a href=3D"http://python-dbus_1.1.0.bb" target=3D"_blank">python-dbus=
_1.1.0.bb</a><br>


similarity index 82%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.0.=
0.bb" target=3D"_blank">python-dbus_1.0.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1.0.=
bb" target=3D"_blank">python-dbus_1.1.0.bb</a><br>
index 1b174eb..a10fda3 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.0.0.bb" =
target=3D"_blank">python-dbus_1.0.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1.0.bb" =
target=3D"_blank">python-dbus_1.1.0.bb</a><br>
@@ -4,12 +4,12 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.freedesktop.org/=
Software/dbus" target=3D"_blank">http://www.freedesktop.org/Software/dbus</=
a>&quot;<br>
=A0LICENSE =3D &quot;MIT&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df5612614133e9a2f2dad527d=
97554670&quot;<br>
=A0DEPENDS =3D &quot;expat dbus dbus-glib virtual/libintl python-pyrex-nati=
ve&quot;<br>
-PR =3D &quot;r1&quot;<br>
+PR =3D &quot;r0&quot;<br></blockquote><div>=A0</div><div>PR is by default =
r0 so i don&#39;t think this is needed anymore.=A0</div><div><br></div><div=
>@g</div></div>

--bcaec51ddaa799b8af04c48fa641--
