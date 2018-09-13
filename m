Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 27F0D7937D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 23:30:39 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i12-v6so2906030otl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1NUXUZVmIpzfU/W6vlZWqbS1YwBPQBsZsN+rejuXiUg=;
	b=0hC+iTxhykWL8XdBVwo4aeOnb9BMw55v+RzIBr7pZB1rP5VLs85hupDewA0j1Hbsky
	wi+Oj7AeJpuLwO4uEHregFwXlZnG0bvRhmqbz7haKXUdrQTVQ2JeHEUkfBiH/B4kgq7J
	eiknKnIsPL36w2dWeFuyaNK6ArVkIlUvaXHYJdaQnPa0dsrnAFU8oZByv6+Uh5pqhWPz
	9cwBUOYHAijvW30UAngAd9fMw9huiqiJsoAnEsIi8JYqwZxjqcYni2jFsYIT/Kzfl+Ww
	zrSi7FAQQMkNcWo7tTdropyHH/4PEVo39b35mgXudjMJn6F81CcCIy0gPVVD8IBFVkeJ
	3Xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1NUXUZVmIpzfU/W6vlZWqbS1YwBPQBsZsN+rejuXiUg=;
	b=AlGxaRQvVqAEU6JePi6bXI76Ii72DZ8PD2T9gY+xDCJIhNK9WMBZqf+WoxdJu9V/1M
	C3ouYK3zDET0vQ49JgDj/Sw2ahhb+Z37KtHiDXCenW1cgMn8SYXeen4bKrZAfLO4VjSp
	g+aCh6TIqfGPWJdgicA6CRlMiknOGTDty67y6+MUYaAlZV9bD3Ymy6ycL6eBL/RhDu5d
	g1gV4UmNW7uAZwNvGLS8mSdmJub1QPNlDPup4RhcLYFrPNEryVgSB9uMhVg34aoWWcD9
	82OtfmxvG+2e479PE9VKb/at0hatdg0Prma7e6/2WtZY8pIIe3wG9lW1H042rNVlCDhy
	gEPA==
X-Gm-Message-State: APzg51DnEvpr+bgUuuTktT/YBAkeMxoWluZJ6Kti54GOvmiDi4zDbS8t
	5rNH2IuOx6oLz+Uz/rgG9VF4yPxcS5s7ZUc/xzE+qQ==
X-Google-Smtp-Source: ANB0VdZLk4pSHI9r8ytGlCXKK6e8Xas8dBNvX0E7KjI+/DBSBiL2bsOfqOxPJejuRFi+jtO8DI3oWLTUAZ5tF3nxJyg=
X-Received: by 2002:a9d:514a:: with SMTP id
	u10-v6mr2638991oti.241.1536881440987; 
	Thu, 13 Sep 2018 16:30:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Thu, 13 Sep 2018 16:30:20 -0700 (PDT)
In-Reply-To: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Sep 2018 00:30:20 +0100
Message-ID: <CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Thu, 13 Sep 2018 23:30:40 -0000
Content-Type: text/plain; charset="UTF-8"

A little oe-pkgdata-util[1] managed to give me a good review of some
missing entries here.

python3-asyncio: /usr/lib/python3.5/asyncio/test_utils.py
python3-2to3: /usr/lib/python3.5/lib2to3/tests/test_*.py
python3-tkinter: /usr/lib/python3.5/tkinter/test/
python3-unittest: /usr/lib/python3.5/unittest/test/ (the test suite
for unittest should be in python3-test)
python3-distutils: /usr/lib/python3.5/distutils/tests/test_*

I suspect simply adding python3.5/*/test/ will catch the bulk of this
now and in the future.

Ross

[1] oe-pkgdata-util find-path '/usr/lib/python*/**/test_*.py'

On 13 September 2018 at 20:49, Andrew Geissler <geissonator@gmail.com> wrote:
> A quick search in the python package shows the following test
> directories being included in the python image:
> ./Python-2.7.14/Lib/bsddb/test
> ./Python-2.7.14/Lib/sqlite3/test
> ./Python-2.7.14/Lib/ctypes/test
> ./Python-2.7.14/Lib/unittest/test
> ./Python-2.7.14/Lib/lib-tk/test
> ./Python-2.7.14/Lib/email/test
>
> Move the bsddb, ctypes, and email packages to the python-tests package
> to conserve some space.
>
> Packages not include in this patch:
> - sqlite3 has it's own -tests package
> - unittest is already a test package
> - lib-tk (tkinter) seems to have its own special installation and does
> not allow the manifest override for its test directory
> - bsddb is no longer in python3 so update for it was not needed there
>
> Just the ctypes and email change saved us ~150KB of read-only
> filesystem space in our embedded env.
>
> Changes since v1:
> - Used manifest file instead of python recipe to move files to -tests
> package
>
> Signed-off-by: Andrew Geissler <geissonator@gmail.com>
> ---
>  meta/recipes-devtools/python/python/python2-manifest.json  | 5 ++++-
>  meta/recipes-devtools/python/python3/python3-manifest.json | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
> index 723e513..8db2afe 100644
> --- a/meta/recipes-devtools/python/python/python2-manifest.json
> +++ b/meta/recipes-devtools/python/python/python2-manifest.json
> @@ -925,7 +925,10 @@
>      },
>      "tests": {
>          "files": [
> -            "${libdir}/python2.7/test"
> +            "${libdir}/python2.7/test",
> +            "${libdir}/python2.7/email/test",
> +            "${libdir}/python2.7/ctypes/test",
> +            "${libdir}/python2.7/bsddb/test"
>          ],
>          "rdepends": [
>              "core"
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 90a41fb..963140f 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -1040,7 +1040,9 @@
>      "tests": {
>          "cached": [],
>          "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/test"
> +            "${libdir}/python${PYTHON_MAJMIN}/test",
> +            "${libdir}/python${PYTHON_MAJMIN}/email/test",
> +            "${libdir}/python${PYTHON_MAJMIN}/ctypes/test"
>          ],
>          "rdepends": [
>              "core",
> --
> 2.7.4
>

