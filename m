Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EBB406D6C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 10:52:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4509CP5s53z5c;
	Thu,  9 May 2019 12:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557399138;
	bh=zIwhQRRoe0RwRsWnVPrjn4BtbCvDLtFz1y/hSftyTIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ebBxGlFK3uoYIun6NulLebNHrMsBA3dA4cEFxBeuujCFFEET61bp9kgpeNdpeYSz+
	lJB2J8zoHHOR8rwYKV6hxvqeXfjh1AKhEUjnsYtZkl78g7w/vOaA+sN9nOnrqELoHA
	F71KX/JIrSrPhMZIjSXz53W3zhkhj/b7Nw0dDPwomAv4gb2iF9dxqIU41fBskygXim
	ZlnRICpX/vBmjtlfilJC3DNvr4ajLmLichQiOXutl35ImbzZK/zAdM8lepQoWVmGc1
	69tOLSJ8f97zRN+rEnJqOzqLI+fgnznR7G7pNGcN45synI00YVOB4CO5ZCJykDDWgK
	WWaUzLZhqP36LYLILusvoBx3/bMbEa0lwL7bDS5Lf0HkepN5k54kqYm3BxhlR+Una6
	8+7Y2qNgzMkbN89LhQusD3BSeUZX4F/++WuJmUhCWoxPVF0HAy9mJVX/IZzE80PUv1
	H2byjiWAOrBw3IGsea4ZG4KIC6cYWA8eVbSF448vLiJj+CbOB0RLwSIMyCq4NQ4n+x
	/nTQY9DNDFfOt1zJPK7n1HCZvZ8i0lEuSuXJcd6/tfsn2tjEVNO5o6VGvrZAT1xcMw
	bObmxT9GJCIsFhsxkdu8u6C0FJDsom0wo0+mEehExNc2Aoua0NUc841ANrqoMkB78s
	ErRAWPZK0wWp9oMOE4NG9Nq0=
Date: Thu, 9 May 2019 13:52:15 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190509105215.GA20453@localhost>
References: <20190507131151.31070-6-bunk@stusta.de>
	<2909bc2066098ba29ccd864c0a4b4669ed2d7735.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <2909bc2066098ba29ccd864c0a4b4669ed2d7735.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ccache: upgrade 3.6 -> 3.7.1
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
X-List-Received-Date: Thu, 09 May 2019 10:52:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 08, 2019 at 10:47:38PM +0100, Richard Purdie wrote:
> On Tue, 2019-05-07 at 16:11 +0300, Adrian Bunk wrote:
> > Remove backported patches.
> > Switch to new download location.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> This patch caused an unintended side effect which you can reproduce
> with:
> 
> oe-selftest -r buildoptions.ImageOptionsTests.test_ccache_tool
> 
> Its the change from .gz to .xz which introduces circular dependencies
> for ccache-native.
>...

OK, I'm sending v3 using .gz.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


