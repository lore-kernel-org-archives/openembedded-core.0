Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id C857E7318D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:50:07 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id n128so2996004ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8IWLEdfE73wF8w2mcXGw+4tlJJlie0XAtrX/QXxoRcs=;
	b=oXDer7uGSTiPk3x6s0uYc6+pnY3RZEHIFnio4CzsNlx78I3zdQKsrf49RS/WqqrznZ
	2E0zHHjK7P8aMJ5N+G2pX8tZXxnfKyTmzYeYgvSfRrKzomEg8n7ESjMVAXFR7PRDmRlc
	0kMm66I6In7tf9TuqIV+rTm+XgVP4XbeKKuN1qOzOuiVEYSgVd2/6bUk4EcaCNs4vUZm
	GR9K0Xw5KtZEJK6XXHJskITtcl9ipZoGd+/VmcGhxBYzKCujcr/xHIhSSTKmgzWIuwQo
	SfzFat4YjnpnedGknc/hAPKFl3nfmq0Qzfndd+vqb+s48VdM9PDD1xyicR6jSvh+qWce
	jkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8IWLEdfE73wF8w2mcXGw+4tlJJlie0XAtrX/QXxoRcs=;
	b=M+SButPwo6vC2ZoYRz+h1uMhWS+Pk05Og2h6F4zxq6uEJT4vhn5gsPDnttYV31DwSS
	OJXebzRwh0luip17G2j5l32On0Ht9zdODhqJYdzmueksYq1Qe/XUXbeSZdgtRxSc9YXc
	5FuFpOxKRaH6/M5ls3iXyV4c9PQI3eNt5jDcVwAQS2eEndSpu0oBYalRjDiFri6PPdFt
	zDjVQV7gMNuxFgl2Lnk0Cy74yNlkeKkYkAHppCNCLA+Ik6l2BVHFA+1n9zIsSU4lEFtX
	dXhrBcQO0xID4WLVfftIbMEe/zcNlm9Qzer1U0x9VLs3n4A3mvlZayCc0G3GANv2Vbt5
	cC6w==
X-Gm-Message-State: AEkoouvUBEEGXskWWVfwkkYtsFldIF7dSngo1FjcggldqQWXfjRZmg2WV5HjZsodtAsKhvXPLtbRfQfFmiKjVouN
X-Received: by 10.36.19.75 with SMTP id 72mr574103itz.83.1471539007781; Thu,
	18 Aug 2016 09:50:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 18 Aug 2016 09:49:47 -0700 (PDT)
In-Reply-To: <1471523878-32164-1-git-send-email-awais_belal@mentor.com>
References: <1471523878-32164-1-git-send-email-awais_belal@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Aug 2016 17:49:47 +0100
Message-ID: <CAJTo0LbyQ7Uo=fg1NRSjpnNFZOHci=3XAdGXzF0wCQoSE+FY2A@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: handle INSANE_SKIP for license-checksum
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
X-List-Received-Date: Thu, 18 Aug 2016 16:50:07 -0000
Content-Type: multipart/alternative; boundary=001a1145180ad51663053a5b5f0f

--001a1145180ad51663053a5b5f0f
Content-Type: text/plain; charset=UTF-8

On 18 August 2016 at 13:37, Awais Belal <awais_belal@mentor.com> wrote:

> The function populate_lic_qa_checksum() is used to do the
> QA test for license-checksum but it does not handle the
> scenario where a package adds license-checksum to its
> INSANE_SKIP and hence fails in such condition.
> This patch adds handling of INSANE_SKIP to the
> populate_lic_qa_checksum() function so it returns
> cleanly in such a scenario.
>

Is that really a sanity check that we want to be skipping?  What's the use
case for this?

Ross

--001a1145180ad51663053a5b5f0f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 August 2016 at 13:37, Awais Belal <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:awais_belal@mentor.com" target=3D"_blank">awais_belal@mentor.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":38j" class=
=3D"a3s aXjCH m1569da951ef93e97">The function populate_lic_qa_checksum() is=
 used to do the<br>
QA test for license-checksum but it does not handle the<br>
scenario where a package adds license-checksum to its<br>
INSANE_SKIP and hence fails in such condition.<br>
This patch adds handling of INSANE_SKIP to the<br>
populate_lic_qa_checksum() function so it returns<br>
cleanly in such a scenario.</div></blockquote></div><br>Is that really a sa=
nity check that we want to be skipping?=C2=A0 What&#39;s the use case for t=
his?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a1145180ad51663053a5b5f0f--
