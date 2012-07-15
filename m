Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SqWUt-0003LW-8S
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 23:36:59 +0200
Received: by vbbfr13 with SMTP id fr13so3166690vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=2kAlZ0BCgWXwd7utVkBySYfgKNdcm21XQsp1Wj+KG50=;
	b=yDJ3vGg4LX186gzbrOBfIqvNHnbfIvLxTfm0oQbxUW28hVng5QgaQhoOM2Djk6uhCL
	G4tPFa59isFqniPvBL6dV5+fGuz+F2cobXyNnrTmYd/t2sO4C3oPGstY71eXCy4KAAsL
	6UlujFuTW5PgTPS2zzoCISgAO2cRlB709gfp578CSeeNxPOteNdCpvijQKmhhOrPvF8G
	L28Cdj1Z3+Kvg77+shMT3LnAe4pfD8PcRrwjuIzRIYuqPm5eG5jaL8hvNh9t2I0r61uN
	ZivgsCUJxfvzWmqWTJzpnBok6WS0/5oh8wV+7K5xglP+Qcq0dVWZH4ZbX+idvjPRAhaB
	ndJw==
MIME-Version: 1.0
Received: by 10.220.241.201 with SMTP id lf9mr1222382vcb.16.1342387541498;
	Sun, 15 Jul 2012 14:25:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Sun, 15 Jul 2012 14:25:41 -0700 (PDT)
In-Reply-To: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
Date: Sun, 15 Jul 2012 18:25:41 -0300
X-Google-Sender-Auth: 529aepS1cGhvZ9ckeY_HDWTnENE
Message-ID: <CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Sun, 15 Jul 2012 21:36:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 14, 2012 at 6:59 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> The recipe is autotools based now, the COPYING file was replaced with the complete GPLv2 license text.
> No more 'lspci' needed ad runtime, but zlib and libnl are needed nowadays.
> Add 2 patches, one to fix cross builds and one from Linaro to fix C state parsing on !x86.

Please add proper Upstream-Status for the patches; it is nice to have
those to track the pending patches.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


