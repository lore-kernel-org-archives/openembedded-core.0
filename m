Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C382D6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 17:00:14 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id w126so174081967wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+DDETXtrRSo7m2H8Tq+pftJ+s2ZDU9ypzX/zXUqosBM=;
	b=i+mh/ZBmUB583CAWhL1oGsW6a2zp+L5QpSYjQy978HwunD1c/4E8/nx4FDllf5ox04
	i84kY3Q26MzDK7hOeGVxvcuY7TUi7S9giSN9ykJIqgoa4Qflt0iEph2pbF95Rvjdx2zc
	iEF/ED2NQyWCqM9i3VuoN4iSHYPrvhSgUo7ndJrrTT8zIGMfMXh6y/3i3Ggyv9FtXTqX
	V9Xp4VwOcNPJWf9YakBvexH0QQRKqIRtD/qTBO6RkTsrSe1ccWoUlTjLYgChlfQ226ys
	+V3Dq1b0oKiyfqjzM0N+Cu6gbozJ7B2e3+IZOiTopiIFi8MM7xqYn7tPnoJfPXIR9aJP
	qiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+DDETXtrRSo7m2H8Tq+pftJ+s2ZDU9ypzX/zXUqosBM=;
	b=Raduez0kuIG1acMuURXc8bZN18a+9QKk+mpxaiDJatpSVEcWrQyW9GhziI+ayCwaer
	O+GA8YsY+h9X/oar0DuHxHoNmdgjS891bbsYEm/ExkCwEZRVmq6JsroqdCvqfMw0P+Oi
	5BWC5OweuqefwsgZp6HCrEsXF6KDkivOEM6/86/LO/mw+OvZCWRI9jzGye4sBKnbwUg0
	BJQH/VM6ol1ICg9GN0kEs+hwfFo1BnZTJ09Fzahk5RbslmlZgdgOqzgNT8wWVt/t/dub
	ix9chIQUzbkcI7G5WReShRnhfvbUxTEbwOejQF3G0Guu6ZHQO+z6V8B9s4gFcLOz1xju
	Btfg==
X-Gm-Message-State: AKS2vOwc9G0MxT4mddqQhWb7dmd1HzYHqHc3VzcracxIivLOAz2P+dm9
	zf9v32hF2Cw8W46eDIWF0MVLA3JEsQ==
X-Received: by 10.80.137.45 with SMTP id e42mr15443096ede.67.1499101215391;
	Mon, 03 Jul 2017 10:00:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Mon, 3 Jul 2017 09:59:44 -0700 (PDT)
In-Reply-To: <20170703162641.42332-1-jose.perez.carranza@linux.intel.com>
References: <20170703162641.42332-1-jose.perez.carranza@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jul 2017 09:59:44 -0700
Message-ID: <CAMKF1sruAfdxjtU3wO9=JLNbEyS3v=ZoctTSY+pCKY6zT+ovZg@mail.gmail.com>
To: jose.perez.carranza@linux.intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/sdk: Replace buildiptables for buildgzip tests
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
X-List-Received-Date: Mon, 03 Jul 2017 17:00:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2017 at 9:26 AM,  <jose.perez.carranza@linux.intel.com> wrot=
e:
> From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
>
> Buildiptables test cases are conflicting with images built with =E2=80=9C=
musl=E2=80=9D
> as standard C library, in order to avoid those issues gzip package was
> selected to be used on the tests as this does not conflicts with =E2=80=
=9Cmusl=E2=80=9D.
>
> [YOCTO #11713]

I see that gzip recipes also have musl appends for do_configure, I
understand, that this test case will compile on device so it will get
hosted env and it might be working fine. I would think it will be good
to use a package which we dont patch even in OE

>
> Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
> ---
>  meta/lib/oeqa/sdk/cases/{buildiptables.py =3D> buildgzip.py} | 8 ++++---=
-
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/lib/oeqa/sdk/cases/{buildiptables.py =3D> buildgzip.py} (84%=
)
>
> diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk=
/cases/buildgzip.py
> similarity index 84%
> rename from meta/lib/oeqa/sdk/cases/buildiptables.py
> rename to meta/lib/oeqa/sdk/cases/buildgzip.py
> index 419c7ebd09b..a92df65c28b 100644
> --- a/meta/lib/oeqa/sdk/cases/buildiptables.py
> +++ b/meta/lib/oeqa/sdk/cases/buildgzip.py
> @@ -3,15 +3,15 @@ from oeqa.sdk.case import OESDKTestCase
>  from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
>
>
> -class BuildIptablesTest(OESDKTestCase):
> +class BuildGzipTest(OESDKTestCase):
>      td_vars =3D ['DATETIME']
>
>      @classmethod
>      def setUpClass(self):
>          dl_dir =3D self.td.get('DL_DIR', None)
>
> -        self.project =3D SDKBuildProject(self.tc.sdk_dir + "/iptables/",=
 self.tc.sdk_env,
> -                        "http://downloads.yoctoproject.org/mirror/source=
s/iptables-1.4.13.tar.bz2",
> +        self.project =3D SDKBuildProject(self.tc.sdk_dir + "/gzip/", sel=
f.tc.sdk_env,
> +                        "http://downloads.yoctoproject.org/mirror/source=
s/gzip-1.8.tar.gz",
>                          self.tc.sdk_dir, self.td['DATETIME'], dl_dir=3Dd=
l_dir)
>          self.project.download_archive()
>
> @@ -21,7 +21,7 @@ class BuildIptablesTest(OESDKTestCase):
>                  self.tc.hasTargetPackage("gcc")):
>              raise unittest.SkipTest("SDK doesn't contain a cross-canadia=
n toolchain")
>
> -    def test_iptables(self):
> +    def test_gzip(self):
>          self.assertEqual(self.project.run_configure(), 0,
>                          msg=3D"Running configure failed")
>
> --
> 2.12.0
>

