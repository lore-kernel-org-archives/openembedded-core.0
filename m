Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5885D789AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:13:46 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 13-v6so1285649ois.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l7IQQGR7IVk2Bq+XhCTiz5OL9NFbBKYCSPa/z4cjLas=;
	b=BlRehpNsCLPy+MuttKOo7ylJ2yTvOBtADVUUJr3tRcnK2u0ePphISJeATT9Umpk9hQ
	MT7qZL7YysQOMhGSPVauob2cAt8vP4YPY2GvpSUMdZhWy5Ii1/TY76DD85cksZZGPLz7
	3BZ0MrIGtUakHY+R6mAyrA/SRdadSi7SU3PxVRe/7tCe9hclVjpG/Yt3Yl6lkIbbCR1j
	tqAFVVGKurbVg55j3I+CCQfMH2cB6aLi7KeFNaq2Ts7lOXlK7ShDf1hCX3xfuK6+U1Mp
	BXnRG1XyY1cU/0awUsVZTiONi1yZ7iJyFA5j6rIjfUf2bjqbi6dQIjBpiDVciHKcsUHz
	x59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l7IQQGR7IVk2Bq+XhCTiz5OL9NFbBKYCSPa/z4cjLas=;
	b=TRr2dM/v2YSSQQ0NV0zw5vT9pexCiaCrARcGaNmUonDfH780JXk4aYsHAAeQk4mL66
	wiRS7Y1BDwhU1cagw7O3Abp2tFSq4uuOApq1PHQ1bdH2pmiLPFxas/hBGYyD3DdxvtFo
	RVqgOdG3YXWTznUrshvvyJIEyI3dwB/u4UerZYsaZSfJ1Celr7tGO87foeNXfUuAkcF/
	qCCoeQB8CjNjlTFlPyobl00+BS2/2n4s7O2cnzpT8paOmeT9P+Hup0HVE0oQhHO4cwiN
	M3Y4a6bwtBg7SS+TOQnDw1WH5nOtwIff+RK+tVilseHUpeeZxns02E4dCIGhRt6azj/8
	CpIA==
X-Gm-Message-State: AOUpUlFi7+T1JmZdzmqs1DZPL+CTIinj/eKfLLqbXAN8BzVJOoitbqLn
	OQiW7rfMkwaebwgBkNImbtww6pQSYU6tY21gzsyUzw==
X-Google-Smtp-Source: AAOMgpd2v1NrJN2XPwhd1gszXMWiUiiOHmJ/RWLNp4FXKeHwgESj14I/P4AmQnXZKbQg8wJIJWbcWJ/bd6Zf6orrIYU=
X-Received: by 2002:aca:2808:: with SMTP id 8-v6mr1207847oix.235.1531826027112;
	Tue, 17 Jul 2018 04:13:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 04:13:26
	-0700 (PDT)
In-Reply-To: <dfc75ebfb9a5282585d621ea66b4590dbb8b6b17.1531798346.git.hongxu.jia@windriver.com>
References: <cover.1531798346.git.hongxu.jia@windriver.com>
	<dfc75ebfb9a5282585d621ea66b4590dbb8b6b17.1531798346.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jul 2018 12:13:26 +0100
Message-ID: <CAJTo0LZW2UdP221rM_z5f2Eq5uyc65hbYZUOUDmz8CZn-o4G_w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] distutils3/setuptools3-native: do not try to fetch code during do_compile
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
X-List-Received-Date: Tue, 17 Jul 2018 11:13:46 -0000
Content-Type: text/plain; charset="UTF-8"

On 17 July 2018 at 04:34, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>  distutils3_do_compile() {
> +        NO_FETCH_BUILD=1 \
> +        NO_FETCH_BUILD_HELP="Please add its native recipe to DEPENDS." \

...

> +     def easy_install(self, spec, deps=False):
> ++        if os.environ.get('NO_FETCH_BUILD', None):
> ++            log.error("ERROR: Do not try to fetch `%s' for building. %s" %
> ++                             (spec,  os.environ.get('NO_FETCH_BUILD_HELP', '')))

Passing the help to the patch seems overkill considering we're
patching in the message in the first place.  Why not just put this in
the patch itself?

> +SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"

Do this in setuptools.inc and you won't need to patch both recipes.

Ross

