Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCC7762A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 09:45:37 +0000 (UTC)
Received: by qgev79 with SMTP id v79so29677962qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 02:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jcQ8jIjsPzsSM+MqiSqmBrK3Gqso/7OsoAbH415PWHM=;
	b=NbYlGIzcT3/Wm/gMWRFPGgYfBq425le2flIhvc2cgnPxaXK6Ti93sZzuj+iReIP44k
	jCs+nyno6rnSrFn7yOwtFDefEDJNhiVzIalwUfqn0AP9aV2jhfI+AfpNaYAqsqnu1CFZ
	KPPDLbc6N6hL9wUrK9jiI2hKoJNbXjixepweJ5z9pETTHCFNSSy526rtv4YiLiVdrpeH
	xh8LFCRSGoKWZ/XvdpGSDUYieH5VN8VZ5lJyFelYiX1dr10pWGP9zq1QbNHBicZyecWf
	kV6dneX8mq1m5XueTqToUBcp6MyjjAJ+dCUGmqlPhLAvxzr33T0J52/4he1CDa5bJUQW
	dUNA==
X-Gm-Message-State: ALoCoQm1yxbxwIdf6Lv+bDZzhvjrJ9qgeJK3+wHZ2PS0Ld7A7SLG1kjQS+Gydu9tTDAnYEZMSdup
X-Received: by 10.140.109.74 with SMTP id k68mr3067435qgf.77.1443606337746;
	Wed, 30 Sep 2015 02:45:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 30 Sep 2015 02:45:18 -0700 (PDT)
In-Reply-To: <bcac24a99fee9f86d5692e7a457e51c41c9208b7.1443600210.git.wenzong.fan@windriver.com>
References: <cover.1443600210.git.wenzong.fan@windriver.com>
	<bcac24a99fee9f86d5692e7a457e51c41c9208b7.1443600210.git.wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Sep 2015 10:45:18 +0100
Message-ID: <CAJTo0LYwQiw5a0_nkBM5erDgbtNgzW54sU+3Cn5x=5EViS0uTg@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] glib-2.0: cleanup buildpaths from pkgconfig files
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
X-List-Received-Date: Wed, 30 Sep 2015 09:45:39 -0000
Content-Type: multipart/alternative; boundary=001a1139af24f52c760520f3ca54

--001a1139af24f52c760520f3ca54
Content-Type: text/plain; charset=UTF-8

On 30 September 2015 at 09:08, <wenzong.fan@windriver.com> wrote:

> For multilib build, PKG_CONFIG_SYSROOT_DIR will be injected in values
> that are returned by 'pkg-config --libs xxx', such as for zlib:
>

So why isn't this fixed in pkg-config?

Ross

--001a1139af24f52c760520f3ca54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 September 2015 at 09:08,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wen=
zong.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2sr" class=3D"=
a3s" style=3D"overflow:hidden">For multilib build, PKG_CONFIG_SYSROOT_DIR w=
ill be injected in values<br>
that are returned by &#39;pkg-config --libs xxx&#39;, such as for zlib:<br>=
</div></blockquote></div><br>So why isn&#39;t this fixed in pkg-config?</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a1139af24f52c760520f3ca54--
