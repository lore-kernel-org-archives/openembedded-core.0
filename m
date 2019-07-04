Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB447CE4E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 10:57:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45fZgX6nzGz6W;
	Thu,  4 Jul 2019 12:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562237850;
	bh=A50n4/l7EwP1iMKIkzpJ0h5qNBQaEjCUuW/A6z67kYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZ7IbyGRsv+gPN5zrozxTb4lHXqT5vDOri9s90VaS6z8hmJZ/bM4IeNwFEoPNqmZY
	FAgxMF1FV/OdDng5gWSciLvRmAWjxoNGUIdFVdRpABTpNV4cfFJ6T+gWocNCAcjFXv
	8skPAVh4t4o9VqWnrublmwAS/c52+2l0eVg56HY42lIU2FQwdOfyH8YwDd7A7BwVMv
	ZAT/aoBBKGqdBsQoJwDsvT+cguT/9WexkzIgG01IH8uAneiSxUvS/42CG0cB9nIk0f
	ghFN6MQF61xDA0ZRdFiFyaK+eChGj144NORDtD9ACuppwpows06b7qfE7bKJJnwz/1
	wZn62679y30/d2cPUN924zns0zNrAPd2s7lSiMYWdZaoJlxPA5PTtQtHfUCcf6y7sx
	OAmvSnOMko+6Ttm2q+qICN0CViR5L93SIlBRTC84D4JgwHBn9QjLhq0581FgxKMzkJ
	26bV/sOjWJ6RakYJmgERiRvcKMXMjl7lGbhmuPjJ0hzI/g9Viqrz4kweF5QmWOb39D
	5DPWTork/J+YGLC117lEOBA7aKm1oiYq4LsQ8q0F9BnWas6pJCAdvP/Afn5zdz2l89
	EEWK5844D1YDVZIaCcXIO/P/FK06l1N2MSGpLTARbLDxkbedw9Aq+2hkfMqVQQ4yjv
	aE4Brc3N1dbZAtbQecLMJCxE=
Date: Thu, 4 Jul 2019 13:57:26 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190704105726.GA21763@localhost>
References: <20190702201609.78379-1-jason.wessel@windriver.com>
	<20190702201609.78379-4-jason.wessel@windriver.com>
	<CA+chaQdZmWmLYPLfzZ2s6ojCG1QwEGjy7O7fdpNOh2QGTE9vjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdZmWmLYPLfzZ2s6ojCG1QwEGjy7O7fdpNOh2QGTE9vjA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] glibc/glibc-locale: Fix do_stash_locale to work with usrmerge and multilibs
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
X-List-Received-Date: Thu, 04 Jul 2019 10:57:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jul 04, 2019 at 11:13:18AM +0200, Martin Jansa wrote:
> I don't see how this change (or the previous glibc-locale one) would cause
> that, but since the oe-core upgrade yesterday I'm seeing following
> glibc-locale.do_package failure:
> http://errors.yoctoproject.org/Errors/Details/250557/
> 
> DEBUG: Executing shell function do_prep_locale_tree
> tar: i18n: Cannot stat: No such file or directory
> tar: Exiting with failure status due to previous errors
> gzip:
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/locale-tree//usr/share/i18n/charmaps/*gz.gz:
> No such file or directory
> WARNING:
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/temp/run.do_prep_locale_tree.23303:1
> exit 1 from 'gunzip $i'
> 
> anyone else seeing this?

Yes.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


