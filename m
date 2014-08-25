Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id C0DA0601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:20:07 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id et14so21136566pad.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 09:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eYZicqYnop3+L7NeH0oerFk6HzjXgnihM8BFzTZVJIg=;
	b=YHGv0QYuKPeG7FKi/oUtlss16Uxtj+QdxmtDyEdShbYiQjyIlbVpR5ExNj+WTnMtl1
	RX0iHQzinZOQ4lKDdIiqL+GuuNcAw1SsMpQY9jZccCGARjvJsx56zxHeWkiUstw+Eck5
	tqbsZ8aRW4V2Kw1pxb02qFq9ptmxLDpPg4nzBZ4lk0ZdqJjNKcvsBT70JjaIpZVaDekm
	joo2QcmgtF1hb0JZt96OJXUXNi3xjk6N3Ql20MXmPI2b+HRXa30QlKDuQ3RjvmG56vL5
	+od54xa09TSvZ4tAAKV4ziJpNYQCDjhPYuKh9sphJIP68cUqsZ+Cc8CZMHBY0w0gOaLD
	vGbA==
X-Received: by 10.68.221.166 with SMTP id qf6mr30438586pbc.12.1408983609069;
	Mon, 25 Aug 2014 09:20:09 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id yw4sm221194pbc.69.2014.08.25.09.20.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 09:20:08 -0700 (PDT)
Date: Mon, 25 Aug 2014 09:23:52 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20140825162352.GA22907@haswell>
References: <cover.1408066680.git.peter.seebach@windriver.com>
	<5303a1f15a0c44dcc34e7bdec060629518e6cd6e.1408066680.git.peter.seebach@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5303a1f15a0c44dcc34e7bdec060629518e6cd6e.1408066680.git.peter.seebach@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips.conf: Default to (and support) mips32r2
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
X-List-Received-Date: Mon, 25 Aug 2014 16:20:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-14 20:42:47, Peter Seebach wrote:
> The MIPS emulation for qemumips actually supports
> mips32r2:
> 	isa                     : mips1 mips2 mips32r1 mips32r2
> 
> We should probably use that tuning file.
> 
> This implicitly changes the default value of DEFAULTTUNE to
> mips32r2.
> 
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/conf/machine/qemumips.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
> index ce1c419..d9d2421 100644
> --- a/meta/conf/machine/qemumips.conf
> +++ b/meta/conf/machine/qemumips.conf
> @@ -3,7 +3,7 @@
>  #@DESCRIPTION: mti_malta32_be
>  
>  require conf/machine/include/qemu.inc
> -require conf/machine/include/tune-mips32.inc
> +require conf/machine/include/tune-mips32r2.inc

I am OK with this.


