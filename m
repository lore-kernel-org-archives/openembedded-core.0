Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D547372201
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 03:06:39 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id w10so10958580pde.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 19:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=yCOwhBXnXlN+W6pkrlXcmuuHOVsXZ4pnxvDaPOplWlU=;
	b=CvlRlPhtbcthGNCOFTihZCPTAO/c7ZD7g6Ablp3Pbg30FVm6n7vQtwJmZKMazlJoe6
	DguQXPANvVrg6YJw+ua9q8gBN7GLLBwKwtysPEi2Hu+a+Rxy4FnwZqYXPrujZNxWI9VI
	br7wFD4E5vsPjq54+7NfHtqKQ7vqab5U3kC7rgwqbptAx5tHDuVzQuN1i/7OE6vcEtUw
	g1S0GAWjZSapPU3TK87EhenDjdyBppSdy3wGNTMOA488xKOEmX3dfGBuiJ529f2gQq2o
	aHWhnAJatJ/2lIb8ZIRsMHz8F2aSF/8p55LBcOXQW2jN4fSoPFTsLIc5E2PVWS/TKil0
	FAPw==
X-Received: by 10.70.37.4 with SMTP id u4mr18332244pdj.3.1416884800288;
	Mon, 24 Nov 2014 19:06:40 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:e95a:607d:d083:a0f9?
	([2601:c:9380:601:e95a:607d:d083:a0f9])
	by mx.google.com with ESMTPSA id
	yl6sm13599564pbc.91.2014.11.24.19.06.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Nov 2014 19:06:39 -0800 (PST)
Message-ID: <5473F23C.4060103@gmail.com>
Date: Mon, 24 Nov 2014 19:06:36 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Javier Viguera <javier.viguera@digi.com>, 
	openembedded-core@lists.openembedded.org
References: <1415893736-52092-1-git-send-email-javier.viguera@digi.com>
In-Reply-To: <1415893736-52092-1-git-send-email-javier.viguera@digi.com>
Subject: Re: [master][dizzy][PATCH] shadow-securetty: add ttyAM[0-3] serial ports
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
X-List-Received-Date: Tue, 25 Nov 2014 03:06:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

thanks,

staging for dizzy merge.

- armin

On 11/13/2014 07:48 AM, Javier Viguera wrote:
> Old version of the ARM AMBA serial port driver creates those device nodes.
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>   meta/recipes-extended/shadow/files/securetty | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
> index 7fecda1330ba..ecc246f7997c 100644
> --- a/meta/recipes-extended/shadow/files/securetty
> +++ b/meta/recipes-extended/shadow/files/securetty
> @@ -9,6 +9,10 @@ ttyS2
>   ttyS3
>
>   # ARM AMBA SoCs
> +ttyAM0
> +ttyAM1
> +ttyAM2
> +ttyAM3
>   ttyAMA0
>   ttyAMA1
>   ttyAMA2
>

