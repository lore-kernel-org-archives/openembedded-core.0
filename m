Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tuo9C-0005GC-K3
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 18:48:35 +0100
Received: by mail-oa0-f44.google.com with SMTP id n5so4265029oag.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 09:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ZPQv+zO/5+mMii8DQhpvAvp7h+KmJinjMpjS58QIVdw=;
	b=qcapBx5sad/hu8YW2UEEFgw13aJp1b1dZT+pfEWvT0ECN6VmcjG2gAhhMESWBYo/On
	2LKhsSMDbNZG9VpsFujEQ0X3zx43WhsFZ6pBd31vKeWhuuGb7TktUfnsSep+J6dr6cHZ
	NoZbtnBL9zga22Rj+ntQYn7andhgAO157ypmAm7P31tSbBQHspbkHRuza3uHEmSnhFQ3
	KW2n/b0Gc3q8iuAQCdJ9jyoa8HLACthmR7x8E2Reb24qqD42x/jmUAS2xpN54NQAosIk
	jQLEvDKn7h8SXbnz7pa0vpJyXbILWn+8E+nm7wsLVVbSS3YrSTZiA4GKQQA/zi0xsvK4
	e/Ng==
MIME-Version: 1.0
Received: by 10.60.1.42 with SMTP id 10mr51335159oej.125.1358184794972; Mon,
	14 Jan 2013 09:33:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Mon, 14 Jan 2013 09:33:14 -0800 (PST)
In-Reply-To: <1358171300-970-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1358171300-970-1-git-send-email-muhammad_shakeel@mentor.com>
Date: Mon, 14 Jan 2013 15:33:14 -0200
X-Google-Sender-Auth: eiruHsaOFCvb__WCK7FfLfuuMQw
Message-ID: <CAP9ODKoom8bBhU-YJZTFLxmNt6uAW+T6GnmWtWiCxmgbiFA3Aw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] archive-*-source.bbclass: Handle all package classes
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
X-List-Received-Date: Mon, 14 Jan 2013 17:48:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 14, 2013 at 11:48 AM, Shakeel, Muhammad
<muhammad_shakeel@mentor.com> wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> * Add archiver tasks correctly for any 'IMAGE_PKGTYPE'.
>
> [YOCTO #3449]
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>

I'd prefer if this patch would be squashed in the first one. It does
looks like the same change for me as you're adding those hooks here as
well.

Richard, can you comment here?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


