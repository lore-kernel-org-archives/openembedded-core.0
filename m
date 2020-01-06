Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id CFC0B7F873
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 00:41:42 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 2so26140863pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jan 2020 16:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=qkw76xDeqdiEjL/9dm+JWbRkxzaHN4bNhJl4qNCmIB4=;
	b=emx1iJV3irgrir2vjQDRNxu+sMq8YEwjWTDAZBoY2moM0qP0M6UKRtrc8McX926rU3
	pNEVKvchQOmXBlfQkNNxLm4Eme+bYThnlaeMXA8/Q79034KHXY+qQYh7mKRh410Z4ZNN
	CpU154b0GidYbh/6MnFAxN/gzplWvxnnyYPd9RmFmcW9Gh03SREz+Eo5Rs/sdCL64Z1k
	tY+fDGIfqeHon7qjmOECXGH2Yccv2+AGb5KqSpuyFZTrf6uSDdIy+zScCsh5E1vCzhT3
	4wwYGHnP+6ZVhdz+ViJYTIr/w+wncNp/Z41LK3vTQE5+7XiGgOKdLMiYxec13l/zgQsB
	Cqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qkw76xDeqdiEjL/9dm+JWbRkxzaHN4bNhJl4qNCmIB4=;
	b=B0cI7982AiBDz+46ZmOb+kMXhuvbnmeF7qtM3zfQyD2hzDaXZV7IZZa6Rj2V5ZaLo2
	I9kIPAfshpqiXdv8vR4lESICKfg6N9Uo9cZZdFsPNVJp4VNUsRaru1Y+XJG5RF9GHvq7
	wE6vzTcGkcenbQZSCRFCctZyqI5X9cqOVlqjwsFJFG2a3tzEHiH71DB91VMAvXKYwWpw
	ozbjBu6Nvow+pRlZmcbGnarrqgV7QQmbu7g/74DMIb2nnTfHFltxsof40NJeIYQKXew8
	Dd7NunBb4BLA1PF0ETd/NA4B4mBGp7VDMtgeJhphRSWMm47aKpBJK04+aUBD5XKV3owd
	PXxQ==
X-Gm-Message-State: APjAAAVa9yvxbguITkzB/AztQBuFcKgNAUW2+kVMRbp+WSq9PkgggA29
	t+19Vg8KA8twswSXhYflCLeyv7Cb
X-Google-Smtp-Source: APXvYqz1hCRCcHCSG8qAthoGNsDRK/Fldeilmg+HaeUgg7KI+gBLTE4YM9bmvLbvI1jKulrt8bemaQ==
X-Received: by 2002:a62:6381:: with SMTP id
	x123mr105652214pfb.75.1578271303664; 
	Sun, 05 Jan 2020 16:41:43 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:24ce:b2a3:bac9:47a9?
	([2601:202:4180:a5c0:24ce:b2a3:bac9:47a9])
	by smtp.gmail.com with ESMTPSA id
	m101sm21855123pje.13.2020.01.05.16.41.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 05 Jan 2020 16:41:43 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c5060a41-8348-37c7-7293-47a534182995@gmail.com>
Date: Sun, 5 Jan 2020 16:41:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/4] sstate: Add extra directory level
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
X-List-Received-Date: Mon, 06 Jan 2020 00:41:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/5/20 4:06 PM, Richard Purdie wrote:
> We're having speed issues on the autobuilder due to the numbers of files in sstate
> directories. We previously split these by the first two characters of the hash.
> This change extends this to split by the next two characters as well, creating
> more layers of directories.
>
> This should signifiantly speed up eSDK builds on the autobuilder as the current
> sstate layout simply isn't scaling there but addresses a general complaint.
>
> gen-lockedsig-cache needed to be updated for the new split level sstateI.

I assume zeus worthy?

