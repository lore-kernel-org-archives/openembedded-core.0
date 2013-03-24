Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UJnKR-0002ZP-7d
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Mar 2013 16:59:27 +0100
Received: by mail-oa0-f49.google.com with SMTP id j6so5567126oag.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2013 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Ddk/DSdqWrbjLpueg2cWQ0xWFK1LJL1dxYBdNhHGZCM=;
	b=pGHKsoOHheF0RBLf9yOQFjKO1wGI1sKpT1x3LoKKoVoogVr/nzKVF2atc28CREUFcz
	Jo1iM7EgI58fAlcOrj75q1l6Gcw0Zh/Da4LP8+5/13M1ki8yJAuCXyl3KoB7TUMrNMfr
	cw6eLENjAgnaRjnT/2JbDT9A6b5v9+9hz48YIq38uCGOnppLywxuUfdsmZwJcn876fO7
	dTNlAru/n+apPYGIUvHSwnUwXyv7BYiXRjHvABQnjY7ylITg0DBLlmnvBC3lgWR6wvO/
	Fyr4XbNuR1+ZCAB2dU5dCC8Ho+wXdkbi2m2EsoTQegob+bPjthkeR0HO9aNf5CLNiXC4
	l90g==
MIME-Version: 1.0
X-Received: by 10.60.8.197 with SMTP id t5mr8544215oea.4.1364139749785; Sun,
	24 Mar 2013 08:42:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sun, 24 Mar 2013 08:42:29 -0700 (PDT)
In-Reply-To: <20130324160139.12fbb4d7@e6520eb>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
	<1364070660-13157-2-git-send-email-otavio@ossystems.com.br>
	<20130324160139.12fbb4d7@e6520eb>
Date: Sun, 24 Mar 2013 12:42:29 -0300
X-Google-Sender-Auth: 9aSYWHW5ew7ydx5hwG1pt5ErOUw
Message-ID: <CAP9ODKoRemde2dC+emOkvu=UG927k3suOZE-Yzdppjp_LG3NeQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] linux-firmware: Do not deploy license files in packages
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
X-List-Received-Date: Sun, 24 Mar 2013 15:59:27 -0000
X-List-Received-Date: Sun, 24 Mar 2013 15:59:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 24, 2013 at 12:01 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Otavio,
>
> Le Sat, 23 Mar 2013 17:30:58 -0300,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>> We don't ship license files with packages and firmware packages are no
>> different; drop them.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> there may be a good reason to distribute the license files together with
> the firmware's binairies : it's often requested by the firmware's
> license.
>
> For example in bcm43xx
> 2.      Restrictions. Licensee shall distribute Software with a copy
> of this Agreement.

In this case we'll need to have a -license package for each license as
we often have more than one fw covered by same license. I'd like to
someone to comment on this so I can send a patch to fix it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


