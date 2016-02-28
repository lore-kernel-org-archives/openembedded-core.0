Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4902B771BF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 00:53:24 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id z135so156417214iof.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 16:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=1cQRBvCorMZNIMxQx5NTPWgqxpFGd2kcgRu71wfkUAs=;
	b=uc8cPOfX4vt9KkA/5lx/N5XpX9ElrHEIEi1s8/WgXVidaho8b1etdrQ6wRP2eUC1NA
	Le+u4uKGI7Q065IArgobnfcqM0kJ5SoJgkQemHwnSwutHcmSAwhD9UZn6GHXVwkH1qMN
	TlM1OrFZCfUmas6KAaCX0Qexm20bovjpyIOeTl/ZbHxa+XL9ePHYGpjVjT7NEFrjDms9
	BwUkSGm/K++4UR7+HwNLIKLFeg/3t5bci+bhl5kMnLcdaxyULXRzRt8dpwsm949ulZiI
	4O+QOmDMG19xhIKWFBtei3o8hpZzkQP/ZSgYXEjA+KkpzlZNOqva2zcr06saKrROZ8nV
	QYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=1cQRBvCorMZNIMxQx5NTPWgqxpFGd2kcgRu71wfkUAs=;
	b=JPHN6JpI/988Uyn8GRm/hzzzNMPzg4/3QIjybg+CCvkCJM7Vs31T5ag5xVH0KRWuJD
	LGWPSz/SVsgL64rrhk2j5FkXjh32Ndl7nekb8Lil/UGoTy7qcKtUHi5yzG/YxlNZglqJ
	ony9XoomqLIQ6NDUgfVeIva44b2mDvyKS+JU9vICbZv3iHfCdpkxCsxEm/PY9WjY/K1L
	09npJ0CzuDV5juCDn16qhoVnZhAMB2dHOOQF/I4M1WAtujpcOHtXAd2tlJujSHH8Sl7Z
	IUzlcY2caBnmArmcbZ+sYUtMn+EqNqk0wF6wOgZJNPwqW4ujVuvCnaDa3DvMAcBqumNQ
	IlzA==
X-Gm-Message-State: AG10YOR18Sv4KrDNuet7TeGvNzBPXqiplnezGoCuxYzUNP1+v/H1v0dFDJy2fVVQboXwNA==
X-Received: by 10.107.138.90 with SMTP id m87mr15342243iod.127.1456620804815; 
	Sat, 27 Feb 2016 16:53:24 -0800 (PST)
Received: from [192.168.141.106] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.googlemail.com with ESMTPSA id
	m32sm8188341ioi.41.2016.02.27.16.53.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 27 Feb 2016 16:53:24 -0800 (PST)
To: brendan.le.foll@intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1456412817-12106-1-git-send-email-brendan.le.foll@intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56D24503.9010803@gmail.com>
Date: Sat, 27 Feb 2016 19:53:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456412817-12106-1-git-send-email-brendan.le.foll@intel.com>
Subject: Re: [PATCH] npm.bbclass: Add npm class to match fetcher
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
X-List-Received-Date: Sun, 28 Feb 2016 00:53:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/16 10:06, brendan.le.foll@intel.com wrote:
> npm class supports the npm fetcher, helping doing the basic compile/install
> stages of an npm package

Any chance you might have an npm recipe example? Maybe something like 
express?

