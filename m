Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (unknown [209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id CEBF661F16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 09:15:06 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id j5so2757721qga.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 02:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jin9LJ8rLQ2WGBIHr7UUhH+0hbjBfeiqUftwvnnz2io=;
	b=MDsdlVLzwh7JjhYiRbRtpmODxwdkwTPBVqKYMkh0wJ46uzEK/DtNYxgKwi0kkdgV23
	ktyEXkbTHofx+QbdOYkjPzdei6dm/8V9M/1dQ9rXXg1nYClX3fUbR5+36MRgT438EKfp
	mq+g2bMdftjNlK7xufkWrmgHDKtMSSJzhGaEZIFVEFxDHS20cHp/dVsPpehU/F71Q8uV
	SF6TdPut76GxSpIM3xnRBmQf1JdJ/RQ+6BdyfPNpWhGIJ3VciR+9r+DltZuSSGMMOkRs
	HpTrqEgh7p70MjGQy27M0e0KRBYaaJI9MxyO0UiDrA5u4HpSa6fSqlyfHs5h+VYkMym5
	D6mw==
X-Gm-Message-State: ALoCoQll41WhiKRAVU8e4rKGBXIp0JwWGVSjdEGz7d1XL/TKq2bAzjgKynbP3dLoqpWE/H+UjQ1h
X-Received: by 10.224.121.72 with SMTP id g8mr1666252qar.79.1400663708099;
	Wed, 21 May 2014 02:15:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 21 May 2014 02:14:48 -0700 (PDT)
In-Reply-To: <1400638600-22676-1-git-send-email-rongqing.li@windriver.com>
References: <1400638600-22676-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 May 2014 10:14:48 +0100
Message-ID: <CAJTo0LYxCj02VqT6J6xFfOcuOuZb1g5Dbv0hFqcURetKUj6JaQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] man: use '#' instead of ', ' as separator in configure
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
X-List-Received-Date: Wed, 21 May 2014 09:15:11 -0000
Content-Type: text/plain; charset=UTF-8

On 21 May 2014 03:16,  <rongqing.li@windriver.com> wrote:
> $CC is able to has ',', when $CC includes some flags,

Presumably you're referring to flags such as -Wl,-O1.  Shouldn't these
flags be set in CPPFLAGS/CFLAGS/LDFLAGS, or can you give an example of
where they need to be set in CC.

Ross

