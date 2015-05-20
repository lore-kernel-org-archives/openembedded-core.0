Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5DCA4601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 19:23:48 +0000 (UTC)
Received: by qcir1 with SMTP id r1so28473954qci.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 12:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fuGfkkiMl/88ExnNU7FS6Xx2Zm8JwM3JhYyCKHbUvVM=;
	b=fZDzB50y1rBJoFTFbBgMxXoMM++QQHhdaQKWFNjN+eFVWxH4/E4g1cRoYxg0q84gYl
	mWrcIOVQIopk/DBh2rlVhT67MoxRGGwEY1dwI2YEH7l+qjJEuOW+pMpkh6V7jUSeOBV8
	s5rtalLhYAnHCnB+HSw48tRx92TPyoa3i/zZxtowNC8S0B+fdEs6Ks5LRbk0wBLP/o1R
	pj0NJxQPAWNMnl47+kqKuXDKdxhO1sg/Hd4+CDTnMqYHvpKZTznFvmRuN+m0BKcBRPkh
	0wU2qq7xuX7psR/8U7pshXfyEWzESoYyA2yd9BA2lxAjNXyCdexeMAHHAdH05ly9u2CE
	hQjw==
X-Gm-Message-State: ALoCoQn4oYJ5lFPVZ85AfVBgy/DEDfv7+OAeEFd46Wsbg6HVVuLZzWNmTnSQKnWWFNBATVzFKdSW
X-Received: by 10.55.20.10 with SMTP id e10mr75835348qkh.36.1432149829679;
	Wed, 20 May 2015 12:23:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 12:23:29 -0700 (PDT)
In-Reply-To: <0e8588557edc10319678be694acdbc3fc7d2b080.1432147061.git.jussi.kukkonen@intel.com>
References: <cover.1432147061.git.jussi.kukkonen@intel.com>
	<0e8588557edc10319678be694acdbc3fc7d2b080.1432147061.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 20:23:29 +0100
Message-ID: <CAJTo0LY6iOq+S=p9N0pkKHyLQ18-8csXK3WAvXHjsVnb40BzcA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] xserver-xorg: Upgrade 1.16.3 -> 1.17.1 (OELAYOUT_ABI change)
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
X-List-Received-Date: Wed, 20 May 2015 19:23:51 -0000
Content-Type: multipart/alternative; boundary=001a1137de32dd12120516885d89

--001a1137de32dd12120516885d89
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 20:11, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> -LIC_FILES_CHKSUM = "file://COPYING;md5=15b5bf9327341c81089137aec4830bfd"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880
>

When this happens please explain what the change was, to demonstrate that
you've verified that xserver wasn't relicensed to GPLv3. :)

I'll look at the rest in a minute...

Ross

--001a1137de32dd12120516885d89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2015 at 20:11, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1cp" cla=
ss=3D"a3s" style=3D"overflow:hidden">-LIC_FILES_CHKSUM =3D &quot;file://COP=
YING;md5=3D15b5bf9327341c81089137aec4830bfd&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D5df87950af51ac2c5822094553=
ea1880</div></blockquote><div><br></div><div>When this happens please expla=
in what the change was, to demonstrate that you&#39;ve verified that xserve=
r wasn&#39;t relicensed to GPLv3. :)</div><div><br></div><div>I&#39;ll look=
 at the rest in a minute...</div><div><br></div><div>Ross</div></div></div>=
</div>

--001a1137de32dd12120516885d89--
