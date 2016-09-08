Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AEE366FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 15:45:50 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n24so2669673pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 08:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=aEAN21VPFnVjPvvzBRIvNg/CBXI8tzLHnSiu1RdromQ=;
	b=tpWPKl/orrdSRmFchTgpcxNRf7UATkpb9kc5Or8DPUk1fBp3QopZvHUs44YNBeXVXi
	8UMBRnJ7vTP3MTfO4tAtRKrmnlFDfqM3RFxCjRMdMVrbstysaM88P9ELAkPOsaqqBxMS
	O7iBmDNXlGFqULq1yQ/+LXtTb1HzOfV4vhH+O+Sv/Lumj20VwvPiR1LONA5iXT4EhfrE
	6Sx8veYaZ0ITwPGT++lI5vdG7fEr0KPhN468lluYmACtXeF0A25uR1DKPG9fykcDDmZS
	4StEQxcUWs2qwWyXhLphG3u5iVYTHp9yspGNzMQEbZTsm/VDxOEaPmNnPF4ugP5bzzxu
	n3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=aEAN21VPFnVjPvvzBRIvNg/CBXI8tzLHnSiu1RdromQ=;
	b=BC3FgBabz4joiNJjs2u9puYQVuNyYv612qnsFBLOnqzLZ/dblFwPYcds2lzp+3bIDF
	P0eeNo6KPMbD5l5zf7UbghjcXltniS3k7jIkf4JA1Es1JPpW3zsCvusxSiufRdUEAL8y
	sCvGhon2NOg4YNFa81QShpKCaX6/G6ZEUI7F9ut3h4g4FIYbVVcjJrWW/bnetdu5TQzQ
	ZjPoCjR95THCaAZpN9EVyE/idqF4G2wnrHlLAhfw+nTgbGoeSil/B8pKyTkAZg71MNi4
	2CWx58a/fkTdaj1kzlACnTe2GdhpDd38P02ZPkxqZ/FdWTLPwsHxCk1ka5prrnYHq+lx
	gYXA==
X-Gm-Message-State: AE9vXwNaZJYVIa7JNj3J3p4jgALlUWcywGrix+sB7E4tE2OkYSWJO9P2oRYCU/xLBIONFw==
X-Received: by 10.98.90.133 with SMTP id o127mr489969pfb.61.1473349550877;
	Thu, 08 Sep 2016 08:45:50 -0700 (PDT)
Received: from [10.22.11.169] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156])
	by smtp.gmail.com with ESMTPSA id d5sm57287545pfc.4.2016.09.08.08.45.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 08:45:49 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1473340457-31797-1-git-send-email-Zubair.Kakakhel@imgtec.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <e0f721cd-96d5-e3a5-b060-83bb467d1784@gmail.com>
Date: Thu, 8 Sep 2016 08:45:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473340457-31797-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH] valgrind: MIPS: Make toolchain basename generic
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
X-List-Received-Date: Thu, 08 Sep 2016 15:45:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/08/2016 06:14 AM, Zubair Lutfullah Kakakhel wrote:
> For the hard float case, COMPATIBLE_HOST should be set to ".*-linux"
> since OE can support multiple distro layers, not just poky.
>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

is this good for Krogoth too? it has the same version.

- armin
>
> ---
> Pointed out by Andre McCurdy but patch v1 had already been accepted
> and applied.
> ---
>   meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> index 3d49131..42fd27f 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> @@ -39,8 +39,8 @@ COMPATIBLE_HOST_armv5 = 'null'
>   COMPATIBLE_HOST_armv6 = 'null'
>   
>   # valgrind doesn't like mips soft float
> -COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mips-poky-linux", d)}"
> -COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mipsel-poky-linux", d)}"
> +COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
> +COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
>   
>   inherit autotools ptest
>   


