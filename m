Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id BF0E1600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:47:56 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id bi2so11641502igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 04:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t7o62+Y5i01h1wyykxdh8tyUx/XDqGH691WpiQirM/o=;
	b=A+PWiDicrOviXo1IF8sM6eWN/IbEXunTz854R4t0QF3g0duzCWJ9NYglnQIfBohPFG
	ht227eAMG99J4EWBtSpKxWn3BBqP5ggXa3TroiBD5T9cuVisaw2AGC2RW6+rGvkScs/1
	qb99qJXkFyT3jlmTExQiZjfCyK6eHenXJ7us5AgwPGquxXF34GV1tWY9sAtzaQ3++V7O
	FI8reTdEJ6/SrY1pj51wbrzb+2/z1MqZBaI+F9ba7pwO8n9jJrDIWVIUYhtk/KN3vk3S
	ReZISyHHiVWezT+O8daLPU+hgO0NRxuB4nr7HdDCLVl6tv4bavlQr5kc1V+mKF1vVQHK
	wJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t7o62+Y5i01h1wyykxdh8tyUx/XDqGH691WpiQirM/o=;
	b=SNFUgVq5Tt2EIf8jqskYtTuoJnQJX7jiUiDVpvHwRu/5jfqG7M/DuJoe0Zh8uJrflS
	zKTTG4H3V8q8YEJdLye+rneypXjlmbiXOyHRKmnvKWEIIUzaHGDqtGNISkvKBRS6sYE6
	/7Xc7AuQwiAxvkQmKFXhX8pcY9DNwPmjym4WCe+XdZayHk0qtgXftVOAF9qYbBWotPXi
	X/GX8BbwgyOwd/ESdiRux2hU0QhzEV8qQ9tNocWgHUGaDPemA6O4xe2n2RSMJ2g/6QCS
	BxGWjOZFukbpkxsz+OHd2Q0Sd0/DuXR2S4CNu5hGlpojETXrVk8NMpAbskg4Pvymy+Gf
	7OgA==
X-Gm-Message-State: AOPr4FVrI/HudjKe3mOhJ6GqAZf08kffdDjjKYzLH0dcc9PQdMylr1d2xgvCEZ/v/Tbab592vezBTvdoqes0Qs5+
X-Received: by 10.50.160.41 with SMTP id xh9mr3750495igb.64.1461325675976;
	Fri, 22 Apr 2016 04:47:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Fri, 22 Apr 2016 04:47:36 -0700 (PDT)
In-Reply-To: <1461215114-5062-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1461215114-5062-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Apr 2016 12:47:36 +0100
Message-ID: <CAJTo0LZ8QS01A4eni=Ou5Yi_w7c=FZN0sRzaTaiaj5jQ5oEBEA@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Fri, 22 Apr 2016 11:47:58 -0000
Content-Type: multipart/alternative; boundary=001a11380a16d176070531116542

--001a11380a16d176070531116542
Content-Type: text/plain; charset=UTF-8

On 21 April 2016 at 06:05, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> +    cups-filters \
>

What recipe provides this package?

Ross

--001a11380a16d176070531116542
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 April 2016 at 06:05, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:=
fan.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":21o" class=3D"a3s=
 aXjCH">+=C2=A0 =C2=A0 cups-filters \<br></div></blockquote></div><br>What =
recipe provides this package?</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a11380a16d176070531116542--
