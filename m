Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SruCI-0002Ns-G5
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 19:07:30 +0200
Received: by pbbrq2 with SMTP id rq2so4128719pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=KZmxApL0qB7V9xGqEj6ZEbfQH/Dp6q/COeQDC//BJcc=;
	b=gdW+OSyLqy++GyY0ssbnEZT1Y4zvKHPha/vnXxg1T8mmMoVDtXx8MVwQCsDK+GFP0W
	3FoloOPmHJy8yM6QR1EN4n4Vpp0c3rmQWTP+iUSz06gE7EXftMVR6mNyP6OsK2CLlStw
	Eg/TpOpOnNRv/TdEj24jkJrKnpDgUY3gz99ujJjFfQN/nlitG2s6YnBPXa0Cl7hQ8dmh
	qKllVK4irYXT2u9/Ix+7HeQ6jytTBZCtPBfBRceRh5R5NBgf/3vKYkk03enCSrpyCetv
	v4EYTdrUAGD7gBqGoPJh3wh78vszDBgTCtqRzwolcLV28obDGYPBXL9dL86ZOKzGkU8B
	l41Q==
MIME-Version: 1.0
Received: by 10.68.129.168 with SMTP id nx8mr6677999pbb.112.1342716967227;
	Thu, 19 Jul 2012 09:56:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.63.102 with HTTP; Thu, 19 Jul 2012 09:56:07 -0700 (PDT)
In-Reply-To: <CAJTo0LaVqK2KJUVcn1=HXPSuV7cyDEyxGaiDFreUTgE0sdbM0Q@mail.gmail.com>
References: <1342710998-15446-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LaVqK2KJUVcn1=HXPSuV7cyDEyxGaiDFreUTgE0sdbM0Q@mail.gmail.com>
Date: Thu, 19 Jul 2012 13:56:07 -0300
X-Google-Sender-Auth: SJjNMS5LUSIx1L6A74MGh21MwA8
Message-ID: <CAP9ODKr_sUz_zUK+0exu+7+k1gfto1ndCZ+x0XJyKtX_2d2X=Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: fix warning about bashbug reference /usr/bin when installed in /bin
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
X-List-Received-Date: Thu, 19 Jul 2012 17:07:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 19, 2012 at 12:20 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 19 July 2012 16:16, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> We change the installation process so we have bashbug in ${bindir} and
>> bash at ${base_bindir}; we also build tested it many times in a 8 CPU
>> machine and had no problem building it in parallel so we dropped
>> PARALLEL_MAKE override.
>
> I'd really like to see those split out as separate commits...

Ok; I will rework it and send it once again.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


