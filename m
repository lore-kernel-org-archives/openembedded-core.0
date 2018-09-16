Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 004AA74A35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 09:20:39 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b15-v6so16394327oib.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yJKfFwRgeV8sy5PnJQ8psQZUm0U+y3GN4fOPYWIC9OI=;
	b=lfn9hPkiAaEpk1nbb51jg7Aa6lpbf0q1RwJk0zW1dPWB+WaVfTU9w6KWMLh5ktgsXS
	oZal8ekYyA8eM3dkIk62oE7aeLKPVUc5asttfUm/C0E9/GxEUZ/Slmz8OJqwK0FqEmUs
	KMgrve5BX9kiKxZO/KSe2iNgzrcPU5s57PurxMl65ZsZfTB4Xa4kvOit7bPciMKPyYrS
	fxdS4G6FqLELn4zSrjKC4W0iBdxhieXPllRToTH7+JpziPn4e/ssjGXruGvccvrm2MF8
	WQCErfHRKaAKtIZGXzlQlh0LtK58YM0VgxxRB/HOmLzpRbE5/xU2rM1MPQ1wkZBhk9oF
	gFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yJKfFwRgeV8sy5PnJQ8psQZUm0U+y3GN4fOPYWIC9OI=;
	b=mPllr2mNh7f0M0xbkGB9C5L2FtvtBkO2WJLoIAvvJY9bmA8SM7bMOUfVnLhjMkSBjk
	OEVM/gHk7y1EktPdu0Mpr1nX+P0K+HFrn8fkn0xGiVuxFkxa+kfwOK6j1sfLPOBx71Ih
	DdF1Z7tSA32iAAhfWAPukDnoB4R7+dDLcmCtB93G5Bx39inEISjCjgjxW+xOSkObJq6X
	SYSY5czDsPPR+xJ4lTbLQZYXm3WetjbMxTzr0dVDmz3QPxp5VOK5f2kgy6ubZfF7HN2j
	TgOWHfb+QBWQefhsvOlRHbys+Er0hMbKstUmzF3GGUAUbaMwSgv0gNtbHOX0MQUB6erO
	Ii+A==
X-Gm-Message-State: APzg51D4nDAiAVtA3+uQZ8pdpO0zW20sjBRccJPKW52U2Flhh4CzToK0
	BhdfxKJ9c7wYM7s06zuGs7OrBOl/4EmV+OJfMXGrMQ==
X-Google-Smtp-Source: ANB0VdYwlY4h9hGsdvguKtkF4Pvt8b5Zkf4tklQTEhYkxLzBmwa+DO9eGR8eGOCALo5cTAnRGQNDHdoxrrCGZEwLqc8=
X-Received: by 2002:aca:506:: with SMTP id 6-v6mr14848383oif.23.1537089640913; 
	Sun, 16 Sep 2018 02:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20180913131544.20812-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180913131544.20812-1-richard.purdie@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 16 Sep 2018 10:20:29 +0100
Message-ID: <CAJTo0LYV8kB5SL1h+mkHSUzkV+tkBzLPgsmTg8gjpt4omB42nA@mail.gmail.com>
To: openembedded-core-bounces@lists.openembedded.org
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/runtime_test: Ensure we build/use gnupg-native
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
X-List-Received-Date: Sun, 16 Sep 2018 09:20:40 -0000
Content-Type: text/plain; charset="UTF-8"

Doesn't quite work:

2018-09-14 23:53:16,527 - oe-selftest - INFO - 7: 13/14 281/332
(10.67s) (runtime_test.TestImage.test_testimage_dnf)
2018-09-14 23:53:16,527 - oe-selftest - INFO -
testtools.testresult.real._StringException: Traceback (most recent
call last):
File "/home/pokybuild/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
return func(*args, **kwargs)
File "/home/pokybuild/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/runtime_test.py",
line 157, in test_testimage_dnf
runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home,
os.path.join(signing_key_dir, 'key.secret')),
native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"))
File "/home/pokybuild/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/commands.py",
line 191, in runCmd
raise AssertionError("Command '%s' returned non-zero exit status
%d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'gpg --batch --homedir
/tmp/oeqa-feed-sign-gqt86zv_ --import
/home/pokybuild/yocto-worker/nightly-oe-selftest/build/build-st-50002/meta-selftest/files/signing/key.secret'
returned non-zero exit status 2:
gpg: keybox '/tmp/oeqa-feed-sign-gqt86zv_/pubring.kbx' created
gpg: /tmp/oeqa-feed-sign-gqt86zv_/trustdb.gpg: trustdb created
gpg: key 7B31316B5D64AD52: public key "testuser (nocomment)
<testuser@testemail.com>" imported
gpg: failed to start agent
'/home/pokybuild/yocto-worker/nightly-oe-selftest/build/build-st-104600/tmp/work/x86_64-linux/gnupg-native/2.2.9-r0/recipe-sysroot-native/usr/bin/gpg-agent':
No such file or directory
gpg: can't connect to the agent: No such file or directory
gpg: error getting the KEK: No agent running
gpg: Total number processed: 1
gpg: imported: 1
gpg: secret keys read: 1

Ross
On Thu, 13 Sep 2018 at 14:16,
<openembedded-core-bounces@lists.openembedded.org> wrote:
>
> Without this, we see errors if gpg is missing from the host system
> for "oe-selftest -r runtime_test.TestImage.test_testimage_dnf".
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/runtime_test.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index abd0723146f..906e460d4f8 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -149,10 +149,12 @@ class TestImage(OESelftestTestCase):
>          features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
>          features += 'PACKAGE_CLASSES = "package_rpm"\n'
>
> +        bitbake('gnupg-native -c addto_recipe_sysroot')
> +
>          # Enable package feed signing
>          self.gpg_home = tempfile.mkdtemp(prefix="oeqa-feed-sign-")
>          signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
> -        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home, os.path.join(signing_key_dir, 'key.secret')))
> +        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"))
>          features += 'INHERIT += "sign_package_feed"\n'
>          features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
>          features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

