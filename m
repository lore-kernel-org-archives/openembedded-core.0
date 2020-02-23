Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFCC60AD8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:11:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g3so7171208wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 05:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=n5hbBWIRm19yBwZvzfXaMCtEJWtfmmKaRqxg+nEaJ1I=;
	b=AdZI3mgnCXEgE3OGhrJ9qO2nMg49gCKVPaJxJHklBAjlBD8cVXTY2X5G+pHmnGMXCM
	wjiF4oSiQq8ALa4RCHcqqwMgfREvndpjuQrezeEo0B0f6tEmtPxM/JwxGwnkPlW6sKI9
	Xi01cu6aY5XAHsgJd6bSnRIyzgPFPkkXnSz/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=n5hbBWIRm19yBwZvzfXaMCtEJWtfmmKaRqxg+nEaJ1I=;
	b=FYMIt+NfwRO+2VzKCM8SMh+/W38Js1Q65jZgN0XvRcQebJH8+KQ22OlY2YGyngdnBQ
	twS1b8/Xsvs5IkjIgdTuyRdSH2kqqEHAW8GZXSL7bt1xBwXIUJcvpxRVm1YA4rvVSwFW
	Vb0tfcn/P3FOJDOVxrSpr1gUx1ZBhQFRtL7FdpPSgFJ1mLlW/0UjSYM1kN8mZegppezt
	ec3b87+t7fZvRdCauGyI9Dljxpt916oaekZpvG+ryo31De1IbwvHWCBqr1FN5dT4wPYD
	eShz5sWvQt0/Y/sdY3CoFD4BZWyxLk53vAuDK+Jp9y3lsGD5XrDVQxgkTBYP9Dya67R/
	QJ7A==
X-Gm-Message-State: APjAAAUWfhbkzDlvIB9fzpbuhDoeC1MAOdfCx+bzutfgBNNd6y7Tls5Y
	SiDAVZ5h7Uw15o8M6yHpboL9aA==
X-Google-Smtp-Source: APXvYqwW8iVCs3ysLm60KudNMKNe8NG44UTJ21HyKJ435rTiGA2fizVBqFWbjU/ESc1VWo9i9hwegA==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr4867328wrm.159.1582463481957; 
	Sun, 23 Feb 2020 05:11:21 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e22sm13584431wme.45.2020.02.23.05.11.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 05:11:21 -0800 (PST)
Message-ID: <1c4e397e80d53d8ef779cf84b57dc4d051ef3238.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Praveen Muthusamy <praveen.lisieux2011@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 13:11:19 +0000
In-Reply-To: <20200223125620.6117-1-praveen.lisieux2011@gmail.com>
References: <20200223125620.6117-1-praveen.lisieux2011@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH V3] alsa-utils: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Sun, 23 Feb 2020 13:11:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-02-23 at 18:26 +0530, Praveen Muthusamy wrote:
> From: Praveen Muthusamy <praveen@linumiz.com>
> 
> Changelog: https://alsa-project.org/wiki/Changes_v1.2.1.2_v1.2.2
> 
> Signed-off-by: Praveen Muthusamy <praveen@linumiz.com>
> ---
>  ...lsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} | 0
>  .../alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb}         | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} (100%)
>  rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb} (97%)

Thanks, does this address the previous testing failure though?

Cheers,

Richard


