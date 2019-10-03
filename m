Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7DAB86C0C0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 17:01:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46kfRp3g1Fz4s;
	Thu,  3 Oct 2019 19:01:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570122102;
	bh=/QS7r9B4cQzfk6m6fWtwrY2Ncb8rE4HCMEDclYuO9ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcaLy/I0VXnqYK5kJmEddkMGGyv/sBgNkXXMjsnk80EO1KdPiJ1/6Tp9RrCK8FZTO
	1D0HGbVcvI4mtagJxG0XhAW6Nt3nnxtPI1lRiNKBFsDMhPoTsiyW345gQoVh4XQjSm
	BkumTzhWosmLDY3xr1BTp2l9Qf6mZBP4E59QGnKMScMpXHnNig2hps0nrOAF1IB+4w
	XO97//sKJjQGz3lbfopJ97dqpiBHAT9+bqTqBfnXZtc/7YZhtNJNu4fnE9zB6XLyXO
	rKkSa+Eygft0fPet4BStm7xF2nP4+hSFM+GH1EznA/2vFWJzPIwZTbghvaceVtRdXH
	Sdl4YeebnsL7JV2kkwZ1JVXwgIvCAL3au4b9VtsSUdlKHTJ5Trrka4Z1m4AfZTIdia
	gY3R1UQQXOQ4KO20WOqpbm7FcKtR52zJf6lohMzLEev5lL+b6tjwUCuaM184DYU3iI
	zh8F+y6f90a6l/EJSvGj269Al3b/HWHZNTcVq1PjfYmV0LkbnoZXi4MWZTxRrbVC31
	ze8dMrhfXMN4U7nosatISKVnBGwRiaXGnTvzIaKCv2EHbjKahEbYn6dy6NnSK2pmQn
	8dg5wKjkho3bDa/u9eMreHUgl9i8mtB+8AwzJCX7uPupMpxHM5hxYaKkvub69L7axo
	Ck5aKR+u1wUmJsANlsHMVmoU=
Date: Thu, 3 Oct 2019 20:01:40 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191003170140.GA1202@localhost>
References: <20191002120027.109242-1-alex.kanavin@gmail.com>
	<20191002120027.109242-2-alex.kanavin@gmail.com>
	<20191002175152.GA14877@localhost>
	<CANNYZj89n07FE7UEo5DdwCs_q2xUePEh_MZgwZ=uYX1hyRqDnA@mail.gmail.com>
	<20191002181821.GB14877@localhost>
	<CANNYZj8W=Ugu8sRctN3aO1mwSrijDBWLONhFiT4aYrMjRygabw@mail.gmail.com>
	<20191002202001.GB18433@localhost>
MIME-Version: 1.0
In-Reply-To: <20191002202001.GB18433@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ethtool, libcap: fix upstream version check
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
X-List-Received-Date: Thu, 03 Oct 2019 17:01:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 02, 2019 at 11:20:01PM +0300, Adrian Bunk wrote:
>...
> I sent an email to Fastly support, let's see if they will answer.

This is something that has to be fixed at the kernel.org side (see [1]),
my ticket for that is Linux Foundation RT #80134.

cu
Adrian

[1] https://www.fastly.com/blog/best-practices-using-vary-header

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


