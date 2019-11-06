Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 82CEE7F857
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 21:43:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a11so345990wra.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 13:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=04iFG62SEfBflRK7s1r1QM3+WAeK/RkL9KZ3kdYYcKQ=;
	b=TaqBjRuTBE17/tLKf21M8aBXz3LPc8gtFKqW+KRAMOAtzI2Tc82BSIJmT5ruXf86AN
	ZoIjDCTFwHv/2A0CUfsRZEQzvwPCkhU7De6ynz2nX/FWTG/ZVLCScFlmgWnQh1i0S9Mo
	YOMUAiuIed3Q7CvKQmiMrpCXGkrLqK6EON5IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=04iFG62SEfBflRK7s1r1QM3+WAeK/RkL9KZ3kdYYcKQ=;
	b=lr1NZ0sAA8D0u4Ia/o1/kLA3PSEBOzX4Tm61xRQmLSeI25F+kVuK2234cwhd2jyaeX
	eBkYweg++qWcpFZYyWH5NJ7NvfK2SoONRfVkGZX+APIoRAGYlWa+KrtB5G9+I9JjvgRh
	MIn9FWWvRpqwGqoNsNTtIiAnwuhl++nKQGrDszY7IShQLWe6hHSnahhYBSm2xxLFNtrl
	P0nJymqd2VmjFVeS7+gEezWYJ/DZhd+4NKti8XCxcGIzRbl4IimeiQnZa9jutKM/F1Af
	6kHnP7WJSA1Huq45QSiLFRNb19QSbLQhAC7m3Z6DC3yjn55JU/fPycvpABw/OP4GFwDc
	Kk3w==
X-Gm-Message-State: APjAAAXwXIlYP+Z6gp8pDiN/YCQYOmQH3nNJ/+HOrMkBfzIW6slIAjnw
	OomWy27eKMcFP4y9TTk0gwR0cOeUREM=
X-Google-Smtp-Source: APXvYqxbm+0/Uo0WzNi93V5IU3tfFALqDoUOcdTwWFie08WPF9X+z5zhyvxtBncDvBVcN0bj10Bq/g==
X-Received: by 2002:a5d:574d:: with SMTP id q13mr5031795wrw.263.1573076598882; 
	Wed, 06 Nov 2019 13:43:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x26sm3770788wmc.14.2019.11.06.13.43.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 13:43:18 -0800 (PST)
Message-ID: <00c1eec5eca9c2b85aa83c21d272073cf6331f12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhixiong Chi <zhixiong.chi@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 06 Nov 2019 21:43:16 +0000
In-Reply-To: <20191106103252.60923-1-zhixiong.chi@windriver.com>
References: <20191106103252.60923-1-zhixiong.chi@windriver.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] libtirpc: create the symbol link for rpc header files
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
X-List-Received-Date: Wed, 06 Nov 2019 21:43:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-06 at 02:32 -0800, Zhixiong Chi wrote:
> Since the Sun RPC is deprecated in glibc, the rpc header files
> are not provided any more, but it allows alternative RPC
> implementations, such as TIRPC or rpcsvc-proto, to be used.
> 
> So we create the symbol link for rpc header files for tirpc to
> be more compatible with the glibc version and the application usage.
> 
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> index e73ffe7b17..a284521c1e 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> @@ -23,6 +23,20 @@ EXTRA_OECONF = "--disable-gssapi"
>  
>  do_install_append() {
>          chown root:root ${D}${sysconfdir}/netconfig
> +        install -d ${D}${includedir}/rpc
> +        install -d ${D}${includedir}/rpcsvc
> +        for link_header in ${D}${includedir}/tirpc/rpc/*; do
> +            if [ -f $link_header -a ! -e ${D}/${includedir}/rpc/$(basename $link_header) ]; then
> +                ln -sf ${includedir}/tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpc/$(basename $link_header)
> +            fi
> +        done
> +        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
> +            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
> +                ln -sf ${includedir}/tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
> +            fi
> +        done
> +        ln -sf  ${includedir}/tirpc/netconfig.h ${D}/${includedir}/netconfig.h
> +
>  }

bitbake libtirpc-native shows lots (31) of:

ERROR: libtirpc-native-1.1.4-r0 do_populate_sysroot: sstate found an absolute path symlink /media/build1/poky/build/tmp/work/x86_64-linux/libtirpc-native/1.1.4-r0/sysroot-destdir/media/build1/poky/build/tmp/work/x86_64-linux/libtirpc-native/1.1.4-r0/recipe-sysroot-native/usr/include/netconfig.h pointing at /media/build1/poky/build/tmp/work/x86_64-linux/libtirpc-native/1.1.4-r0/recipe-sysroot-native/usr/include/tirpc/netconfig.h. Please replace this with a relative link.

Cheers,

Richard


