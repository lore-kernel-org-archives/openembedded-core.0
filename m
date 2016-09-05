Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 051CD772EC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 11:18:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w207so12802606wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 04:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QayfHMg8pAq3AwPQtCOxN5sa189qz0BAU73WLzRyqrk=;
	b=WsP592ehBWUy/OQSJ5PZamhKGJneC2seXKvuZ7Vwh4rC2/wqFPnDcrQBvItYZ/Ds19
	3z5c9JLKdXIYcIA+hhUc61E98dSLjAjU5CDHN9HXANN7ph+iJyckflBb/ZrQL64bhOpt
	JrphLtQu31BfrSyNyWAYJ11SBFX9w0DRnncwFbqkH2xzwcSDuOXadvyfv7excZnEGnt5
	bdRW8HpXKbwurx2sBD82em3gGWWwQflyG2mOTvJuCUZU7HeAZwPiKzfq1/IFXs/e4cN3
	nvOz8ZpWWrEx/5sKY9Tj1U27LrJ2rnYjsRDczhzSZ+seDV8VSRHCq23lZGOobgsPGv4e
	+bGA==
X-Gm-Message-State: AE9vXwNc2dl1ScmttHCTAi+ms1t0Fy+tOpLTCCQbh2Jj1GAViRGKXy+oAhT3gYe8aR5H+A==
X-Received: by 10.194.92.77 with SMTP id ck13mr5731675wjb.11.1473074306735;
	Mon, 05 Sep 2016 04:18:26 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	w129sm20333393wmd.9.2016.09.05.04.18.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Sep 2016 04:18:25 -0700 (PDT)
Message-ID: <1473074303.17211.13.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 05 Sep 2016 12:18:23 +0100
In-Reply-To: <1472207936.19220.11.camel@andred.net>
References: <20160817152538.14181-1-git@andred.net>
	<20160818075626.15973-1-git@andred.net>
	<1472207936.19220.11.camel@andred.net>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 0/3] fixing kernel module cross-recipe dependency
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
X-List-Received-Date: Mon, 05 Sep 2016 11:18:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fr, 2016-08-26 at 11:38 +0100, André Draszik wrote:
> On Do, 2016-08-18 at 08:56 +0100, André Draszik wrote:
> > 
> > In a situation where multiple external kernel modules are built
> > from multiple independent recipes, we currently don't generate
> > correct runtime dependencies of the packages created.
> > 
> > This (small) series of patches attempts to address this.
> 
> Is there anything wrong with these patches?

I don't want to be rude, just in case this series ended up under the radar,
I'm asking again :-)

a.