> Also update tests for new layout.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sstate.bbclass             |  4 ++--
>  meta/lib/oeqa/selftest/cases/signing.py |  4 ++--
>  meta/lib/oeqa/selftest/cases/sstate.py  |  4 ++--
>  scripts/gen-lockedsig-cache             | 13 ++++++++++---
>  4 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index c0329cd5d18..7d2cb9eb840 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -6,7 +6,7 @@ SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
>  def generate_sstatefn(spec, hash, d):
>      if not hash:
>          hash = "INVALID"
> -    return hash[:2] + "/" + spec + hash
> +    return hash[:2] + "/" + hash[2:4] + "/" + spec + hash
>  
>  SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
>  SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
> @@ -15,7 +15,7 @@ SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PK
>  SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
>  SSTATE_EXTRAPATH   = ""
>  SSTATE_EXTRAPATHWILDCARD = ""
> -SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
> +SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}"
>  
>  # explicitly make PV to depend on evaluated value of PV variable
>  PV[vardepvalue] = "${PV}"
> diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
> index b65f3de64c4..9ea31328eff 100644
> --- a/meta/lib/oeqa/selftest/cases/signing.py
> +++ b/meta/lib/oeqa/selftest/cases/signing.py
> @@ -157,8 +157,8 @@ class Signing(OESelftestTestCase):
>              bitbake('-c clean %s' % test_recipe)
>              bitbake('-c populate_lic %s' % test_recipe)
>  
> -            recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_populate_lic.tgz.sig')
> -            recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_populate_lic.tgz')
> +            recipe_sig = glob.glob(sstatedir + '/*/*/*:ed:*_populate_lic.tgz.sig')
> +            recipe_tgz = glob.glob(sstatedir + '/*/*/*:ed:*_populate_lic.tgz')
>  
>              self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
>              self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
> diff --git a/meta/lib/oeqa/selftest/cases/sstate.py b/meta/lib/oeqa/selftest/cases/sstate.py
> index 410dec64fcd..80ce9e353c0 100644
> --- a/meta/lib/oeqa/selftest/cases/sstate.py
> +++ b/meta/lib/oeqa/selftest/cases/sstate.py
> @@ -56,11 +56,11 @@ class SStateBase(OESelftestTestCase):
>      def search_sstate(self, filename_regex, distro_specific=True, distro_nonspecific=True):
>          result = []
>          for root, dirs, files in os.walk(self.sstate_path):
> -            if distro_specific and re.search("%s/[a-z0-9]{2}$" % self.hostdistro, root):
> +            if distro_specific and re.search(r"%s/%s/[a-z0-9]{2}/[a-z0-9]{2}$" % (self.sstate_path, self.hostdistro), root):
>                  for f in files:
>                      if re.search(filename_regex, f):
>                          result.append(f)
> -            if distro_nonspecific and re.search("%s/[a-z0-9]{2}$" % self.sstate_path, root):
> +            if distro_nonspecific and re.search(r"%s/[a-z0-9]{2}/[a-z0-9]{2}$" % self.sstate_path, root):
>                  for f in files:
>                      if re.search(filename_regex, f):
>                          result.append(f)
> diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
> index 9bfae9d8323..6a7d2859104 100755
> --- a/scripts/gen-lockedsig-cache
> +++ b/scripts/gen-lockedsig-cache
> @@ -78,11 +78,18 @@ files = set()
>  sstate_content_cache = {}
>  for s in sigs:
>      prefix = s[:2]
> +    prefix2 = s[2:4]
>      if prefix not in sstate_content_cache:
>          sstate_content_cache[prefix] = build_sha_cache(prefix)
> -
> -    for f in sstate_content_cache[prefix][s]:
> -        files.add(f)
> +    if prefix2 not in sstate_content_cache[prefix]:
> +        sstate_content_cache[prefix][prefix2] = build_sha_cache(prefix + "/" + prefix2)
> +
> +    if s in sstate_content_cache[prefix]:
> +        for f in sstate_content_cache[prefix][s]:
> +            files.add(f)
> +    if s in sstate_content_cache[prefix][prefix2]:
> +        for f in sstate_content_cache[prefix][prefix2][s]:
> +            files.add(f)
>  
>  elapsed = time.perf_counter() - start_time
>  print("Gathering file list took %.1fs" % elapsed)


