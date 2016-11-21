Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2587560116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 17:57:44 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n204so361930008qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 09:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hZvGVdHqBdbap6sYA0CEcVhfajCw5UVCtPvCktDtI34=;
	b=Glq0Kyv0nb+7WQttAn2XRRawslaaVjLRi6ifWM/Z8PfTAhHZbDoipw0iffwhmnxAwd
	nR5yw1iJI7P1i/q8/nprX0Lxi4M881jiuJq42IWLtTC/uPdpMZqFSlZ6lVUFg/itbKNS
	a4lE8695UIrQJpPTiAG3scWRO6BddlB2iDExslQs2tr2ExprAO1IhtYSuYPD0PP3TpRD
	8GoI90KruXDBtVkmtBCVhlVBQdlAR+0qft02wzWf8bY3NnlBP8WkP9TLqj0sr7ckvIx8
	1YnqKk7o3vBXAO/L3WmQuh6GNukcPcOOKgH2c+1cx6ru0jdA+cv1Nk1nt1gNWQ7Voqcz
	KU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hZvGVdHqBdbap6sYA0CEcVhfajCw5UVCtPvCktDtI34=;
	b=K24pBF8U+1NsTCOIIbuvoTqD/vGGoxgppcw+n8nXcU7wgBwnasb//GYUNLuAa+PuiK
	ghKM0uHTQ52keVkLkr0oEvObnHw/l9QyEri+FJeQGbsNSMgHgiQZq8Mf0Tc7vO8m4/r4
	KZ/oMk7jDJ/t/XiShaKbki+suY92zbK+VG8qDsPNxAZzLWAxPutM0gxWvHFGxFDWfFlh
	FCT9vG0BOiAahY+Qv38kVri3UniIx8CflxJzX/Ccf4eeSv4A5ZYTZRRxZqkH3uWqYtV6
	uCH0W6u9OcgQe8IdTnRFoCYk+ZfwGoxfb/svfi5J1NfRT4Cru4WT0HwUJBs5dCWMq9FG
	VvrA==
X-Gm-Message-State: AKaTC02dKl7VZzNPSdMxQe7JRU2qUNT+dB0cyy70gUjioocGijpqcFPDZlRTjARSCh0dHbMLUlag2eX4JdOBXkvr
X-Received: by 10.55.8.20 with SMTP id 20mr19156208qki.3.1479751065992; Mon,
	21 Nov 2016 09:57:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 21 Nov 2016 09:57:25 -0800 (PST)
In-Reply-To: <20161116174748.26994-2-raj.khem@gmail.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
	<20161116174748.26994-2-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Nov 2016 17:57:25 +0000
Message-ID: <CAJTo0Laq+KdjYoNvTM3DV+X8aGGdfWyJM=1z830=8T1orbqaJQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] taglib: Update to 1.11.1
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
X-List-Received-Date: Mon, 21 Nov 2016 17:57:45 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60a51c5d0541d364a3

--001a114c9d60a51c5d0541d364a3
Content-Type: text/plain; charset=UTF-8

On 16 November 2016 at 17:47, Khem Raj <raj.khem@gmail.com> wrote:

> -DEPENDS = "zlib"
> +DEPENDS = "zlib boost"
>

This appears to be an optional dependency and pulls in all of boost for a
byte swapping macro, which whilst I appreciate is in the spirit of C++
isn't great considering GCC has its own macros that it also checks for.

Can we just fix the tests so they don't error if boost isn't present and
force it to off?

Ross

--001a114c9d60a51c5d0541d364a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 16 November 2016 at 17:47, K=
hem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1nx" class=3D"a3s aXjCH =
m1586e42ef6234754">-DEPENDS =3D &quot;zlib&quot;<br>
+DEPENDS =3D &quot;zlib boost&quot;<br></div></blockquote></div><br>This ap=
pears to be an optional dependency and pulls in all of boost for a byte swa=
pping macro, which whilst I appreciate is in the spirit of C++ isn&#39;t gr=
eat considering GCC has its own macros that it also checks for.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Can we just fix t=
he tests so they don&#39;t error if boost isn&#39;t present and force it to=
 off?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a114c9d60a51c5d0541d364a3--
