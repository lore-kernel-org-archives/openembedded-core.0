Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T9OAi-0004Vw-KY
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 00:34:08 +0200
Received: by lagv3 with SMTP id v3so676714lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 15:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=IHhPdo2DHNn8TuJiPwAm7gJaOTwTJp8q5DAAAyuvCuU=;
	b=jR+Upct8ioS5NwUspm1fZA6Kife5LZ7NtubVhVKCYiqIotUNY6ieR/9s7UcuiH0Z7c
	tY/ggT4Ijp9agvf/l4oH2eTYjv3wwv1igd+vLyfmEUbMXsJO6B7kk2VVpNA5gq7bOq2S
	vUS+vU/sSvXt0Ha/0OZAI4B5Bjmscl8kAIHzrM78+p4DmQtgtATYSvNyUpWvCO5eJpZi
	dpO4b9Iyu4Q4rK6HCbZzZkb0MCtWTtiTL2qZei+eYTkuCBHHKk2BWhsq3bbN2FgDHw0W
	7tpgP8TuXk07H+QGt6/Llk+CxytWUhNANZrYB3ChrNhZnNp3ktvy/WGmIDxCRhR1tkSA
	4Hfg==
Received: by 10.112.51.174 with SMTP id l14mr163776lbo.24.1346883705127; Wed,
	05 Sep 2012 15:21:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Wed, 5 Sep 2012 15:21:24 -0700 (PDT)
In-Reply-To: <1346855269.21985.57.camel@ted>
References: <1346855269.21985.57.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 5 Sep 2012 15:21:24 -0700
X-Google-Sender-Auth: cLz4323tO-y1GzEKH1HrS7kigCQ
Message-ID: <CABcZANk+N+3Gg3kASaQ_19DYd_AtyDoWsS-hfv=mFZe0Jaz6Qg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: Move back to running at ConfigParsed time
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
X-List-Received-Date: Wed, 05 Sep 2012 22:34:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 5, 2012 at 7:27 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If we don't do this, users can get extremely confused errors since the sanity tests
> happen too late (after parsing) and don't see the warnings.

Can you elaborate on this? This commit message is extremely unclear.
If there's an open bug in bugzilla or something that could be referred
to here, that'd be helpful.
-- 
Christopher Larson


