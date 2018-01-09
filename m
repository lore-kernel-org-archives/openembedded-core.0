Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id C0DC4783C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 10:20:00 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id t63so18012636iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 02:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ainlTqPZnJpwAxOGKM6Pv2veGiXRcZ+7RxPKQ/jHz7M=;
	b=JLdTFzJ8oiHYcPIlpuzO28MPcFjFMF68TqfifLTWwVcbOK6Wv6gC9PWJtQA5MPPL6X
	cvue9Yubnh8mhpYovFYSh5bY5d3bob+KtMTf4yB6ahecr3h5nMwJwOKEw7wI/0+t7+Ia
	FB5q0NhMZyOMcDt9Q3GbEq8rT/eaH7eEuR/yBd7voszUAsqUUNF+j+KAvMQT8datWm/C
	lDCBw1aDx+9eB8bEOS4A9iHiC21MxqGOsCfgtHrBOeSKyZq4vmjRnBX3lc+kn8JwUlZ7
	y4S/BEkwD81WmLKp1x0QPcbvbQ+seq4EByWb7CdYKDFt1XURNpCGWMclNTTENgWEqDUm
	TVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ainlTqPZnJpwAxOGKM6Pv2veGiXRcZ+7RxPKQ/jHz7M=;
	b=DTEO/XTWjEcKBoozP6Awzy5EUsrTdYc+Y9aulZRA8g0FTc6zSrScNdZsRi3abA+o++
	ycIHoOulhz8XIqWBwu0m5ID6af07Oegz8xK8yMyy0ShsRSr6oZwYzAsVjI4au1xwM8NL
	VdB/UtgmUHhNj8Em1l8SH9AUKjRK2TKyqU30TdJiaM8uaPa7YZ/isJVUKn8zdW1BWxEt
	mYCO01dVTUnz3x6GcBKe0W3b9336Tybf/FMtwId4BxrDr9AjV3oeN4Dt1DMLtNVZkoXK
	jo239cC8aTAgnnZwl/PzAfOD+Z1wr2fk0DBkZUVQoyBIanl4OE7T44vzSPf/2Jc0Mgu5
	Ivdw==
X-Gm-Message-State: AKGB3mK2fjT7dmyOxwQ2aRfes4//vER0tOLkVN/X5y2AoQ0y8KM6W/mx
	1OVKCNpKt7eMwA/4TTmVQ5pkcP5IjGLvnRLGfhpTHQ==
X-Google-Smtp-Source: ACJfBoupLrGhP7T+Qyu/5FSTqrVQ4S8FqOT7VHJWL5YfkHWwPPpk/EGprra4RM49Ct891GDRWAFpIYYcRmM+Ji6bRkw=
X-Received: by 10.107.186.139 with SMTP id k133mr14084967iof.208.1515493201794;
	Tue, 09 Jan 2018 02:20:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.147.193 with HTTP; Tue, 9 Jan 2018 02:19:41 -0800 (PST)
In-Reply-To: <d4370891-2188-4ad0-5abe-1aec68beeed0@linux.intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
	<20180108160021.4715-7-ross.burton@intel.com>
	<d4370891-2188-4ad0-5abe-1aec68beeed0@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jan 2018 10:19:41 +0000
Message-ID: <CAJTo0LbfsUq1QWR4Xmu-1HBV9Z6w_vyku9XcKgLTAGEoy8+3Bw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] avahi: remove explicit avahi-dev RDEPENDS
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
X-List-Received-Date: Tue, 09 Jan 2018 10:20:00 -0000
Content-Type: multipart/alternative; boundary="94eb2c07077af3f2bd0562554113"

--94eb2c07077af3f2bd0562554113
Content-Type: text/plain; charset="UTF-8"

On 9 January 2018 at 09:01, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 01/08/2018 06:00 PM, Ross Burton wrote:
>
> -RRECOMMENDS_avahi-dev = "expat-dev libcap-dev libdaemon-dev dbus-dev
>> glib-2.0-dev update-rc.d-dev"
>> -RRECOMMENDS_avahi-dev_append_libc-glibc = " gettext-dev"
>> -
>> -RRECOMMENDS_avahi-dev[nodeprrecs] = "1"
>> -
>>
>
> Cool, I was wondering about the necessity of this stuff.
>
> Thanks for cleaning up, we can also perhaps look into splitting
> gettext-native recipe into a sane set of parts, and use them in a carefully
> targeted way, rather than the current -minimal-native approach, which is
> hackish.
>

ross/gettext is slowly heading in that direction.

Ross

--94eb2c07077af3f2bd0562554113
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 9 January 2018 at 09:01, Alexander Kanavin <span dir=3D=
"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_b=
lank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On 01/08/2018 06:00 PM, Ross Burton wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
-RRECOMMENDS_avahi-dev =3D &quot;expat-dev libcap-dev libdaemon-dev dbus-de=
v glib-2.0-dev update-rc.d-dev&quot;<br>
-RRECOMMENDS_avahi-dev_append_<wbr>libc-glibc =3D &quot; gettext-dev&quot;<=
br>
-<br>
-RRECOMMENDS_avahi-dev[nodeprr<wbr>ecs] =3D &quot;1&quot;<br>
-<br>
</blockquote>
<br></span>
Cool, I was wondering about the necessity of this stuff.<br>
<br>
Thanks for cleaning up, we can also perhaps look into splitting gettext-nat=
ive recipe into a sane set of parts, and use them in a carefully targeted w=
ay, rather than the current -minimal-native approach, which is hackish.<br>=
</blockquote><div><br></div><div>ross/gettext is slowly heading in that dir=
ection.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--94eb2c07077af3f2bd0562554113--
