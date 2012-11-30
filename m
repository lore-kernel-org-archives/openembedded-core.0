Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TeH0K-0005lL-Qi
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 04:11:06 +0100
Received: from mail-pa0-f69.google.com ([209.85.220.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 29 Nov 2012 18:56:47 -0800
Received: by mail-pa0-f69.google.com with SMTP id rl6so19981pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 18:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=N78nHDaVYo6N82dyMSmUaGtqo3ZQrNgv0J3STJZAIck=;
	b=Uf84d4g+M75whJyVWgsHvRbYC9AOdL+wNhWKZne2Uc/kc4v1Sj4n/7XByN2L4NKnq+
	eCOajBTiadS/g4uyHMvYcnYXjuPDI8g2avOFVfMf6RzyG1fi+Fknza7P0Ck+lBCUFQX5
	W57G24tKg6e2A7Q9JDaTi+3zDb0J4MriqCYLhx0r0jpt2hYKi14LwrrOm0Eu6FReQz+i
	wbyXUoj0qESHjFLuHZ2gbDb539i1f/oATCZ2A5xH/cZoNTCQyTVLtmoztW78gomjN/jS
	qXPin1Q+nGtuuJCZwcTke0ltvCwBvuchbzt2yCeDBNWBC2j2CJ2IJlbVAKqODANEz7m1
	x0Bg==
Received: by 10.68.143.129 with SMTP id se1mr1701615pbb.67.1354244203234;
	Thu, 29 Nov 2012 18:56:43 -0800 (PST)
Received: by 10.68.143.129 with SMTP id se1mr1701601pbb.67.1354244203038;
	Thu, 29 Nov 2012 18:56:43 -0800 (PST)
Received: from [192.168.1.104] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id m7sm2071269paz.3.2012.11.29.18.56.41
	(version=SSLv3 cipher=OTHER); Thu, 29 Nov 2012 18:56:42 -0800 (PST)
Message-ID: <50B82068.6020601@intel.com>
Date: Thu, 29 Nov 2012 18:56:40 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1352218848-19801-1-git-send-email-msm@freescale.com>
In-Reply-To: <1352218848-19801-1-git-send-email-msm@freescale.com>
X-Gm-Message-State: ALoCoQlxoFPHqeUFHuVxMXCNp4gNR6z+I8/E7CPuPB9xrchI3J7HxVl7khqR4d56oFgT5FyoD4Cwr2JMQY8OA7rejr1LNT2hRGQzIO8MRRgHpgoCEXYxy+6Q31MPkBMsFxhAXGMBO0JL/7nqE6OM8h7J5W2Xw0ibdDZWqDAptxJab5iiMmQIr5ROKD2VVTo2k/BJ/PKn1y8T
Subject: Re: [for-denzil] bitbake: compile tar-replacement firstly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 03:11:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2012 08:20 AM, Matthew McClintock wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> Compiling tar-replacement or not is decided by version of host tar,
> if the host tar version is lower than 1.23, Compiling tar-replacement
> is needed.
>
> When doing popoluate tar-replacement sysroot to write the tar to
> sysroot, but writing is not finished. other packages probably
> use the being written tar to unzip file, which will lead to failure
> and report the below error:
> "bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text file busy"
>
> Now we compile tar-replacement firstly to ensure that a being written
> tar command will not be used.
>
> (From OE-Core rev: 3c1c4719fc96f6f1fbb257413d6baf3d91fdf4e8)
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   scripts/bitbake |    7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/bitbake b/scripts/bitbake
> index 3772d82..c52d5d2 100755
> --- a/scripts/bitbake
> +++ b/scripts/bitbake
> @@ -134,7 +134,12 @@ if [ $buildpseudo -gt 0 ]; then
>               fi
>           done
>       done
> -    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sysroot
> +
> +    if [ $needtar = "1" ]; then
> +	bitbake $TARTARGET -c populate_sysroot
> +    fi
> +
> +    bitbake pseudo-native $additionalopts -c populate_sysroot
>       ret=$?
>       if [ "$ret" != "0" ]; then
>           exit 1
>

Pulled into sgarman/denzil-next.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


