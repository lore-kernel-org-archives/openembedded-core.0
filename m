Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 13B667E133
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:34:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457Pbl158nz4D;
	Tue, 21 May 2019 07:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558416899;
	bh=fyhoIt/hdKDaidxPigpI5LJ2MkPHmDMv2vgPi55L5d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdfizpKoDH9yF/E+AHYUZuAnh2XtnHl/V2PgwrOQKTyW9Nv0nBbjKBbUPLEi0OCgE
	/5cGzf/PXCFzEtynNvViGyVf8XW1xpbZRwojvNYzoZ/Z8G4etZ66/7wxv5VM4ExW+e
	+BrAGaMcQXMC8NACq7fC44Xh6s3vCRo6hDtKsRqQ5DKSkTVnj3ycAbIs2yNox6RgQ8
	puZL4DgBgI9HJmtmQ7X136vp6HlrCoOGBNIMjXuYsiBgcNA0XKH6IyFIz6vaYm3B9D
	LiIT2nuMg6YVlqo0xldyyelFP4K2motkRI8MYtas/NUlRJ7ySUprszmA13z1XiVskr
	zQVmH1F7BpQXLgkQf22RSELqU3iEAdRH761Fe/8JrOG84Vd+HZLnspKXzaah0iagHs
	2XnNDMnaqqDx6JCTERJrkUuw5Wcs3afufSO6no+WPqqymMczNQlyggh8jVGX7mF0+f
	hA0dbljjG2hsNbhOpzJJwqTzXmScWsvD14yiXhKYEwv2JaokbT7QgCUWVvwifoeTr+
	sdq/g+zIYjQ+xif0jUViTcwTOC7bDv1QJ3Iv8yU0we40Zub+nyovj9gCflWVDoCkwQ
	hiIEa9EnKOGn6LJZUIrrT6yNcnwHvrJn0R6+tiZhQz7ZiPiJIxp2djb3/9H+9ekvv+
	NZlAhmoxBRNNVvv8LMEH7XuA=
Date: Tue, 21 May 2019 08:34:57 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521053456.GA9971@localhost>
References: <cover.1558402534.git.akuster808@gmail.com>
	<334fb1db7bcf7456c9db263080cd281571c512dd.1558402534.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <334fb1db7bcf7456c9db263080cd281571c512dd.1558402534.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/15] gdb: Fix aarch64 build with musl
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
X-List-Received-Date: Tue, 21 May 2019 05:34:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This is already in warrior.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


