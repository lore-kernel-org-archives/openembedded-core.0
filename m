Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id C8755786DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 16:02:29 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id u62so14027791ita.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 08:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JRgLkdcPB4WO5cnQSbbu3mC5fp48gdOqF70xNCAL+X0=;
	b=coSjnH+zuj+7IDkNLuYIBfUXSny1nVSQBxv5tZagpldXNaC1qWBs2n8ftrJ6/32RqH
	Am3hvhheAEkY3GkTcLRSGVKq+zQqV43HR3sZCHj1er4Ey6OfDLk7XMDWbjww5FTZf+RB
	RN68yxWHVz89kQyZ2enyFfsQ5TF8yM9bd47uiwp1Ngt1j8TzPduI+fkNHjML7l+gcwWp
	VLDHnNYmG+uYSYLxm7P1V3wPTaDvrdkArIR8VGVhqRPRSafIeIviqtysNWICuoz0MFXz
	AZAQNlpeL/Xbset5v3aPuM2H7GUHOwqC0CLyCxYP2aEydSF8NmS8DAYCja4WCTiQQPdY
	qYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JRgLkdcPB4WO5cnQSbbu3mC5fp48gdOqF70xNCAL+X0=;
	b=lRt7V59l3sRxvYnvG7jEZ/qKh+B5EmGCvMEw7VxuhS+rH537nyY/i4gxkNvZNLMRQP
	LT0ineOX3nZgiG8OheSHNRrAphX6Rc2N3QWQTxl4ILdaiVw7SdN2rjy9YzN3Aoim236W
	SAFC8RmvaZmOe0Nl6gmedwSYyXaTpBtkqXBkbG7mD0XqVj73iirAGaiDV25kFOlQOIia
	ZyXG8pup/vOVp1OQFDc1ns+Si8S/AaaBF0Hhmh+9cRzJSJLw0RVdktTsgjbEEV6fVV38
	no8w0B0vZ6b9SqOQbJIIC0FY+74tb70ynq+fNEefBMLBKay6ORV706aBhn2Q+lrA/z1F
	y/FA==
X-Gm-Message-State: AKwxytelm09xrSKPN+NAXrETC6WNL35fwvTPvxcL0B/lKBbz8g9e2o94
	viGfUhV7q1HvBOr7dAHCD0DjUe1WN+Ko3Cdpipvopw==
X-Google-Smtp-Source: ACJfBosyXuQIrmZL7Ufb94KONfHnLWwfos/l2TGhF5jxfPJhVgrS9IluBmFpnMcuNleK1dOgTH/gL5s/COY1uTVp8ss=
X-Received: by 10.36.85.206 with SMTP id e197mr20668472itb.124.1516291350646; 
	Thu, 18 Jan 2018 08:02:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Thu, 18 Jan 2018 08:02:09 -0800 (PST)
In-Reply-To: <86e573b5-bf02-2046-d67c-4c696d6aec03@pr.hu>
References: <20180118123804.2465-1-ross.burton@intel.com>
	<20180118123804.2465-2-ross.burton@intel.com>
	<86e573b5-bf02-2046-d67c-4c696d6aec03@pr.hu>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jan 2018 16:02:09 +0000
Message-ID: <CAJTo0LZ4mgBK-c17_S2z_QM44VqFYkCV-w2vVucrE0V8YmhzWA@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cmake: use Ninja by default
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
X-List-Received-Date: Thu, 18 Jan 2018 16:02:30 -0000
Content-Type: multipart/alternative; boundary="001a1139924254e57305630f1746"

--001a1139924254e57305630f1746
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 18 January 2018 at 15:02, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@pr.hu> wrote:

> 2018-01-18 13:38 keltez=C3=A9ssel, Ross Burton =C3=ADrta:
>
>> This changes the cmake class to use Ninja instead of Make by default.
>>
>
> Can we still use "oe_runmake [-C subdir] target" with Ninja or
> is it considered a broken build and forced to use the "Unix Makefiles"
> generator?
> I have a working mariadb 10.2.12 recipe and the native build is trimmed
> down
> to the absolute necessary pieces:
>
> oe_runmake import_executables
> oe_runmake -C libmariadb
>

Because you're doing -C I suspect you'll need to force it to use makefiles
explicitly, but you can tell cmake what targets to build and the target
names are universal so if you can find a way of doing that without -C then
you can tell cmake to build the specific targets (OECMAKE_TARGET_COMPILE
and _INSTALL)  and then the choice of generator doesn't matter.

Ross

--001a1139924254e57305630f1746
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 January 2018 at 15:02, B=C3=B6sz=C3=B6rm=C3=A9nyi Zo=
lt=C3=A1n <span dir=3D"ltr">&lt;<a href=3D"mailto:zboszor@pr.hu" target=3D"=
_blank">zboszor@pr.hu</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">2=
018-01-18 13:38 keltez=C3=A9ssel, Ross Burton =C3=ADrta:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This changes the cmake class to use Ninja instead of Make by default.<br>
</blockquote>
<br></span>
Can we still use &quot;oe_runmake [-C subdir] target&quot; with Ninja or<br=
>
is it considered a broken build and forced to use the &quot;Unix Makefiles&=
quot; generator?<br>
I have a working mariadb 10.2.12 recipe and the native build is trimmed dow=
n<br>
to the absolute necessary pieces:<br>
<br>
oe_runmake import_executables<br>
oe_runmake -C libmariadb<br></blockquote><div><br></div><div>Because you&#3=
9;re doing -C I suspect you&#39;ll need to force it to use makefiles explic=
itly, but you can tell cmake what targets to build and the target names are=
 universal so if you can find a way of doing that without -C then you can t=
ell cmake to build the specific targets (OECMAKE_TARGET_COMPILE and _INSTAL=
L) =C2=A0and then the choice of generator doesn&#39;t matter.</div><div><br=
></div><div>Ross=C2=A0<br></div></div></div></div>

--001a1139924254e57305630f1746--
