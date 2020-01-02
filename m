Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B5EB67FBA6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 18:30:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47pc6P0JMKzQJ;
	Thu,  2 Jan 2020 19:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577989837;
	bh=v4Ulbk3iGRLEO/5HtlIH4geNCrBgI9xax5eKumhiFVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clATjN0QmsVzgj9kVp7wg8JBnyjaZFsFDGV2qJYArcW1UEJ3trsZnBCuj7wMqUg3G
	j7wuzE+cKRmqemIe9WbutJL2c9l9Ye64wvEH37017kgxptJ5GkRDXLM3lhp63fTYef
	EsJEbWD85i4o471UHv4i5kwG7/SFUAexRfrHPpLdNLNe6ZIaNUBX7iLgATDt9dK5ic
	muGMMpJ/uvo7mF6VldvfUMCe1qfCkmdoGuU9ucejrSS6S/d6O2i+WJamutuI4RGrAP
	kLAMqw6kPzioBbvoa3MubKvsQe/I6wz7qUgOTgaGYwB/m8bplPXMtD3TMXUPC7PQgT
	csfWmX9qflkZAGeyGUU6xkAxHnDigdCk9JBJNTan8qPKPeBTfgVX5yY9Kue+u4AVDp
	paP7uMCDxEgL6HR0Z0Oe35l8hEjuunnKvSO2XzCCJjACQ0aXyOpnUquUQwqpdFBmcY
	CJIkVLOx6FerWmijW/bo2DhguI6gzv7UhvEliImQb6XzNLjtLBby6ZDvG2v14iWeLo
	xt+h2PTcFjHWAauXchDH8ZdqvF2zD56J3i5UokbXfmELfXFk7xtS006kqQgAFqzCfQ
	TQJ4rGv6B+qNhXXgCWRqMQaaP2WALzrvQNMXOYzf6IkT2UqYzujDFdf1MqcZOH4iUA
	ryaB6OZ2oyQmOr+X1Z2yJ6BQ=
Date: Thu, 2 Jan 2020 20:30:34 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Stefano Babic <sbabic@denx.de>
Message-ID: <20200102183034.GC11760@localhost>
References: <20200102175206.657-1-sbabic@denx.de>
MIME-Version: 1.0
In-Reply-To: <20200102175206.657-1-sbabic@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Thu, 02 Jan 2020 18:30:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 02, 2020 at 06:52:06PM +0100, Stefano Babic wrote:
> libubootenv is a replacement for u-boot-fw-utils. It is
> hardware-independent and provides fw_printenv and fw_setenv tools that
> are full compatible with the ones provided by U-Boot. A library is
> provided to access the environment from an own application.
> License is LGPL-2.1 and this allow to link the library to proprietary
> code. The user of the tools should install the configuration file
> "fw_env.config", as he is already used to with u-boot-fw-utils. The
> configuration file is compatible with u-boot-fw-utils.
>...

Why do we need two implementations of the same in OE-core?
meta-oe sounds more appropriate to me.

cu
Adrian

