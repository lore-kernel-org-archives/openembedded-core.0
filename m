Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 185A87F4D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 09:22:20 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so62525984wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2019 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=mrgixczjxVR8lacJwPvKJvMXMBxo3z7KzHmdapef1qg=;
	b=D031f5eLjkGBcCVjTEXd89lhHurNMgC5/SoA3A99H8yJQhkBG+yfTfgd5HXNpcJT2s
	QZybbTPh/6S7rGQvJHIYtycmu+sKPFSjDCRR5p3YpQpmzGz091FzYQTGTaJE+e5S3JeX
	RjUN1Js/qBxUNzIKk56XyclVeMgmlttwHeSYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mrgixczjxVR8lacJwPvKJvMXMBxo3z7KzHmdapef1qg=;
	b=QWvwx9lhx89K+qKVISU+a7Mvf04N5FOBFLJEbt4HJvmpIcXgDeBzptFM3brI7hw0Z2
	lUwtFP7PYX3ZcjgUwDnUgxYkZbVtikzU7UzVmS7eHwbkaX2yyF8Rl+WvXZFS2PRp3J/H
	U4w9GOQxmedxtgdQouxyx0jDFIyOFFCqFsY0imnaLioiMuAhNnQBIkKrUO94/bVDZBDI
	U6TDX8eFOvUUjurVyztrbb6FqXYBwhZZG3LGOAc8yNAaf+nFbRONHu4IOPdrMe6dfeMw
	uZ4ls7/IyBcO50AovzQc7hjKbCcNv/gXjt8XsUJguxMAhFE+88ULqljZS+nicoHEV+Ky
	hNjA==
X-Gm-Message-State: APjAAAVempVNlgDvspmS5QjUXd7M5CShOXT1wle/mODe+GC2PkASXc1V
	zlp1Oi0xVieky3eccEb1uIfAWQ==
X-Google-Smtp-Source: APXvYqzFdjUTY7kYaXsYXBQb4UFW0EpF4u5ZvMTPtoorfPusGxYrVABXyK0Ke45zWAM/ckMwkqa7PQ==
X-Received: by 2002:a1c:b68a:: with SMTP id
	g132mr119590006wmf.66.1564651341675; 
	Thu, 01 Aug 2019 02:22:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	91sm156661498wrp.3.2019.08.01.02.22.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 02:22:21 -0700 (PDT)
Message-ID: <7a8f13032f1e892d865c6bcf95c8f58f141001a3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 01 Aug 2019 10:22:19 +0100
In-Reply-To: <ac388709-9edd-3f06-ff2b-dfd0910bbcf5@intel.com>
References: <20190801011038.4416-1-zangrc.fnst@cn.fujitsu.com>
	<ee26bc1bf769ab46b9f6f9f503cd192f4ae0611a.camel@intel.com>
	<ac388709-9edd-3f06-ff2b-dfd0910bbcf5@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] libx11:upgrade 1.6.7 -> 1.6.8
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
X-List-Received-Date: Thu, 01 Aug 2019 09:22:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-01 at 10:03 +0100, Ross Burton wrote:
> On 01/08/2019 02:24, Mittal, Anuj wrote:
> > An earlier patch for the same upgrade didn't make it in and
> > probably
> > fell through the cracks. Can we pick those upgrades?
> > 
> > https://patchwork.openembedded.org/series/18658/
> 
> Already in MUT, I'll prod RP.

They failed in testing, see my reply on patch #1, two different
problems.

Cheers,

Richard


