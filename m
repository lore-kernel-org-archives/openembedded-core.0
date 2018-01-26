Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 78B7B78741
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 03:39:24 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id o13so6439273pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 19:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=w/vxY3mz13COccLZz/R9OGNfjnDokkrtjOesUHHVqwU=;
	b=BeDx7XIGjrcoSI04CYw4PkjCTLL5yRN7+JrJmDMBPLwI7bOdDJgHiMLR9pZw0lGQeM
	XWvTxs9AWIHUOYf5FEWrW6ztxfygbgtR4YYPEMnsbn476lYfa860GJgMhsZB8l5mzkhm
	PopCiDDHMt0xwIwrwD19I/TyOZOJZZL+sJ9ydfXish1HpKpvC39Y1j0NG11zpWtt/2mB
	8tO8GwpHKJ9eAJnC4YFPjSLb05svYlE8uJQrZTMcuIsCfiNnMOP4dv4L9iEGUiDsqeen
	Lv7vs7LD8W9umuzapBewSVTTjoq6c7wFEL2XrwcOB6wB9QPcQg/kpy6ckiozz+g3h0HJ
	Gmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=w/vxY3mz13COccLZz/R9OGNfjnDokkrtjOesUHHVqwU=;
	b=JRomzAwWXdG2Lhd6WAOYL0k8FBu4JJdFvx/7XDR8fcNkTL8fNFzUKdZEWgJh+r5ZKW
	rfNOgaV0HaUu2weqTjGsYnophzAZlaveAGrNPWPuvgXgZ+6IP1cI2ZAmOyIbsG/ZwE+P
	6I+ulYzNjEtHb8FPjdYsDP+e5dFlr/0SGs+tocBK8SWzdd4qC6WC4lZCBQDUzUmu7Fk1
	z+hBuGEFnbq3YrOZ91cCgYsMp+wn+Gy9YcZXIDRkKpjovNG8Ix08OC063NgbCuh0pHLz
	VGNaQGJSLU7hOLML5XgWHla5gVrJSqJAcBivTal5s1vmDvWY2lkxSeDBJQSCYmwkUWhL
	Tj7A==
X-Gm-Message-State: AKwxytcsWkpuUq8sVH5JTYW/nTwm3kYjfr9eDlXbfE/tgB99MN/chQim
	gQH+2735HfECqeP87mTFXvL6stBi
X-Google-Smtp-Source: AH8x2240wdA8NS7EaVcW+ZiZBDzp5z0fmWK4+hoU0sOVc2bvvULp1NzQLoxOqbfSpH+tmjwyU5W0PQ==
X-Received: by 10.98.236.93 with SMTP id k90mr18100402pfh.35.1516937965246;
	Thu, 25 Jan 2018 19:39:25 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:3012:7af4:dd04:6cda])
	by smtp.gmail.com with ESMTPSA id n21sm1628670pfi.9.2018.01.25.19.39.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jan 2018 19:39:24 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1513972523-23788-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <73d12ae5-f3b8-3a71-b3a9-099f51eec2cf@gmail.com>
Date: Thu, 25 Jan 2018 19:39:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1513972523-23788-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
Subject: Re: [PATCH] systemtap_git.inc: Add microblazeel as a supported architecture
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
X-List-Received-Date: Fri, 26 Jan 2018 03:39:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/22/17 11:55 AM, Bhargava Sreekantappa Gayathri wrote:
> This patch adds microblazeel as a supported architecture for systemtap.
> 
> Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
> ---
>   meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 3dc688a..547b3c1 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -16,7 +16,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
>              "
>   
>   # systemtap doesn't support mips
> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64).*-linux'
> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel).*-linux'

is little endian the only config for microblaze ? I wonder if BE is 
accidentally left out.

>   
>   S = "${WORKDIR}/git"
>   
> 

