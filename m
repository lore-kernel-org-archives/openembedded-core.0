Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id A50CD6C3B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 01:05:26 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id f19so15049559eds.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 17:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2KjBNAn4myNcmGymJd5ewwcex0FyX3kDIp3NV1Et/oU=;
	b=cmhwVahV3+eUyFwuyvV1B47uHEfvn3zocrLeivI1T1GgOmY9Ze/++CDpWU7OpYpAO0
	VEq7JHPk8p7X9Qil8rXHjz8OJ5Lo/YsWmhRti/j43ojoUxWm89yGxaLynR67CsJBDIvU
	1SyEZTaV6EerbrC8ANXHg1myaiPrKLMFo9GUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2KjBNAn4myNcmGymJd5ewwcex0FyX3kDIp3NV1Et/oU=;
	b=NZD5DS4pZ2xVx6KEVhf3vfjbaojQAvWcm4ZZhEBEK9hDmOKGZhdn61ZNGxBOYDFMbm
	C1UoB/vXO4otNcIsk6MA3KpQcl+5ZHw76LgwwG4j4YX9JhufF0I8in2UjlTmnKNCBxXH
	8RHCLKABXPKxg2LoV7R2zYOWrrxfjQP6fjscB/mTVekoHKxSSCiohmK2S2gROosV5gFD
	92L4KwdMVqljg3pkllGh2+cY8XK03/kr/LeX2+YupDJtCIXMAgQzV0jbYSkLq8OnZVF3
	IMxSeH7t6rupjWSrduDShE3/l90SjattRZUud7OGaNmKcmbroc1OdhD+Whn8RlSfntp8
	afqw==
X-Gm-Message-State: APjAAAWtrsfr1tFqykoEfMNOo+b+vKfCSyH+iRtolFFr7yFZelM88R/+
	j6//ghoEeBC5/meKCFTL3N+swA==
X-Google-Smtp-Source: APXvYqxUWbXtA1JvE0BXGcsb/QJDCYa6K2ZLYGWZktASXhmIscTwzZngPlCbYclIzxfbOPJlFUxd4A==
X-Received: by 2002:a50:9938:: with SMTP id k53mr30255150edb.134.1552007127033;
	Thu, 07 Mar 2019 17:05:27 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-606A-AF5B-88B1-B23A.dyn6.twc.com.
	[2606:a000:1401:880d:606a:af5b:88b1:b23a])
	by smtp.gmail.com with ESMTPSA id
	x34sm1791013edm.70.2019.03.07.17.05.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 17:05:26 -0800 (PST)
Date: Thu, 7 Mar 2019 20:05:22 -0500
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190308010522.GZ5026@bill-the-cat>
References: <20190307173215.18765-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190307173215.18765-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] inetutils: Fix build on RISC-V
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
X-List-Received-Date: Fri, 08 Mar 2019 01:05:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 07, 2019 at 09:32:15AM -0800, Khem Raj wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

