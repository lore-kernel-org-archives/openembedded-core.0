Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB3B7F7C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 19:33:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l1so5046588wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=OK5p1zWIPI7JiffnBbtT3dzQsL1AzAzQE9p/hOvLtpk=;
	b=WbyhdZlm+oZl1LuSxueFGMKEaCUCytIDv4twdX0QUp5BQF+eCAmvV4tUSxjoGSLquC
	6fJa/tpt9lBTsyXS71GDtqQLXg/IrkX86v6XVFHR/m+I9R+AUshJ/rD2ajZMnmXqoOPd
	Fi+FBQ23GnEdqPvJyRu/9x+9WoRS3nJQP7Ea8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OK5p1zWIPI7JiffnBbtT3dzQsL1AzAzQE9p/hOvLtpk=;
	b=oe8dBIrxvSB8/nlA9LU5IJSmUiW6HRlsmZS96u3gCOlKeidztxc3DXWOdLtxti6LwK
	uOmAAvH9VigaMIB1Ck62we+6M+0QVS63fhiYQcrAqJ2XUT0uy6V39PB5doz2dbkDxogu
	0TkG5NB/pdwCHWyOucngRHuF0+MUCJlA15uEvXzp9YukoEjKX1gMP1X8MxbFdFg8J0UM
	iCfMQUZ534t6MjRp59xyJOwtEY43RlBfrmFb6sK0e67cAZCj8h78kQcD4xfYqHzlnWFO
	5v89VxW+QN3cZc67T7NiCaPKTNShc/O9Qh8bD3zGIspu7ak6FMAKSUxmt91lH6jUuZIX
	cL5A==
X-Gm-Message-State: APjAAAVKpeZynLgjgjdkpZbisqQnjlbsnUF6ZQJqMAx/Y6TlHuMLYdHg
	8XYhRYSnS/3krU8THDmzTFe8HEFN93E=
X-Google-Smtp-Source: APXvYqyRB68COnOeX6Ut0FIlw/iKU0dPuRftTrXIRgdSui73MNo9atIFS5kq7A6cDKbDoi/l+cL9ug==
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr11467206wmk.36.1574364790225; 
	Thu, 21 Nov 2019 11:33:10 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 65sm4700771wrs.9.2019.11.21.11.33.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 11:33:09 -0800 (PST)
Message-ID: <a41449c79577ce3dd1442d8c4cdefcc04bb74f05.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, Adrian Bunk <bunk@stusta.de>
Date: Thu, 21 Nov 2019 19:33:08 +0000
In-Reply-To: <38e95272-cef4-e80a-456d-eb365a81e393@kernel.crashing.org>
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
	<20191121150207.3657-3-richard.purdie@linuxfoundation.org>
	<20191121155018.GB28013@localhost>
	<ec0c2ab6397acc54c64cc4f8927eed97e82a9509.camel@linuxfoundation.org>
	<20191121170948.GC28013@localhost>
	<0f2a46118e8847a3a785a2ab50999ecc22ec205f.camel@linuxfoundation.org>
	<38e95272-cef4-e80a-456d-eb365a81e393@kernel.crashing.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Thu, 21 Nov 2019 19:33:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 13:14 -0600, Mark Hatle wrote:
> On 11/21/19 12:09 PM, Richard Purdie wrote:
> > On Thu, 2019-11-21 at 19:09 +0200, Adrian Bunk wrote:
> > > On Thu, Nov 21, 2019 at 04:54:12PM +0000, Richard Purdie wrote:
> > > > Any suggestions on how we fix it?
> > > 
> > > My preferred solution would be to replace CentOS 7 with CentOS 8
> > > as supported distribution, which would also allow to drop hacks
> > > for two major releases of gcc in various places.
> > 
> > We are working towards that, equally the older version support is
> > useful to a significant portion of our userbase so its a balancing
> > act.
> 
> RHEL 7 is still heavily used.  But if we can provide a buildtools-
> tarball that includes a new enough tar, that should be able to
> workaround the issue.

After some discussion, this is the direction we've gone. Debian 8 also
has the issue. On the autobuilder we've installed buildtools-tarball on
that and the Centos7 workers.

> > > If all other supported distribution already ship 1.28 this would
> > > solve your problem.
> > 
> > I believe that is now the case, yes.
> > 
> > > > (We could make opkg-utils-native depend on tar-native but for
> > > > most
> > > > people that isn't necessary so it seems a shame).
> > > 
> > > Building tar-native is not something that would strike me as 
> > > problematic.
> > 
> > Its an extra build dependency and extra build time, just
> > complicates
> > things. "tar-native" is in ASSUME_PROVIDED and gives bootstrap
> > issues
> > although we have the "tar-replacement-native" mechanism to account
> > for
> > this already. So possible but not entirely straightforward.

For fun I tried this. It exploded in circular dependency problems :(.

> Requiring a newer version, and suggesting to the user to use a
> buildtools-tarball (SDK) I think is a reasonable compromise.

Agreed, we reached the same conclusion. I'll tweak the patch to improve
the error message to the user.

Cheers,

Richard




