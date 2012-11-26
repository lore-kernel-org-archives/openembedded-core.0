Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tcwlz-0001W9-D8
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 12:22:47 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so5672216pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 03:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=gjr4VDkFtufynVbMpbhGL9G2acKFhujp+tlvUxA/cKc=;
	b=t8IFi7VIqU5pOySvrtxXjXBV5PvYSkiGKdjiK7fvH//C7LASLVqXke2dAGi67I5WPs
	bBd22NQaYSML3+8Jq9+icrQ6GIp44ge9IUYLlhw+8kaR++ZEX6fPUjgC4+OOmAoYp7Pq
	pDTghNN30vbNq00wZDONJcsl8yTckeG4YOUO/LfykJQOm4SllNUeoZQ6fQaRdSn54sfM
	3J31ld327HYAWyjbKY36ErcIgYPt6puDjPDDR0Mm98qmNvr86kGGnahq8grKQsOM2oXK
	IvnQAlyav0s17TnMu63bnGeb2NoQ9i2W4uOtttRlMNjdfuHvBNVqbZ0JwbaaCkIYFrai
	QFWA==
MIME-Version: 1.0
Received: by 10.68.252.4 with SMTP id zo4mr36710799pbc.126.1353928112183; Mon,
	26 Nov 2012 03:08:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 26 Nov 2012 03:08:31 -0800 (PST)
In-Reply-To: <1353874980.21863.20.camel@ted>
References: <1353874980.21863.20.camel@ted>
Date: Mon, 26 Nov 2012 09:08:31 -0200
X-Google-Sender-Auth: TIRFYylOC3Z4iL5wwLRT7du0xdc
Message-ID: <CAP9ODKrCMHknzX62fb23=AXaKT8-CD2o6Pgmu1PV8T2wwKdh1g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] allarch: Allow class to be included but overridden
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
X-List-Received-Date: Mon, 26 Nov 2012 11:22:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 25, 2012 at 6:23 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We have cases where we'd like to inherit this class by default but allow
> special cases to override it. This change makes the code of the class
> conditional on PACKAGE_ARCH remaining set to "all", allowing it to be
> overridden. packagegroup usage is one case this is desirable.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Richard, I fail to see the usecase of packagroup. Can you clarify?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


