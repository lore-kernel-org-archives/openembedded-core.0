Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id C9C4E7E3B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 08:35:44 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id i21so1513352ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+k+Hqq0YNz1FJDvQ/oy+//sTNwTDOWDIVWNgaHW7APs=;
	b=X17r2ElAUtXSx5ayh3PlNo9Mc6w2vcLtyweQxg+E0+uj2plSrZ+J2vdGQqReVH2UF7
	IZmIhIWkc2ReOsPj4kaIoYhCPOzBAmjIfIAXBnqgVEOv+sASbaJUpw1tJh/DvpIrHwjD
	7+EXAx4FsQYQ+K+jbtX0tGabazjxyXz44LCgNnK4X4NBIN7t/FzjdH0AcR3RfBcPOFOV
	VqfuatejFXaZJJIZUnmVNBP+J2yLmwRZWOHDFHwpOWzLomDI/i73YTocF2Ws+7DXPcfc
	r/ODeSZ/697stHdCjh+RtqQoVlD58xn4dQEpKLA3IkHhjSK/W0BRtcTKV2lKBJqjF9q3
	LBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+k+Hqq0YNz1FJDvQ/oy+//sTNwTDOWDIVWNgaHW7APs=;
	b=eeTghlhhLycfTZUecn6bI5P5sjeMFmVw7DRSoq8RyzPgIePdEqnctLOz41Fz04yX9a
	0p5n+fELFYoOX/2MGwf4acAnFyn9ASPIBepwvGx4nbcngFhFtLBAEbaDDG37wTRoioo/
	Yqw4V+4TFmpYWDa598SUqL2ZGKcNDAEvsuXPSB93Zd9IS0jd81+aoCeyyyioFVWvPeDm
	tmMK6vZ1/zXExiT1OlW9zbRBvwNRAioQmqiQDc57F/aqGXjLlyeDWsOFfVRQ72z3DdbO
	NmsHDT0/JcKtM32UR+6SwukFK9kR4rjgzqF6O0ag1lb3HtCDtxah8agMGZah9lhSXJ6y
	vu3g==
X-Gm-Message-State: APjAAAXOFXbv6zBiSZLin6hB0Gwombq/O/WQoS2+v2ckd13i76aHuBwt
	/r+/hY1dt6wmSZgcpYgw1PqgOnWSUKG9AdzO5Rw0Tw==
X-Google-Smtp-Source: APXvYqy9tgA9/JYySyPIpB5dmK/Lame2y6uc/suXmRhb0F3hx+YUHweBHm8yV/Vc1Qq2UVfxspsRRHD2X1e/+dIHs8k=
X-Received: by 2002:a24:19cd:: with SMTP id b196mr3507879itb.74.1559896545822; 
	Fri, 07 Jun 2019 01:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <1559892984-24780-1-git-send-email-maciej.pijanowski@3mdeb.com>
In-Reply-To: <1559892984-24780-1-git-send-email-maciej.pijanowski@3mdeb.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Jun 2019 09:35:34 +0100
Message-ID: <CAJTo0Lb=azHFW1Cpg-FP4nbLnnNaL9KMu0FHUpHQcMh+Sr2R2Q@mail.gmail.com>
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: piotr.krol@3mdeb.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipetool: support python3 instead of python2
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
X-List-Received-Date: Fri, 07 Jun 2019 08:35:45 -0000
Content-Type: text/plain; charset="UTF-8"

My first thought was "won't this break the test" but then I discovered
that there's no test.

Would you be able to write a small test for this, along the lines of
test_recipetool_create_*() in
meta/lib/oeqa/selftest/cases/recipetool.py?

Ross

