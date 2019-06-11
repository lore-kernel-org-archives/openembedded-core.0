Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4F57D34E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 11:52:11 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id j194so4392446ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kU++zZYozjDdCW8YoHZD0j1k0fsvtZWWsSxcMAYn5h4=;
	b=nedGgm6BGbkb5E1/P2qWZbbEaUCLDhOIVE6sZJLDqVQmuhLwNjjmtE21JATxT1ptOc
	9Rt9LR8qavfmqupQEym79zSRHjqqL9Fp/DpV0/l3kWEL0XUW5xSpbU9VaJdZVNhgM18z
	rJ/AcTjjKUQ/gr5iTT8OgkbZYAzkq1O2jpuT8v7zZ6BbkYnVjTtq5AteFJqagt3jSHIy
	jbpLpF5WfZm/YRbANq7ohE6//5tATLQ2RVjdXydxkpfnUZ44Kb7dCnLwIlnFLBSKF2MN
	Y4x/orYSOAyahzkFq5VShXrb+f2fakucf9KlTVovUd9NtiET1iHQ4yOVDjHYItBXfyrz
	5Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kU++zZYozjDdCW8YoHZD0j1k0fsvtZWWsSxcMAYn5h4=;
	b=ic32BxISJnBJYeFxCzVMoJxA8RHzZ6LzA531K3gb3jAp2RBfkfuM/EqiWlTrHy0rq9
	J73NhxSF44scEbwxfIoBbC+j3Hfo+xOTMlPpjgrDNt8MyzFCVZGIwvMCqYN3rCRsf8tC
	JBb0unahkmZ1/6k2yA9OCCFtHk4CW+dw0dt29MXL6AAg2jVBtxUo4CN3xa6DvG+ODtkd
	xuaN+YDoZlJui6sN3XPOyHKyu2CeV08WOTvrAnDq9VKn74FyWfqW5snAOT+lyxbspM/t
	8jdqmKG9ezIBmnFya8x7ohaT5qyu4hRiCcSBAIs5FXi6S+eVX7EneEphppm8Y6mRMHRN
	NR3A==
X-Gm-Message-State: APjAAAVLkvBnBEHFFCpctnViXHojP9mBzAEOz0Q9bj1idYY5BwFFw9Mv
	5g8V/XxJvZ7zuVQfOzyoPHh5tAgnVt06/E/xjt/cYD8m
X-Google-Smtp-Source: APXvYqy94HHaZLlWoyfiU+Cc/74mbCHu5qjko9YiVK/oASCmluoNp47894ktG+0lT7NHptwAoiHN7IcfOk9nWsPoJpQ=
X-Received: by 2002:a24:c987:: with SMTP id h129mr13527411itg.74.1560253932858;
	Tue, 11 Jun 2019 04:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190611081146.24732-1-quentin.schulz@streamunlimited.com>
In-Reply-To: <20190611081146.24732-1-quentin.schulz@streamunlimited.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2019 12:52:01 +0100
Message-ID: <CAJTo0LbprqgXwvK=y+hXrAMoRoUi4DvV5PPQH48oyE_nGJyeRg@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Adrian Bunk <bunk@stusta.de>, andriy.danylovskyy@streamunlimited.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] meta: license: fix non-SPDX license being removed from INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 11 Jun 2019 11:52:12 -0000
Content-Type: text/plain; charset="UTF-8"

What would be really useful is a small selftest
(meta/lib/oeqa/selftest/cases) to exercise this codepath.  Have a test
that should work but doesn't before the fix, so the bug is
demonstrated and verified.

Ross

On Tue, 11 Jun 2019 at 09:13, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> A non-SPDX license (which is not an alias to an SPDX license) cannot
> currently be marked as incompatible in INCOMPATIBLE_LICENSE.
> In the current state, we take all INCOMPATIBLE_LICENSE and pass them
> through expand_wildcard_licenses which is only adding SPDX licenses that
> match the glob regexp of what is in INCOMPATIBLE_LICENSE (be it a direct
> match to an SPDX license or via an alias).
>
> This does not work well with custom licenses.
>
> E.g.:
>
> foo.bb:
> LICENSE = "FooLicense"
>
> conf/local.conf:
> INCOMPATIBLE_LICENSE = "FooLicense"
>
> `bitbake foo`
>
> Gives no warning, no error, builds and packages successfully, because
> INCOMPATIBLE_LICENSE is basically empty since FooLicense is neither in
> SPDXLICENSEMAP nor in SRC_DISTRIBUTE_LICENSES.
>
> Let's add the original licenses to the list returned by
> expand_wildcard_licenses to be able to handle the aforementioned case.
>
> INCOMPATIBLE_LICENSE = "FooLicense GPLv2 GPLv3+" used to "resolve" to
> "GPLv2 GPLv3". It now resolves to "FooLicense GPLv2 GPLv3 GPLv3+" which
> fixes the issue with custom licenses not being in SPDXLICENSEMAP or
> SRC_DISTRIBUTE_LICENSES and thus being left out of the blacklisted
> licenses.
>
> I needed to pass a list to expand_wildcard_licenses from the
> license_image class instead of the current output of map() because the
> operator [:] does not work on this kind of type, and list(map()) or
> anything that iterates over map() actually moves the iterator and breaks
> the forloop right after in expand_wildcard_licenses.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
> ---
>
> v3:
>   - fix git context from v2, patch cleanly applies on master branch now,
>
> v2:
>   - fixed image building by replacing map(lambda) by a comprehensive list so
> that we have a consistent input type for expand_wildcard_licenses,
>
>  meta/classes/license.bbclass       | 2 +-
>  meta/classes/license_image.bbclass | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index ed91a4b4db..adca881c85 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -268,7 +268,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
>      wildcards from SPDXLICENSEMAP flags and SRC_DISTRIBUTE_LICENSES values.
>      """
>      import fnmatch
> -    licenses = []
> +    licenses = wildcard_licenses[:]
>      spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
>      for wld_lic in wildcard_licenses:
>          spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
> diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
> index 6fb76be48e..2cfda81c99 100644
> --- a/meta/classes/license_image.bbclass
> +++ b/meta/classes/license_image.bbclass
> @@ -40,7 +40,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
>      import stat
>
>      bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
> -    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
> +    bad_licenses = [canonical_license(d, l) for l in bad_licenses]
>      bad_licenses = expand_wildcard_licenses(d, bad_licenses)
>
>      with open(license_manifest, "w") as license_file:
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

