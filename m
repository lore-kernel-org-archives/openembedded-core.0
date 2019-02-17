Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B249C7C66A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 12:30:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r5so1843976wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 04:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=PsvOIfyxj9SwcrbuGkAqr/G1KPVroRSndRdSPLkxhvA=;
	b=WC6QypZop26WyAX+5yDsl+TJUY5ZOnUyGl0o6okTclp9jQxQjR9UygKVYU4r0CUeTs
	J/tuIlP1l7mzsmU8/SRFIeizFV83nrHASpfxZ/wbChnANaPGr028Y0jrl7uKxkbvJHWI
	myFGLzfiDj51zP+0Y7HsNp7rnVYccXELl2Snw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PsvOIfyxj9SwcrbuGkAqr/G1KPVroRSndRdSPLkxhvA=;
	b=nFnaVOO4aMzOFSC8wnwgCMcZXu2QoFVwM+YPvce0/clJ0rK6fxY56n/lFfSvQmyITG
	6gMUsULPXHmGD/JbILKd7YiBvZKrJkUF6/jDEoCiXycPynRp/PQP5/sjtq2xFV+TF6hU
	D8IjvkRn+44jVY/3FX9ZCMoVSA0Hx9bd7kx1OAuIzr6y03iol0IC1IjjiN7bRUUwwnIx
	pdbojaU7s+2lclsi/ZU0D09moxEBdPigxn7+cKWryRNFfw3FGlntKTOGwdGw/e46wghP
	hoKnZnPWu12JZF57lgv+Gumv3ZJJhJGLbv5zrIaZujIYYSQ2afoqSH/o7BzoPSdQfXHk
	Py1g==
X-Gm-Message-State: AHQUAuaOfjgnzwxAKk77aFBxG9Jk5ImTaHQa1O/17OW2OLyHNYninEHu
	oQQYQsmUqhIwel4Z/GMdwfCF7g==
X-Google-Smtp-Source: AHgI3IbkddIw0mNS1Jiudc95lWvmd+5v54+QDX7IhZM3uYO2mllwz2IEzdlQX98BeAvVmx1k/19PeQ==
X-Received: by 2002:adf:9d85:: with SMTP id p5mr13146201wre.215.1550406608434; 
	Sun, 17 Feb 2019 04:30:08 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b197sm26365873wmd.23.2019.02.17.04.30.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 17 Feb 2019 04:30:07 -0800 (PST)
Message-ID: <746bd42a55aed6d0e8618b60edf24836a63883eb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2019 12:30:06 +0000
In-Reply-To: <12f66cbd-b0fc-72ed-33f0-0f15cf5c9d87@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
	<20190216194048.6256-1-andrej.valek@siemens.com>
	<d1a6ccb19112c13eed8bddba5900bd754717a804.camel@linuxfoundation.org>
	<dcb1186cb63fc3a8558e6863061576562a63b8ae.camel@linuxfoundation.org>
	<12f66cbd-b0fc-72ed-33f0-0f15cf5c9d87@siemens.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] busybox: 1.29.3 -> 1.30.1
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
X-List-Received-Date: Sun, 17 Feb 2019 12:30:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-02-17 at 13:28 +0100, Andrej Valek wrote:
> I have already made the comparison. Seems to be that relevant
> differences are:
> 
> CONFIG_NOLOGIN
> CONFIG_NOLOGIN_DEPENDENCIES
> 
> CONFIG_BC
> 
> CONFIG_FEATURE_SH_EMBEDDED_SCRIPTS
> 
> We have to check, which feature we really need.

What about CONFIG_DC ?

Cheers,

Richard




