Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2ibW-0005iN-No
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 14:30:34 +0100
Received: by mail-ob0-f182.google.com with SMTP id va7so108957obc.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 05:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=uIF7ob/v7UUvAlpXDPwxoRfQqtcr73VM2fcuPZSYQvg=;
	b=x5WU0YpOfoodaQOc6+qtPwPBULu2f8DZmM+9m/iSaI9M8lBFUL6//C2iWkqfPq4GWw
	MBh3OJdKBaLX7Cb71jg+KAzAYiESRv8imBVMLQqZVyRENJ1bk3X2oYGZW1Qzbk25/Dym
	VWhHXoIZ1tu5s8Ky6Mtq0PYH50qUC5RXLgy+PsCjLI3zsDYYzYNbhSEoAZWbEjwvHJYu
	lttVGWD2NeXB1XDDWmvC52JVhXAzhLQ0+pH8MTeWhN0ZCDq6fxZqgTlJ+DaQf+ArtnDh
	UHYb6U7pMDm/eIYJ3/Oynlfk4lM+QMCK5ITG9C/gn8bjdQiGYLj7Y5tN1e9hAZozSZmP
	UAZw==
MIME-Version: 1.0
X-Received: by 10.60.8.40 with SMTP id o8mr17935265oea.112.1360070080518; Tue,
	05 Feb 2013 05:14:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 05:14:40 -0800 (PST)
In-Reply-To: <5110DF13.7010502@mlbassoc.com>
References: <1359990723-21304-1-git-send-email-constantinx.musca@intel.com>
	<5110DF13.7010502@mlbassoc.com>
Date: Tue, 5 Feb 2013 11:14:40 -0200
X-Google-Sender-Auth: iUcA3FVYQAlhBxxPiUEX_t81Pyc
Message-ID: <CAP9ODKr6tGoU-jYdszVerCvMYn-gR4thnbL4WYnHroFw_ZUmjg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Tue, 05 Feb 2013 13:30:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 8:29 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2013-02-04 08:12, Constantin Musca wrote:
>>
>> - netbase should only include etc-rpc, etc-protocols, etc-services
>> and the hosts file
>> - the init script/configuration files should be in another package
>> (init-ifupdown)
>
>
> What is the benefit of such an intrusive change?
> Why not just have the netbase recipe create a separate package?

Many images use different network managers so ifupdown might not be
need; thus the split. Is it what you're concerned about?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


