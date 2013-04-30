Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UXATo-0004S4-5U
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 15:20:28 +0200
Received: by mail-ve0-f171.google.com with SMTP id oy12so347450veb.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=jQNbVmvB2zu8gZoEtcj1wa5hWQWQ13JKvX5vrJlUcuI=;
	b=elIZjaxRBREPCKEXw8dJ7IxxZe+YQTpM9cl9WiSIdesHB9RSdlcdefb/fhD6xvTtF1
	P9u/bcF6mAwOBzdBoBJ3AapxHuJbTZkrSateaea4NVUoYkVNwJu/+hIgWyrFIhpHUNL5
	Dp6tlARj4HmXsI15ztFY6uPgkPIwIdbITyHuaOZs3eh3jdvfKCj14fbr4o+XPg0wBdpW
	raoeHNCqcG/I19X1yOG1kfpBznCXocOt6w64DvE9PBNBVowAZsJpfFmLGP29GBU+Ezp2
	pB9J8FDzUVgWqTv+a/NKtOnIjH3iXB/6njaar4YCIhFIWAEDaBnnuL5IYrmUMfG3TitU
	wndQ==
MIME-Version: 1.0
X-Received: by 10.52.67.11 with SMTP id j11mr412999vdt.87.1367326952402; Tue,
	30 Apr 2013 06:02:32 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Tue, 30 Apr 2013 06:02:32 -0700 (PDT)
In-Reply-To: <1367325716.5379.90.camel@ted>
References: <1367325716.5379.90.camel@ted>
Date: Tue, 30 Apr 2013 14:02:32 +0100
X-Google-Sender-Auth: jsBlAkJN5DnJ9qBS27xRzIzACW8
Message-ID: <CANyK_8f0a-PRB22bCQekZLPp7aKH75yO4noUpZ7damPsPcnzaA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: Ensure target packages don't reference perlnative
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
X-List-Received-Date: Tue, 30 Apr 2013 13:20:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 30 April 2013 13:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Currently a load of scripts in ${bindir} start with:
>
> which is undesireable, this patch fixes that.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Missing a line in the commit message?

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


