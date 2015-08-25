Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D1BD573DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 15:30:01 +0000 (UTC)
Received: by igui7 with SMTP id i7so14291866igu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 08:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=/fGcuOyKbjJX0NHm+3qPsKvImEkyg/LesAE+maFYSPg=;
	b=bGb9mqNO1UEWQC1glKXdOebt7hfrjzDxkQiCOpuNVWKuRjI/7YSSw8yhdz9PZKKPCk
	v39rDFQOuNOvXepiFcS5TCop3vHne3bFrI0TfhBRwQ0T7MbXhTTj+YqNUXuO0tpOVatM
	LCHlLLm71XPNHWygoG69B3bCB/EfV4eTTMOp/IbOthQPT/gCAycs4YxCvRGmO0NYp27g
	5c6UwUBiTe8j4chbL3ZWhKAWAoFFNxBr7XXi0NPkQf86X+pYgLPWFVN3TUEMo8P8OXIc
	DeQgQSJ5bqU4bZyvhliMLfl+8jcgBJiJ5MKI02CzNvVy18iYgU0hqYaIo+i+iXKfQiPR
	erfw==
X-Gm-Message-State: ALoCoQn3tHURzRUJ36eutH6pdc3K9XiHBMwT3dZ8NRi9Z0tp3A+rBAw5VopkB/GA6Eyv5adXAAT9
X-Received: by 10.50.138.193 with SMTP id qs1mr3546241igb.2.1440516600377;
	Tue, 25 Aug 2015 08:30:00 -0700 (PDT)
Received: from pohly-mobl1 (p57A57DEF.dip0.t-ipconnect.de. [87.165.125.239])
	by smtp.gmail.com with ESMTPSA id
	c79sm15659300iod.9.2015.08.25.08.29.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Aug 2015 08:29:59 -0700 (PDT)
Message-ID: <1440516598.24929.81.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 25 Aug 2015 17:29:58 +0200
In-Reply-To: <1440280746-11401-1-git-send-email-andrea.adami@gmail.com>
References: <1440280746-11401-1-git-send-email-andrea.adami@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] mtd-utils: disable xattr if DISTRO_FEATURES doesn't contain acl
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
X-List-Received-Date: Tue, 25 Aug 2015 15:30:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-08-22 at 23:59 +0200, Andrea Adami wrote:
> After commit 24fde4d do_compile fails:
> 
> | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
> |  #include <sys/acl.h>
> 
> This is a missing dependency on acl.
> To fix this we add a check to disable xattr when acl is not in
> DISTRO_FEATURES.

I'm unsure whether checking for acl is the right approach. If "xattr"
was added to DISTRO_FEATURES, I'd expect the xattr support in mtd-utils
to be enabled, even if that creates some additional dependencies.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




