Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 582FB7D41A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 15:10:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44sWSh3Fqpz2M;
	Sun, 28 Apr 2019 17:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556464245;
	bh=eFTKhws/7SR7kWw+t6U4eUiDw64HFZIOPN3UITbZmEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QatjbHQemk7B/+U0hnMEbFYU2+O5iIyJymZO9Cj1Jq++BsFKQhsE+4OGSMXZL6e9i
	0Wzt7lAx5gsNZjhh4cE2hWU7+7Tgnp8nhcrf1AXqNOcwHDOoueehhwCqYQ/U5S6V3m
	EEhnOu7FZpw8zKeSP+Jtzteq3bqlXLRiTTqnoXrUihpOPbtkfYCvN2PAfqQ0B+NROr
	IcvZxn5VJFhdV8R6NP9FfDW3ONzT2QQ2Njk2jkGnM7o3enHKECZVMzBP7uObDb4bSN
	57Tsx1gh9mi+xol9+3yvNloU0dl3P43kEThzZulOILTYfu4ndkUjyBXYloqV/x3Bs1
	HPRd5v9FRwXZIoxoYAuUVOyJ7eZO8YL5SLO77lQjKiA8v4Zfc8p2Bs1KVf/K8eRRpL
	bl9WM/IKsfyog5AAeG8bsHDlvxXgMwr93ggR35E5TNYt8+zB/HEsmTXm5pHweb+5hU
	6iKvbh/8D4HU470aavo0aDkaYqSi8Eeu5RowDCpn5tSWZ/cZtdf/ZIfzwcSDFA9mFh
	TG/VGG7oeE0KhMUvdaOnXkBsr6pKYaqS0Wz23DFAVeNDyMK8pSlzhngXteLlol4hkX
	jyCPZGzGhApDU1rQdZKvdBijInFoROZrVfQeTLqJoJJI1P4BGf+Ji7YfYsz5YbpphK
	QYZHaALA+dPYu76iB/9y2KmI=
Date: Sun, 28 Apr 2019 18:10:41 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190428151041.GA23387@localhost>
References: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LaYdMRz41qeojHLsv9zj+VL6u7EL8LwM3=JKnKcriw_bQ@mail.gmail.com>
	<891ea63e-134f-ded4-b0a7-f1c75022d4cd@oleksandr-kravchuk.com>
	<CANNYZj-Ld+RK=H1+Z1LNyJ9q0MobGU7nWVqRJxekRA3YLAvuSw@mail.gmail.com>
	<CAMKF1sqkbMKJ0H3xeasVK=xcmAQ6qBnkty13Bm-PjLYc=rtCSw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqkbMKJ0H3xeasVK=xcmAQ6qBnkty13Bm-PjLYc=rtCSw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ninja: upate to 1.9.0
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
X-List-Received-Date: Sun, 28 Apr 2019 15:10:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Apr 27, 2019 at 10:11:36AM -0700, Khem Raj wrote:
> another issue I see
> 
> https://errors.yoctoproject.org/Errors/Details/238569/

Are you sure this is related to the ninja change?

The error looks more as if it would be caused by the gtk-doc.bbclass 
change (commit 07d29e7cec).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


