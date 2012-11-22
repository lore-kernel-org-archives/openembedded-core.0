Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TbXd8-0006kj-LY
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 15:19:50 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 22 Nov 2012 06:05:43 -0800
Received: by mail-ia0-f197.google.com with SMTP id j38so19331211iad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 06:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=/zCI+y9HcjRZkK31iUfNCY8BV8I/3ek8VfvgXh/4jqg=;
	b=WBXQS1If/Cca0Em/juofMy3UBZS6K8bwhMkd/MhdMWEorI3lU6ya5WRx4RFvP20mVp
	M8IKA4cNKv65KEU6rKnRgXzEJNzuF8FjcoXWbmAGKQTyEiLYq9c5ttRNcNkgVg77Re6x
	1FaVmQy65L7ehts+Djb2os4gzV3WHLFtJRj/BDEYkq4vIdG18zoPaK5hwFtYvQ/ONKaZ
	Y9tF+Kz7kHkukDW2C8OJWtqnQDDfihkKN5aCinJqYRRphppzll9xU4D0FbKft4RPbUbM
	4XN8zXWg8HoGipW7cLJ5QZAS9L1i2EkLeul5J6ax92URkDJ3hHwHDbAB2P8ytUndZxgd
	J8TQ==
Received: by 10.182.54.103 with SMTP id i7mr454403obp.62.1353593141862;
	Thu, 22 Nov 2012 06:05:41 -0800 (PST)
Received: by 10.182.54.103 with SMTP id i7mr454397obp.62.1353593141786; Thu,
	22 Nov 2012 06:05:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Thu, 22 Nov 2012 06:05:21 -0800 (PST)
In-Reply-To: <CA+chaQf1MWGeSP=BsZBtTG+mOgGEL7dm51yUcBu_36co9bZz4g@mail.gmail.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
	<20121121162051.GK12637@jama.jama.net> <50ADE2F7.4070904@intel.com>
	<20121122083735.GU12637@jama.jama.net> <50ADE966.4060300@intel.com>
	<CAOT3mi+kr6mg4tPwkY9uHohFw9w2vWVnLPDNaZV2XDuyWbL52Q@mail.gmail.com>
	<CA+chaQf1MWGeSP=BsZBtTG+mOgGEL7dm51yUcBu_36co9bZz4g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Nov 2012 14:05:21 +0000
Message-ID: <CAJTo0LYTJD=QWk8pL+EEs-jsFvCPS+R_HxbD6N9tquiuCjR9=A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQlho6HabANxqj8TNAHh3ukVxZWwf2Yj29z32RwIj+sFZ7ubG+rOULt87cTVYI8KVhb2lPk94VoKxwJm6e1l0an5+0cQAcYsi1iuaHxjaHSMISdicpRN2cNNccOz836cLIR5YHpODPP6jN3zsIOCV48qpKgDYNmb9L4mCqHY6lBSPzAyXOevWJ6RVUUj/q//yvVOYjUc
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 14:19:50 -0000
Content-Type: text/plain; charset=UTF-8

On 22 November 2012 12:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> Well that's probably the same issue GNUtoo reported on xf86-video-omap
> patch, before it was merged and xf86-video-omapfb removed..
>
> Pity that bits of red in autobuilder logs are the most important
> quality indicator for some people...

Bits of red that nobody is willing to fix?  If you've the hardware to
test it on, and the need for it to work, the backporting the
compat-api changes (which have been made to every other video driver)
isn't *that* difficult.

Ross


