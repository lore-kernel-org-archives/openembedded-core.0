Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id E05566FF69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 19:57:53 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id x49so109946117qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 11:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r9fI0rQIjeoeLUaL4T3UWKSUh+59t79oNo1als/8mvo=;
	b=nnZznZxZr7ZOYRU1Lgsb5RI74j7ENT4ZUM/vSKMsQpJkTXkvXYlE0+xxALdQAQcqda
	+isFbcngY6940TbRpzzhX0shbew2jigD5yR6hys0aAFp5EXSNOHcG0AVJWD1+kOpV4Vg
	RaAEabxtkpAE1AlCSnSfIkw9kVkpZc3oMZZ4cjF6NrANkCwXwEXZ9t+Whf2fJ3lTwoQT
	9mwT7YwKc+eNBy1m3Dvs+iAl+wYZQ2SkoWed96y0HJFissuL7v1EKMJO6ho6YX9FF0ji
	+dmSuBN99E8M4R9qemcs0hbE2pVaPBDWqfDFK1fufOhhUkOJ9/DAUqAEA1zJsP2Y+hiJ
	IQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r9fI0rQIjeoeLUaL4T3UWKSUh+59t79oNo1als/8mvo=;
	b=K9gRt5nBpF/4pk1qpZVZ2fE9SBgTtAH8boU+ttNIP9beO0xCuueiZZ5t12eAw0Z1gI
	aAK36qT+zI1QCe3cqjdGCmH6DHWYh56Is8n6CjHbEAlzblZSgS5Rq5Bi5af4/wFCtWuW
	zOchS4DD0ZejimZggh7fS4Oy6xLiwkdQbmAQXWMt1teCd3/YhUHjXpDVFhrQutlYJV8b
	Zh4XgMRKj/2eH/7M5gSqXt6jS4+Vvy5aMvuDI7uxbVbeETyD0eRZkkPEtTBfbsoJUzRh
	2KVHmrzXcaaLt+zJ2K7yXkL2XBTG4BJs2sJ+GqpmH3gpBHG42LLMU/amMUYdVuh3iXRr
	UIPg==
X-Gm-Message-State: AIkVDXJR0/YwWRVfkbwZKxRwfiRHpb6IFDzLjCVHk7+c0AOgwfVpA7aswnNejmsR25qI6AIxvrl9BPukaQORVwkJ
X-Received: by 10.200.45.247 with SMTP id q52mr4825927qta.197.1484078273718;
	Tue, 10 Jan 2017 11:57:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 10 Jan 2017 11:57:33 -0800 (PST)
In-Reply-To: <1484070799-19031-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484070799-19031-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jan 2017 19:57:33 +0000
Message-ID: <CAJTo0LZA_r=H8_Nchybr+7+bZu0Ka35MXd_AqvbYNZ9Db6VRLg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] python3-pygobject: add PACKAGECONFIG for cairo - enabled by default
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
X-List-Received-Date: Tue, 10 Jan 2017 19:57:54 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf05303490545c2e610

--001a1139cdf05303490545c2e610
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 January 2017 at 17:53, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> Have onboard (onscreen-keyboard) in the pipe for meta-oe. For that workin=
g
> properly we need python3-pygobject build with cairo support.
>

Does v2 solve the problems that the autobuilder is seeing?

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-pam/builds/10=
23/steps/BuildImages/logs/stdio

Ross

--001a1139cdf05303490545c2e610
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 January 2017 at 17:53, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony=
@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex"><span class=3D"gm=
ail-">Have onboard (onscreen-keyboard) in the pipe for meta-oe. For that wo=
rking<br>
properly we need python3-<span class=3D"gmail-il">pygobject</span> build wi=
th cairo support.<br></span></blockquote></div><br>Does v2 solve the proble=
ms that the autobuilder is seeing?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra"><a href=3D"https://autobuilder.yoctoproject.or=
g/main/builders/nightly-qa-pam/builds/1023/steps/BuildImages/logs/stdio">ht=
tps://autobuilder.yoctoproject.org/main/builders/nightly-qa-pam/builds/1023=
/steps/BuildImages/logs/stdio</a><br></div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1139cdf05303490545c2e610--
