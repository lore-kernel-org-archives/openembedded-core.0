Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id F2ACD6010D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 07:46:57 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r201so21811100wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 00:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=1UUW180izUNG+Sia19TOFTU7QjrxGemdtGt1TKOWCnU=;
	b=VU3AguFMnRxW0oxAte3s9ROLb09+1SDwEbSh5z54KcRDha4kbV+LNBQGMPRE6IaPbV
	X2XeGwOuU0/IYHpKlcZYxe+XlHpVKyR0fDdyZglgIFFaR/U2orwJQylzXk2IEPvX38oF
	HnlKLzcpuUT03H+KlB3YahgEJF57yk4bSadgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=1UUW180izUNG+Sia19TOFTU7QjrxGemdtGt1TKOWCnU=;
	b=dJmvDWZ6dzstCmpKs1mcUV9b4Q0pmH7FEt695ObnR35h94JOuYVf/rZcDqr7c5u/bg
	/OBtPez+FM8UnZ6YZ28C1lFLMBKavztMNwY/zF8icwPFvwlhHhoHajzSGwqrOEjOuK+m
	ddSpJSe6ybHaKrbW+opoeyGgbpW7vM8Qa4516v5dNGJaZTsVXjjrK/iXa9LKLycAWi6O
	y4anik353wHQFOhKB/OQflgEliVD1pYl4zPzg/IxoxZEnAhm0q+mZvycgin6wPu3+fKt
	6X2oClr0PWeWFVDYBsy2EpXcptWkc12MwWmOJP2Aqlz1M4xt4j+08i/vZCYYL+s9Frp+
	fVkQ==
X-Gm-Message-State: ALyK8tKcWOsbVfAw1qowPxdTEZd1i1fyPRsga9nYl/mopIopeXNrfa3yNC8tPOJeNmcBHDUR
X-Received: by 10.28.63.134 with SMTP id m128mr5505860wma.97.1466322417444;
	Sun, 19 Jun 2016 00:46:57 -0700 (PDT)
Received: from [172.20.0.210] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	bh7sm25188317wjb.22.2016.06.19.00.46.55
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Jun 2016 00:46:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen.kooi@linaro.org>
In-Reply-To: <1466274078.3319.0.camel@linuxfoundation.org>
Date: Sun, 19 Jun 2016 09:46:53 +0200
Message-Id: <24C09066-C7EA-47A6-8771-02E59FC60525@linaro.org>
References: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
	<0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
	<32A5DABC-B911-4C2E-B9CD-A520BCA395EC@dominion.thruhere.net>
	<1465045799.13979.33.camel@linuxfoundation.org>
	<F5F5FC08-7E44-4648-A769-EC4D8F4D9EB7@dominion.thruhere.net>
	<1466274078.3319.0.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "image.bbclass: don't execute compression commands multiple times"
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
X-List-Received-Date: Sun, 19 Jun 2016 07:46:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable




> Op 18 jun. 2016, om 20:21 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>=20
> On Sat, 2016-06-18 at 15:08 +0200, Koen Kooi wrote:
>>> Op 4 jun. 2016, om 15:09 heeft Richard Purdie <
>>> richard.purdie@linuxfoundation.org> het volgende geschreven:
>>>=20
>>> On Sat, 2016-06-04 at 10:41 +0200, Koen Kooi wrote:
>>>> ping 2
>>>=20
>>> It would be helpful if you'd cc'd the person who's patch you were
>>> suggesting we revert. I added Sasha to cc.
>>=20
>> Since the original committer has shown zero interest in responding
>> here or fixing the problem in the past month, can you please commit
>> this? This fixes a clear regression, which alone should have been
>> reason enough to commit this.
>=20
> Did =
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D7028192246552f
> d9e4aa3674da9c30670fd4ec86 fix this?

Don=E2=80=99t know since I use OE, not poky.

=E2=80=94
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

