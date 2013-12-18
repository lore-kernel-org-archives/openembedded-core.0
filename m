Return-Path: <scott.a.garman@intel.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id E1C5960D5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:36:37 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id rr13so8705601pbb.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 09:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=AF2FnKHoh1xxkLbunRX0lSpi4CC58bk3Q56p00gzDoM=;
	b=jtOVkVFNxg9+nkS8gIyQv6ynGwnXv5thSFnptTH73aHOPtpei4THhmNaz4sn5ZMA/V
	R8hWT9CRo+ri+5dsluDYLs4l9d8lfFWwg+0SX1cLOzJkDQJTx5k5JxOYaOIqBh8Qxy/N
	UiX7NqRpQdAK4bjX/oHkhSEp6J6Utk3VjiSz8caKkBRPZdCpZMeXJHOLcNkZwJpAFZmi
	oEuW2vyMj8wrfMHcWDSna5ItIFUTkin3eBBq813uLiqpWe6CMEDUzuWbhn9kLhu6Z706
	jrU/J8OILGa0S2uPqp3VHuBkW9AhcoowXTTqbO2y3zUXOzvFcWE4mIVwirigMuZeUvWS
	Pnfw==
X-Gm-Message-State: ALoCoQnbiATz8aIeImdXB11Sb+ncRNbXm6k/ty9YVZ4Pfmhj5Co8CUIQC+mSk3/4jfOVxrdQsiS1
X-Received: by 10.68.91.131 with SMTP id ce3mr22016971pbb.19.1387388198952;
	Wed, 18 Dec 2013 09:36:38 -0800 (PST)
Received: from [10.1.10.14] (c-24-20-145-95.hsd1.or.comcast.net.
	[24.20.145.95])
	by mx.google.com with ESMTPSA id pe3sm1398650pbc.23.2013.12.18.09.36.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Dec 2013 09:36:38 -0800 (PST)
Message-ID: <52B1DD24.5040606@intel.com>
Date: Wed, 18 Dec 2013 09:36:36 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1386279548.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1386279548.git.scott.a.garman@intel.com>
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 0/1] runqemu fix for bug #5617
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
X-List-Received-Date: Wed, 18 Dec 2013 17:36:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ping reminder on this patch.

Scott

On 12/05/2013 01:57 PM, Scott Garman wrote:
> Hi all,
>
> It's been a while since I've submitted a patch, let's see if I can get
> this process right the first time. ;)
>
> This is a fix for Yocto bug #5617. Ross Burton wasn't a fan of the image
> filename whitelist, and I have to agree - it's not very maintainable. So
> when we have to guess the image filename, instead just pick the most
> recently modified imgage filename that conforms to our typical naming
> conventions, *image*machine.fstype
>
> Scott
>
> The following changes since commit 300760193c6bcfd20f1d4908f912bebd53e86281:
>
>    tcl: fix tclConfig.sh to point to the correct private headers (2013-12-05 16:48:17 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib sgarman/runqemu-imgfn-fix
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/runqemu-imgfn-fix
>
> Scott Garman (1):
>    runqemu: remove core-image-* whitelist
>
>   scripts/runqemu | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center

