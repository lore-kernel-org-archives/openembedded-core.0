Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1THZpD-0007td-7z
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 14:37:47 +0200
Received: by padfa11 with SMTP id fa11so2248337pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=X1KJ90/D9Q7UBcYgoGmt8WZf5V7MjpmnMil8m5ll+kI=;
	b=stdROgWHV5Lq/yu1f170Vi8QUbMLoJAjbzZfwUbw2tjT1PfJLa0J9u0QgJ6T+yB7O+
	jOGyRhpRymnuFwerDsQAYFkfHQjWhiREvinl660Faiv+gMSHlfP3ohUvdNx8XjtCZwKC
	EXGNncioK8cbexbfh9NTgz0wYg3D8OHB5Yq3d0wNFZgjphsv/AWJM74Qhom93o85A+xw
	ghRVfvU5OgDzidckz3+dU/u3bvrGTpygxALsoXRy2mXVIa1x6Op861RGtOuR17RY2liT
	liQCqWbT857XxGNV0mY5eC4OubqQ1fF+NLmxcByh3NhTxHjSExE2S8m5oQI2x20YSU/F
	mWUA==
MIME-Version: 1.0
Received: by 10.68.224.133 with SMTP id rc5mr19643140pbc.130.1348835093477;
	Fri, 28 Sep 2012 05:24:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Fri, 28 Sep 2012 05:24:53 -0700 (PDT)
In-Reply-To: <1348803644-20961-2-git-send-email-raj.khem@gmail.com>
References: <1348803644-20961-1-git-send-email-raj.khem@gmail.com>
	<1348803644-20961-2-git-send-email-raj.khem@gmail.com>
Date: Fri, 28 Sep 2012 09:24:53 -0300
X-Google-Sender-Auth: pwy-78JTk0BZq9TZusRaX4HDfeU
Message-ID: <CAP9ODKrjKH3mBMLqeF8W_Kc8S0tkrju63sJBEqkTE3bsYuyyLg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex,bison: Add nativesdk variants
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
X-List-Received-Date: Fri, 28 Sep 2012 12:37:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 28, 2012 at 12:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
> It is needed in some SDKs that we ship own
> version of lex/yacc for sdk host
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I'd prefer two patches for it, otherwise the patch is indeed a good addition.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


