Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3E16465C8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 16:53:07 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y68so1697308pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 08:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=hi0bQKjGi1PGFIynY1c/Fv4/1YVwY6xqngfh8iDfaUo=;
	b=1BvfbJBo1yi9n5crJiN8OYEWrGNNIuqyamdiy22Dptxs+hOaO6glkJifivGpJRsNuA
	4b+zkMqRv8DHZN9aUMBsI3MEhd5uGSwCzUoNh5NnoyYq8VPQSS65HzG3Grvv1/Chp1+V
	Pn+xBTDmwjwLeSu+KAiHcESACnGOBYn0RrGJ/VyW8yXtPPr+H36Ci+byrhiTKcM4DDo4
	7/e7Gcm5Yh6UAJdmlgLivrzj1uQ4g7Yzhpw0+rjSE5zQA85wSsr+DXMEJyt16NQBj5Rp
	GCZTx3jcUEF2rQC5UQsccSCCQfWH85suZwnmGnT8z98o18nh4m1CZxzVgxrVY8ozHumm
	AcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hi0bQKjGi1PGFIynY1c/Fv4/1YVwY6xqngfh8iDfaUo=;
	b=I0U3A91nyiZWGSfnetId0FHmBPB4zt9NJUFI0ZFyZL+dIdfby8jSNYE/blg1NteSHK
	uv8EKoRjNdcNoKkkx2gxrb4o1d6aV6CBWbPzxSYGHd5Qxf4qrz8LCi6Rq/z2PiCoo1E5
	MrOkzMDYPFeIMyQTtQdFBrCjEAbUmNHlwN+Ngsj3oNT8yLGkBPINMphvtf5o8ESq7acE
	R1sBUqY6pcGv+CeuTUkyoqMmWa2wZrJtcHpf3eIfbslHS73zHfkzsw/WKxA73373jlpb
	yYaaGBUiQHySP1/kWMpVQlW1MOxak7Lm/xWcHJEGqZGrvo0tmsp8tHDeHw+e+UStUYWz
	gK1A==
X-Gm-Message-State: AKaTC001nD3qc6WJGkyPTZ+CClAWo61z+Bcw7L+7LkY3VG+/KbmXu3sEGEjVVqKuFqYNLA==
X-Received: by 10.84.169.169 with SMTP id h38mr1506320plb.48.1479833589231;
	Tue, 22 Nov 2016 08:53:09 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:81c9:bbf5:f92d:a3d8?
	([2601:202:4001:9ea0:81c9:bbf5:f92d:a3d8])
	by smtp.gmail.com with ESMTPSA id
	h7sm28536124pgn.13.2016.11.22.08.53.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 08:53:08 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org
References: <cover.1479830169.git.bruce.ashfield@windriver.com>
	<1656a2c98cd4f8113972d3c86870dc1eaf323760.1479830169.git.bruce.ashfield@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <dc66e7b7-8723-ec27-bdc5-1462d76c3798@gmail.com>
Date: Tue, 22 Nov 2016 08:53:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1656a2c98cd4f8113972d3c86870dc1eaf323760.1479830169.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/7] kern-tools: error checking and tree generation fixes
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
X-List-Received-Date: Tue, 22 Nov 2016 16:53:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Bruce,


On 11/22/2016 07:59 AM, Bruce Ashfield wrote:
> During processing of the kernel meta data the kern tools were
> not properly exiting on syntax errors or invalid commands.

Does Morty need this?
-Armin
>
> Noticing and debugging these issues wasn't trivial. To make this
> easier, we now trap the error and dump the offending meta-data
> for the user to see.
>
> There was also an issue with creating branches during tree
> generation, which is resolved by always switching to the
> active branch.
>
> The following are the commit logs of the changes themselves:
>
> [
>    commit b36f6f9a5695f2084b83823393e13ca42284bed9
>    Author: Paul Gortmaker <paul.gortmaker@windriver.com>
>    Date:   Sat Oct 22 17:23:25 2016 -0400
>
>        kgit-scc: dont mention meta-repo in help ; it doesnt exist
>
>        Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>        Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
>    commit 08463d684c1952e74c25344cddace4c3f24c739d
>    Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>    Date:   Mon Oct 31 14:30:12 2016 -0400
>
>        scc: exit on error
>
>        If there is an error in the processing of the input files, scc
>        should exit and inform the user.
>
>        scc is executed on a combined/preprocessed file and as a result
>        it doesn't have the granularity to see each input file individually.
>
>        Rather than moving preprocessing into scc (from spp), we can trap
>        the line number of the error and dump context around the line.
>        This gives the user a pointer to the input file and the specific
>        line that caused the problem.
>
>        Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
>    commit bf99953e8ac14cee653e559f2d4a6022c847a182
>    Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>    Date:   Fri Oct 28 21:23:27 2016 -0400
>
>        kgit-meta: always checkout branches on branch commands
>
>        During a tree generation we must always make the branch active when
>        we see any kind of branch command. This ensures that any subsequent
>        patches are applied in the proper context.
>
>        Previously, only branch creation was changing the active branch, and
>        this mean that tree generation was not determinstic and relied
>        on the order of processing to generate a correct tree.
>
>        Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ]
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index d8041ddd38c5..88b1aee729c9 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
>   
>   DEPENDS = "git-native"
>   
> -SRCREV = "9a3995ee8daabf37e92e1b51b133cf8582d85809"
> +SRCREV = "b36f6f9a5695f2084b83823393e13ca42284bed9"
>   PR = "r12"
>   PV = "0.2+git${SRCPV}"
>   


