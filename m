Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 97AF279D59
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 19:41:22 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u10-v6so831451pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2018 11:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=BvTeN9ONEMGO3GvShXh0oBG64+pPhhDeCMNzWmVZ2qY=;
	b=auycZ6quucZZhHkQGFUQa7EBdBsqIC5yMcE1JZmas+CYaJNrCnITwK60wcCglQVZwa
	4e0TMBHp1b9/v5xzTSRxdhuHSlo88po6w1L2l090D5T6Aroj+io/G0cUjpqVkj7m/55g
	gCS/GMctH4ImJz6rvyjK+7C136hDLcgm76lJAgduiadMId5WuToL2VvsSyyyvA7VDREh
	ptVUJb6KRYos3+AExfgfbcY7QzHS8Yh/odgZhCj/7SjNTAtFA1ghdkWYeqGlTmLqX9/E
	5sS5Pl4myAclxqqvFKwpS4iaYQlvNlJekzzf4eLtfdtJYDNdQwb537tVVjD/Q7WkUdlA
	36QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=BvTeN9ONEMGO3GvShXh0oBG64+pPhhDeCMNzWmVZ2qY=;
	b=fF4zO5q5h8sMsGNiPKfvxE/H5eag7PAes4dJPumTQTX33XbIbW9FQjYKUAkxHypge+
	ZOaFZIjp2Wpwbj69h6kGI/G6fIBqwNd7zBAAX8ouKiAkqC6yStTWxtEg/U14Db0FvmMq
	g+0ZGZDnhymDSPAFNNKMy7RrTxCtmoU72Mv9V+ssiaH0i9EJ7Cw9iHxPK87YabG2fim5
	3yfW19rdZwdWL2BbyZHeEUnIkmIP8oCZkebxx5SZbSlE/ElG6Zn39wL/YbCmGYYbeZWL
	P//SAdzblyhE+gkNGGYW3bFUUhObo52K8MOpl6Q6bZyd/NmXic6+AvqL9O+ZN20gA09x
	uO5Q==
X-Gm-Message-State: AGRZ1gK9Fjr+9Yuk0lZcO8eMrbZRJff37SLbFi/AyQtL9QH8HbF0tFnT
	5ixK5fbjvjKzNuCdqLYruOIhT8Rc
X-Google-Smtp-Source: AJdET5eQc48y1xyXT5h2Sl0tJ4zP3+FnPNgaeXUqN5QgqzyibA9gtG3sPNf1tcfXd3tqFdRXCtS3aA==
X-Received: by 2002:a63:78cd:: with SMTP id t196mr22358310pgc.62.1541533283134;
	Tue, 06 Nov 2018 11:41:23 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:bd6f:ce:d9fb:a281?
	([2601:202:4180:c33:bd6f:ce:d9fb:a281])
	by smtp.gmail.com with ESMTPSA id
	u29sm37185549pgn.23.2018.11.06.11.41.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Nov 2018 11:41:22 -0800 (PST)
To: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20181106100416.41548-1-martin@geanix.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <58cd5d08-9d24-0e30-7f9c-3bec2c93ba84@gmail.com>
Date: Tue, 6 Nov 2018 11:41:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181106100416.41548-1-martin@geanix.com>
Subject: Re: [PATCHv2] glibc: make ld-2.28.so reproducible on arm
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
X-List-Received-Date: Tue, 06 Nov 2018 19:41:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Martin,


On 11/6/18 2:04 AM, Martin Hundebøll wrote:
> Play the whack-a-mole game and add the .file directive to another
> assembly file that otherwise shows itself in ld-2.28.so debug file,
> which in turns alters the build-id of ld-2.28.so on target.
>
> Signed-off-by: Martin Hundebøll <martin@geanix.com>
> ---
>
> Changes since v1:
>
>  - Added signed-of-by tag
>
>  .../0034-inject-file-assembly-directives.patch      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
> index 3f9f8cf189..55eba2d43e 100644
> --- a/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
> +++ b/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
> @@ -257,3 +257,16 @@ index 244d87fb6d..14d3e2ce14 100644
>   /* Initial entry point code for the dynamic linker.
>      The C function `_dl_start' is the real entry point;
>      its return value is the user program's entry point.	*/

Please add Upsteam-Status: and Signed-off-by: in the patch itself.

You may want to review
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

This seems like a backport candidate for Thud too?

regards,

Armin

> +diff --git a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
> +index d26ad1f8d3..a0de10bf81 100644
> +--- a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
> ++++ b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
> +@@ -27,6 +27,8 @@
> +    ARM unwind tables for register to register moves, the actual opcodes
> +    are not defined.  */
> + 
> ++      .file "libc-do-syscall.S"
> ++
> + #if defined(__thumb__)
> + 	.thumb
> + 	.syntax unified

