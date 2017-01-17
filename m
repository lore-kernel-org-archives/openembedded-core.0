Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id EE94571ADD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 16:24:17 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id l7so166217071qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 08:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BV7AT5oBWjl5XQsBiDdVQZKXN+mPCjjtCwdzsqsMFgU=;
	b=Fs9wf9xuGGBSJPFdpe7DlWCLWk552O7PsQ/ot7PhGodtMZFt1TOZQEIpg1qQKE9uhJ
	X6pjjTwbq9BEGRS02PFUMKgMgFBrPTm2PkF3mIJzxfEne4YzgcSLRh9yJDilk8A1ZBTy
	3jBckeYN01lxyD2yBTJJ/FdZ2jVDCUUX0aCSrjvK+2VV6/42W1cW1gP4BKwjLn8FUl7v
	sttNYC5wewAGezyZwzJVGzwNaErBWjRgkykeIAgBnDPCh0iis88IQ0ZCMLaHvDyUSlYz
	ZTE5oEnqr/dK0u78U3xGQInKcPf61dvvrzuew2eHevF5t3GaM51T24wmblwV4AfpLm8U
	U7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BV7AT5oBWjl5XQsBiDdVQZKXN+mPCjjtCwdzsqsMFgU=;
	b=MdIqCrA2ged7sm5U5j9h57kd8dyO1Y9mIGn5ze6UYb9+7ENGpF9QBjEgyoJ4kYGOJH
	7Ct/lainLsviUtZJic3B0H/vR53O9uXKhvLMEPT2OlTMgX8cLTGbU0Pk6ngBEUZi930S
	aqfgCTj+RsWUrEFp1/z7mMmvlZoGMC2CKKWx78LY5mOymfbwzEMjMeRvw6V5A7NKo/tp
	wnxV2LbNHzssxx1yyANMhZ3yMfAqiDJUcgoTG5utV+wi1vk+atZwi2UHONWzRPbJaiwO
	Z/dldWpJQ2kcJAPsHcL+/x6d8VTb8ygCoqiRojRRUf6N5zdK3Y/afAlJl3jKk3VcyAFO
	DZNA==
X-Gm-Message-State: AIkVDXLDH7a3PB8uZCbX9Cl6PuXLu45xJxKK32nf54qwCekNhOf1NAKg56pxtMMtVFzhAmAX3VueVRSshie4w+4l
X-Received: by 10.237.36.208 with SMTP id u16mr37146117qtc.105.1484670257359; 
	Tue, 17 Jan 2017 08:24:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 17 Jan 2017 08:23:57 -0800 (PST)
In-Reply-To: <1484670034-4647-1-git-send-email-maxin.john@intel.com>
References: <1484670034-4647-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jan 2017 16:23:57 +0000
Message-ID: <CAJTo0LbMNaU0wxJcsBa10wfWQbwYbjYG5=JjG_6S4qGoOJSamA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] busybox: refresh the flock patch
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
X-List-Received-Date: Tue, 17 Jan 2017 16:24:19 -0000
Content-Type: multipart/alternative; boundary=001a114104ce4c86b105464cbb4f

--001a114104ce4c86b105464cbb4f
Content-Type: text/plain; charset=UTF-8

On 17 January 2017 at 16:20, Maxin B. John <maxin.john@intel.com> wrote:

> Upstream accepted the flock fix with some improvements. Backport those
> changes.
>

Thanks Maxin,

This also applies to master, and I've queued it in mut.

Ross

--001a114104ce4c86b105464cbb4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2017 at 16:20, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":pb" class=3D"=
a3s aXjCH m159ad3b4b846b7ff">Upstream accepted the flock fix with some impr=
ovements. Backport those<br>
changes.<br></div></blockquote></div><br>Thanks Maxin,</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">This also applies to maste=
r, and I&#39;ve queued it in mut.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a114104ce4c86b105464cbb4f--
