Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 769FC60807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 14:07:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 74-v6so9483633wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 06:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tCMWh5lTStyYH6rtivSsMSrkg5IcZowbVMDRJ5MXmrU=;
	b=S6XEUf+UMn0aDxzDMhM9pypCEBJt+rMI4S01bMe0/lmlUaygGZzIOQs//S8coDXU/Q
	k0ZPTO6HzPgITGIXvbuPLkewCGLrEF7PZNsN9tWG881QhZi0OPWDOXNPLK6z2fkGaoQy
	HsSRvlr1CZ5TZzC2VpDS7LRBmRiDchv0sCFlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tCMWh5lTStyYH6rtivSsMSrkg5IcZowbVMDRJ5MXmrU=;
	b=Z/dYUG00BduJAwgbFfLzpAM+Rg5zQdWUrFd5rB5w1qypFE5U0qbrFYUs/2RWrPy9d6
	xuMcX0gwAICI6NvFsqNcw4+oXqL8A/haSAQ4In/n+lpk2QnARd16npJ9Qv4l2nYjJC7M
	sHMA1yH5KoHopb83OxXbiCkrD3tQ4jJBD/ELSM6uCdk4NX1GGdIN3Yeh/2GXukV4W2lK
	LDhqF8EuSazobeWRYlA9OXRCfhm/m4G4GXbgoXOcviUoTV4wbNy1hhO/xSNrLRkSuC+b
	UcnufUehp4AqZFf/51Dpry0Y91Bs3ZYkbtyH0IWWf5DsXwW4ePoH9DRrYt4uN7nal0QU
	5bPA==
X-Gm-Message-State: AGRZ1gIMZ2nJ/Cpg5CXeYtXVkRMM7KVR8mKCPkh1bJWJvP5qvjmV4hz0
	5E7TUphmQ/ia1prX48LHESnoTA==
X-Google-Smtp-Source: AJdET5e/3fs96f+QO8D4N+UsBQO5bRvYANLLmGY/86CgNkeI8kCBCyVe+vE0bKBQ0+4JVXdAI1QlTA==
X-Received: by 2002:adf:9589:: with SMTP id
	p9-v6mr1135447wrp.270.1542031644115; 
	Mon, 12 Nov 2018 06:07:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	137-v6sm13045527wmo.43.2018.11.12.06.07.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Nov 2018 06:07:23 -0800 (PST)
Message-ID: <b66d3b7bcbcd4dd6c378d5562d9c24c227f89c20.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2018 14:07:22 +0000
In-Reply-To: <20181112125653.21157-1-git@andred.net>
References: <09487c1d7e9d9a2cf0c60883ad209712c2d31dc2.camel@andred.net>
	<20181112125653.21157-1-git@andred.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: broken sstate archives
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
X-List-Received-Date: Mon, 12 Nov 2018 14:07:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-11-12 at 12:56 +0000, André Draszik wrote:
> As a follow-up and as a reference for the future - having done
> countless
> builds I am confident enough that a kernel update solved the problem:
> - linux (Debian 9) versions 4.9.110-3+deb9u6 and 4.9.110-3+deb9u5
> both
>   exhibit the problem
> - 4.18.6-1~bpo9+1 doesn't
> 
> Something must have gone into the btrfs driver to fix the issue. I
> didn't
> really spend the time to try and find the relevant commit.
> 
> For reference, I am also sending my hackish patch to poky to detect
> the error case early, which (tries) to detect the broken archive, and
> simply runs tar again.
> 
> Thanks Richard for all your inputs.

Glad you kind of have an answer, these issues can be challenging to
debug. FWIW it sounds like the right kind of problem/solution to fit
the symptoms...

Cheers,

Richard



