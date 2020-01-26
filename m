Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 86A067FF26
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 23:28:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 485TbR6H4yz3H;
	Mon, 27 Jan 2020 00:28:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1580081332;
	bh=huxk+PTAOXCe3TwwIVnd9anhm/IQpl5R4lxDjw3pUcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvYAk9HSv2k6Oq8g90MmI399coH5Z2/DF+Od7E0PQ9XR3bASnVDKarc6fixAJSJs6
	XSpLbWE59QHxxxbXuoaf5Td1pck8Wl7N/YbK8ed6sA0GvhsYXbV4HCyVm7SEt2D+4v
	Y1iQjSAdUncCZ7wueJKxSlh6J1VVCmnvH405wNlwHZ1kMHEjI3DZEaXRlId2vO2U2d
	dHADUQJmEJw+Pk56S5M7YMxQKGOSwGPue232u0dYxcBkCNKj1JRcLjglTMtBkshWT/
	PWbWXJBwPSDzc7bZMTvKaSNQ2fAlMWi03Pet4CmIT1C2dhlWAZskeSVcAYjkYY9FWW
	gwza2XNVZOXFQEwWQ65/QnnA/Dpfc9H7SlMuAWeAFCBPZ5PI7WXoRM+SPrH8JwlxY4
	Xrx6OozUOYTwcz+f5KQBdbuUMOf5YGRCKbyBCBNegCgvIu9bz0mM6dfv+Nu5hzjb8w
	ieC2H5Y4J8TpuJhrh/lQNoQesCfxhfx9J7rf+shBuVR3K5OWOd+eMhrP+L0tyVngyX
	JSxu1zvc6zRn34r4fJo0OMeC2uwehhLl7vLrKT18LSK+Ib+YrUwkfzrX0vNX+fIyRv
	g3avlI1v8iMHjDkcYtZ0jv6qsvZqM/VBGw5BrSwzIoNzmpP26PVOXjN/lkH65BrhOS
	/F0m6IBuY91qRcxZDXI6JSck=
Date: Mon, 27 Jan 2020 01:28:50 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200126232850.GE1635@localhost>
References: <cover.1580066507.git.raj.khem@gmail.com>
	<621053e890ff4f9a8bcfdea42b3cd523a5ba4181.1580066507.git.raj.khem@gmail.com>
	<20200126232617.GD1635@localhost>
MIME-Version: 1.0
In-Reply-To: <20200126232617.GD1635@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/13] glibc: Drop fortify refactoring patch
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
X-List-Received-Date: Sun, 26 Jan 2020 23:28:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jan 27, 2020 at 01:26:17AM +0200, Adrian Bunk wrote:
>...
> Are you submitting a patch removing the workaround for it in gettext
> or should I submit this?

Sorry, I should have checked the whole patch series first.

cu
Adrian

