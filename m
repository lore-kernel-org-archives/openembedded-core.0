Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.155.1592337047517233030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 12:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=eE6eA56x;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=tws0=75=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49mf2F4qpsz43;
	Tue, 16 Jun 2020 21:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1592337045;
	bh=ur67HzVrdBTi3mCyFbbBFGBG2+BId9/T6haj0tcm6z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eE6eA56xlwB89U8JeP5DbuVSsrtvP5A+K8ezh1yQxkezt9Nq1tjDhvXLkn0hBxFkJ
	 r3LablFwqj7/uV4iFeTgCMg0OqtjRPEXn5/fsCjfiWMiMpqB4ewwexpJOU7NeQybKo
	 Jl4L+dNYaTDdaptr3RHcp9euBLZ9y5TNqYzX/S6AOVkLjVJNQQ/vVUo1YTYCe2+2vY
	 dcpSGgeSs0gQEmVp7jHUhUl5JKb/Oc1lauG2hTZLAGf/jPdpOl8RmFtKXazcVFsT6x
	 hFDoHakvEmhC3qZ1YnGpEkPtGnU8EPrUwS8+fBLPSkDunydeuIObE9/C3q75JEm+S5
	 uSprNP5U/w513eN5HTbuueUifqEs8B8ius8pyb1uNCrA547Tju9KPoZxig3YwdWZ7a
	 E2SYNIpIOgZEL3yypM1H2WKZWt7KQ8riuS+9C8JpFwYDhDMPEM7Ng+wjIcah+pXHw1
	 7r8A6vBn255hFdMfpGoPrgT1nR5eXqs8HL4tgVTbYEeWXyUYqxXqhD6bWbvWH0F7NN
	 nDSV+vNBHr+Bl7HtEdfNw4TF9yOVgY4yVDRrKm0zIc3PXEj6LQ2+sGQay20NIpKAA+
	 F3W9mvRJFpiwfx4qTR8pbRXJdJiRX05u2K+NpmI1n7D/gR8hZ0tgxgy5u8A0Lde3gO
	 rApee4KS6j1ooqAk7D/9FiKE=
Date: Tue, 16 Jun 2020 22:50:44 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell 12/21] ca-certificates: upgrade 20190110 -> 20200601
Message-ID: <20200616195044.GI14969@localhost>
References: <cover.1592249381.git.steve@sakoman.com>
 <8f71ed4ff9743433abc16f84a4c21ad506d18bd9.1592249381.git.steve@sakoman.com>
MIME-Version: 1.0
In-Reply-To: <8f71ed4ff9743433abc16f84a4c21ad506d18bd9.1592249381.git.steve@sakoman.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Please drop this patch:
https://bugs.debian.org/962596

cu
Adrian
