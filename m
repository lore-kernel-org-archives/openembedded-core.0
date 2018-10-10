Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id CD46479AD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:29:23 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 23-v6so3035994pgc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 13:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=dVnhnGG8JTE4McVxcgdev0iGHbkz42UR8NHNdKJvNUM=;
	b=ozKBtwh9U3MBpZfJqReGiIGF6eF9FO890kMQ0xlDO+xmE1dkO6pCrV5X8HUpQDWqWI
	Ji3W2ltUHoTBzkmGa0G95uxc4buqQ/P+auxI4jmNH5HKlfn3aFcVQ1MumbArhNIbR/aE
	QsQorlmBZKB0Ma6xQB4royV8ipZekUF66UU0tbAvJWXwXXkAAWOp6DRezgsZiPHIRm2K
	GAo9FnzHtg89s5kI6FQCSDVLH8X/Qv4/g1cky8BYCPi0K5dTeLWEZWHT6nUs/6EnaE3B
	IDsgCXTJsROTxFUASzXCYf2xCJtWEiD6ArOJrTzVcktEuOBp7wdK99GrGLaebAyxHXjL
	6jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=dVnhnGG8JTE4McVxcgdev0iGHbkz42UR8NHNdKJvNUM=;
	b=bQsTtC4uZZ3EY+8xg9aYL0h/S2VB8m7Vu5GGikQTfkIHeEJWm1gO5jI/FynAeJmJu+
	7WtGwNq2X/a42nt5f/Q2XSxBvg0R0/9/cxOgzu5o94ALDcDehHTZtfSSBkxSuYa+v1Sm
	wvADKXwQkkxZ7jKrKiJOVuiut176whhnUPtNbPwo55zkvjOe8HjPp0NAy6nfas3X2lIG
	xxyaInBh9TYbsMuBWPgdAWO7avFvC8jmRtQtb2s207OvuZw7Hb9TLMtQKKERbtT1En62
	kTzYhvVoHf4mDzo3Iq9wUqCm2YHngHx0pTux5hbOIdc9ZjsG7OzMHwVbodoZtv0csprF
	7l2Q==
X-Gm-Message-State: ABuFfog0dMqbizlp/IvMRJ4C7pR7hf1C4pTSX92t5tRAWygSbtl0hK6z
	9fywh4NHsBDAMg21RmquCuA=
X-Google-Smtp-Source: ACcGV63rLGwx7pyWIGlz1MeJ8dQ+1r6rp4KlSHDT/kuFAJTdm0AWTltYb2iYfHKR0CgphO1s8kuw9Q==
X-Received: by 2002:a62:5547:: with SMTP id
	j68-v6mr13219953pfb.166.1539203364775; 
	Wed, 10 Oct 2018 13:29:24 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c41b:76c5:1d80:6c9?
	([2601:202:4180:c33:c41b:76c5:1d80:6c9])
	by smtp.gmail.com with ESMTPSA id
	k12-v6sm9252146pgo.34.2018.10.10.13.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:29:23 -0700 (PDT)
To: grygorii tertychnyi <gtertych@cisco.com>,
	openembedded-core@lists.openembedded.org
References: <20181010162624.7377-1-gtertych@cisco.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6238cb7b-8148-a707-89c6-151e1148bb76@gmail.com>
Date: Wed, 10 Oct 2018 13:29:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181010162624.7377-1-gtertych@cisco.com>
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH v3] lib/oe/utils: add eol to format_pkg_list()
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
X-List-Received-Date: Wed, 10 Oct 2018 20:29:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Grygorii,


On 10/10/2018 09:26 AM, grygorii tertychnyi via Openembedded-core wrote:
> Append '\n' to the non-empty formatted string before return. If you
> write it to the (manifest) file, it will ensure file ends with a newline.
>
> Many GNU utilities have problems processing the last line of a file
> if it is not '\n' terminated. E.g. if the last line is not terminated
> by a newline character, then "read" will read it but return false,
> leaving the broken partial line in the read variable(s).
> It can also break or adversely affect some text processing tools,
> that operate on the file.

is this needed for the cve patches?

- armin
> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
> ---
>
> Changes in v3:
>  o write_image_manifest(): remove extra '\n'
>
> PASS bitbake buildtools-tarball
> PASS bitbake core-image-minimal                                                                                              
> PASS bitbake core-image-sato -c do_populate_sdk_ext
> PASS oe-selftest --run-tests manifest.VerifyManifest.test_image_manifest_entries
>
>  meta/classes/rootfs-postcommands.bbclass | 1 -
>  meta/lib/oe/utils.py                     | 8 +++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index e816824f28..bde58ad6cd 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -253,7 +253,6 @@ python write_image_manifest () {
>      pkgs = image_list_installed_packages(d)
>      with open(manifest_name, 'w+') as image_manifest:
>          image_manifest.write(format_pkg_list(pkgs, "ver"))
> -        image_manifest.write("\n")
>  
>      if os.path.exists(manifest_name):
>          manifest_link = deploy_dir + "/" + link_name + ".manifest"
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 93b0763b0a..d05f517a70 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -347,7 +347,13 @@ def format_pkg_list(pkg_dict, ret_format=None):
>          for pkg in sorted(pkg_dict):
>              output.append(pkg)
>  
> -    return '\n'.join(output)
> +    output_str = '\n'.join(output)
> +
> +    if output_str:
> +        # make sure last line is newline terminated
> +        output_str += '\n'
> +
> +    return output_str
>  
>  def host_gcc_version(d, taskcontextonly=False):
>      import re, subprocess


