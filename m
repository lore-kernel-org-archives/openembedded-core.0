Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8A1F7CD63
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 12:36:38 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id g9so580460eds.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 04:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oiA+MgSUjiueBPFOH3XnzymWu+CASvub/RvHfQAHDoY=;
	b=HovfcNVMz58vF4syJte4cvc2ogjLXXOE9MsYWrAoeocUtXynNLg3nUWO01kbaawzmO
	1LzqKPjlrEQvLi1DT50A04AYE8H44S5c5dJWHhIDGL8m1BehJYDa/Yz9Wffe9rncPrNp
	7mr2W2OoXrEQ2xohd4owCLCjdcFU6J2HDDZjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oiA+MgSUjiueBPFOH3XnzymWu+CASvub/RvHfQAHDoY=;
	b=oRdmGfbIZ04WgzLd6CwG00lYrE4E0hGM/cd7M6Y/91OuSFmYtspTLBOpI8000kqudw
	Px1KCgM5iPblZ14PcmSCXOc6myO+tljdQpIVUPZrScQTvpObT25C9p7RxYfUST4VL91W
	X4k/nJidGeR/1N/qepv4RVK/7VJ3nULTPye9EES38NXbjN8lgf+6Tv1M7qU+uuuLQfmj
	GXqIstKiNixUao1Cc0KZAQ6HB9o8b7x7D0rSLmUa+MuVHmDqqX+ent5CdDrQKDn2em3f
	LiZDBNiAGc43KEJI4c5ziDct5E/s6fqfyrbCgkSzzOAO75E9krYnVG7VYZAGL9Rw0gZI
	51sw==
X-Gm-Message-State: APjAAAX1AiphF/4sDi2qhLAwKCEPaVJxw0TfTYfvUd0rEy1Z7ssbFQsJ
	8fCRBooQUYfhp7bv9JmD1+RrxA==
X-Google-Smtp-Source: APXvYqzGy3Zqm9NQ7MbIgql6WRx4AxeMl+nxWE+0OZg51KBItqd0qbLZ9ZfHb//1VVTRGzgQGnY9/w==
X-Received: by 2002:a17:906:b30c:: with SMTP id
	n12mr6452733ejz.49.1551530199131; 
	Sat, 02 Mar 2019 04:36:39 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id gx5sm113658ejb.37.2019.03.02.04.36.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 04:36:38 -0800 (PST)
Date: Sat, 2 Mar 2019 07:36:34 -0500
From: Tom Rini <trini@konsulko.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190302123634.GE5026@bill-the-cat>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-2-git-send-email-trini@konsulko.com>
	<20190302091548.GE1503@jama>
MIME-Version: 1.0
In-Reply-To: <20190302091548.GE1503@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] vim: Import version 8.1.0347
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
X-List-Received-Date: Sat, 02 Mar 2019 12:36:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 02, 2019 at 10:15:48AM +0100, Martin Jansa wrote:
> On Fri, Mar 01, 2019 at 05:26:49PM -0500, Tom Rini wrote:
> > In order to have a stand-alone editor in oe-core, bring in vim from
> > meta-openembedded/meta-oe.  This imports the recipes as of git commit:
> > commit 7b48bd2be97408107c0dd3c74b1e28f042268457
> > Author: Ovidiu Panait <ovidiu.panait@windriver.com>
> > Date:   Fri Feb 1 10:07:20 2019 +0200
> > 
> >     vim: Enable GUI support for x11 DISTRO_FEATURES
> 
> This isn't the latest vim commit in meta-oe, you're missing:
> 
> commit c4db3971ab88dc8c012256e987f73ccd4459b400 (HEAD -> jansa/master, contrib/jansa/master)
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Fri Feb 8 22:57:02 2019 +0000
> 
>     vim: use empty PACKAGECONFIG for vim-native
> 
> it's currently in master-next, but it should be imported as well.

OK, yes, I only grabbed current master.  Yes, I can re-spin to include
this version.

-- 
Tom

