Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 88BC77F92B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:17:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v17so867507wml.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 15:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=lt1Ty1WMlip9dvRSIgaBxoyGzYlwx5GWXEA89ShZDzI=;
	b=Cl0kovCOh8WwUOaFjaEzilkzdb+Ref5OAMnJvicHEzLup4sMv8hbIAPwyOXAUmyhgh
	vq8tTM7MIrqED9QiGdre3SqN/CvkJUbCr9h5jYS0anW9hjFcZFVuwB947Sl+GST0URiF
	Z34g/5g5RZseTf/yMa91IvGga7xCj+zidLPK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lt1Ty1WMlip9dvRSIgaBxoyGzYlwx5GWXEA89ShZDzI=;
	b=Xs2QAMmW6xSKBin/jUq51b5TZ2A1gFZ15wx/9h3vR9p8GkrF4GwbVB1q1KQ+0P85hl
	GaEnhKyxVJeJBe0LHpA9CzV3pC9BoeG+HmoF+WCQZII/jRg1aiC2cF+GpjomnilhpVav
	E37+FNJ9npK4JHezmiK6DOyIqyLg3xEbuzAIv4NAwCdXyZellQNKQy1taGv6BWyOvpVb
	zqtScq6w0t4651ARbJvC2HeZRyFQz2Too+ya9Oa/AzGW+BVUc6Fmh05uzpPYafdyvMU8
	UADE24Oq7rHQ7AjdnPGUVl73dc1kETSE3GdjMFPnKhovHAsB9HRSAeBlaiMP1WY1qSVL
	4jJQ==
X-Gm-Message-State: APjAAAXH9RzIPRP4Pw5+Cc4dKkVYloWtGBKCpZgFXLYd6mLCK1peWQez
	uptHvnzRqec9esrNVEFqU1574g==
X-Google-Smtp-Source: APXvYqzZ0FE0luAdThaE+YSdRvJ7us3WN4oH/vzSWRN9Fqc+fzdLbHfB3AWHTt3gzUv9wqd5WEohuA==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr868978wmc.19.1568672267233;
	Mon, 16 Sep 2019 15:17:47 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k9sm525178wrd.7.2019.09.16.15.17.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 15:17:46 -0700 (PDT)
Message-ID: <23aa15d10f0bfb0cc558caa5dd84991f465dba4a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 23:17:45 +0100
In-Reply-To: <20190913154434.29908-1-dbaryshkov@gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: Re: [PATCH v2 1/9] uefi.bbclass: add bbclass holding configuration for UEFI applications
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
X-List-Received-Date: Mon, 16 Sep 2019 22:17:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-13 at 18:44 +0300, dbaryshkov@gmail.com wrote:
> From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> 
> Create new bbclass defining common variables for all UEFI-related
> packages (bootloaders, test applications, etc).
> 
> Signed-off-by: Dmitry Eremin-Solenikov <
> dmitry_eremin-solenikov@mentor.com>
> ---
>  meta/classes/uefi.bbclass | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta/classes/uefi.bbclass

I really want to get away from the proliferation of bbclass files we
have. Wouldn't this make more sense as a .conf file? 

The anonymous function could be done with overrides, or an appropriate
function from lib/oe/.

I appreciate we don't use conf files so much but we need to start
somewhere and I think this is a good candidate for it.

Cheers,

Richard



