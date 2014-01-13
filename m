Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC4B6D8A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 18:16:42 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id lx4so1524241iec.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 10:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=mh1cb40LH5PvIjCi8C8mfMOPi2Ui748GIIoxmj9XSa0=;
	b=Y7uf5FpuO3mfdLsK0m8Jxo320K2qPISrfGoTM+KWJ7YiZYA8lm4xpFuOX8z2O/ussa
	9kCXBHYa4l+hFGPlgfKo1sNL+LZF7pxmcU34YqQ/Jn7lo65B4fbGi9/Xaw9n74senOb0
	QL/FX2p6oYBiZhgeVIEtCtr9U0/VdSiAP5TteTQCYTuQGHRyBEKK2Jq2Wj5GGTa/ilA9
	YcZuYsZEE+u8//BZ1lc24MBnrjj3b5raf4nxzfmGsrtifda9rJvSzZH89qQOWmgnTdb4
	ZRvgQ83O/X5E6PFGhqZe0Dxbpk8p+HSMIGPm7efwSWKI2YYWhkEyIbSOZLhY6px9JUbb
	0YOA==
X-Gm-Message-State: ALoCoQlyJHXIOy2UuSj7+Chjfg0Yx5OrKfPjkQn3JPEke2e5Cso6Rf/Zd3aaqIGCAKcb9gy/UuxZ
X-Received: by 10.42.61.4 with SMTP id s4mr3463035ich.58.1389637003322;
	Mon, 13 Jan 2014 10:16:43 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id qk7sm19557470igc.8.2014.01.13.10.16.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jan 2014 10:16:42 -0800 (PST)
Message-ID: <52D42D89.4050106@linaro.org>
Date: Mon, 13 Jan 2014 13:16:41 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH 0/2] Cortex M3 tune fixes
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
X-List-Received-Date: Mon, 13 Jan 2014 18:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Since OE is generally used to build Linux distributions, I'm rather
curious to know why OE would include tunes for CortexM3?

