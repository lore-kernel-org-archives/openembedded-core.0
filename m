Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6651360017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 20:34:08 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id z76so80768141iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 12:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VHpzk/z6/fBXoenr2ia0pA2o+OkuzmO/zmEY8kFMD60=;
	b=Yr65Xy99hpzWP3/Y/qtCtc/R2Zptz4NJOuH3iCs6RQ2uTrQu0vmBxCNJSOPyil9XDY
	rBC5n0AoAeo6G6qxRdCZTm9NMWLGXPH7URzDBCNNiCj2t2hQP24vgGJ4PFz7bdLmfV9Y
	lHCzVb0YCSr3bdafr6lVp7gNhK+LmjY5H4f02ZrZkt2XIQBZ1nJJSmneU5gbCEAFdod1
	Zgqf3j0LipX4Dhb34fVVyBbUfL2ZOSuk2JihqkNvozu3CYapp315j9LzWdJDW5fx/2nw
	PwuBXI7C9HTRMlkmtiswLWKgIfSAGQrA18wyEWbGHQ8xPsMeoE+ZHTL3YlTDiY6YyRZK
	k5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VHpzk/z6/fBXoenr2ia0pA2o+OkuzmO/zmEY8kFMD60=;
	b=R2eVPg+puyPcUKkIEUB5W1Rqwa4IPzwH9tQ3irupsTHsbLpwzxKcDI4R5Cko1lNB5J
	Q4A/2ETlnIpWHpTwArgzpGKGa93EwhZ2CtMa7DxLYOMSfxlYhn52tttAQBMU7dWKbPXJ
	L0laWKDeboA7fl6obw+QSSu9tmr/7wOpN/RL6D9KZoucz0Zqv6Ff/o9lwNJC6Bbgi0g5
	MR9/lL5o6LccNSG/+58PDJICafZr5DQL5BZpXaZXyQgsWIvoOQrXgI8Ga7T0+7kZ1cvQ
	LF+BASqAKiEUEW7N0zOlkfExw6575FRNdBZGRxgmwbEgdNpAz7ipHN2AeIY1yMKkPwYy
	F5IQ==
X-Gm-Message-State: AD7BkJKTE0tce2vmFkayZwlsizK3QsV0wo9JBHZotyFYHeTlJugmruxHDzWyyvij3sNpeBI0Yp6b2wW5RIllPcOj
X-Received: by 10.107.16.19 with SMTP id y19mr1084718ioi.148.1457555648869;
	Wed, 09 Mar 2016 12:34:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 9 Mar 2016 12:33:49 -0800 (PST)
In-Reply-To: <1457547560-21542-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1457547560-21542-1-git-send-email-ricardo.ribalda@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Mar 2016 20:33:49 +0000
Message-ID: <CAJTo0LYeOMKtvdZb2_Nc55Ti+mrbsjFdOEem-mAC+5N5gVt0fQ@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package-deb: Ignore circular dependencies
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
X-List-Received-Date: Wed, 09 Mar 2016 20:34:08 -0000
Content-Type: multipart/alternative; boundary=001a113fd1eab10b80052da39e18

--001a113fd1eab10b80052da39e18
Content-Type: text/plain; charset=UTF-8

On 9 March 2016 at 18:19, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com
> wrote:

> +                        bb.warn("Package %s rdepends on itself. Ignoring
> this dependency" % pkg)
>

Depending on yourself seems wrong no matter what packaging backend you're
using, even if it isn't fatal.  Maybe this should be added to the general
sanity checks in insane.bbclass?

Ross

--001a113fd1eab10b80052da39e18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2016 at 18:19, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":7ss" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;P=
ackage %s rdepends on itself. Ignoring this dependency&quot; % pkg)<br></di=
v></blockquote></div><br>Depending on yourself seems wrong no matter what p=
ackaging backend you&#39;re using, even if it isn&#39;t fatal.=C2=A0 Maybe =
this should be added to the general sanity checks in insane.bbclass?</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113fd1eab10b80052da39e18--
