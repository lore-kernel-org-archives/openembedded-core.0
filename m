Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.57968.1584983070158098167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 10:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=qkHNMt5s;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=wdyw=5i=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48mLMX3l40z4J;
	Mon, 23 Mar 2020 18:04:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584983065;
	bh=D6zF5GpRbWK5EhwbIKxESEnbjHydSoSUijG3yE/VGMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkHNMt5scJLUUDj4ray4RSWxGILwf8pY0PLo8IO2Q9vRLexmyC2IVGc6YeRB94vlP
	 d6pW/OtvWp6C7oKtcp01kHTvNyd4/SnM7Xzt//avwWVYSrs0OAj/lRwDCdEF8Za4Nv
	 B5PuK+CAf5fAaCrbWDbjoyN+jJQcwKR9kUYospWKy4fZzG07wexoA+2ld56wHHWOCb
	 GI6IPziAgP9w9oX4Zm7d3MUdMYZBZEBr4t3/NWTn4UZH2xYqzeapQjtQ1KJ42iKCHc
	 BURaNDwZUykBSYDghLv9Nb1YUenMaYQ15cne969dG7GVz94Fxu8z+MZVEwT/i52I+V
	 94FOSEllBfoywtV81y/edPI5ZMocnGQK4GbIoSeRdu+h+f4ejTGe2eSGVWrriAPgI5
	 oAGNt4ORJe1hvigzVuh4NDBUIxVpfLxsU3Hq+Fr8UJoPlNU3k1E3mfWWXXFNK3xNh0
	 xhA+NOgCvHHJKIJrvaAQBCN7f0ucM447DZrFYzT1vkU1j5LpfvzuBr53Nu1+YvL/eb
	 lt1D6UAo+/SvgbHXlJbrEjCxak+PmEjbd4v9xUOHR6Men8dKTdbz/0d4c5RZzTbXMH
	 BzC1QsWwM5em9KYJCM+QYb2URy6U3kpRjEpCXDYGZXfKS+KMvBKkkPeakNr+3/b6Lh
	 mzFXmC82jEppyEXB8Azu7cKA=
Date: Mon, 23 Mar 2020 19:04:22 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] wanting to clarify variables related to using host tools
Message-ID: <20200323170422.GA10964@localhost>
References: <alpine.LFD.2.21.2003231207540.20339@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003231207540.20339@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 12:26:04PM -0400, rpjday@crashcourse.ca wrote:
>...
>   in that case, i notice this line from bitbake.conf regarding
> ASSUME_PROVIDED:
> 
>   # gzip-native should be listed above?
> 
> which seems like a reasonable question since both gzip and gunzip are
> listed in HOSTTOOLS, so why would gzip-native *not* be in
> ASSUME_PROVIDED?
>...

meta/conf/distro/include/default-providers.inc:
PREFERRED_PROVIDER_gzip-native ?= "pigz-native"

> rday

cu
Adrian
