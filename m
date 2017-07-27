Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 50B897808B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 12:17:51 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id y129so97308093pgy.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=gg/NM42L/T2dvEF6aMWjdnl9vONNUY2P/0BaAx2PrZ0=;
	b=sS1iQsBeLbJWfRE9yqYWyNwVZAYqARz97uCi+AzhWWbgOX6WqwETmsZKkztoSe1XY5
	/99Z8Uo2M9BO+dDdxmgDHvJFszah7xDo2bBSfYmRF4ps8OKPwnC0krG00zLP+VbSxg7I
	HQ95UtSKHyfODVMby1Ypdcqie0F7u69bG/XuMmrO2GUyCCewdA/ldFBrz4M3UF71+zHp
	Huq+yTNaHVT3EhEosXtEz1qA35Qdej9SPMFYApoDNN5XF+QMUP0PudtY8WqbZ3Yqbk/j
	VcRtBaqK3xJ7yooIg15CfRQYLPMgr5zOt4kDCpNfBMnK8RcXyGnH27oykEYSTt1Cvx9V
	qb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gg/NM42L/T2dvEF6aMWjdnl9vONNUY2P/0BaAx2PrZ0=;
	b=I8MmW1D5FtntwplLkgYi0txLRyJ6f87ZKWPBO9IjkzWxOyNxlHr4bnyXK+TgLh/gZa
	XolryjG7p/cJPjINCTY0OSRsZBFuX4NIuHz37hrsGIefdCaMuiuxYvydUW0oI7sdHzAx
	R2+YN7sS8/gJLsfwJEQLmgfY5hbfZK177HCjk0i1wF1fgVOQriPMu9NSp0scU+jTetdH
	argsjS4Rh8eQWid9pzbfERPJtISAdd38VQLe+Eg4OflYOp79Y3gxlYKI6nnjzoXledXT
	9geGm2R87TfZgN4Ol8biWgoGEKz11gz93apNH48a8dZbh4HErlKeISkQhlvITUR+wcKx
	cEmw==
X-Gm-Message-State: AIVw110grN3d6tuP4wztGM79Kq6UHXkZCw2qW1V0ooBcloAhSgdbiWr7
	xyOOCyPifsKRFL03
X-Received: by 10.84.131.6 with SMTP id 6mr4232539pld.413.1501157872680;
	Thu, 27 Jul 2017 05:17:52 -0700 (PDT)
Received: from pohly-mobl1 (p57A5602C.dip0.t-ipconnect.de. [87.165.96.44])
	by smtp.gmail.com with ESMTPSA id
	d29sm42751104pfb.11.2017.07.27.05.17.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Jul 2017 05:17:51 -0700 (PDT)
Message-ID: <1501157865.26603.46.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 14:17:45 +0200
In-Reply-To: <1501086090-11867-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1501086090-11867-1-git-send-email-ed.bartosh@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] image_types_wic: add dependency to e2fsprogs-native
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
X-List-Received-Date: Thu, 27 Jul 2017 12:17:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-07-26 at 19:21 +0300, Ed Bartosh wrote:
> Added e2fsprogs-native to the list of default dependencies for
> wic (WKS_FILE_DEPENDS_DEFAULT) as all fs-related utilities
> have to be in this list.
> 
> Thanks to Patrick Ohly for noticing this.
> 
> [YOCTO #11817]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

Acked-by: Patrick Ohly <patrick.ohly@intel.com>

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



