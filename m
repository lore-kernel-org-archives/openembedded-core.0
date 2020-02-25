Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8CFD2616C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 20:07:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Rqjh1b6mz3Q;
	Tue, 25 Feb 2020 21:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582661272;
	bh=wIjyMxq4lYYZKYvF3Lw+JSztZcjKl6T1ce5wVcWkU7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/2BVsM9QubMpppgyPwMuCvCWvfX8PCONhdW7DoQXvDXf0XJRvfnJ3N4eiqGFgkQ+
	3Q3DprLERYRatvcjh/CaiiIffUWjIttu4iqW5rof7OJyjbG1scp8i2cQ/h/zHhhhBT
	d+h3p0qfm4+LCN/f162iQw1/Xgxt0cHQ4EkncNR05iaScWTfGJ11Kl+1laYAOnaU4M
	uLqmLj7ACEdzUXw9uyD+1hVW38MvhbEL++8NghG8IWL/xbAiKLdu1AZfxW0OqMEqBt
	lfiK+m+X85jOzEzUGQE+nY86HqkqaZN28Hr/AEMUXwTZeLEQslK4e7+Yt3iMsziXNe
	f1RMOOUD80PYgYUWmJtVjUB97B+qYEhGj9nec6/QsWOJXPTUJZx/A9jH/EminW+Ucp
	KY/q4WMidJtL+09DlVfsH2hfV8/U6b4KANOTEIu2F1INyYXuTNkVeiB6m1LDdbl6PT
	0S5mR4uURuxGdFTW14jFx2g3LGH1VKb6nwA55Jtr5ATTR8zJo77wr85i25LSWtFROD
	VZXudaH1uDcFGd7+JRr2VzAOQ4dVuc2c70NnxS6LExDfpM2Zh84B6vUXgiPheU79p4
	0O2wCgvucGptdOB9SrZc39D00eU7c0IY0bZ8TlvAV8jiQtakuNx9DzTgZxdo7vENKl
	O4WrwCjoUEJm9HhC4ZqVDy1M=
Date: Tue, 25 Feb 2020 22:07:49 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Jens Rehsack <sno@netbsd.org>
Message-ID: <20200225200749.GA16017@localhost>
References: <20200224143920.19383-1-sno@netbsd.org>
MIME-Version: 1.0
In-Reply-To: <20200224143920.19383-1-sno@netbsd.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Tue, 25 Feb 2020 20:07:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Feb 24, 2020 at 03:39:20PM +0100, Jens Rehsack wrote:
>...
> -SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
>...
> +SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.lz \
>...

Please use the .tar.gz instead.

Building lzip-native just for being able to build make is not worth the 
small space savings, especially since this creates a bottleneck that
can slow down the whole build.

cu
Adrian

