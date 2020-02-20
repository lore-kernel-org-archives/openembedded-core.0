Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 02E8F60B85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 19:30:23 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b22so1924371pls.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=fFFIE3MKreffJTUSBX6K6HUvtZAQqWH9zL57cugL4K0=;
	b=ozKZ7fn7UEIVfGB4UJx1dPsAXtMa1VcHwX4KXmHqtcgQocdutyQNDZNpnOEhg7NZWU
	s4I1BajmMsmgHFYufdWWvbCMT7jwXoW/QAl/8lG3SeXxPt0OXMmZk+N5VXbCFJxdlj5G
	0GEKIuiOJEftf42FnjeNW+W3GY2s99fIbC3VPwtZKaqEHHQGxeLoS6hYTPZB53UDqJBN
	U+TJRPj9ZDgrACDGDt5fItd+mN6gyrUxeAmuIdAO2kuG6n2rwLLiGG9DJV1rbdtDUNVc
	Yyv3pxM16UM3Jpl5Jo52gY0Ch20ukt2q92b/MoLEQKc5aFCDqKqq1bTK8r331jd+rBpE
	CDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fFFIE3MKreffJTUSBX6K6HUvtZAQqWH9zL57cugL4K0=;
	b=bUXjKMqSD1LdcbmGN83dy1dH3ZMjXolrwUVXDaw5pc0ukF0KlINIEFWsTk42KQMSX1
	9o0ydS7ni39U874Hc0NkByasddXsJvGoqrUPfkxRHufnftF+3YMFD8FIpJvSQepnN1yU
	sOgTwYDDd9vgdyKNu5+eqN8cXbdfoLn/THrea6FfYjqkW1yB5PtLAeBusdiot8aR/nPd
	IjjxkRNzHIIcgGxj4/NH+FwvfmWntChXVDPTn2dXMa/kA3igJdEUgK+A7Sdl2lPFb/85
	NccnUGIi3/6lyH5r869qYjTgKN+QTrDOQzNnjjDvOWZdZnccDtEgwqZQGcFZkyuGRTIH
	z1ew==
X-Gm-Message-State: APjAAAUmS0Rz79xBqJctK0OMie5v0ImpxUGQr9LT93dZ9txYluIVfO7G
	creDdBOg/0ln+Qy3t34PTLnpx7c6b7c=
X-Google-Smtp-Source: APXvYqwVfVkLGHDU1YHjUEjMduTsaiql7n+vSUlxMOezGkBhKieiJKW2m6QgBB7zrbtHfKSLhClt7A==
X-Received: by 2002:a17:902:b611:: with SMTP id
	b17mr32329351pls.23.1582227024467; 
	Thu, 20 Feb 2020 11:30:24 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:94fc:1e40:9cc4:7d04?
	([2601:646:9200:4e0:94fc:1e40:9cc4:7d04])
	by smtp.gmail.com with ESMTPSA id
	x21sm345928pfn.164.2020.02.20.11.30.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 20 Feb 2020 11:30:23 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200220185150.23422-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <e81900d2-4692-ca05-841d-d2fbceac70c2@gmail.com>
Date: Thu, 20 Feb 2020 11:30:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220185150.23422-1-JPEWhacker@gmail.com>
Subject: Re: [PATCH] classes/meson.bbclass: Explicitly mark functions as missing in MinGW
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
X-List-Received-Date: Thu, 20 Feb 2020 19:30:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/20/20 10:51 AM, Joshua Watt wrote:
> meson (with some help from GCC) misdetects certain builtin functions as
> being present on MinGW, when in fact they are not. Fix it by explicitly
> marking the functions as missing. This requires rearranging the
> meson.cross file to put the [properties] section at the end so the
> append works properly (meson can't handle duplicate sections).
> 

patch is fine workaround, but I think meson should look for strndup in 
string.h

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes/meson.bbclass | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 06034e8b47..5c74658d01 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -96,14 +96,6 @@ readelf = ${@meson_array('READELF', d)}
>   pkgconfig = 'pkg-config'
>   llvm-config = 'llvm-config${LLVMVERSION}'
>   
> -[properties]
> -needs_exe_wrapper = true
> -c_args = ${@meson_array('CFLAGS', d)}
> -c_link_args = ${@meson_array('LDFLAGS', d)}
> -cpp_args = ${@meson_array('CXXFLAGS', d)}
> -cpp_link_args = ${@meson_array('LDFLAGS', d)}
> -gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> -
>   [host_machine]
>   system = '${@meson_operating_system('HOST_OS', d)}'
>   cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
> @@ -115,6 +107,23 @@ system = '${@meson_operating_system('TARGET_OS', d)}'
>   cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
>   cpu = '${TARGET_ARCH}'
>   endian = '${@meson_endian('TARGET', d)}'
> +
> +[properties]
> +needs_exe_wrapper = true
> +c_args = ${@meson_array('CFLAGS', d)}
> +c_link_args = ${@meson_array('LDFLAGS', d)}
> +cpp_args = ${@meson_array('CXXFLAGS', d)}
> +cpp_link_args = ${@meson_array('LDFLAGS', d)}
> +gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> +EOF
> +}
> +
> +do_write_config_append_mingw32() {
> +    # meson mis-detects the presence of several builtin functions in MinGW
> +    # (see https://github.com/mesonbuild/meson/issues/3672).
> +    # Explicitly mark these functions as missing in the cross file
> +    cat >>${WORKDIR}/meson.cross <<EOF
> +has_function_strndup = false
>   EOF
>   }
>   
> 

