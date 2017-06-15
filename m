Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 564ED783FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 23:45:45 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id 63so13046964ywr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Dn9Z5yKsd6vUGmt+Kr2e96Wto8q+8C+XQahKPIjW3KQ=;
	b=N4j1w4POr6psYJ4aQF1ga2lU75YyJPQuQiCTYyOyEAph3psnLuBGSYU+mRH2EeUMkI
	D5hM390r2WGfqxiUG7K5RhIHI4gm93mAsK5rX7f0OZdENaAL7nf7lrWvOnkz7Xy2WE5b
	PvknlK1OTBu6gAFJfilr2C+IJF7m6SnJDMReA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Dn9Z5yKsd6vUGmt+Kr2e96Wto8q+8C+XQahKPIjW3KQ=;
	b=PRFTAUs05ttHdS1wazYMXvz4ylMIad3E2rkXVzWnsvKEJ0qgqNICmEjwZIDXFFQ9go
	X5xE2buiEE/zrZPsm9oR49s/dm4K887pHZTC0g/K8xhmJ9IXQ0NFEgu0sq7EDUcog4X7
	/HTYJA4502JOHpuxhudnEyq1SN+QBNyzMlFwdCjVFo2r/sR7s9G6TVXc4YplAEVGQwxd
	iQsDJmNN9918DCNEZrMB5zgbWcmAb4WohogoLynQzdjFSJBxJhJWFLmERhMBgxoQWvcu
	Y56fV4bL1cHHE4zT3UCTJX3NV91U01wsdYmJV7l2gPsp5aIFcPIio55T2KsSrZnA8VWn
	71Zw==
X-Gm-Message-State: AKS2vOy9Xa/JoSHZo3lMP0P4N4xOWAu9RkL0E1dXImkYvTlYWhhBf87U
	+nl1xapL9BZpQ72M
X-Received: by 10.129.98.65 with SMTP id w62mr7142751ywb.145.1497570346993;
	Thu, 15 Jun 2017 16:45:46 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id w4sm306524ywe.56.2017.06.15.16.45.46
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 15 Jun 2017 16:45:46 -0700 (PDT)
Date: Thu, 15 Jun 2017 19:46:11 -0400
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170615234611.GO10782@bill-the-cat>
References: <1497549909-22148-1-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1497549909-22148-1-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] package_deb: Drop obsolete comments/variables
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
X-List-Received-Date: Thu, 15 Jun 2017 23:45:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 15, 2017 at 07:05:07PM +0100, Richard Purdie wrote:

> These comments/variables appear to be long dead, remove them.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

