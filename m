Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8684A77687
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 09:25:25 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 90so109063878ios.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 01:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=62eRloYemLHpgEb/VCy1IUeNv1RSPNNh+TNZnFfHoJQ=;
	b=K7KWs2ybyfznk0I3ZCXw4wgb38fntnrgLlJOqEpppKKQpra7/mgwB/9gfON0W+ABBy
	MwQnEMICFP5tqXcvh3kwfKrcj8akEQ4q5Ah8RJ3SQSVkn40S9NlAr6vxi7KviU34IpVT
	kyIa6KXZ04jUpCqDJrIzFcww/XB8tq/r5KTk+KMtBNS93OLZFZ/k8GBAuCC/47mJ5tON
	U/wHul6ICvPI27fLhdXCpBbCHLNdpAb3V5T2bdM1M9C8gPvP32JCdcw4vQ+rskslCom+
	h32ggagXWLdTYOpcfU/WzIkpnpV3FZUmOMFDO7LNGw0W19TnrYaCDL527ZNH2vujNvhv
	bjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=62eRloYemLHpgEb/VCy1IUeNv1RSPNNh+TNZnFfHoJQ=;
	b=oAU+MJKjr/jF1KDRathvb0QCYj+gqpQX3SzaOPMS0GPAAKbyHiurmgIYvSOQhe5nrZ
	DKKWIERpHwEzMWgy93gLZ8iVCDRULMmzE9kriksxrzIrgFPEdDmel+h3U+HLmZqe2ITq
	bhW2yl96knHz/cyhfHH7Dwpp1D1arWaAqq3qG+ogjqfREXMC71lvY5oWMCYtg2oxOfn7
	RgkWLzaLU/7d99DQnYSb2IFDydbD2YC+hZONvCJ7kQ9OnmDPQ3AuIMS4SLm57rH03yU3
	8zajN8uljg6C95007qA//Fag1vgTE2iXKlZZLt8aO9td8vYX3opCt8CRTFMNYM4h6oe5
	K4jA==
X-Gm-Message-State: AMke39mHo2kPZIEqvkYsqFjB6lNR+E4X41v4ZXWIZLG5+UAe4wOrr2Z7TyjDDcp7YCVULxOIJZAdljiPAp2VtMzo
X-Received: by 10.107.4.75 with SMTP id 72mr12033189ioe.162.1488792327101;
	Mon, 06 Mar 2017 01:25:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.108.5 with HTTP; Mon, 6 Mar 2017 01:25:06 -0800 (PST)
In-Reply-To: <1488792157-27915-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
References: <1488792157-27915-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Date: Mon, 6 Mar 2017 10:25:06 +0100
Message-ID: <CAKuJqM-BayFiN-F78yg2d0H5V+gyY9wV06GjXoU_-ckJKY4DkA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.2.5
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
X-List-Received-Date: Mon, 06 Mar 2017 09:25:26 -0000
Content-Type: multipart/alternative; boundary=001a113d905ecd3331054a0c79e5

--001a113d905ecd3331054a0c79e5
Content-Type: text/plain; charset=UTF-8

Please ignore. Mistakenly sent to wrong mailing list.

On 6 March 2017 at 10:22, Oleksandr Kravchuk <
oleksandr.kravchuk@pelagicore.com> wrote:

> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  .../wireshark/{wireshark_2.2.4.bb => wireshark_2.2.5.bb}              |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.2.4.bb =>
> wireshark_2.2.5.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
> b/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
> similarity index 95%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
> index 29dfbfe..03ae3b9 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
> @@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.
> org/src/all-versions/${BP}.tar.bz2"
>
>  PE = "1"
>
> -SRC_URI[md5sum] = "6d0878ba931ea379f6e675d4cba6536b"
> -SRC_URI[sha256sum] = "42a7fb35eed5a32478153e24601a28
> 4bb50148b7ba919c3e8452652f4c2a3911"
> +SRC_URI[md5sum] = "749e7ca7606ae7df5c1ca8c62f93ff31"
> +SRC_URI[sha256sum] = "75dd88d3d6336559e5b0b72077d8a7
> 72a988197d571f00029986225fef609ac8"
>
>  inherit autotools pkgconfig perlnative
>
> --
> 2.7.4
>
>


-- 
Yes, this is my signature

--001a113d905ecd3331054a0c79e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please ignore. Mistakenly sent to wrong mailing list.</div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 6 March 2017 =
at 10:22, Oleksandr Kravchuk <span dir=3D"ltr">&lt;<a href=3D"mailto:oleksa=
ndr.kravchuk@pelagicore.com" target=3D"_blank">oleksandr.kravchuk@pelagicor=
e.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by=
: Oleksandr Kravchuk &lt;<a href=3D"mailto:oleksandr.kravchuk@pelagicore.co=
m">oleksandr.kravchuk@<wbr>pelagicore.com</a>&gt;<br>
---<br>
=C2=A0.../wireshark/{<a href=3D"http://wireshark_2.2.4.bb" rel=3D"noreferre=
r" target=3D"_blank">wireshark_2.2.<wbr>4.bb</a> =3D&gt; <a href=3D"http://=
wireshark_2.2.5.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_2.2.5.bb=
</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-networking/recipes-<wbr>support/wireshark/{<a href=3D"htt=
p://wireshark_2.2.4.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_<wbr=
>2.2.4.bb</a> =3D&gt; <a href=3D"http://wireshark_2.2.5.bb" rel=3D"noreferr=
er" target=3D"_blank">wireshark_2.2.5.bb</a>} (95%)<br>
<br>
diff --git a/meta-networking/recipes-<wbr>support/wireshark/<a href=3D"http=
://wireshark_2.2.4.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_2.<wb=
r>2.4.bb</a> b/meta-networking/recipes-<wbr>support/wireshark/<a href=3D"ht=
tp://wireshark_2.2.5.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_2.<=
wbr>2.5.bb</a><br>
similarity index 95%<br>
rename from meta-networking/recipes-<wbr>support/wireshark/<a href=3D"http:=
//wireshark_2.2.4.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_2.<wbr=
>2.4.bb</a><br>
rename to meta-networking/recipes-<wbr>support/wireshark/<a href=3D"http://=
wireshark_2.2.5.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_2.<wbr>2=
.5.bb</a><br>
index 29dfbfe..03ae3b9 100644<br>
--- a/meta-networking/recipes-<wbr>support/wireshark/<a href=3D"http://wire=
shark_2.2.4.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_2.<wbr>2.4.b=
b</a><br>
+++ b/meta-networking/recipes-<wbr>support/wireshark/<a href=3D"http://wire=
shark_2.2.5.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_2.<wbr>2.5.b=
b</a><br>
@@ -10,8 +10,8 @@ SRC_URI =3D &quot;<a href=3D"https://2.na.dl.wireshark.or=
g/src/all-versions/${BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http=
s://2.na.dl.wireshark.<wbr>org/src/all-versions/${BP}.<wbr>tar.bz2</a>&quot=
;<br>
<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>6d0878ba931ea379f6e675d4cba653<wbr>6b&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>42a7fb35eed5a32478153e24601a28<wbr>4bb50=
148b7ba919c3e8452652f4c2a<wbr>3911&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>749e7ca7606ae7df5c1ca8c62f93ff<wbr>31&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>75dd88d3d6336559e5b0b72077d8a7<wbr>72a98=
8197d571f00029986225fef60<wbr>9ac8&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig perlnative<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Yes, th=
is is my signature</div>
</div>

--001a113d905ecd3331054a0c79e5--
