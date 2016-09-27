Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id C770260017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 12:29:03 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 92so12874183iol.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IX41YU51r/o6/GscQy/dU54MaY+UKk9MaXLh8aBv4Pg=;
	b=s3zEF4TNNayvqyp8qu1E77kpEyIQyBCuRd3cekpz/uUJDJYYXQFhQwf/37tK2R0cU8
	LAGc31wUlfDToG9MzAmaUxQWgC5Bu6tWwFpGf652gy+Q1HYJdcYka7ObuAl5wCL2DpvH
	NvAPCixdwPpHMzKFCW2Q2uDc6mFMO0eCUUT4mS+ytZPg7SF02EGRbD7TbiuQhH5087HP
	qHhO11+2elSv/lc3yyfMXi0UJOpk+HdPkvRa0bUEPxh1o2iTmi6gDzmqqrChzgki0b75
	cxmrSxP41AntMnZTRZDb+5KWDEWQ3ITWClbjMyTFrZBl+m1nYCiLLlBY4k8o369CiiY6
	Alcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IX41YU51r/o6/GscQy/dU54MaY+UKk9MaXLh8aBv4Pg=;
	b=NSdQiLraI2VhYgW0SXIIdG8TsTsUj32BiVDD0vObCBuzbNvJAIKU8gMzGdBQDlkWor
	0Oci98g7r0EFm/0TqQWKMvOys098FKsjur5P75gISY97wFRB54GEzJcQlI2mqySKdRtC
	2rd9RPmt64IMmnRi6NHhr2S68jYgz1lyqJ/2wrmfCkr/h9L+znk0mSDzsOYD71nzd+QU
	Vl9PWvE4/lXzR/NFlry5RwkiGqVz/hGsHVa4sRSlTxcLdF5mSROQJnz9T3dYCxxjX4qA
	tjhJ7gc2fGB/3YoOAKGDJKvLumlu5rRwejtxA48oGDdLUnPKJejx+F4mjBjirBIkb0NA
	rgAw==
X-Gm-Message-State: AE9vXwM1wCYk7FeXo4x3GyMDLRY+yJi9HWrIn7BIa8g76Xw75mkwaEEz+BCzGMkbI3tlVHiaoY4BDL/O3SglBsbx
X-Received: by 10.107.142.147 with SMTP id q141mr28354950iod.67.1474979344823; 
	Tue, 27 Sep 2016 05:29:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 27 Sep 2016 05:28:44 -0700 (PDT)
In-Reply-To: <b4dd791086d6e09a415d5dcd2afafa7906aab3c4.1474875470.git.jackie.huang@windriver.com>
References: <cover.1474875470.git.jackie.huang@windriver.com>
	<b4dd791086d6e09a415d5dcd2afafa7906aab3c4.1474875470.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Sep 2016 13:28:44 +0100
Message-ID: <CAJTo0Lb0+rRw3LTdaW7PjkGPC1mo==s1CAF8MX9ozTabvOdDPQ@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] boost: add support for additional boost libs
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
X-List-Received-Date: Tue, 27 Sep 2016 12:29:06 -0000
Content-Type: multipart/alternative; boundary=94eb2c05b2dee6625d053d7c63ff

--94eb2c05b2dee6625d053d7c63ff
Content-Type: text/plain; charset=UTF-8

On 26 September 2016 at 08:56, <jackie.huang@windriver.com> wrote:

> +FILES_${PN}-graph = "${libdir}/libboost_graph.so.*"
> +FILES_${PN}-graph_parallel = "${libdir}/libboost_graph_parallel.so.*"
> +FILES_${PN}-locale = "${libdir}/libboost_locale.so.*"
> +FILES_${PN}-mpi = "${libdir}/mpi.so ${libdir}/libboost_mpi*.so.*"
>

Are all of these really required?  Apart from ${libdir}/mpi.so they look
like they'll be handled by the Python logic in the recipe.

Ross

--94eb2c05b2dee6625d053d7c63ff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 September 2016 at 08:56,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jac=
kie.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7yg" class=
=3D"a3s aXjCH m157658fbe541d8ae">+FILES_${PN}-graph =3D &quot;${libdir}/lib=
boost_graph.so.*<wbr>&quot;<br>
+FILES_${PN}-graph_parallel =3D &quot;${libdir}/libboost_graph_<wbr>paralle=
l.so.*&quot;<br>
+FILES_${PN}-locale =3D &quot;${libdir}/libboost_locale.so.<wbr>*&quot;<br>
+FILES_${PN}-mpi =3D &quot;${libdir}/mpi.so ${libdir}/libboost_mpi*.so.*&qu=
ot;</div></blockquote></div><br>Are all of these really required?=C2=A0 Apa=
rt from ${libdir}/mpi.so they look like they&#39;ll be handled by the Pytho=
n logic in the recipe.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c05b2dee6625d053d7c63ff--
