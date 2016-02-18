Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B35D260796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 03:03:25 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 9so58702290iom.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 19:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=HQomkALJuimoP8DIqQI07oH1HbcjBaVtURyR7OHaSXQ=;
	b=EkYIfNqk9drQsl7D2q8L16tpYWuchmmxGd9jO+VUUrAGri/RKQdl/oozRrZVYjyc2O
	scMIj4PIONr6V6FPMiWa7+3y+Pz/umKpbuSKXJBelHrU3zV5a1cRZNBFOi5ruaPTMPcA
	HUW+SXZRJSLn4NhFlYovg05LZYDvP6JUr+dSEdVoKsbaTL6VasrrxRRbsy7e6IotIhwF
	ky48AYFF7McSCg+HZEdZZMCBfs+qzfpSyKrzgPiIaIK+XOs+kmS5fo4Q7TNtJI2FcVn8
	5BQsNFavvuxoHRbsF5JoU9UJhCUYkHhnOVV0Xv5BPrUHVflm3JKvJ7ZvzYdcZpVHc9jD
	nfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=HQomkALJuimoP8DIqQI07oH1HbcjBaVtURyR7OHaSXQ=;
	b=h3kKL+b3aiUBB3fYO08S1uzkuUjTJsbFV1k6nF3FbzIA3qH8pWxXa7Njzm7GIFpQw2
	W+/XeztwzKg0/0Ahorn2YWqEGkCRkqj6pO3QL8Wwkm9/oQOv5RCKFbnb5SdV+bjeJy2E
	1gRWsqGdhamVmRSDoLkUm4Ld4hCEMneDbyGT3BiBuBxoUlTDkAh7ZfDKsfpJB4RYc7lT
	39P0m9kmJA3DStAygVGD1kmbqW2pL79W7eeWWS8cXUl1DxkBmNCNehA+qxPAxG8tdylp
	S1QkCqkzr7YyTUy+NqMjwNuWPajPjM0nDr7vekI69CxRYDQEsoNxKfUoDIYAJzPl9gZi
	kIRg==
X-Gm-Message-State: AG10YOQrqX5PM3I2HTjIDHGPmweZRb5xm8TapY8rRujviNibb/w04EW+BXVAejMjY8/drLqra+tGTs838HU5cw==
X-Received: by 10.107.14.66 with SMTP id 63mr7155849ioo.150.1455764605836;
	Wed, 17 Feb 2016 19:03:25 -0800 (PST)
MIME-Version: 1.0
References: <1455746041-4482-1-git-send-email-humberto.ibarra.lopez@intel.com>
	<1455746041-4482-3-git-send-email-humberto.ibarra.lopez@intel.com>
In-Reply-To: <1455746041-4482-3-git-send-email-humberto.ibarra.lopez@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 18 Feb 2016 03:03:16 +0000
Message-ID: <CABcZANnc8phRxSHeea8kP_OXaQqags6dWini=Gxs0DFDnUxAMw@mail.gmail.com>
To: humberto.ibarra.lopez@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] scripts/oe-selftest: Use site.USER_SITE to run coverage configuration code for sub-process
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
X-List-Received-Date: Thu, 18 Feb 2016 03:03:26 -0000
Content-Type: multipart/alternative; boundary=001a113fe1be3522c5052c029c17

--001a113fe1be3522c5052c029c17
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 17, 2016 at 2:57 PM <humberto.ibarra.lopez@intel.com> wrote:

