Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id C37467BDAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:03:00 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id s17so2402943ybp.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=CEboZGFD61WMh4p16Ix9H6J1yNeQnR2MEnD3SjoonzA=;
	b=dLje64VrVLNDMINPS4u4hJmLLOKjmNLUNpcCYEu2PwNutdky+/K77ND49oCK3B66Bz
	Pmu0AlVqJzBRpiJd7g3bsQff+YnXdcRfWlxK5FzzROxhpbZWBYlOJLdb3g32erFEH8bo
	tZUm8ipEcoiuI+F+2EN9YlddBABP+yTORl7nhF7XCiFnq8dNTZEqfRKAXyiXc0QqA1ft
	TphBOEwxRtfmIAmR7zrMtm3UlVsSuTZZMl4UT/3RdZFTc2kkuxApLO8NgOQjzeSZZu1i
	bbKSCBzMQ6rm7uhDQNkLq8nHRwoa/4TY0fFGC+lkO65ujseHjmTPtUDTxupO9BiYDh44
	TfXw==
X-Gm-Message-State: AJcUukfeX4gA4vFxkuwP3vf4OPLtv7cvZ6IfWeN4P8zeSQ5Wqas3e8Lt
	Gg+LHKoaC5BbZFExhEl4dAb5VMHz
X-Google-Smtp-Source: ALg8bN52FlRodHcNAHHusRrdn5P2dtfRKAG+TFNIY3ycPnJydmX0a4CJSuJDnxp5TZWF2fbe4IaJsw==
X-Received: by 2002:a25:4d3:: with SMTP id 202mr7028057ybe.414.1547640181510; 
	Wed, 16 Jan 2019 04:03:01 -0800 (PST)
Received: from bluvision ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id g84sm5087305ywg.9.2019.01.16.04.03.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 04:03:00 -0800 (PST)
Message-ID: <a90ab7b90616d174bb2d64d8ac13de6cc5289539.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:02:59 +0000
In-Reply-To: <20190116120051.12182-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116120051.12182-1-git@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 00/12] util-linux: one package per binary
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
X-List-Received-Date: Wed, 16 Jan 2019 12:03:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-01-16 at 12:00 +0000, André Draszik wrote:
> v3:
> * update 12/15 util-linux: simplify meta-package RDEPENDS / RRECOMMENDS
>   commit message
> * replace patch
>     06/15 update-alternatives: allow hooks before renaming files
>   with
>     06/15 update-alternatives: convert file renames to
> PACKAGE_PREPROCESS_FUNCS
> * update follow-up patches 7 8 9 10 accordingly
>   
> As per Richard's request / suggestion

This also was rebased on top of current master-next to avoid merge conflicts
due to 'meta: Fix Deprecated warnings from regexs'

Cheers,
Andre'



