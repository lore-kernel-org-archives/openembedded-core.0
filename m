Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 79F3E6011F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 17:03:54 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f144so32216715pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 09:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=HFGMTpaGe7o3SSbH6GC3fW4zh0hQH8jOu7SiQUneUnA=;
	b=hxxlS+aj3E80NKIPrTbxSqqmuy9606etBKLWrndADWfkadmSAngyp6icZ/IdK7E0Z4
	2g6wTfstD5yrwGT17NvXjp2rwa9at+Fft8r6OpTR2vfr5ZhNQrsXUnk1+uz3ONBn78Kt
	Kt6QWTeExz3PVBzq7HpzyyIC9V1hP1PwsCbt3h4W3NQm1KlN5tsgEXMIlDQ935I3aY+Z
	lpzyd4V8VrEB+kHXjcmEK9GLV1pyTHFr+KkkDWVgv1F3lZwzPyL6DxCLZ4v/umSQ0/Mt
	yTZXLYPkWUIHrQxFmWBTJSpjGZxi1+jcJzXO+XsE29NqoKr2ES23uXz5PdTktLUPdWPb
	EBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HFGMTpaGe7o3SSbH6GC3fW4zh0hQH8jOu7SiQUneUnA=;
	b=kUreqWgkPPc87qFhTnWXdm3H4ow4mbTfBjUWlYEQJynbVdZurrCgd+fmJMQlr2Yp7O
	gxInjW7MhqImYm5kqysMvwKX27SJP6qabGbjU7Pk5mUJ7nQkKWT9LCiH9UKlO92wgXuQ
	F/EF9liUkqHL9Hj6N1YL+3tF4QRFWaMGKe77iPGQacoukjggS1eWuME8m6VHRa+f7RJC
	nl26LNRiEAmReZURwoPB98Riv8YnxTSzI7vefqOcWl8xMw58JNx1wNLFKQtmWAHAKMEJ
	GJw/BGbeTP/AZiCqJYp4QyF2udvKs4Ia7jnmnQ7uXNIYRIeO/3Wl+RThfp7O8GfZy+7k
	c2kA==
X-Gm-Message-State: AIkVDXKNP5iJ8Rizux5ylpszhX+97fTiRek7foNnNSXZmcawYIbjk1XzdTT813FCMCR++w==
X-Received: by 10.98.12.196 with SMTP id 65mr4812411pfm.40.1485968634636;
	Wed, 01 Feb 2017 09:03:54 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:8ce9:48a5:c3c4:adfc])
	by smtp.gmail.com with ESMTPSA id
	199sm51058499pfu.91.2017.02.01.09.03.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 09:03:54 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1485865762.20333.161.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <d4623190-c52c-36f5-a1d5-a5c4e3214b62@gmail.com>
Date: Wed, 1 Feb 2017 09:03:53 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1485865762.20333.161.camel@intel.com>
Subject: Re: potential bashism in guile_2.0.13.bb
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
X-List-Received-Date: Wed, 01 Feb 2017 17:03:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit



On 1/31/17 4:29 AM, Patrick Ohly wrote:
> Hello!
> 
> verify-bashisms (after some fixing of the script) reports:
> 
> /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/guile/guile_2.0.13.bb
>  possible bashism in guile_cross_config line 94 ($'...' should be "$(printf '...')"):  
>         	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
> 			> ${B}/guile-config.cross
> 
> 
> This is for:
> 
> guile_cross_config() {
> 	# this is only for target recipe
> 	if [ "${PN}" = "guile" ]
> 	then
> 	        # Create guile-config returning target values instead of native values
> 	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
>         	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
> 			> ${B}/guile-config.cross
> 
> And the resulting guile-config.cross has (when /bin/sh -> /bin/dash):
> 
> #!/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/guile/2.0.13-r0/recipe-sysroot-native/usr/bin/x86_64-linux-guile$ \
> --no-auto-compile -e main -s
> !#
> (define %guile-build-info '(
> ...
> 
> This looks rather strange to me and I've no idea how the Linux kernel
> will interpret that first shebang line, which literally ends in
> ...guile$ \
> 
> Is the content as intended?

it should have come out as path to native guile with options, I think if
this is not happening it might just be installing wrong wrapper when
used it should complain. In any case its better to make it shell
independent.

> 
> It builds, whatever that means.
> 

