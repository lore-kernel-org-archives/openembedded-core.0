Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 424257F9A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:45:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47BSFR6q8vz3L
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 11:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573469116;
	bh=ejklGsKYv1+Y94Za72O6PwA8NSmZDwg1owu1J8kx3Wo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=cBL29OyBRrOucgc3cl1Q0iTl8uvqTbwxokdl2wWC5VV+q9Jq/HgKLHDtQsLfIm3f8
	3nvpchE8Z/MsO3JJn0I6kVdpbJ8UfALrtVmr8IGOJGytI/xJMXNF5+resKWLQTXaut
	z31LApJ/wYChlJF/wgZ2iy4cCllVJvbyggeXJBxgwc0zfcI1hZ4U8XB2JIRpBjyWZT
	UB/dEYP4qxC481s77wTFXnnxgNlmSpR5WpxbfKt4hBtvvjndMn8iIhQqSdS0cb/eFI
	McTXQOL7okJlbwUnAFq8Jncd70h6SGbLarmLcPWkHn5JbVb+IHGVJb26dFVgB0XILC
	wH/SPpJ/TDQ8AFvT8Fu1w49QMOqz3U8ZVitTmaVxsjs/rOUUv/+ZEo2SqGuzEmnuNQ
	hG5MRLo5Ye7TkYEpioQE0Vua+hKoSTzM67+XfcL6fQE9rJI2qr1lp6otx2kJIVM/LJ
	wv/5qV/wVptItkyuql5kSCQ5nHnXWQcIMO76RYGwJv1jPP502rHg3/mDA4axeNEibQ
	EeUsz6oJwKqv0SJze/sjv294PUJqJ19yde5QtTV2Fkc/9mKEw/egGErvnTW3DvEbFv
	6S3771d3ogE8MttG0YAnqMXx+iyjy1POyw3AjApuGZvvCj7DntaAC1kIBEST4IHzRK
	tfDiJThwuSNJvajWXpSZMQdY=
Date: Mon, 11 Nov 2019 12:45:14 +0200
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20191111104514.GD28797@localhost>
References: <20191104084612.27966-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20191104084612.27966-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [PATCH] python: Upgrade 2.7.16 -> 2.7.17
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
X-List-Received-Date: Mon, 11 Nov 2019 10:45:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

ping


Whatever layer will ship Python2 in Yocto 3.1 will want this,
and it is also desirable for stable branches for getting
security fixes.

Thanks
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


