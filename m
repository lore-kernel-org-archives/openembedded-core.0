Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB277D660
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 16:04:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44xDNQ5wdtz4R;
	Sat,  4 May 2019 18:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556985895;
	bh=VSR+0xltPMOCCywzyr29uYVKwcosAZPcxC0KTst28jM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkHp6ZqFwzlshtymRr4blQVJMfAjMFLVrasNfA1Pq84Y179rjyKq/FPW7orAAjmxt
	Tc6s0hCx9V1clLn+53l8lMGyNzeTQzesOSbNh8yGfP4ObqRExEHtdRoeCl9xPhFiaD
	QQzeh2Oiz5ONKiom1/AWPCppf7Wrrd654x7kElMeJwSZzh/yp0JMe6AyiVFtZxNodU
	7xNuac7Wu87pb5Yhbk8PKZ6fQnQ0LmXnTv8H5tT7StCZR7428jTwNW3B7tJu1NspNh
	GLCxfRPr3OOFvlHx7z0ZYJfBeuOm29GupXhM2td8jHQUUQWI9iuBnxjel7PhtOHPoD
	ZVVbtPSASyOFdowQiggPZjtdUJV/nC0vrmkhqK74jMpqmOLQFaEWfQhSL2p/wiefeV
	LnKnn2UDYCYvwUKQnkWYYp59GmkaJGx5sMIWG+JQdGZB8K2OdHPW8T2sIyMuuU+OFU
	Yo5TK33WVWWzPTe7KPdfpDOaqMNF84snkFOGizjifs8RI+0h/ZkfktXnV+hguSAUBm
	5nI8NsysplOUDZexlxTGmHsVDDO5a2DmXCLjmvKByIEns8tij4vBgolHUgrCmxR0j/
	R5zACKdainc9ze1eEhDf61vIUU/uinqKRlbxsSx/k+ZWAT/X40SHfw4/2jfniwM6Fh
	ZJki3mJZUHTdnyLFg5xCl7LA=
Date: Sat, 4 May 2019 19:04:52 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190504160452.GD11633@localhost>
References: <cover.1556983501.git.akuster808@gmail.com>
	<ca1292c6521c353c8203e7b1e1a4ec72b09baf21.1556983501.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ca1292c6521c353c8203e7b1e1a4ec72b09baf21.1556983501.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 33/43] gnome-doc-utils: Remove stale patch
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
X-List-Received-Date: Sat, 04 May 2019 16:04:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, May 04, 2019 at 08:27:09AM -0700, Armin Kuster wrote:
> From: Adrian Bunk <bunk@stusta.de>
> 
> The recipe was removed 3 years ago.
>...

This is a pure cleanup change, not something that would be worth 
backporting to stable branches.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


