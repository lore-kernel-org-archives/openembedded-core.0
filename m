Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB6176D9AB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 14:26:28 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id f18so5764397lja.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=yTHrLgBduqIEAkRO6v35m3gjNM5a1phZupy9+GcGLGI=;
	b=K7JAJXgV64nUIoSoTrSTNmY/EBnv+RVDJWcQKrF8Z+An4cC4BWzQIuKJNxBiQxZ4Ep
	gVPjnEhT1VMR+3hVRK+YpE9IvW/u7ly1M0XvQoJxZpmfoN2J6Z8XYHNh550RjhrhcU7F
	lnULMUEqWT3GjTgyFKvEWMYQQQctFpHVye3PyKQgBmpTJa5YnVnbjA/25+Ui3DihOYHU
	EauQsNPpmiBm0z+VIf/QmTIzShnB8mG+V9ai+HlLPV/UpU4SuK9ECzy33KfhdKFj86Eq
	F/S1z64sAFZEs1v4GCOe5R4EimVvFyViNwt8CoVFCHU4O5EGScPQTWhCRjjV528MkfN6
	J4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=yTHrLgBduqIEAkRO6v35m3gjNM5a1phZupy9+GcGLGI=;
	b=tiNKMSAaaBVgV5hhV0s9BmhO4VcQczYEE8/V5MCL6EUFkGRQYxVVOD1BDeGWBaZ1oS
	MHPR1wCxV3bfsDeSUacLF5B9XIfjk0izrq+4vvSeLvzB6VkQhmcnhIYTk8LPLfARdyKs
	iU8YLKazkxKX0RQACOLjzhV7BCFSBMbwiF1/7YLuIjDLtlvHWBx3I8co+lsJnfDSLuaI
	U0YxFnUmTJNL5RUDCFz/qgSy2x0mNB+seynZk+7AlGwsy2eJ3SU24qmwBxE9C5FDXERM
	o0rg/64ULuUO6CxnhZtMk7ThmBQrv+BxOWf4gNPBjV2tX116BX24imV0pJYB9W2y4XzS
	MA4w==
X-Gm-Message-State: APjAAAUW8kUbJ12vx9aqTKwsFKUcGD0KQEVTUMoxm7zy2WjtkvG6xk07
	he+ty+Wl/JgOiG1RxuWLvzGcvmQ2U5g=
X-Google-Smtp-Source: APXvYqxtRl5nrgkkXHK6JPMBK7Qwb2EwzxY/Rt1y+Wv7ADWczTrL/tnQM4+g2cSr4YLf5Wo8j+bzXQ==
X-Received: by 2002:a2e:9196:: with SMTP id f22mr32363970ljg.82.1554042388643; 
	Sun, 31 Mar 2019 07:26:28 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id s16sm281795lji.61.2019.03.31.07.26.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 07:26:28 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190331004115.16429-1-open.source@oleksandr-kravchuk.com>
	<CANNYZj8hm5szOHGPijdQ3HMnwKM8qpOfH6ZQQ+sDA1SQMzK5Cg@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <1a8906b2-47e0-bd3b-30c4-0e82f3877e60@oleksandr-kravchuk.com>
Date: Sun, 31 Mar 2019 16:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj8hm5szOHGPijdQ3HMnwKM8qpOfH6ZQQ+sDA1SQMzK5Cg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: update to 1.43.0
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
X-List-Received-Date: Sun, 31 Mar 2019 14:26:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

> 1.43.0 is a development release.
> You can use 'devtool latest-version pango' to find out what the latest
> stable release is (facilitated by 'inherit upstream-version-is-even').

Aha, nice. Thanks for the tip.

> BTW, would you want to be the maintainer for some of these items?
> You'll get patches from Automated Upgrade Helper whenever there is a
> new version. YP is struggling to find people for this activity; many
> existing maintainers have become unresponsive.

Hm... I would love to help the project more, but it's better be
something I am familiar with; also I would prefer to start "low", so I
don't get overburden and join the army of "unresponsive" maintainers.

Do you have any specific suggestions? Is there a list of poorly
maintained packages I could scroll through or something?

> On Sun, 31 Mar 2019 at 01:41, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../pango/{pango_1.42.4.bb => pango_1.43.0.bb}                | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-graphics/pango/{pango_1.42.4.bb => pango_1.43.0.bb} (93%)
>>
>> diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.43.0.bb
>> similarity index 93%
>> rename from meta/recipes-graphics/pango/pango_1.42.4.bb
>> rename to meta/recipes-graphics/pango/pango_1.43.0.bb
>> index d3357f82de..e91e02a837 100644
>> --- a/meta/recipes-graphics/pango/pango_1.42.4.bb
>> +++ b/meta/recipes-graphics/pango/pango_1.43.0.bb
>> @@ -18,8 +18,8 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
>>  SRC_URI += "file://run-ptest \
>>              file://insensitive-diff.patch"
>>
>> -SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
>> -SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
>> +SRC_URI[archive.md5sum] = "2df040d3f6a4ed9bc316a70b35adcd8b"
>> +SRC_URI[archive.sha256sum] = "d2c0c253a5328a0eccb00cdd66ce2c8713fabd2c9836000b6e22a8b06ba3ddd2"
>>
>>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

