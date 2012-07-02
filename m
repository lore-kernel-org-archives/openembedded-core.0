Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Sleuw-0006lb-Jj
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 13:35:46 +0200
Received: by dalh21 with SMTP id h21so7134094dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=4vRDpZurZs4xrBc7MQWRwSFC/VCGavOvQPFqY0GhUbI=;
	b=WeBzBpQ66wCBqVL7tero1qrwGQrhf1dkcilexwFFev5RVR6GfDtPU8Z6dXc5a8l9PI
	rPKQmdFgWuNZZJCqJKVb1oqAHLPkLvPA5aY/FFoQz3x6JWuVaNO35mrU9mlAFy4EdvpV
	4YfZeGqTcB7iEFh9Y4O0n96uH8z0idpe/EtWwFAozBWY0CupwohP7LWra5TuBQSgejAd
	iJFBb+E+zoEzI0jb5Z+uAPwH1GS3BUuCXYO/EYEyRdZwM0pUshclDYDHmrlTKEzx64dz
	vfXYJ902cr/nwQP3W4gpS1RLnmxUpEq4nEKwboJHYzqyQ7gAMIDiKGu47FoeGL+zrTBD
	pwYg==
MIME-Version: 1.0
Received: by 10.68.233.132 with SMTP id tw4mr28260345pbc.61.1341228285454;
	Mon, 02 Jul 2012 04:24:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.129.129 with HTTP; Mon, 2 Jul 2012 04:24:45 -0700 (PDT)
In-Reply-To: <1341207885-9463-3-git-send-email-paul.gortmaker@windriver.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<1341207885-9463-3-git-send-email-paul.gortmaker@windriver.com>
Date: Mon, 2 Jul 2012 08:24:45 -0300
X-Google-Sender-Auth: NGr-nayT26r-9fnY0IR_a7S0o_A
Message-ID: <CAP9ODKot3PDg5vkz76NwNgSsy+2tn_FB2-tvaYyc1WJzW3zjrQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/3] u-boot: make FILESDIR a shared setting.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2012 11:35:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 2, 2012 at 2:44 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> The setting is the same in all recipes, so move it to
> the shared settings in u-boot.inc
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


