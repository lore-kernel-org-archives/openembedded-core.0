Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id BA5DC60110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 12:16:51 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id y9so22612013igg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5+MgHRa85KaugcX9TiKoAsjzyTpPycGyVT8kpbS0WlU=;
	b=jKNpOIFZUNC4n1ChpbkObyb4QBAHh3MXjACd63GHCTwLw88GyDdtIQCVL4SdbWDX0+
	ADXh0rTvfJAgkBsTa6QilwXqSN/GuzsZS9l41QsxNYKV7VoKtpaPst6aVM/J3Loe9UBF
	ByCs1CDOfrMGOyli8QoAEosN6yWGON3WEOo+pjzXxzZ4/f0gCxbE0aXKcCRfN6YiXO0a
	dLTiNwtojWiUTHBdCXt1IjyFB0te4ClrTYvFXZ+qGwIcZb+naCKDViiXPWEGU+s8BATx
	UOcBPRjm5HfozbK2sfHQQM66XcL4J2md5Csmehzdlqml+pYJAiUojpwYxBRqMTByV2zZ
	AueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5+MgHRa85KaugcX9TiKoAsjzyTpPycGyVT8kpbS0WlU=;
	b=ZRnJHU8iE/XSZaEy0UiurGWa+1x7+elmbtvGcaN29/yVbrXxhxDURYJWQ5qX986Ci9
	1sB2m3ILEnKRwkuP6xHYl0D17Kcq8jKDTB2RnXp/BOd2jOhpPF0jupdBUXX1jvkaHgTI
	f340vtAMKxXdxqE6WQJ6RTkhWhhXK19nR+2gtZrtsMpDdO8CZdIrP3yLZ+WAp0IS5jin
	3Dc45IVJjtlH/HSgcAkqJ2ycBnjsv8ZKIfR6FAScBXcqlVOQzmC+dRpAuyGF5HDWySPa
	mBGEC/0q30D7uvKgHJcvLDRTNYk3XKB/skH6RRjlbh/MS7Ws2AllHg7F2iZD5OXPgSVg
	gLyg==
X-Gm-Message-State: AOPr4FXwIbbCLeMGpC2kMTWiPTzsbQvzs2LkpdfoPdFtvJZsf5uk8NvKC/CB3E1cP0l6mrZ51rchXNjejMz8B2ZN
X-Received: by 10.50.155.67 with SMTP id vu3mr17816296igb.52.1460981812549;
	Mon, 18 Apr 2016 05:16:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 18 Apr 2016 05:16:33 -0700 (PDT)
In-Reply-To: <1460979423-6171-1-git-send-email-catalin.enache@windriver.com>
References: <1460979423-6171-1-git-send-email-catalin.enache@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Apr 2016 13:16:33 +0100
Message-ID: <CAJTo0LbTRM37b4rC2Zq8mxEvDLrXCpk1D7w-WeeDW6jm=bJEsA@mail.gmail.com>
To: Catalin Enache <catalin.enache@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: CVE-2016-2774
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
X-List-Received-Date: Mon, 18 Apr 2016 12:16:54 -0000
Content-Type: multipart/alternative; boundary=001a1134dbecf600360530c15571

--001a1134dbecf600360530c15571
Content-Type: text/plain; charset=UTF-8

On 18 April 2016 at 12:37, Catalin Enache <catalin.enache@windriver.com>
wrote:

> +From b9f56d578ebfd649b5d829960540859ac6ca931c Mon Sep 17 00:00:00 2001
> +From: Catalin Enache <catalin.enache@windriver.com>
> +Date: Tue, 12 Apr 2016 18:23:31 +0300
> +Subject: [PATCH] Add patch to limit the value of an fd we accept for a
> + connection.
> +
> +Upstream-Status: Backport
> +
> +By limiting the highest value we accept for an fd we limit the number
> +of connections.
> +
> +Author: Shawn Routhier <sar@isc.org>
> +Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
>

Please add a CVE: tag into the patch identifying the CVEs fixed (CVE:
CVE-2016-2774 in this case).

Ross

--001a1134dbecf600360530c15571
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2016 at 12:37, Catalin Enache <span dir=3D"ltr">&lt;<a href=3D"=
mailto:catalin.enache@windriver.com" target=3D"_blank">catalin.enache@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":ne" class=3D"a3s aXjCH">+From b9f56d578ebfd649b5d829960540859ac6ca931c=
 Mon Sep 17 00:00:00 2001<br>
+From: Catalin Enache &lt;<a href=3D"mailto:catalin.enache@windriver.com">c=
atalin.enache@windriver.com</a>&gt;<br>
+Date: Tue, 12 Apr 2016 18:23:31 +0300<br>
+Subject: [PATCH] Add patch to limit the value of an fd we accept for a<br>
+ connection.<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+By limiting the highest value we accept for an fd we limit the number<br>
+of connections.<br>
+<br>
+Author: Shawn Routhier &lt;<a href=3D"mailto:sar@isc.org">sar@isc.org</a>&=
gt;<br>
+Signed-off-by: Catalin Enache &lt;<a href=3D"mailto:catalin.enache@windriv=
er.com">catalin.enache@windriver.com</a>&gt;<br></div></blockquote><div><br=
></div><div>Please add a CVE: tag into the patch identifying the CVEs fixed=
 (CVE: CVE-2016-2774 in this case).</div><div><br></div><div>Ross=C2=A0</di=
v></div></div></div>

--001a1134dbecf600360530c15571--
