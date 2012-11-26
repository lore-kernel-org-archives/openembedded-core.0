Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Td42T-0007b3-KY
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 20:08:17 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so5937372pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 10:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=X7qX0IzQlwg4Hr+CM3hsqH5O65ogNNjhzzSYsglhThE=;
	b=TSQ1uZN5/P3w2kwhU4/82TqLZnZaIO9E8dJDU+ZpZRa+AvUv6ToBp2bjhQPoOhR1/9
	r1BJ5YCkr88bmqhf0gax/TJN8zy9n5xPK24iWKT/FDyzPwekqh5Nva2zeThfBzEojC7G
	OmRIC6fDfTYrwmEtVF457M4AUpIdoSw8eFHhtzMogkChZP0rqvq5uL18rnfyqFL8RVaD
	PT2UFjAlDPtBuS2Gjrx6Rl95HkqwsEHsVxOP0kCAk5YTxRMsKvf+f+MjQT+gQB8N2s10
	K9ZMchiNOO4C2Ve8x8KNlzd8Hj6z4o3TLMRf/B8c0ebb8f5e1sgUMRUO0yAeudPLci7U
	E8mA==
MIME-Version: 1.0
Received: by 10.68.132.196 with SMTP id ow4mr40859750pbb.49.1353956044732;
	Mon, 26 Nov 2012 10:54:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 26 Nov 2012 10:54:04 -0800 (PST)
In-Reply-To: <1353952462-18652-1-git-send-email-cristian.iorga@intel.com>
References: <1353952462-18652-1-git-send-email-cristian.iorga@intel.com>
Date: Mon, 26 Nov 2012 16:54:04 -0200
X-Google-Sender-Auth: NqbK6jQSdVK0_3yoW5QXWpxozWc
Message-ID: <CAP9ODKqke5xJ1Jx9FHnmA0TG3mkOvQ-ck18uz46pwXCg0BF0Ag@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake: fix for mixed-up wget commands
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
X-List-Received-Date: Mon, 26 Nov 2012 19:08:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 26, 2012 at 3:54 PM, Cristian Iorga
<cristian.iorga@intel.com> wrote:
> wget commands for check and resume were
> mixed-up, leading to the following issues:
>
> 1. long running "NOTE: Preparing runqueue"
> reason: objects were downloaded, not spidered on the mirror
> 2. Failing network test in Build Appliance, because wget 1.14
> (in use in BA) will fail if a file already exists.
> During the network connectivity test, index.php file was
> actually downloaded, not spidered (checked for existence on
> yoctoproject.org website), leading to wget failure.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>

I agree with the fix but this needs to be send to the bitbake-devel
mailing list ;-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


