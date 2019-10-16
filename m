Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 652737DF61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 13:03:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46tXXf3C8tz2J;
	Wed, 16 Oct 2019 15:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571230995;
	bh=TyB3jdHGZFwPkl+axDLO84HBofR5GB1pq6oLvML8Ov8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ee6Be5sCUMNx1588JD74DZexNq0lEF0AOJiTmLgsoQ/1XXg76O3OEwEQMtNDffCZA
	y2k+XPEIevtRqu77syxSINmN7pGd1sGqkwivYW9CtoqRHJ1z+tqWG7Qsqn0nQlU+RK
	/nxiV1cW/2OFlYiADmOzUX/vvPh73wP6DuNPq4pVJElasuawG4lJ5+iEx7RuLu9JtN
	v3B7NmwFSyNQkieAYAA+SzbPc7940NO8cIwtBfyeyIQjhgXs5VNWpVxNZINHeBANW7
	xWq0SuGTeanNScZbx7vKXlgf6RVhGDrFauRpv9r+3aWc480JIYksnamt5qHD+G/aW4
	ZDDHf+u3B/Sh5Jpd2YLj5cZRwB4F6x4ZKYoVAXM/anWUep2X1m5p5PArr5ExUPlEaH
	CODLCobQlRedQRsIqDh3WTT2zZ6dqqlHFlUchiT3GryG0k5SlurA8izvl8JFwGX7fv
	lER/6dvD+VsIa3a1I9EA3p9jZviMBHATVVpTMUtN1Vh7MUEkyjcotbVeX7JgFLcWOR
	cUCtImNL4K3M9+xeIu+d8tRfSKJp06TH6uNKk8DIENl/JPVm/UhhVRYvfVQ5fxbI6P
	5ESfePMK/b+Gi1TCXI/bkiOMFduv8xfdOQWAEqwz80Xj8/GtN+ByBc0cbM9HHXwr7e
	vja0rWPD0yuy1X7aao2yUILQ=
Date: Wed, 16 Oct 2019 16:03:09 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <20191016130309.GB7998@localhost>
References: <20191016120526.67433-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191016120526.67433-1-trevor.gamblin@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] aspell: upgrade from 0.60.7 to 0.60.8
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
X-List-Received-Date: Wed, 16 Oct 2019 13:03:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 16, 2019 at 05:05:26AM -0700, Trevor Gamblin wrote:
>...
> --- a/meta/recipes-support/aspell/aspell_0.60.7.bb
> +++ b/meta/recipes-support/aspell/aspell_0.60.8.bb
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>  PR = "r1"
>...

A new upstream version allows dropping PR.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


