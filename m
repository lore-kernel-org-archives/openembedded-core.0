Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 971BC71A6A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 16:06:40 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n21so384335829qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 08:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KafLp5oMnXotEHcuX5KKhkKgElDdcAJNTwEbGeOtEgM=;
	b=ff4P6XIGr1j67SEuo7S9nHwwl2lENmLKRvbzuLtFAO6aiIwQCU0L41u0eGLaFCqnnF
	09pIMibWhCEiboyA0WyodEqZuSOGITATSDu+3nhS1scerJUMXQaLCHlRDyi1xNXu1yAS
	K7ZmPgA5ypfpQ1+u1C3Aa4AKz+gSCxlIbOGg3NlcHVrlyvahGuLEG3EU7ykXvoYnLtcI
	ad0eatG7k1TOXTxip3OfSbRHKUdT7HAUlzo63JhFxkqrPNaF/lT+hzFzs2uTAlfpjxCx
	HgNu3WDj8xs2SRNDOxJ9AWcvsfqknoeQEQ9IbfZ4oBfMdd8nw27fL5IphhwAKjW9n7wk
	gyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KafLp5oMnXotEHcuX5KKhkKgElDdcAJNTwEbGeOtEgM=;
	b=TxlG/t3yQ5z6J86SqZxtNhGHHyM4QyaI73fU4m2d3s989ZHrR9DdkOfUgxQbdIboCU
	A2YkvZlCcFJyBzGDsQop828MqfQWB7DTMBySeg4hApk7h81/VGoe5nHpL/OdUBZwtE2f
	/i+K1ofzU4rlF7hxyDuv1gJVvlrpyRvveaOyofzL87CHBAinIW+TkasoPlKpZ0u02tvd
	lUmlWQjdOTfIHtIPPn7TOFW3ilkXmFYZX4f6/tZEfU2GV5PC/aCqwPSl69mEzu5YOpuJ
	xJ818HoxhygOXXBufbIQ9VEIDcuIF/qE8mL3Y5pdAQJ8dDTHgy26uT1L/18/ygwFXhQ5
	YSdg==
X-Gm-Message-State: AKaTC00LeQJB51LGMrMILrruozqmj5YcVdG5S5h2KIxPP55XHiH9In57ad+t3pMoo2rs5luP02n6VEsMeUCGiqFT
X-Received: by 10.55.75.17 with SMTP id y17mr47497085qka.26.1481040401725;
	Tue, 06 Dec 2016 08:06:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 08:06:21 -0800 (PST)
In-Reply-To: <26165659-66e8-f334-2035-1b50001524cc@opendreambox.org>
References: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
	<1480545786-5069-3-git-send-email-obi@opendreambox.org>
	<CAJTo0LZxQO7B6V=MK9+XE1is=jNDFut8Fq+q7S9Mrov7FrLX5g@mail.gmail.com>
	<26165659-66e8-f334-2035-1b50001524cc@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 16:06:21 +0000
Message-ID: <CAJTo0LYr1fUAPThGvLmWT_Jf0A+fzA302xHWfw4+NkY0d0FGGA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] keyutils: new recipe (version 1.5.9)
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
X-List-Received-Date: Tue, 06 Dec 2016 16:06:43 -0000
Content-Type: multipart/alternative; boundary=001a114a88c80b64d50542ff9798

--001a114a88c80b64d50542ff9798
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 16:03, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Apparently there's a recipe in meta-ivi which already has a fix. I'm
> going to merge both recipes and resubmit.
>

Thanks Andreas, feel free to just send v2 for just this patch, as the rest
are sitting in my staging branch already.

Ross

--001a114a88c80b64d50542ff9798
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 16:03, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ys" cla=
ss=3D"a3s aXjCH m158d4e1ab08371af">Apparently there&#39;s a recipe in meta-=
ivi which already has a fix. I&#39;m<br>
going to merge both recipes and resubmit.<br></div></blockquote></div><div =
class=3D"gmail_extra"><br></div>Thanks Andreas, feel free to just send v2 f=
or just this patch, as the rest are sitting in my staging branch already.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a114a88c80b64d50542ff9798--
