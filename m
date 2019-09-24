Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E15F77F0D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 06:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46csK72LtXz4t;
	Tue, 24 Sep 2019 08:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569307851;
	bh=fsKj9jmamTlT+wzcf/jxvyRjXEkEg9w6rpnJzhlf7m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTKJx3ATw/mgZcjlRiX+Qm7PGOZDvHbe23yTbHbhxnEnfKxCMyEcIXrwxfbUIaheZ
	RHmUFZzJWzTHpyrt1n8c2GdJvJSwtXGT5WX6l+z4oc5lHiCD8pXQ0SL/OYM4FaIpjF
	iqH8o3O/v69y/z6gHXp1HHFqaGJ9otP5zs/rNRczUJ2eriHdlPY11/ALsR7uo20moW
	OYIOQMVhbQG/ae9YYqv/nAPEltDMy7BtWUMGUmGC7EqcBUs6/KNmleWOgXZvjCZS9Q
	/S2LcYMSo+qn971sBomhTWj4j1kjz7DM0RYutCPl9GnenDyGGF/OR907hpTAvRBRrB
	veOQ6cIGu6RZY304A3PIaGG8jpB1GWj6iMKN+ugouWpOHJMqAbLlvruNroiZO/jFFd
	IdHKJ2I0hbkr1t+cNmncW0ggPXRBFmlWNFglaohLYK6UHt6wdoSPeKNEfPQSz8zI8a
	TgIXI2V1JtYOzVuY13rlL6xUWE2x4+gh8QRw18DCq2Nr2zDlWefseLEd5xKMo5Dn9R
	5lF5ZJbDjcPB7Vk1ZcX9fOILgdz6syc1RfSIdLOOLvzeRw4e0DKVgLvbd6XBu7vlYf
	MRRyOqg/QzgUxW8lcF81OAqKqZ/Xgoyi2NFXyymMOAm8ntwuFToAPnwekfobqqyCnq
	IMnHLxzC8p2/rSd+98vMlXg0=
Date: Tue, 24 Sep 2019 09:50:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190924065049.GA16793@localhost>
References: <cover.1569292053.git.akuster808@gmail.com>
	<d000f85c4dfa791e2e764c9d6126bcc13baea01c.1569292053.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d000f85c4dfa791e2e764c9d6126bcc13baea01c.1569292053.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior][ 18/50] systemd: Backport OpenSSL BUF_MEM fix
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
X-List-Received-Date: Tue, 24 Sep 2019 06:50:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Please drop this one, see
https://github.com/systemd/systemd/pull/12802

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


