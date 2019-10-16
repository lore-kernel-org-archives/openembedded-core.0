Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2E77F35E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 20:24:09 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q21so81119pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 13:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bu2qksiPo9szz82NYrKz4HQMOfOoGR+0xAPmwyBv08M=;
	b=kVtOJDF/tEZTFYU4JOvBMSFFOzYVbbieGP8JzeYIRzqlyX0GpA5Vb2nrWjxVmn1cIr
	1zkWrltqyb6fjFFeuKqa3l8ROK9Jx02IfOAJrQ+HNc21XgSVIbrMdO7XCwFnaChH15/S
	Wcrho5KdDltPPjIaPUX72Tt1SbojziUFmD3jzgGAUz5EUGDmjNTbRzNw1khK421wD/Jh
	uYWGR9NHRaGK2A5DXjv5pnYASM9CC3UIf/l4pwtXLiVi5AknyByMAhrS583xMWvdUwKn
	fjTHm6rZ/p3zxK0yiuYtMCEruQl/Op4yNnsBWB3lEuzorQSEBOc3tUB87cn6pQ4XSJ1q
	OLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=bu2qksiPo9szz82NYrKz4HQMOfOoGR+0xAPmwyBv08M=;
	b=WcA0pLF+ctsA2yBwIYqqLF0R+Co08vxoU8ltTNfDZsMC4F6apHR/NHg5/6GoSr1tzY
	BpWe/9GTPNNezrKJT0dE6Uno5hgrwVPRzbFRkL6P/l+MOZBN+KtJpmrj1Xfi04vAlEsa
	46HSOXG+wozLd+hIUSnJNBdOoIDVYCxYiDgcDFSUpRPWhbbaMiFAvO0bk2mmo/4hos2s
	YhwErwmdz7SxPvHUoa67/s7olimYwLkFI42Vt8goGgKLu2IOG/2WU4d+oJcRfr43cLeY
	+w9VBhHFkolfuIAZP9TtHmoZ7jRTtjKT2hbQlOeQvcJQbVSl84zELtksojR+QYsSLXBm
	v1Ow==
X-Gm-Message-State: APjAAAVx4fsh9JRfnbK8fbxnFpYLF3mp0FLfgaMXhbj+pSxSj9HJzPId
	bHF8V/MxCjs2jQuNzHRmNnYuiOaE
X-Google-Smtp-Source: APXvYqzal/d25tS6m25kmq9hPoVwDDaoOvEIaAWUKJntPDr0jc5ypustCK2iv2jnIEIbcGaOyvPjlw==
X-Received: by 2002:aa7:9525:: with SMTP id c5mr46098763pfp.22.1571257450693; 
	Wed, 16 Oct 2019 13:24:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:8dc1:2952:740a:7402?
	([2601:202:4180:a5c0:8dc1:2952:740a:7402])
	by smtp.gmail.com with ESMTPSA id
	i6sm31366229pfq.20.2019.10.16.13.24.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Oct 2019 13:24:10 -0700 (PDT)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1571243326.git.pkj@axis.com>
	<ce369f6028c064b2974447a91d83251a46bd675a.1571243326.git.pkj@axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fd3f7aaa-47bb-d685-3195-35caf1b31e23@gmail.com>
Date: Wed, 16 Oct 2019 13:24:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ce369f6028c064b2974447a91d83251a46bd675a.1571243326.git.pkj@axis.com>
Subject: Re: [warrior][PATCH 1/8] meson.bbclass: Remove the MESON_*_ARGS variables
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
X-List-Received-Date: Wed, 16 Oct 2019 20:24:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/16/19 9:30 AM, Peter Kjellerstedt wrote:
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>
> The options in ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} are already passed
> via ${CC}/${CXX} and there is no reason to pass them a second time. Thus
> we can remove MESON_TOOLCHAIN_ARGS. And when it is removed, the other
> MESON_*_ARGS variables revert to the standard CFLAGS, CXXFLAGS and
> LDFLAGS, so just use them directly instead.
the above is not a reason to backport to warrior
> Apart from the obvious improvement with not passing a lot of options
> twice, this also solves a problem where -pie would be passed on the
> command line in a way that it would prevent building any dynamic
> libraries using meson if using a toolchain that is not built with
> --enable-default-pie and if security_flags.inc is used.

but this is.


- armin
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/meson.bbclass | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 115d1aedcb..5c0139f02a 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -30,11 +30,6 @@ MESONOPTS = " --prefix ${prefix} \
>                -Dcpp_args='${BUILD_CPPFLAGS} ${BUILD_CXXFLAGS}' \
>                -Dcpp_link_args='${BUILD_LDFLAGS}'"
>  
> -MESON_TOOLCHAIN_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> -MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
> -MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CXXFLAGS}"
> -MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
> -
>  EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
>  
>  MESON_CROSS_FILE = ""
> @@ -76,7 +71,7 @@ def meson_endian(prefix, d):
>          bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
>  
>  addtask write_config before do_configure
> -do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
> +do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
>  do_write_config() {
>      # This needs to be Py to split the args into single-element lists
>      cat >${WORKDIR}/meson.cross <<EOF
> @@ -93,10 +88,10 @@ llvm-config = 'llvm-config8.0.0'
>  
>  [properties]
>  needs_exe_wrapper = true
> -c_args = ${@meson_array('MESON_C_ARGS', d)}
> -c_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
> -cpp_args = ${@meson_array('MESON_CPP_ARGS', d)}
> -cpp_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
> +c_args = ${@meson_array('CFLAGS', d)}
> +c_link_args = ${@meson_array('LDFLAGS', d)}
> +cpp_args = ${@meson_array('CXXFLAGS', d)}
> +cpp_link_args = ${@meson_array('LDFLAGS', d)}
>  gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
>  
>  [host_machine]


