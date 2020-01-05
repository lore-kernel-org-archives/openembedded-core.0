Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A823F7F230
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jan 2020 11:21:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47rGRN26WQz4x;
	Sun,  5 Jan 2020 12:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578223264;
	bh=AYRkT+qYhUYuGNMrV0KrGBYseTPjTeYdZfLJFMEdpaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRROK3Fh1XGm1G+IQwdbEsVrtViF8lpiNBmteNSyu773YL2QRM+P75YwQA0n/raVK
	LpbUa9JSuMOTTm7HAnP5MZXwxo7qJN+01QwSzkAL8qqMfcy9RffiiBLmraCPtJYwjs
	Wkk0dOd80EgwLnZNj/BN71KLpE+N55vhIsmx3+1vRuUg5qnoqfhfHsAmsaY791NDY2
	6TL+35FpP2fJTUKldIlEnwlfHnF7o6H387PBRHpHYrtwi5qMX6gNoCy/Xuvc3NEuMw
	enRxdlp4av08v9z6oFFBfcD0GGQRVkxTLAMK+hsIHhivliu770FcnENCwkpKcooyyf
	7gkef3Syd3TgE4xvqMB3RVRRGlyZ38Hg1V59j35C14trf30+FCmeY+eyMpSOaC0Qxg
	wSq+bH8n8pX6v3/X8eN629CBq1yeDwZ5BX7EBKk2VhIRSkgXI+JyYGgiZhHUIirDXk
	HxyInoxdWCwS3PCnnw+GDa1nAiM8eHR7GSmafn6ri9EGAVQqtS/SRPdwKzXrCijFYE
	huCKxGBlu2p4Ui/vxfqkqodj1TLZHKyT4Rl7T/2OnZQgs+g4w/tgrJi4lUEciOWylA
	Oyq/eu5/MnX7FEFo8jTZBVtDY4oD7RNy2vvCB1wW2NSGfyCWK5Ktxfnhuk+WdALtTc
	NXfXQ7EHkKs86v2Ol31GQGvE=
Date: Sun, 5 Jan 2020 13:21:02 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20200105112102.GF26925@localhost>
References: <cover.1578155074.git.akuster808@gmail.com>
	<8a25a3ecc4a4220c996ab91fb986598de7d1e917.1578155074.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8a25a3ecc4a4220c996ab91fb986598de7d1e917.1578155074.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus 26/29] valgrind: Fix build with -fno-common
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
X-List-Received-Date: Sun, 05 Jan 2020 11:21:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

-fno-common is a changed default in the upcoming gcc 10,
this patch isn't needed in zeus.

cu
Adrian

