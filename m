Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 428E161732
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 14:38:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QSVw5dZsz2J;
	Sun, 23 Feb 2020 15:38:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582468729;
	bh=HfLJ/R8HXyujHdRCpJOmBqOTwiQMj8q35j0Xfrzb8K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YleFjTCIYjib9SSzKdml28MoGKAQZA/kW3swifi5O29Guylt7J/4Bqt+GNn48+OdX
	3o0PWXSVbWPCcdxyAhld8LnKmhU2OCUS6dC5882xwTGbBADXlgfIjQgZZ2cY+uRgF8
	qUXHIl5amijyRv16JKMHaACUNcpGgyb0E8nJptANYdBvDGSzbqEZ8XipXYfPXXnj49
	QdQcKFUWh6q8ThwV0egXdxQiaa3KEnorPbLN2VheCriNKlE0DQkfKGiqJj8UiT9EaS
	XvgzyLeESu98h9fZPkybb+bKri0olQqZ6WyYQe2OANRF9YI5HDrn1+Cz/rrlJAcXtA
	34W+h16J937S9PcZfvNQLja3nlt+WjKf9MEbu31HOF3IGyIuxvztOSlGxgpEPjs4Lt
	BBXF50Nxx8BhCkoI/KQbbWsyFQvx1YK4YrhT5MRqjIYGZtzqRdhk+Z33nPbVLuh6GK
	ZHSloEbpBo51fA8eg34E1mlpp6Q04jtLWMC9yv48W2FiC0lKRJId+OXKQI3QHUEpU6
	6A35jjxEvcAsa2y5n1wunoUvFGiRxVyAsHUdN4yj7Qp77ElvctGeE05prwF1fFpdk2
	QaJE1IXH1ijhR1C6CHmSdAUddrJzwgb0EJeOj7NiVWA03ax30AuEoGMUVqMeAKbsNY
	8oJxymeRMRm9XIXjOyK89mgs=
Date: Sun, 23 Feb 2020 16:38:47 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200223143847.GF9628@localhost>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
	<20200219194752.7967-2-alex.kanavin@gmail.com>
	<20200223130206.GE9628@localhost>
	<CANNYZj86Odg3+2UcEtg=ZbQPdti9hhha404-0vWqWBHYmCDFng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj86Odg3+2UcEtg=ZbQPdti9hhha404-0vWqWBHYmCDFng@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/13] webkitgtk: x11 and wayland are not mutually exclusive
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
X-List-Received-Date: Sun, 23 Feb 2020 14:38:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Feb 23, 2020 at 02:05:54PM +0100, Alexander Kanavin wrote:
> Right, I think this line can be simply dropped. Care to make a patch?

Seems to need something like ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}",
I'll send a patch later.

> Alex

cu
Adrian

