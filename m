Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id BA0D9731B0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:07:57 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id b188so2139289iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=kBEOHrHrqLU8lgD8JSbhmCMDLuCct17qkM7gvlhP/Ng=;
	b=o+WdVOVn0zPAiHJmiuvZhqU/wyYOL1LL0drebRk89qBGDQloagWZDSkThw1zDStCEo
	cAvcxTs/q/2kv51GDjRMkntfq0iW+CDEPsPkxV0A26T2EcdbztSdHG9CEdLuZKvVQuR7
	exEmDibdF0n5+OIiaCWjTCAafyNsjyS0bt3DwA7jGo+MZ27ukn1LgINdn54DW3rEaYtM
	AJTAlq4ifxekKz1G7YIKdzxrjptnjGnNfcT3qIz1QnGB9DYlm5Ffjb1HBpLe6FciEIMV
	oE/L5/Db0Qqo8osTihHfAjbx1KceNE30nbxKQDktynzQDXrK8gushqfS+zRsJQS0VcTV
	crMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=kBEOHrHrqLU8lgD8JSbhmCMDLuCct17qkM7gvlhP/Ng=;
	b=kJpq2boNQNruNfU092xRBUja506yl8SaWv9VRurvQL0g0DFesiOP0k+GDfE2LJDRaP
	m0ce7JeFPPebdcU04XlLtm9aExn23YvstMMAZJvV/0zF0pjGQu48cy74ZLAmM04w80Q0
	R/+t+PWMO/th+462NHzxpO6gNGFZGO+lG5J1mi+wvBT8ThjFmTJ0dzNinLsvWe++qJDe
	FkC9L57goyXECjspq31Fd4agL4hMQ+QWgIxmHJpBUjyb8sMDvPsTuXxL1r++DoDezL7Y
	H9REjWyNwreDdRyh5txC8e5IzD7rMmR0bqHL0umkrcRgfd1n93n9Ct6RklzinX/WjY3G
	uDgQ==
X-Gm-Message-State: AG10YOR1+K9W/GE1SVvmvO5vs38ckkz6wVU50NIZ5B1ZVemaD5vzmyuKTtOTce/rQpjaiwqjsTgvRPHnOlfHeg==
MIME-Version: 1.0
X-Received: by 10.107.3.220 with SMTP id e89mr25165379ioi.99.1454929678785;
	Mon, 08 Feb 2016 03:07:58 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 8 Feb 2016 03:07:58 -0800 (PST)
In-Reply-To: <1454928241.3938.13.camel@open-rnd.pl>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1454926183-22439-4-git-send-email-maciej.borzecki@open-rnd.pl>
	<CALbNGRREKAXAW_0Z1e-_y21G477u9DrfKuAL8Sf1GL=ErDNi2Q@mail.gmail.com>
	<1454928241.3938.13.camel@open-rnd.pl>
Date: Mon, 8 Feb 2016 12:07:58 +0100
Message-ID: <CALbNGRSeKhSLWS8qxM5OFc-Fe8=mpuCKgx1j8ejB1XgGj7MYsg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] systemd: extend PACKAGECONFIG flags
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
X-List-Received-Date: Mon, 08 Feb 2016 11:07:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 8, 2016 at 11:44 AM, Maciek Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> On pon, 2016-02-08 at 11:21 +0100, Andreas M=C3=BCller wrote:
>> On Mon, Feb 8, 2016 at 11:09 AM, Maciej Borzecki
>> <maciej.borzecki@open-rnd.pl> wrote:
>> > We currently ship a rather full-blown setup of system. Very few
>> > configuration knobs are actually exposed through PACKAGECONFIG
>> > flags. This patch adds new PACKAGECONFIG flags for some finer tuning o=
f
>> > systemd's functionality. By default most of functionality is disabled,
>> > with exeception of:
>> By disabling all those you kill huge amount of functionality by
>> default - which at least my images need. Could you choose default as
>> is and cut down your images please.
>
> The default built pretty much everything, including machined, backlight h=
elpers and all
> the other cruft. It would be great if we could come up with a sensible li=
st of defaults
> and let people extend it as they see fit.
>
> Since it's the first version of the patchset, the intention was to gather=
 feedback, see
> what people use, and update the flags in v2 accordingly.
>
> Can you list the features you need?
From a quick glance firstboot / logind / bootchart / machined

But to be honest: I am not willing to spend huge testing efforts for
you saving a few megabytes. Don't misunderstand me: adding
PACKAGACONFIG knobs is fine but changing defaults totally is not.

Andreas

