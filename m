Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id DBB4A6E5D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 19:42:49 +0000 (UTC)
Received: by qgez61 with SMTP id z61so43514694qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 12:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=znEwUzHWWHRmNdSh0/G9ej7Y9fJ6iZ3BW9Rttc10myk=;
	b=gr79kjOY9N72eXPJAZa9LYdBwxqELzjKljEN0+tmCBIDCyAgMZEumMkQC6JVoqwCyp
	loTMckUvzda1ndZwEORWmcMEYUN+oezOtFsVBcLpRYECs9bS/wDQ6KP3O8iVx24ElvzK
	vdczJ+DbUkIyBc7TBUExNEqCPOUD2vEixC7Yo7kDIxnc8LFvuFUCx0KAdfvKUnpJfx0o
	wjVbKbE768Ck6EWBatW5NotPh6/X6OJ6yAX/Spz2xwJ7q3Ml4jYjqYlJpWAAqCszmhCi
	pB10oi+U8GL5VbXBjDL/cMN2ZlIUBcuPN6ZFOy5sfoz84mtRkviq0iNLRtLw1S2Jmu7z
	IoZA==
X-Gm-Message-State: ALoCoQknzs9umjdHfyL0eMo4HslC8ToFqLOS0hGzhQRudcoLfCeAyvW2oGQTcb3QXN3PwwnXDHsY
X-Received: by 10.55.43.130 with SMTP id r2mr10332670qkr.14.1432237370136;
	Thu, 21 May 2015 12:42:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 21 May 2015 12:42:29 -0700 (PDT)
In-Reply-To: <1432212136-26396-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432212136-26396-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 May 2015 20:42:29 +0100
Message-ID: <CAJTo0Lb_-dMwKOgbZzJyPHi3ZZyA65qSdGrY80KLkTjJQTQZMA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: make buildable for x11-less environments / update to latest version
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
X-List-Received-Date: Thu, 21 May 2015 19:42:52 -0000
Content-Type: multipart/alternative; boundary=001a1147afb0ae6ea205169cbf13

--001a1147afb0ae6ea205169cbf13
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 May 2015 at 13:42, Andreas M=C3=BCller <schnitzeltony@googlemail.com>
wrote:

> * Make glx part configurable by PACKAGECONFIG enabled by 'x11' distro
> feature
> * Major upstream enhancement is using pkgconfig for egl. This should make
>   those egl implementations happy that require compiler extra options for
> their
>   egl headers.
>

\o/

Thanks!

Ross

--001a1147afb0ae6ea205169cbf13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 May 2015 at 13:42, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=
=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@go=
oglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":ng" class=3D"a3s" style=3D"overflow:hidden">* Make glx part configura=
ble by PACKAGECONFIG enabled by &#39;x11&#39; distro feature<br>
* Major upstream enhancement is using pkgconfig for egl. This should make<b=
r>
=C2=A0 those egl implementations happy that require compiler extra options =
for their<br>
=C2=A0 egl headers.</div></blockquote></div><br>\o/</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Thanks!</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147afb0ae6ea205169cbf13--
