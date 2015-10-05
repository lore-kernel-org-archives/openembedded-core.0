Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3AAA776660
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 14:40:59 +0000 (UTC)
Received: by qgez77 with SMTP id z77so151468145qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 07:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=52Aa5kMNAq5UBpEFvLzujpNfrUWcdY2awfKVFnQTYBA=;
	b=CbAzavuNHkDU2fyWJkcmhUhmF4jiRih7q927qjnOXi1rqYy3EiCzCEJPPtKI5KisXi
	Y1tIAfU04pa3kwfrg+AlzpbWEwQZ0E2MpJwq5LecR7LGBmZCtkx5cVYY5FufT9i48Aqm
	jzPtScJc43sXbn+pTG3eII5AQMewn+o+GWl2fnHNACA70PYIK9R3foLEFZIx38hi5Z27
	6z7+beKnEaNV7tYYrRId6I8D1fdSQLXt2IS70buLvfOd4P3/NhmSbkMIKrw7hSI1iBew
	QAOawC/ZLyZdFpSy0YmMpAcCyE0LIRJZfnmcTUKzXa7+m5A4791sTZstNPnrAF8QOtUA
	Kqlw==
X-Gm-Message-State: ALoCoQnVa9L5aeCddhvBvTALu9wAy15T1fCBkKy9wDGHriBbOICCODZ2Ddem2Jw1htxoS/3dlwT3
X-Received: by 10.140.147.77 with SMTP id 74mr36286693qht.52.1444056059361;
	Mon, 05 Oct 2015 07:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 5 Oct 2015 07:40:39 -0700 (PDT)
In-Reply-To: <20151003133343.GC2381@jama>
References: <20151003133343.GC2381@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Oct 2015 15:40:39 +0100
Message-ID: <CAJTo0LYSc3TV1D2OhmO4KN9ucJLm+d_U2BgrCq40Pk=+RiXqFA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-10-02
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
X-List-Received-Date: Mon, 05 Oct 2015 14:41:00 -0000
Content-Type: multipart/alternative; boundary=001a113552f274645b05215c8041

--001a113552f274645b05215c8041
Content-Type: text/plain; charset=UTF-8

On 3 October 2015 at 14:33, Martin Jansa <martin.jansa@gmail.com> wrote:

>     * /openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb,
> do_compile
>

This fails with a giant number of assembler warnings, but works when I try
with current master.  Does your build change some tunes?

Ross

--001a113552f274645b05215c8041
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 October 2015 at 14:33, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1e1" class=
=3D"a3s" style=3D"overflow:hidden">=C2=A0 =C2=A0 * /openembedded-core/meta/=
recipes-gnome/libsecret/<a href=3D"http://libsecret_0.18.2.bb" rel=3D"noref=
errer" target=3D"_blank">libsecret_0.18.2.bb</a>, do_compile<br></div></blo=
ckquote></div><br>This fails with a giant number of assembler warnings, but=
 works when I try with current master.=C2=A0 Does your build change some tu=
nes?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a113552f274645b05215c8041--