On Fri, 7 Jun 2019 at 08:56, Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
> Add support for generating python3 recipes using the recipetool / devtool.
> Drop python2 support at the same time.
>
> Tested with:
>
> devtool add --also-native python3-python-magic \
> https://files.pythonhosted.org/packages/84/30/\
>   80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/\
>   python-magic-0.4.15.tar.gz
>
> No python2 dependencies were pulled in
>
> Fixes Bug 13264
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  scripts/lib/recipetool/create_buildsys_python.py | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
> index ec5449bee99f..f24dce23918a 100644
> --- a/scripts/lib/recipetool/create_buildsys_python.py
> +++ b/scripts/lib/recipetool/create_buildsys_python.py
> @@ -41,11 +41,11 @@ def tinfoil_init(instance):
>
>
>  class PythonRecipeHandler(RecipeHandler):
> -    base_pkgdeps = ['python-core']
> -    excluded_pkgdeps = ['python-dbg']
> -    # os.path is provided by python-core
> +    base_pkgdeps = ['python3-core']
> +    excluded_pkgdeps = ['python3-dbg']
> +    # os.path is provided by python3-core
>      assume_provided = ['builtins', 'os.path']
> -    # Assumes that the host python builtin_module_names is sane for target too
> +    # Assumes that the host python3 builtin_module_names is sane for target too
>      assume_provided = assume_provided + list(sys.builtin_module_names)
>
>      bbvar_map = {
> @@ -225,9 +225,9 @@ class PythonRecipeHandler(RecipeHandler):
>          self.apply_info_replacements(info)
>
>          if uses_setuptools:
> -            classes.append('setuptools')
> +            classes.append('setuptools3')
>          else:
> -            classes.append('distutils')
> +            classes.append('distutils3')
>
>          if license_str:
>              for i, line in enumerate(lines_before):
> @@ -292,7 +292,7 @@ class PythonRecipeHandler(RecipeHandler):
>                  for feature, feature_reqs in extras_req.items():
>                      unmapped_deps.difference_update(feature_reqs)
>
> -                    feature_req_deps = ('python-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
> +                    feature_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
>                      lines_after.append('PACKAGECONFIG[{}] = ",,,{}"'.format(feature.lower(), ' '.join(feature_req_deps)))
>
>          inst_reqs = set()
> @@ -303,7 +303,7 @@ class PythonRecipeHandler(RecipeHandler):
>              if inst_reqs:
>                  unmapped_deps.difference_update(inst_reqs)
>
> -                inst_req_deps = ('python-' + r.replace('.', '-').lower() for r in sorted(inst_reqs))
> +                inst_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(inst_reqs))
>                  lines_after.append('# WARNING: the following rdepends are from setuptools install_requires. These')
>                  lines_after.append('# upstream names may not correspond exactly to bitbake package names.')
>                  lines_after.append('RDEPENDS_${{PN}} += "{}"'.format(' '.join(inst_req_deps)))
> @@ -364,7 +364,7 @@ class PythonRecipeHandler(RecipeHandler):
>          return info, 'setuptools' in imported_modules, non_literals, extensions
>
>      def get_setup_args_info(self, setupscript='./setup.py'):
> -        cmd = ['python', setupscript]
> +        cmd = ['python3', setupscript]
>          info = {}
>          keys = set(self.bbvar_map.keys())
>          keys |= set(self.setuparg_list_fields)
> @@ -398,7 +398,7 @@ class PythonRecipeHandler(RecipeHandler):
>      def get_setup_byline(self, fields, setupscript='./setup.py'):
>          info = {}
>
> -        cmd = ['python', setupscript]
> +        cmd = ['python3', setupscript]
>          cmd.extend('--' + self.setuparg_map.get(f, f.lower()) for f in fields)
>          try:
>              info_lines = self.run_command(cmd, cwd=os.path.dirname(setupscript)).splitlines()
> @@ -535,7 +535,7 @@ class PythonRecipeHandler(RecipeHandler):
>          pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
>
>          ldata = tinfoil.config_data.createCopy()
> -        bb.parse.handle('classes/python-dir.bbclass', ldata, True)
> +        bb.parse.handle('classes/python3-dir.bbclass', ldata, True)
>          python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR')
>
>          dynload_dir = os.path.join(os.path.dirname(python_sitedir), 'lib-dynload')
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

