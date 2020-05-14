Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.14776.1589470179005846249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 08:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=CMhLI18n;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=glre=64=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49NFp85HHfz4X;
	Thu, 14 May 2020 17:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589470177;
	bh=FmGsgVrNCnROyj6DDwxDEU055IgBTY6yWcLlFlTWqPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMhLI18nIJqVfKu1B1IorO0pAExLNd8qGGl/KzqfLZYNgKY9DybIYgqw0HpQGJjs2
	 h6DOWbHpvyOnA4FAXb7NJQGqE2uRH2zc/hi0S0oQTEQL90FdhrzuBfT68wnm3IPE3o
	 xQ/KnaAbuf7GZdMI64sUnknVbjTw5LqF/a07Odjygjr1F1OWuvDyt+SQu8V6QiYUd/
	 CAhi3sZbgMRxr7mBnoAm4S920os94gmv6QDnqlmsfueYc7eb+Hu5RqYyYvhxduumnX
	 +fa+BoG6TCOpCVjwGtY1TFwpAIQ5jiiicic0PsuK1umnBPrST7KzuIQwv8MfgjVSjV
	 WnTF1u2QaL/7i4UlJ7N7Pt9UYukcKfYLwixwii3XQ9oT/2tZm4/U4kSBAJPSODIGi/
	 upjbrHNRWCFZRPBk3xSKTDM0b7ciPjvHyxbEEM0U1uLyB8ep2TpjeqrPxbeHKlxdNV
	 dR+R8vg1vszvQJ+NiFsTPUePq/Zu5AM9K9nn/4az2JstZynfNTkdyNIysXkYiA81Lu
	 Pd7AyvM/buwUlqPflkMBGKR3PKx3N7Jh7cQX4/W5PJkgyXNUgNXMsUQVgy8vInM6Nj
	 u5SVqVtlBMdA+PwjAgda209g/seg/FhWKGmzyfOLYbqvMjAVI650lH5F1Aexe5uDzh
	 1+7xBr9+pc66hRyi+bGgNj64=
Date: Thu, 14 May 2020 18:29:34 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
Message-ID: <20200514152934.GC21399@localhost>
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200511182812.441561-3-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Disabling -moutline-atomics would also workaround this issue.

And I think it would be the right thing to do for Yocto in any case.

-moutline-atomics makes sense for binary distributions that want to 
offer both high performance for heavily threaded code on >= ARMv8.1
and support ARMv8.0 in the same binaries.

I do not see usecases for this in Yocto that would justify 
the small performance penalty from -moutline-atomics.

cu
Adrian
