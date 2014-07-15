Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 46C406AC7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 05:30:12 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id rd3so6661225pab.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ycGtHP92mV7JZtWxACTL6hpxs8hFuB+ZpsmdvB6047o=;
	b=V5GAK09in7+ezF9Mhbu3zE83fAla3tITAhiQNUxDtxe7fg/GAxrZjxZ35CGyIfuwfn
	kNFABGSL/95VNGEcpbQoQxgJPLbhTSnB1wEq6Hmxi2vkHYU9wLGuhNZuW9Rl4lqacrxk
	eu1cMSt6FML1qnqeCkzGn10itfwO+mPCqW7X4J5K+hRY5Q7R2fHXVr4gRQHJOSAwwKdl
	ftKpbgONgb0ihIgVB4pvhtJVfWizCeJCjyeuSwgMjTMRqWbHFjAbKjBZAsMQ/Y3BPFxX
	rymQ1rCR+DcsEujHrSq463TbKLySa1wykaU2yB5r0mQgWAQlRsB6xPOWfmICbXe69Ruy
	r/qg==
X-Gm-Message-State: ALoCoQk51dPi8BC8MnGMxsGP4/tVoUFAyGyBxzPt4hcUoaMEd11krMfs6pUo7EG5VEoxcwG17BOP
X-Received: by 10.70.33.228 with SMTP id u4mr19453114pdi.6.1405402214080;
	Mon, 14 Jul 2014 22:30:14 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	qf10sm12628146pbc.23.2014.07.14.22.30.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Jul 2014 22:30:13 -0700 (PDT)
Message-ID: <53C4BC63.6070501@mvista.com>
Date: Mon, 14 Jul 2014 22:30:11 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1405388483-30716-1-git-send-email-akuster@mvista.com>
In-Reply-To: <1405388483-30716-1-git-send-email-akuster@mvista.com>
Subject: Re: [meta-oe][PATCH] V2 lz4: update to latest version
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
X-List-Received-Date: Tue, 15 Jul 2014 05:30:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Bah,

missed removing old recipe and wrong list.

- Armin

On 07/14/2014 06:41 PM, Armin Kuster wrote:
> update to version r119
> Use github instead of svn
> LICENSE md5sum changed since it was updated in r117
> FIxes CVE-2014-4611
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   meta/recipes-support/lz4/lz4_git.bb | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta/recipes-support/lz4/lz4_git.bb
>
> diff --git a/meta/recipes-support/lz4/lz4_git.bb b/meta/recipes-support/lz4/lz4_git.bb
> new file mode 100644
> index 0000000..3978d76
> --- /dev/null
> +++ b/meta/recipes-support/lz4/lz4_git.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Extremely Fast Compression algorithm"
> +DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
> +
> +SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
> +SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
> +
> +do_install() {
> +	oe_runmake install
> +}
> +
> +BBCLASSEXTEND += "native nativesdk"
>

