Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C99117FCDB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 14:10:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47w1vz4HYmz4q;
	Sat, 11 Jan 2020 15:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578751823;
	bh=TWnmuFwOk1lhTtHJ15OB7BKBO4JX8Hs3pvmgNS7aBoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WycIsO6IArjiaS8HJXhPrGLxfc1nchz1kTUkfU8IeDV303BcrqPKS4B14CyGoYZq+
	yAxpPlHjJjEFfpJwLZhVyPC4EeIn+PnRqmLQLxPAOje5Y4up8XZ2UcM0YiI4MXNrvE
	4p5PT+UZ+XYIGH6ZSrLJXP8tTVooOXuLuQvEvcNY3swNGYWLtXDs9T10Uq5ei4M2cQ
	X+5QIpbHmpMF5o7sjQFNC2heBFl6WNC/bJLBdIMhztV8pf0pbcyLx27ueQbPM6CX3U
	bmuE00DyfLyGcWXeGLv4OJvoAMRHb2QlXJNEtzefU0SyVGmGp464pfpsaIZoZY/xot
	57wUqp9VZfaSsWRO8+qabOi25SUIU1heIvTDP/RdAy2IMeEHqRQx6d6CvR7MbM932w
	DmhBsQFik+Yqiok1E7yZQN5DjgEGUNb4/uidovEpmUXsp2nYImyVJ8KjAfBYNytVwK
	8oChqBo8PHyCaloHRTxxd3AsDn0muYgVFPzYmog2v+sylYDOscnCbHB/DX6OefqWAx
	5KZNtUkrf47dLzlm3uz+qurvamJ54N3BJr9UVz8h0QigcpAfYv8mPFidlT96EaVWCO
	ogz7vMoorEqaHJwBZ89Eo1pUViR6iNALxc2jx+i8GU3uJt69pwurLfkPX7unxG/upF
	KjuhBwd/mzNYzTdjFCUuRV2Y=
Date: Sat, 11 Jan 2020 16:10:21 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200111141021.GA21350@localhost>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
In-Reply-To: <20200110165302.27426-1-git@andred.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/16] site updates (autotools / coreutils)
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
X-List-Received-Date: Sat, 11 Jan 2020 14:10:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Are these values not part of what is being checked for rebuilds?

I was surprised that after the latest pull on master including these
changes nothing was rebuilt (except perl due to an unrelated commit).

cu
Adrian

