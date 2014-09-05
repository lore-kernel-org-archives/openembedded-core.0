Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id BCDF3713D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 14:34:25 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id i17so12287100qcy.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 07:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ljjzrUo95sNOlrVL+PIAA6fuJ5rpsGw/pKMlWSxv7a4=;
	b=PIaJFyAl1w7I+uY+Rg0LN+3QOWcs7vklKGnAYumbfiNxdPlAcVhZsGFhwd4fjmJhdT
	tMQolCne5m9XQtqvdAT2IExWxmaU6M5c8Nm74dh2b8Ff69xwVY2DtZ1FPvWIbg7Yto8+
	x6eXR1uwygEb8/lZOGUGOoUIfJCNfdbvo5f9k8WtAanEsYJo9lTXUWE+Y3jd2mUiS30s
	U4uXldgk4FZ0Vreo1YUO4sVpYsHjELd+okHTgtmkamnvvMEfomjAwjPqBm+cE5kLua4c
	KAtHn8TSClFwNmctiwCI16aUoy0/C7CoqypBJ91ddq19/w8m9Mf8ynDzbWmbvOODOAl0
	y5Zg==
X-Gm-Message-State: ALoCoQmzqBIW47oF84ZSlpDZobJMD6oXvs7HF9tF2oO0yAAaRzlUT36ZiyDvidZs6V1eISZnK/li
X-Received: by 10.224.64.201 with SMTP id f9mr19709416qai.64.1409927665840;
	Fri, 05 Sep 2014 07:34:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 07:34:05 -0700 (PDT)
In-Reply-To: <1407407817-1034-1-git-send-email-bobadeshrikant@gmail.com>
References: <1407407817-1034-1-git-send-email-bobadeshrikant@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 15:34:05 +0100
Message-ID: <CAJTo0LasngY_+h1np9tR70y423MdJ0kOHPKA8iF7iy6B-oqRww@mail.gmail.com>
To: Shrikant Bobade <bobadeshrikant@gmail.com>
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pigz: Add dependency on zlib-native for pigz-native
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
X-List-Received-Date: Fri, 05 Sep 2014 14:34:34 -0000
Content-Type: text/plain; charset=UTF-8

On 7 August 2014 11:36, Shrikant Bobade <bobadeshrikant@gmail.com> wrote:
> When pigz-native and zlib-native are coming from sstate the setscenes might
> not necessarily run in the expected order. The problem happens when setscene
> for pigz-native runs before setscene for zlib-native. To fix the issue
> do_populate_sysroot_setscene[depends] should be properly set for pigz-native.

Can you explain what the problem is?  pigz doesn't perform any
operations when installing into the sysroot, so what breaks?

Ross

