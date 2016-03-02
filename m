Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id DC416731EA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 12:36:02 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n186so83333488wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 04:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kMC0VJ/iU3tr9wKcxN0NlCAJ8crzq/7/M7S4Q+85tkM=;
	b=X+QgtjDdnbpl3CIv2IX74VW7bhNui1fleWbXlNZOiWWJl7jBc5rxH63j2HuAObYxJ5
	KxmrhoqEd2iU8mo6FOUc2CqhZdOocOdR2SYXaYoRNQRoCksZDaOlx5bVMqo6z5CX2Y/g
	q0j1bsfHYW9qXPyS1gNEAGvB/oQf//yD5NVbvGVGI23BpeuaXp5GlajBLh8T5Ie+4El0
	/aThSVHwoUukw1aWrOpb0rzmhSG2rsum99xKQAsEgRjbi6Ht9T/a5wk2zudEH1tRAogH
	SA0lBupk1U/nKzHEW3ofqsYDXuSZCFyCOH5R/61/ggRgX9WdlTlav1DqCP0VYIjyeUxw
	nZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kMC0VJ/iU3tr9wKcxN0NlCAJ8crzq/7/M7S4Q+85tkM=;
	b=DIKAOqC1vkeVkzDn7VBgVLQjjuuuv6ApSrrnUFGbM6bLCQ1DTkVfWIEm4anZa71j/T
	e6VRge2SuXTHk7jN+10UsMXWRLojtOadosuRBO6QTdLUqxngLfZlKoi6CYsUr42FvjjU
	QONvxx7Qv5ui/nZoCCEXA59s199uUgAKX2lUh9gDME5Ym7wUt1iE7bzwzlDdaPZ7ehDT
	CmKbVu5cPpnpeDRGwifrJQy4g+uSWBl0RyeNWR7k8ogf9YgkAQCPmdPymbB7q+ZDz0MT
	sIKDqPdKYFeOasOGjUf9VSEj63namQnHjCj2wX2vLZEdWsRM6LENqV7qwL5r1f/KvHi0
	+/Dg==
X-Gm-Message-State: AD7BkJKPQ+m83cHSC01nlXBHhi6ZPrMzxu7wRi86mOUTAidelWsgKLKCkdIM4Z6K3vMB2A==
X-Received: by 10.194.192.36 with SMTP id hd4mr24431023wjc.85.1456922163142;
	Wed, 02 Mar 2016 04:36:03 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t3sm35815279wjz.11.2016.03.02.04.36.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 04:36:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Mar 2016 13:38:00 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20160302123800.GB10529@jama>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Wed, 02 Mar 2016 12:36:04 -0000
X-Groupsio-MsgNum: 79026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline

--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 27, 2016 at 11:09:47PM +0100, Martin Jansa wrote:
> * add separate variable for configuration options generated from
>   PACKAGECONFIG setting, this helps other bbclasses and recipes
>   to take advantage of PACKAGECONFIG mechanism, without including
>   other options from EXTRA_OECONF
> * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
>   from PACKAGECONFIG:
>   EXTRA_QMAKEVARS_PRE +=
>   but with
>   conf/distro/include/no-static-libs.inc
>   it means getting --disable-static as invalid option inside
>   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
>   to use poky with meta-qt5.
> * once we migrate all bbclasses and recipes to EXTRA_CONF_PACKAGECONFIG
>   we should also restrict EXTRA_OECONF append only to autotools.bbclass
>   like I did for cmake.bbclass

No comments? Should I resend without [RFC] tag?

This is needed to fix couple components when
conf/distro/include/no-static-libs.inc is used.

Cheers,

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbW3qcACgkQN1Ujt2V2gBzaSwCcC+ib9kVKH56rqaH13NyzXjKy
mQcAoJcYHceaL87ZKu2XGGz85u9stxxf
=Wkp5
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
