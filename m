Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A1FDB7E6E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 13:27:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45P7342pF1z4s;
	Wed, 12 Jun 2019 15:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560346065;
	bh=3dO46XAXO47e0z9QSRZZdOLubZ9+F47SIMawnswFBpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPmT9p0QaGl7FLDNP/CrOZeE3UuX/2SvLAzUx/UOcTTPg3050Z5nRsFlVlAmGRUlT
	8egysSOkhlOJHxeDp1HuD8u202KRPr1r05RBHhEnaghDJBK+ftarbDl29FcK7AnJGf
	uwrJx6DF0HnW4HtKskmypbk2Gun7U0yDEsQ2ngrScsJWp2DchSRaWB+JNOX/oqIsi+
	yNax8pC2AN/rE2vR13uxEkIEH36BXJ/MfN0gcRmaIrQK/gURPG/RASl+dxNmlLfDPp
	dW+DWxEsYRLelRpnYCNLa4otMVP35Fo3sA3dZ06koC0wbaz3nKPtpNNJ8Rgg6IFhyw
	PiwKtz3giahzIDEtZ43EcKs+NP+L9Ph3AMsRC1kewuSb5nRc7Xge45PJOknMFWBWfC
	3fzjZvy++sG1NmvSBmHur6ex1xMJT50uu2Fv24wQTxwpRRCi3XuesaXvlXj5W4Bfjm
	urXk65Y0+JxPj1wKLt+QWtoHH2jty0cVMJrFWCzLeA1pfQruhvb7RzOqU8IyQqLDNk
	5bL+CvkwOp2O0tnhYBGF9YsyXsVO2+O2loaQECGfA/FzyKLdCzKFF7Gq+S5tmnntbo
	NQAsXVX5MHKAJDNzrmtUfUET8OOIF6iboZ7jE9G+T4t4ZT1vsfm2OqQSjTU499vZwB
	oOzXGnQNmT6Ifr2e29it1mxU=
Date: Wed, 12 Jun 2019 16:27:41 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Message-ID: <20190612132741.GB23143@localhost>
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
	<be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
	<20190612105114.GA23143@localhost>
	<1859381600.42862.1560337102909.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
In-Reply-To: <1859381600.42862.1560337102909.JavaMail.zimbra@efficios.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lttng-dev <lttng-dev@lists.lttng.org>,
	Jeremie Galarneau <jgalar@efficios.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
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
X-List-Received-Date: Wed, 12 Jun 2019 13:27:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 12, 2019 at 06:58:22AM -0400, Mathieu Desnoyers wrote:
>...
> We always integrate support for newer kernel versions instrumentation back
> into our current stable release. So as soon as 5.2 final comes out, we will
> release a 2.10.x version including support for it in lttng-modules.
>...

Did something go wrong with that for 5.1?

This discussion started with patches on top of 2.10.9 for 5.1 support.
If the missing release was just a one-time problem for 5.1,
then the whole problem is usually confined to -rc kernels.
 
> Thanks,
> 
> Mathieu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


