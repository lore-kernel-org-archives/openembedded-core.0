Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TzqR0-0000d5-LK
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 16:15:53 +0100
Received: by mail-oa0-f45.google.com with SMTP id o6so787456oag.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 07:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=P6bF0Z6nghSvvujx99RpfDeKVUyMsglBnQBM/bB3oO8=;
	b=xWsCjA91CqqXbRfhW3XqAFNKmC8ohcGZ1uisxIW9LqEXUJNOMhHC53OP8WM4KXZj6q
	GUJkmuQz8UcfOGY/7ewe6UDAatO+v5RiEsx5iiEYuBzhhBOCXtz0QjS0HP8e4IO38D79
	IbQfDNyF7V89H0X8eHRVrD8E2YgAXQw7ul2k2x6g1efB3EFbwcZCe4VRB3JG9T+Q4HKb
	cqI9ShcT1KFdEdAfgWcCqxrv3k+pGvghNDmVm7GTUUZ2xwtGCSpfY9SWhEnmShSolV+Y
	E1014b/UDS5clOZZMRafJmykBnnJLYKZBYYXvroNSZCs8pwYtntnhIHs8DJEvZ0suxPg
	smoQ==
MIME-Version: 1.0
X-Received: by 10.60.8.65 with SMTP id p1mr11756966oea.4.1359385207729; Mon,
	28 Jan 2013 07:00:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Mon, 28 Jan 2013 07:00:07 -0800 (PST)
In-Reply-To: <1359383057-2560-1-git-send-email-vakul@freescale.com>
References: <1359383057-2560-1-git-send-email-vakul@freescale.com>
Date: Mon, 28 Jan 2013 13:00:07 -0200
X-Google-Sender-Auth: rT6ftoJFdbAR7VF5_kmZPTuqvqI
Message-ID: <CAP9ODKokATZBMCOSKDy3-O0LXhJybeA_=ijd57dp-azBYGHg-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Vakul Garg <vakul@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb: Add extra padding to the blob.
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
X-List-Received-Date: Mon, 28 Jan 2013 15:15:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 28, 2013 at 12:24 PM, Vakul Garg <vakul@freescale.com> wrote:
> U-boot patches portal devices for adding new properties in portal nodes.
> T4 devices such as T4240 have large number of portals. This requires extra
> space in device tree blob. The large number of portals need more padding
> space to be added.
>
> Signed-off-by: Vakul Garg <vakul@freescale.com>

This might be overridable so it could be overrided in the machine and
do not change the default for everyone.

What do you think?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


