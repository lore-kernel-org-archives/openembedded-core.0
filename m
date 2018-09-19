Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 579A879261
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 11:08:45 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id c12-v6so5320219otl.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 04:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/ZWDDxtIF4mLaFM9Q9n+O5Txg3xgxWSHPUTPcoGZgNk=;
	b=tkN8OGBGhjlQgNY1+p7RSj2aDYP7bD4LWGVe3/PHa08vlNEvr8SYWadmREiF9DbeJF
	eyIAb2V+gLIhPQqiS/JoQIJ1+lK5y7JfD2bFWdT/UDD4rcGp09Ff3OgcFOEPPZnKV8y4
	PzDJj7jf3A37nE91D4kzjjg9olr0n8Nd7/V5xjw2kWqCCQlVa5uSbDr8KGhxPBQh5HdN
	/qY3dtJTRxQz/XNZiVTlo+DxSmNTowNMsuRjda2dyhHNUeDWVjhmWiSMV8GsFgYvJiA2
	VlFMsbW3LpavW0bjeYbClLsTysX83hy3fcf+QwWjAPpBNv6AK6hMiyepYAQOmmgmgMyX
	BvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/ZWDDxtIF4mLaFM9Q9n+O5Txg3xgxWSHPUTPcoGZgNk=;
	b=pJxi6D9tlTa15AP0r5QtXPhI/0gzRhYQSUfo+2Demee6U9/nPw3kp2VyV2FpBjSIUr
	9Y+ySWGjLfIxyHUBVzU0ULX4dc9y0mdld6eRwFW+4YIUEqJMuiUzUgQgnmUEnq2a2zzF
	0Hvg2fkg5Pxcmpfgk2WsCFVECzaNmz/ehnV2asI3x75BF77t4Rc4zaw8CuCPuup9J7rq
	b9/nwIHsELCp9jIilP8s34kgsSvJHh5XZCUDFeBU84pXn+QnorBW+C6bFUvx8sJBqjvZ
	IwldKQv2cDWdGwh+2RN9SG/e++6uV/7ub0vB8IacrKBV50OKqJg+JbCb4NCPXwIubKSU
	qu5Q==
X-Gm-Message-State: APzg51CqMKBTam9jzOhqomgwe9l7i7Dp04v2rmVQdZfbsms4v9uzo5sW
	rTANyBfsYSoGPcaf4YNaWWrsJgajBCEOKg9jomwzTA==
X-Google-Smtp-Source: ANB0VdZe75sj5MVe3hf2TCZFoam4syJbfDAudY2FWjNFPT4kmmwi4ZzscauhnYHdhljRrCesU6nKGR78fCgAvGkTIPs=
X-Received: by 2002:a9d:2253:: with SMTP id
	o77-v6mr19883320ota.204.1537355326123; 
	Wed, 19 Sep 2018 04:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <1536960788-26056-1-git-send-email-geissonator@gmail.com>
	<1536960788-26056-2-git-send-email-geissonator@gmail.com>
In-Reply-To: <1536960788-26056-2-git-send-email-geissonator@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Sep 2018 12:08:34 +0100
Message-ID: <CAJTo0La92vSVCfQyvgJga1gMrH=VskopHv9FnRHbiJ7yBA5-eQ@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] python: respect package order in manifest
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
X-List-Received-Date: Wed, 19 Sep 2018 11:08:45 -0000
Content-Type: text/plain; charset="UTF-8"

Close, but:

ERROR: python-2.7.15-r1 do_package_qa: QA Issue: non -staticdev
package contains static .a library: python-distutils path
'/work/corei7-64-poky-linux/python/2.7.15-r1/packages-split/python-distutils/usr/lib/python2.7/config/libpython2.7.a'
[staticdev]

Ross
On Fri, 14 Sep 2018 at 22:33, Andrew Geissler <geissonator@gmail.com> wrote:
>
> Don't sort the manifest when using it to generate packaging rules, so
> ordering can be used to have complex packaging rules.
>
> This is a backport of the same changes done by Ross Burton for python3
>
> Signed-off-by: Andrew Geissler <geissonator@gmail.com>
> ---
>  meta/recipes-devtools/python/python_2.7.15.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
> index 43d9ff5..472c1da 100644
> --- a/meta/recipes-devtools/python/python_2.7.15.bb
> +++ b/meta/recipes-devtools/python/python_2.7.15.bb
> @@ -207,7 +207,7 @@ RPROVIDES_${PN} += "${PN}-modules"
>  INCLUDE_PYCS ?= "1"
>
>  python(){
> -    import json
> +    import collections, json
>
>      filename = os.path.join(d.getVar('THISDIR'), 'python', 'python2-manifest.json')
>      # This python changes the datastore based on the contents of a file, so mark
> @@ -215,7 +215,7 @@ python(){
>      bb.parse.mark_dependency(d, filename)
>
>      with open(filename) as manifest_file:
> -        python_manifest=json.load(manifest_file)
> +        python_manifest=json.load(manifest_file, object_pairs_hook=collections.OrderedDict)
>
>      include_pycs = d.getVar('INCLUDE_PYCS')
>
> @@ -248,8 +248,6 @@ python(){
>              d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
>          d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
>
> -    # We need to ensure staticdev packages match for files first so we sort in reverse
> -    newpackages.sort(reverse=True)
>      # Prepending so to avoid python-misc getting everything
>      packages = newpackages + packages
>      d.setVar('PACKAGES', ' '.join(packages))
> --
> 2.7.4
>

