Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 817B5771AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 20:13:51 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id f6so92825964ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 13:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sCyVEy/76JrfhX33KSSgtOIpS/rMM0sg2h6Z4vl4rPg=;
	b=VSFdTH1mprZtI4lVidcorgQA525dgNYl3abx/FsBulq1uuWXgQMRIPWhdvSOs8yin7
	Z6lQv2xYv2m63rdNKaogNze1GKM4qB8bWGKbBCf+uYT+cmtMMwM6Z+w1sBBSuX8ggnvO
	6GwdJH57LigZ88JoO+Ywskf5vxGKclmCqcoN37BVO6k61wni0wl9b8Y5VxMsPaNoukhE
	uvr3UEjcVFkd2NKsCb9/x22T6EV30pEDq2EixkaSzYF2R8Kr9S75rw2Ert6XFAJAWBGH
	qnKJXn97vfIL7An4aud+nUK4MB8SzcqXxpO/seTSkybEbBqN5uBrCSZK7nqQSA1FzEvk
	XJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sCyVEy/76JrfhX33KSSgtOIpS/rMM0sg2h6Z4vl4rPg=;
	b=TuqX/V9ODB9EHr3WFWHdCVU8AQ8RI0FBRHTGJdegIkKoY0j/h8/+61BG69N95B7hZV
	wItPKExkbEaYZ/Uwd2xsQlmzaJHgAiGgs86lqvMPWkP6l0LekBL9uZLMJanyoZrmXB8I
	wCzYcOYooUBKv7qzEeguZNgy7pEhjTdqaCvx2Tg2qjoRLlE6llheN1pL4HSlvXkgjiLv
	uDClY5WmGXdhG05oBrg5tsMApOUmmlY5no6M22aT7ZC8D/WDDVNKj4HSZX9FYgXF2f9b
	UKfrOSN76CuZ/6tvIsTiGgo1TvxgfdfDyjaOY8xFIx3mMmBT8Sd3ZXrgnYYD1f8Jqq8a
	39sQ==
X-Gm-Message-State: AEkoouvXt4f7B2bmEyrxAN4hpq7qQk8j1ZLT00kuQLH5e8FX2WOcqMoJhDgu/wTA75u6y46Elghbwb2MP3YNBhfs
X-Received: by 10.36.121.204 with SMTP id z195mr20640955itc.22.1470687231925; 
	Mon, 08 Aug 2016 13:13:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 13:13:31 -0700 (PDT)
In-Reply-To: <20160803074939.GB12566@mbabyjoh-desk.ger.corp.intel.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
	<1468332463-4154-6-git-send-email-maxin.john@intel.com>
	<CAJTo0LZfeU9zAdk2tEF9yxPY-4OZ_3LCH_U7e4ggHh1Q53G+jg@mail.gmail.com>
	<20160803074939.GB12566@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 21:13:31 +0100
Message-ID: <CAJTo0LYSyg0E-KpL5v+wVro-5XqC+tMKKQSeAohinxKL+Y6jjg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] tslib: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Mon, 08 Aug 2016 20:13:51 -0000
Content-Type: multipart/alternative; boundary=001a114aa46608f8380539950e37

--001a114aa46608f8380539950e37
Content-Type: text/plain; charset=UTF-8

On 3 August 2016 at 08:49, Maxin B. John <maxin.john@intel.com> wrote:

> Haven't tested this because of the specific hardware requirement
> (touchscreen). Since we
> remove the pointercal recipe, I thought it is appropriate to replace it.
>

Just had a look and we've finally shed the last pieces of software from
oe-core that still use tslib.  I propose shunting tslib to meta-oe along
with the pointercal recipes so the dependencies are still valid.  Modern
software tends to use the kernel drivers directly, or libinput, instead of
tslib.

(tslib still gets pulled in via the tools-testapps packagegroup, but that's
something that should be removed from oe-core in the process).

Ross

--001a114aa46608f8380539950e37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 August 2016 at 08:49, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ou" class=3D"a=
3s aXjCH m1564f619260d8a7c">Haven&#39;t tested this because of the specific=
 hardware requirement (touchscreen). Since we<br>
remove the pointercal recipe, I thought it is appropriate to replace it.</d=
iv></blockquote></div><br>Just had a look and we&#39;ve finally shed the la=
st pieces of software from oe-core that still use tslib.=C2=A0 I propose sh=
unting tslib to meta-oe along with the pointercal recipes so the dependenci=
es are still valid.=C2=A0 Modern software tends to use the kernel drivers d=
irectly, or libinput, instead of tslib.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">(tslib still gets pulled in via the tools=
-testapps packagegroup, but that&#39;s something that should be removed fro=
m oe-core in the process).</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a114aa46608f8380539950e37--
