Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id EB654605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:13:59 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so92371433qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 12:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LeDN4/HWHJ9mPpRo+VBmjIYY9VNPkzmCYeicQRuMaKU=;
	b=P9wNI/yS71R+SAvRYM3rWLJupupPoQqStUP9AmGBw05ib2YhOVV2LCm7D3Dd5l5DJX
	YSjfdzQYE77fxAjLhm9AwDwlOvE8D/q5fH4j9tmxYi/ZgBs73yiTL3dLZ2KMw+NyAetA
	OSxOtP058G26Bf0Ald2pXLqWXKKjHCLoIJbYqSsj8pAHPp/C5iQxNd+H/cI2MUiJIWww
	On4GXq5Pyd0jVgbl3IxNeNs5JZcXhAr1NRuHm/qpBiqdi0h6lMpB634y2S/BrFKaxIlO
	v+T92DAYv1qDoCBK62epN1sH0xCpnIVfB4SU2hAr2R0xJgEK8SwxBlen3E605N5/Eq7m
	PsdA==
X-Gm-Message-State: ALoCoQmko3zl4mRl9aVgMV+KYqgw1yj6LcQWeh2BvCnqmMlQ8insVJFh0AtclRBVYzdumS3rwsZO
X-Received: by 10.55.50.20 with SMTP id y20mr55017982qky.58.1429125222731;
	Wed, 15 Apr 2015 12:13:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Apr 2015 12:13:22 -0700 (PDT)
In-Reply-To: <552D2FDC.4090800@windriver.com>
References: <20150413141345.GF17921@deadlock.dhs.org>
	<CADkTA4N7CTFHgBrG5HO0XrtG6YP3YN5J5ibOx4ZnwG9bHS=0sA@mail.gmail.com>
	<20150414094258.GF19841@deadlock.dhs.org>
	<552D2FDC.4090800@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 20:13:22 +0100
Message-ID: <CAJTo0LY6hzgudB4Hxeow0NLWrJA2j+P5suj7+h4z6QuYw2Yx4Q@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] allow installation of multiple kernels in the rootfs
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
X-List-Received-Date: Wed, 15 Apr 2015 19:14:00 -0000
Content-Type: multipart/alternative; boundary=001a114713923daa060513c82568

--001a114713923daa060513c82568
Content-Type: text/plain; charset=UTF-8

On 14 April 2015 at 16:18, Mark Hatle <mark.hatle@windriver.com> wrote:

> Honestly, I'm not really sure what all of the options are here.  I know
> that RPM
> supports a mode (designed for kernels and modules) that allow you to
> install
> multiple versions of the same package at the same time.  I'm not sure if
> this is
> what you want... but the initial install can only be a single version.
>
> Using RPM (or smart) basically you have to tell the system to 'install' vs
> 'upgrade'.  And as long as there are no conflicting files, it will happily
> do
> more then one version of the same package.
>
> (I doubt dpkg or deb support this, but I don't know.)
>

dpkg doesn't, and as opkg is a clone of dpkg I doubt that does either (if
it does, it's probably a bug).

Ross

--001a114713923daa060513c82568
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 April 2015 at 16:18, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":523" class=
=3D"a3s" style=3D"overflow:hidden">Honestly, I&#39;m not really sure what a=
ll of the options are here.=C2=A0 I know that RPM<br>
supports a mode (designed for kernels and modules) that allow you to instal=
l<br>
multiple versions of the same package at the same time.=C2=A0 I&#39;m not s=
ure if this is<br>
what you want... but the initial install can only be a single version.<br>
<br>
Using RPM (or smart) basically you have to tell the system to &#39;install&=
#39; vs<br>
&#39;upgrade&#39;.=C2=A0 And as long as there are no conflicting files, it =
will happily do<br>
more then one version of the same package.<br>
<br>
(I doubt dpkg or deb support this, but I don&#39;t know.)</div></blockquote=
></div><br>dpkg doesn&#39;t, and as opkg is a clone of dpkg I doubt that do=
es either (if it does, it&#39;s probably a bug).</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114713923daa060513c82568--
