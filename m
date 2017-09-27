Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5A41B77DB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:13:07 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id w22so9119481ywa.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 05:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=7DUF+yBKr3wqIedvtcu9Fs1oJAu7K+v9XYqupUyjHFs=;
	b=qUX1RkB9LIxPJkFA92nKg8lvAQNtUKZn2W5AWo+M0bBl0azBopM+z/pUO0aHgFaTOD
	dDv7VuhFk60GUt8GdwTNJtKRhZIpPNF0lydP5r61mQNdtrkn/7PksPw3Otey0J6FtsUq
	9f7jiw8bXanGi9JodBBVXXwUAsw7Hz07CRJS/MDy6tRh6fl7/knyz4bPgkvTiSA3pBVh
	+zISLJpYe1JZ34lFSJUO6LPZEBBoCEQsHbH9Dw0P5NQwl5Ig7v0QRo3Bj/K2MH+Ng1FC
	wfRJXwPx0JM9K/KoFV517IjxIokTWA3+8aa6shXk7fDvnJ91TnjILqLQiKe9HWe3K8TS
	Wz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=7DUF+yBKr3wqIedvtcu9Fs1oJAu7K+v9XYqupUyjHFs=;
	b=E64qzIaVaPK8EzwmUkXbC1dRwQ91Iovf8T69p8w9c2kNRidGbpqlOGVZ6bWxZuZ5gc
	fuFl+a8rLqqnG0dIL0g7kDGzHUNKUD1DZKcF0WVgZt1a2BRmnfIL8gzq+JAFHUn7gVs5
	L1OukvJKHXhB0xsw2ihe4GZPZR3mcor2EIiL9NnXy624qgLixu34A66RCr8mjIw/Tu9i
	DNHmSdMJkgjG/P31JdD3H669jf3b/9uyVgEY0syhZBfW8CId+ZRN215RQ26OvU9BpZXf
	NPsE8nR4VeIbmZP9MkN2LU9O1wm8cVvpomCXrgieZ6dY0XmA6tS04FpXGkOVJdf3kX96
	buPQ==
X-Gm-Message-State: AHPjjUgSH/1IMRNh3R2KHTORI9VobO/SfD8ddRspCMaJzNYIacX1IXRm
	vN/iExh4QsKoFBPAayZF8CnNtvFb
X-Received: by 10.129.52.23 with SMTP id b23mr689305ywa.43.1506514389032;
	Wed, 27 Sep 2017 05:13:09 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54]) by smtp.gmail.com with ESMTPSA id
	z40sm4674704ywj.64.2017.09.27.05.13.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Sep 2017 05:13:08 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id u130so15915493oib.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 05:13:08 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDrCiTSKpctWGSk8uUrD22x8iyFFWBaonLI35MGo+M1sWkBGYBCRhA61gf+QLE7JY7LjzPZmwwKg+/GQTDeXoQ=
X-Received: by 10.157.20.233 with SMTP id r38mr800913otr.357.1506514387550;
	Wed, 27 Sep 2017 05:13:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Wed, 27 Sep 2017 05:13:06 -0700 (PDT)
In-Reply-To: <CAJTo0LaJmEy6EbDZ+uv92ESgLZx-wYB8mmKboJsP4pAR8uDA5g@mail.gmail.com>
References: <20170922235219.2785-1-sgw@linux.intel.com>
	<CAJTo0LaJmEy6EbDZ+uv92ESgLZx-wYB8mmKboJsP4pAR8uDA5g@mail.gmail.com>
Date: Wed, 27 Sep 2017 09:13:06 -0300
X-Gmail-Original-Message-ID: <CAP9ODKopt-a_Ur8GKMjBwsGo_S9XBFmwZj9K9V8=kxQ6x__MgQ@mail.gmail.com>
Message-ID: <CAP9ODKopt-a_Ur8GKMjBwsGo_S9XBFmwZj9K9V8=kxQ6x__MgQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wayland-protocols: extend to native and fix dependencies
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
X-List-Received-Date: Wed, 27 Sep 2017 12:13:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 9:01 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 23 September 2017 at 00:52, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> When trying to build a newer version of Mesa, a native version of
>> wayland-protocols is needed to build.
>
>
> Why does meta-target need wayland-protocols-native?
>
>>
>> +DEPENDS = "wayland"
>
>
> So how does wayland-protocols build now?  What was breaking?

Many host machines provides it; make sure to test in a host without it
installed.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

