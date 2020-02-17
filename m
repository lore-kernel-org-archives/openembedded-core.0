Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7F4613E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 11:03:20 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id q8so18339656ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 03:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=KnB5jVfWxrZ+zpEQ0DLsxfnADv1soDQYS49i7kFi0o4=;
	b=RJos6mUCxyioBFJ7TUepPZIvDabUwdzdPpHX/MPQ5T/fKQZItYrQXr+QzsV6GCZ9ov
	3GrhdXEDelPk/DNZufL1bLK15g4CKDEJocrW4DewKqSMBLpkuhM+yikZn11KVQMjd6vQ
	IVQ+9a/DWp2aTft2kEdu+eshbQQCvObzk7InwC4My+9FJHFHmsYDxv55t6j808l6Flpu
	X9N1qYXPl6Hlf3+t5EcX+h/rm0VwgPy9qDHgTf6geA6U5TmEK1D9B5/t8CcWX6ZflKV8
	/T1+yKXXMqKn25hZPN+/ItPWdWvX5+lRVRTcFtLwV20qeRnHUztifsvrzKcb3QJJwOT+
	9j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KnB5jVfWxrZ+zpEQ0DLsxfnADv1soDQYS49i7kFi0o4=;
	b=A6Jq0nnqrgN8P9phSOmRXtzPsxz6WzhJwkSg+BQgaw7zo46+vKZGZZCJXNp5twaJ65
	jeSsx9T9Vhfn+8Fi9KNAlA5XLNn19dUqQTT6DJA70Gl2Q4JNqtM5zWARinkYMhZq812U
	xo41hexYnONGs+UIieamFCbLMwSC8DyNCwZq3I5Fd3NZjMqmP5pLhtcOBDHjKAYJotuo
	8Ilf1hdt2+FgogADrVOSMcgvB8FEFhLYiWErqh4u20Hvg+CNz6OiVVdz+uqLUOIgrFDu
	9e70tqxVGCWGfBIRgbzNpDDni57Of7xz80RapeQd9kmKM/Dlo2H7x74vBK5sNn1J13ip
	C5lw==
X-Gm-Message-State: APjAAAVswy106JE8ViNEWxr/J6cFp238psQhZuVdbOmgW7YRALfBXXsb
	omELtBctk7VkAMJJrfOxaelLne5C
X-Google-Smtp-Source: APXvYqynSNdFJ1OGdznVPtebFS8uoQGgI3+tqv3OKjw7shBxZKOMlNhWYCF6mMrkC9tLkVq3N7M+dA==
X-Received: by 2002:a05:651c:321:: with SMTP id
	b1mr9645972ljp.62.1581937400555; 
	Mon, 17 Feb 2020 03:03:20 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id x10sm164257ljd.68.2020.02.17.03.03.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 17 Feb 2020 03:03:19 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200217105930.902-1-wallinux@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <ac6d6a63-124f-099f-d1ff-e3092b506341@gmail.com>
Date: Mon, 17 Feb 2020 12:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217105930.902-1-wallinux@gmail.com>
Subject: Re: [PATCH] babeltrace: update to 1.5.8
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
X-List-Received-Date: Mon, 17 Feb 2020 11:03:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/17/20 11:59 AM, Anders Wallin wrote:
> updated HOMEPAGE to http://babeltrace.org/
> updated LICENSE to include LGPLv2.1
> 
> Signed-off-by: Anders Wallin <wallinux@gmail.com>
> ---
>   meta/recipes-kernel/lttng/babeltrace_1.5.8.bb | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> 
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> new file mode 100644
> index 0000000000..b6b7653037
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Babeltrace - Trace Format Babel Tower"
> +DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
> +HOMEPAGE = "http://babeltrace.org/"
> +BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
> +LICENSE = "MIT & GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
> +
> +DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
> +
> +SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
> +SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--disable-debug-info"
> +
> +ASNEEDED = ""
> 

Looks like this patch adds a new recipe for 1.5.8, and keeps the 1.5.7 
recipe. Was that intentional ?