> From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
>
> Coverage in oe-selftest currently requires to create or modify
> a sitecustomize.py file according the coverage tool setup instructions
> (http://coverage.readthedocs.org/). This file has to be located in
> the system's python folder, which is not a good solution since this
> folder is not accesible to non-privileged users.
>
> The best solution so far is to create this file in the home directory.
> This is implemented by creating the temporal file in the user site
> default folder.
>
> [Yocto #8930]
>
> Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
> ---
>  scripts/oe-selftest | 46 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/oe-selftest b/scripts/oe-selftest
> index f3865e4..25ca632 100755
> --- a/scripts/oe-selftest
> +++ b/scripts/oe-selftest
> @@ -553,6 +553,7 @@ def main():
>
>  def buildResultClass(args):
>      """Build a Result Class to use in the testcase execution"""
> +    import site
>
>      class StampedResult(unittest.TextTestResult):
>          """
> @@ -568,26 +569,41 @@ def buildResultClass(args):
>
>          def startTestRun(self):
>              """ Setup coverage before running any testcase """
> +
> +            # variable holding the coverage configuration file allowing
> subprocess to be measured
> +            self.coveragepth = None
> +
> +            # indicates the system if coverage is currently installed
> +            self.coverage_installed = True
> +
>              if args.coverage or args.coverage_source or
> args.coverage_include or args.coverage_omit:
>                  try:
>                      # check if user can do coverage
>                      import coverage
> -                    log.info("Coverage is enabled")
> -
> -                    # In case the user has not set the variable
> COVERAGE_PROCESS_START,
> -                    # create a default one and export it. The
> COVERAGE_PROCESS_START
> -                    # value indicates where the coverage configuration
> file resides
> -                    # More info on https://pypi.python.org/pypi/coverage
> -                    if not os.environ.get('COVERAGE_PROCESS_START'):
> -                        os.environ['COVERAGE_PROCESS_START'] =
> coverage_setup(args.run_tests, args.run_all_tests, args.coverage_source,
> args.coverage_include, args.coverage_omit)
> -
> -                    self.coverage_installed = True
>                  except:
>                      log.warn('\n'.join(["python coverage is not
> installed",
>                          "Make sure your coverage takes into account
> sub-process",
>                          "More info on
> https://pypi.python.org/pypi/coverage"]))
>                      self.coverage_installed = False
>
> +                if self.coverage_installed:
> +                    log.info("Coverage is enabled")
> +
> +                # In case the user has not set the variable
> COVERAGE_PROCESS_START,
> +                # create a default one and export it. The
> COVERAGE_PROCESS_START
> +                # value indicates where the coverage configuration file
> resides
> +                # More info on https://pypi.python.org/pypi/coverage
> +                if not os.environ.get('COVERAGE_PROCESS_START'):
> +                    os.environ['COVERAGE_PROCESS_START'] =
> coverage_setup(args.run_tests, args.run_all_tests, args.coverage_source,
> args.coverage_include, args.coverage_omit)
> +
> +                # Use default site.USER_SITE and write corresponding
> config file
> +                site.ENABLE_USER_SITE = True
> +                if not os.path.exists(site.USER_SITE):
> +                    os.makedirs(site.USER_SITE)
> +                self.coveragepth = os.path.join(site.USER_SITE,
> "coverage.pth")
> +                with open(self.coveragepth, 'w') as cps:
> +                    cps.write('import sys,site;
> sys.path.extend(site.getsitepackages()); import coverage;
> coverage.process_startup();')
> +
>          def stopTestRun(self):
>              """ Report coverage data after the testcases are run """
>
> @@ -599,8 +615,14 @@ def buildResultClass(args):
>
>                  log.info("Coverage Report")
>                  log.info("===============")
> -
> -                coverage_report()
> +                try:
> +                    coverage_report()
> +                    # remove the pth file
> +                finally:
> +                    try:
> +                        os.remove(self.coveragepth)
> +                    except OSError:
> +                        pass
>

I didn't notice this before, but if there's a legitimate failure to remove
the file, resulting in it still being in the user's site area, I doubt you
want to suppress such a failure. If you're specifically suppressing a
removal of a file which is already missing (though I don't know how you'd
get into that state), then you'd probably want to check errno to cover that
case. If not, then I think you should at least display a warning/error.

--001a113fe1be3522c5052c029c17
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, Feb 17, 2016 at 2:57 PM &lt;<a href=3D"mailto:humberto.ibarra.lopez@intel=
.com">humberto.ibarra.lopez@intel.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">From: Humberto Ibarra &lt;<a href=3D"mailto:humberto.ibar=
ra.lopez@intel.com" target=3D"_blank">humberto.ibarra.lopez@intel.com</a>&g=
t;<br>
<br>
Coverage in oe-selftest currently requires to create or modify<br>
a sitecustomize.py file according the coverage tool setup instructions<br>
(<a href=3D"http://coverage.readthedocs.org/" rel=3D"noreferrer" target=3D"=
_blank">http://coverage.readthedocs.org/</a>). This file has to be located =
in<br>
the system&#39;s python folder, which is not a good solution since this<br>
folder is not accesible to non-privileged users.<br>
<br>
The best solution so far is to create this file in the home directory.<br>
This is implemented by creating the temporal file in the user site<br>
default folder.<br>
<br>
[Yocto #8930]<br>
<br>
Signed-off-by: Humberto Ibarra &lt;<a href=3D"mailto:humberto.ibarra.lopez@=
intel.com" target=3D"_blank">humberto.ibarra.lopez@intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-selftest | 46 ++++++++++++++++++++++++++++++++++----------=
--<br>
=C2=A01 file changed, 34 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/scripts/oe-selftest b/scripts/oe-selftest<br>
index f3865e4..25ca632 100755<br>
--- a/scripts/oe-selftest<br>
+++ b/scripts/oe-selftest<br>
@@ -553,6 +553,7 @@ def main():<br>
<br>
=C2=A0def buildResultClass(args):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Build a Result Class to use in the te=
stcase execution&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 import site<br>
<br>
=C2=A0 =C2=A0 =C2=A0class StampedResult(unittest.TextTestResult):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
@@ -568,26 +569,41 @@ def buildResultClass(args):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def startTestRun(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot; Setup co=
verage before running any testcase &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # variable holding the coverage =
configuration file allowing subprocess to be measured<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.coveragepth =3D None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # indicates the system if covera=
ge is currently installed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.coverage_installed =3D True=
<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if args.coverage or args.co=
verage_source or args.coverage_include or args.coverage_omit:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# check if user can do coverage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0import coverage<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://log.info" rel=3D"noreferrer" target=3D"_blank">log.info</a>(&=
quot;Coverage is enabled&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # In=
 case the user has not set the variable COVERAGE_PROCESS_START,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # cr=
eate a default one and export it. The COVERAGE_PROCESS_START<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # va=
lue indicates where the coverage configuration file resides<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Mo=
re info on <a href=3D"https://pypi.python.org/pypi/coverage" rel=3D"norefer=
rer" target=3D"_blank">https://pypi.python.org/pypi/coverage</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n=
ot os.environ.get(&#39;COVERAGE_PROCESS_START&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 os.environ[&#39;COVERAGE_PROCESS_START&#39;] =3D coverage_setup(=
args.run_tests, args.run_all_tests, args.coverage_source, args.coverage_inc=
lude, args.coverage_omit)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.coverage_installed =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0log.warn(&#39;\n&#39;.join([&quot;python coverage is not installed&quot;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Make sure your coverage takes into account sub-proce=
ss&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;More info on <a href=3D"https://pypi.python.org/pypi=
/coverage" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pyp=
i/coverage</a>&quot;]))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.coverage_installed =3D False<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.coverage_i=
nstalled:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://log.info" rel=3D"noreferrer" target=3D"_blank">log.info</a>(&=
quot;Coverage is enabled&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # In case the user=
 has not set the variable COVERAGE_PROCESS_START,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # create a default=
 one and export it. The COVERAGE_PROCESS_START<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # value indicates =
where the coverage configuration file resides<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # More info on <a =
href=3D"https://pypi.python.org/pypi/coverage" rel=3D"noreferrer" target=3D=
"_blank">https://pypi.python.org/pypi/coverage</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.environ.=
get(&#39;COVERAGE_PROCESS_START&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.e=
nviron[&#39;COVERAGE_PROCESS_START&#39;] =3D coverage_setup(args.run_tests,=
 args.run_all_tests, args.coverage_source, args.coverage_include, args.cove=
rage_omit)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use default site=
.USER_SITE and write corresponding config file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 site.ENABLE_USER_S=
ITE =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exi=
sts(site.USER_SITE):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.m=
akedirs(site.USER_SITE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.coveragepth =
=3D os.path.join(site.USER_SITE, &quot;coverage.pth&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(self.cov=
eragepth, &#39;w&#39;) as cps:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cps.=
write(&#39;import sys,site; sys.path.extend(site.getsitepackages()); import=
 coverage; coverage.process_startup();&#39;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def stopTestRun(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot; Report c=
overage data after the testcases are run &quot;&quot;&quot;<br>
<br>
@@ -599,8 +615,14 @@ def buildResultClass(args):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://log.info" rel=3D"noreferrer" target=3D"_blank">log.info</a>(&quot;Cove=
rage Report&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://log.info" rel=3D"noreferrer" target=3D"_blank">log.info</a>(&quot;=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 coverage_report()<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cove=
rage_report()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # re=
move the pth file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 os.remove(self.coveragepth)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exce=
pt OSError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pass<br></blockquote><div><br></div><div>I didn&#39;t notice thi=
s before, but if there&#39;s a legitimate failure to remove the file, resul=
ting in it still being in the user&#39;s site area, I doubt you want to sup=
press such a failure. If you&#39;re specifically suppressing a removal of a=
 file which is already missing (though I don&#39;t know how you&#39;d get i=
nto that state), then you&#39;d probably want to check errno to cover that =
case. If not, then I think you should at least display a warning/error.=C2=
=A0</div></div></div>

--001a113fe1be3522c5052c029c17--
