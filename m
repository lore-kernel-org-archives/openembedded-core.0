Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0CCAC6E650
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 14:38:27 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id w105so3419045wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=dQYOgt8JDPhrZnyQ509kIyqKF52PjADIv9IQ69LCcNA=;
	b=vwGX0w+6Z9zaAiIwoy/5iefnMZjNc7cFyw7JbA19TlrpdTNE8H9ISj1ffznAupI1nT
	pgnK1CswM+EVkkzh9MiJFj+UTtc0Y2NTBxJRYxdDwTwReKG0Myy1D3ThyrSu7LXmm9Qo
	o9DKXkQmXp1u+pA+74bE85GNMcsxGbQDOnxGo0Jk0x6xMU4y/7vdlcNQ6Yc5rqoUUW8v
	E1rJFBPbFNpFf8Yj33ZGGzqvGyv84hpXQ6ZSE/utfXiSvKQ4GKm61Bqgdke40+fTKVy1
	PwucWFL21NpEqEPgq695ywL9drMVWlfOikvPrl/5nJXCsZ242YiVu2+Z1rgr6m7oMU9q
	oOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=dQYOgt8JDPhrZnyQ509kIyqKF52PjADIv9IQ69LCcNA=;
	b=Bm7cnElISTyWTgNlS39k9s4R2TrwGowjL0GKOt0Nu87VTkFsB2JKNHUyShDZ/vcOgJ
	iYKF+UptVnds9Zla6rM8yF2Sa9LygMe0reUgJuRoTyvBXawJWqbu0ytuWSwkne4BhxqP
	ZyxpxYeE1/zI3Ht8Wmi608fH1DQ7GhBEQ0VBn4KgHfjxShBVS4Uqad26rSQ79DEQOWMT
	pIfe/OZlvniL6dYih61XAb4ZwCmGfkbVYay/kDsCb50VILOwzwom6r2+13gXseEiJ8HF
	ETjPdxew96J/Yf40dKEDK4wYgz6HrJk2gGmKxTc3xScfIeumlMJ/lx7nQGu9Voo5cO+6
	9YxQ==
X-Gm-Message-State: AMCzsaWYAFteanZxekEAi830Q/WjkrFG9PTDOcPpB+IWmo/oKks1zS6j
	jMwjc8/JOcURu3d0vAth0LjaJ9I=
X-Google-Smtp-Source: ABhQp+R8rGk8C2PYDuiQVOWOrDNNgGBo/JRdS0IjmcR5tQ1ZY/p+06HjpYP99K/WkOGfCUTx5T5Stg==
X-Received: by 10.223.177.143 with SMTP id q15mr6069420wra.269.1509028708628; 
	Thu, 26 Oct 2017 07:38:28 -0700 (PDT)
Received: from pohly-mobl1 (p54BD545B.dip0.t-ipconnect.de. [84.189.84.91])
	by smtp.gmail.com with ESMTPSA id
	m126sm1040837wmf.31.2017.10.26.07.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Oct 2017 07:38:27 -0700 (PDT)
Message-ID: <1509028706.25153.130.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Thu, 26 Oct 2017 16:38:26 +0200
In-Reply-To: <1509028643.11251.23@fm-out.intel.com>
References: <20171019201047.148436-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1509010439.25153.128.camel@intel.com>
	<1509028643.11251.23@fm-out.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qemu: upgrade to 2.10.1
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
X-List-Received-Date: Thu, 26 Oct 2017 14:38:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-10-26 at 09:37 -0500, Leonardo Sandoval wrote:
> I used devtool upgrade and the only hunk I need to remove was
> thisone, the rest were applied cleanly.

The rest was applied *silently*, but not *cleanly*. The lesson here is
basically that developers shouldn't blindly trust the tools. If
something is odd, investigate.

What was odd in this case is that it looked like a patch was partially
merged. Why would anyone do that? And indeed, it was merged completely.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



