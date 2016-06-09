Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECF76FF9B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 12:54:30 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 5so36757177ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2016 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lBEj4f+WGbG0QpZG+IAmiVypvtoJNMdRCu90SJ7htws=;
	b=GKoWXYXPlGgjWXqiyB3NmkcSAr6GCThVUD5s0vcVeEg+CozwJ5ogsWLYw13cFJGX1t
	kSCP7XpUEyuXnk3zJM0iqrBOHHLJBmixXSz37B1btnp4zp07kf+fwmU7EkNAGNg3Bg5b
	bwl5DANfSnftDf4cfeEKABkCyRE1UzPPXIvG+fJ9R4ztkO9SQg4uxtydSN1ObpUGgIaS
	EgvQq5r/UhrPXzc11m/+E+vJs+N0qCJJaW+K07VPAQxJLLM4c/37H32aDdRBpf+K3Zs5
	jYdjMm0dylGFim0ATCfZxHtPP1k5Gp0xiSlnd2TYteO6sJl+/Vdw7pTCwxXrWFZnp2bU
	IMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lBEj4f+WGbG0QpZG+IAmiVypvtoJNMdRCu90SJ7htws=;
	b=lv2zsv+SgQa4N7y/qu5Xfi08Tlr+Baf292T3jUUSe/wgawZ8uZz1HkuTV9RDiUTkI9
	pU/fEDxHHrNH8sakoyy7wp+GnqRz3FUiVe5ZMkREicA0zFgalF3SPE4U1FhpJEfZ44Rb
	zDMf9Xsp9ObjIsj5E6G82omkPJMQET9+Tw/i0chS7/bicZlE151/rZzpsYVDnm3ZsAqd
	+f9NChEPO8OqUWF82x7deWubfWSbVaj3jo/gT4nc6xAji2qLqAhm9b2AkIoedPRpbsuv
	TFj1/vBr4LgHXcfzVkmbQoNF3vd3VT2fw8gnA4YPrB6qsia4o9dFtDDxqPXONXiu6UqA
	6pgg==
X-Gm-Message-State: ALyK8tIqc1EpoLFKVa698X7N43A875ZcQobbLdIJga/L26BHpSGBtdKip0SaKiJmC9z72j9LBPrlTnJkBWjH2rtm
X-Received: by 10.107.135.137 with SMTP id r9mr17230579ioi.133.1465476871284; 
	Thu, 09 Jun 2016 05:54:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 9 Jun 2016 05:54:11 -0700 (PDT)
In-Reply-To: <CAG+FGgfFMYHhcHp_PcJw+dk6LDj8CzC4UjRrc7aLAZAhEq0ChA@mail.gmail.com>
References: <CAG+FGgfFMYHhcHp_PcJw+dk6LDj8CzC4UjRrc7aLAZAhEq0ChA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jun 2016 13:54:11 +0100
Message-ID: <CAJTo0Lb5q9m1872_xv6+biDPF+cHRmSK1TzQ93Z4-AN1S+YNOQ@mail.gmail.com>
To: Dmitriy Falko <d.falko.work@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Avahi, add extra path to GIR_EXTRA_LIBS_PATH
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
X-List-Received-Date: Thu, 09 Jun 2016 12:54:32 -0000
Content-Type: multipart/alternative; boundary=001a113ec8425700ad0534d7ecb4

--001a113ec8425700ad0534d7ecb4
Content-Type: text/plain; charset=UTF-8

Hi,

I applied this manually, but in the future please use something like
git-send-email to send the patch so that your mail client can't be
"helpful" and wrap the message in HTML and wrap lines.

Ross

On 9 June 2016 at 09:35, Dmitriy Falko <d.falko.work@gmail.com> wrote:

>
> Signed-off-by: Dmitriy Falko <d.falko.work@gmail.com>
> ---
>  meta/recipes-connectivity/avahi/avahi.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc
> b/meta/recipes-connectivity/avahi/avahi.inc
> index 81aad79..340b3e6 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -71,7 +71,7 @@ do_configure_prepend() {
>  }
>
>  do_compile_prepend() {
> -    export
> GIR_EXTRA_LIBS_PATH="${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
> +    export
> GIR_EXTRA_LIBS_PATH="${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
>  }
>
>  PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client
> avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113ec8425700ad0534d7ecb4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I applied this manually, but in the=
 future please use something like git-send-email to send the patch so that =
your mail client can&#39;t be &quot;helpful&quot; and wrap the message in H=
TML and wrap lines.<div><br></div><div>Ross</div></div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 9 June 2016 at 09:35, Dmitri=
y Falko <span dir=3D"ltr">&lt;<a href=3D"mailto:d.falko.work@gmail.com" tar=
get=3D"_blank">d.falko.work@gmail.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>Signed-off-by: Dmit=
riy Falko &lt;<a href=3D"mailto:d.falko.work@gmail.com" target=3D"_blank">d=
.falko.work@gmail.com</a>&gt;</div><div>---</div><div>=C2=A0meta/recipes-co=
nnectivity/avahi/avahi.inc | 2 +-</div><div>=C2=A01 file changed, 1 inserti=
on(+), 1 deletion(-)</div><div><br></div><div>diff --git a/meta/recipes-con=
nectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc</div>=
<div>index 81aad79..340b3e6 100644</div><div>--- a/meta/recipes-connectivit=
y/avahi/avahi.inc</div><div>+++ b/meta/recipes-connectivity/avahi/avahi.inc=
</div><div>@@ -71,7 +71,7 @@ do_configure_prepend() {</div><div>=C2=A0}</di=
v><div>=C2=A0</div><div>=C2=A0do_compile_prepend() {</div><div>- =C2=A0 =C2=
=A0export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/avahi-common/.libs:${B}/avahi-cl=
ient/.libs:${B}/avahi-glib/.libs&quot;</div><div>+ =C2=A0 =C2=A0export GIR_=
EXTRA_LIBS_PATH=3D&quot;${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${=
B}/avahi-client/.libs:${B}/avahi-glib/.libs&quot;</div><div>=C2=A0}</div><d=
iv>=C2=A0</div><div>=C2=A0PACKAGES =3D+ &quot;avahi-daemon libavahi-common =
libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avah=
i-autoipd avahi-utils&quot;</div><span class=3D"HOEnZb"><font color=3D"#888=
888"><div>--=C2=A0</div><div>2.7.4</div></font></span></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--001a113ec8425700ad0534d7ecb4--
