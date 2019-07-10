Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC5897EFEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 21:21:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g67so3685539wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=8WuDILd+U29VRvFOAHtS2/MobEFzm86IfSaDXHri+LQ=;
	b=WibYVRq+1/i7olcYoduOwGe83wtcVNFLL/+Ep1EqoI5WIlFxJzqnr8YX3TOKbc131n
	Q58CJT8r8gCNV1MQpSW8QS/oL5TBp/P8UtQw+kImWZNEdNs3EVzYpk/9Uvf8xQWjZVnk
	sDWYbI97lzHGDr+v6A9khm3tsC4B2I0Vg+yBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8WuDILd+U29VRvFOAHtS2/MobEFzm86IfSaDXHri+LQ=;
	b=e6l0AiRaqR/3shDSMmSaANgNm2mGlFZ1RWz61jUw5nJc5iwXxmp9uO0jMR2d9vnd/x
	AD9DOh4eD7zzhIJ0IruarttwX1T/VXr1vY7q0QqJse6+85GzEXRjb37AM8dsXGHPHILV
	BIzpt2VXe3GyL0mAQPB5sDnK8+Rc1Dtvp+XQXPjzY62u52t8QaGgiZ9AULlRtr5E8ObA
	qVwoVACubpHvmyfcR9V6bkQjvNLpZn8K+Y/R+kNTWmH0n/SoRbSI10acdcjuAZzoF9pP
	J+dXj8sevXjQ/KVNZaZjqiAhegqEXOZOvCl7jiDjZXU6i8mOCegXz8gRdvw4wkg0I7lY
	wYtQ==
X-Gm-Message-State: APjAAAWxlpBlUdW130Xtw8HO04he/M9HqGf562VNLdFpP/avyD2aWMYV
	8jY6TgrcabhhKH6yYPW6s7Jbwg==
X-Google-Smtp-Source: APXvYqx5rfT08k2bkMjLysDcstS9kv1qXaqRnJXmzbtl0m84JTjxKLXSxsW8yPhZXS1Q7nvmWqJeAQ==
X-Received: by 2002:a05:600c:2385:: with SMTP id
	m5mr6385303wma.4.1562793715409; 
	Wed, 10 Jul 2019 14:21:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r11sm4505359wre.14.2019.07.10.14.21.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 14:21:54 -0700 (PDT)
Message-ID: <866a7e8b0d4684ed176b6b349f87a40a609436c7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 22:21:53 +0100
In-Reply-To: <20190710123401.16646-1-ross.burton@intel.com>
References: <20190710123401.16646-1-ross.burton@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa/recipetool: change the CMake test to use taglib
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
X-List-Received-Date: Wed, 10 Jul 2019 21:21:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-10 at 13:34 +0100, Ross Burton wrote:
> The current test builds Navit, which uses GTK+ 2.  As GTK+ 2 is being removed
> from oe-core, change the test to build taglib instead.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/recipetool.py | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
> index e3f5c71666f..1c701a40bf0 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -406,22 +406,19 @@ class RecipetoolTests(RecipetoolBase):
>          self._test_recipe_contents(os.path.join(temprecipe, dirlist[0]), checkvars, inherits)
>  
>      def test_recipetool_create_cmake(self):
> -        bitbake('-c packagedata gtk+')
> -
> -        # Try adding a recipe
>          temprecipe = os.path.join(self.tempdir, 'recipe')
>          os.makedirs(temprecipe)
> -        recipefile = os.path.join(temprecipe, 'navit_0.5.0.bb')
> -        srcuri = 'http://downloads.yoctoproject.org/mirror/sources/navit-0.5.0.tar.gz'
> +        recipefile = os.path.join(temprecipe, 'taglib_1.11.1.bb')
> +        srcuri = 'http://taglib.github.io/releases/taglib-1.11.1.tar.gz'
>          result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
>          self.assertTrue(os.path.isfile(recipefile))
>          checkvars = {}
> -        checkvars['LICENSE'] = set(['Unknown', 'GPLv2', 'LGPLv2'])
> -        checkvars['SRC_URI'] = 'http://downloads.yoctoproject.org/mirror/sources/navit-${PV}.tar.gz'
> -        checkvars['SRC_URI[md5sum]'] = '242f398e979a6b8c0f3c802b63435b68'
> -        checkvars['SRC_URI[sha256sum]'] = '13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d'
> -        checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib', 'fribidi'])
> -        inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
> +        checkvars['LICENSE'] = set(['LGPLv2.1', 'MPL-1.1'])
> +        checkvars['SRC_URI'] = 'http://taglib.github.io/releases/taglib-${PV}.tar.gz'
> +        checkvars['SRC_URI[md5sum]'] = 'cee7be0ccfc892fa433d6c837df9522a'
> +        checkvars['SRC_URI[sha256sum]'] = 'b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b'
> +        checkvars['DEPENDS'] = set(['boost', 'zlib'])
> +        inherits = ['cmake']
>          self._test_recipe_contents(recipefile, checkvars, inherits)
>  
>      def test_recipetool_create_github(self):
> 


2019-07-10 19:33:07,067 - oe-selftest - INFO - ======================================================================
2019-07-10 19:33:07,067 - oe-selftest - INFO - FAIL: recipetool.RecipetoolTests.test_recipetool_create_cmake (subunit.RemotedTestCase)
2019-07-10 19:33:07,068 - oe-selftest - INFO - ----------------------------------------------------------------------
2019-07-10 19:33:07,068 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/recipetool.py", line 422, in test_recipetool_create_cmake
    self._test_recipe_contents(recipefile, checkvars, inherits)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/devtool.py", line 172, in _test_recipe_contents
    self.assertEqual(value, needvalue, 'values for %s do not match' % var)
  File "/usr/lib/python3.5/unittest/case.py", line 821, in assertEqual
    assertion_func(first, second, msg=msg)
  File "/usr/lib/python3.5/unittest/case.py", line 1073, in assertSetEqual
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib/python3.5/unittest/case.py", line 666, in fail
    raise self.failureException(msg)
AssertionError: Items in the first set but not the second:
'Unknown'
Items in the second set but not the first:
'MPL-1.1' : values for LICENSE do not match


https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/283
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/284

etc.

Cheers,

Richard


