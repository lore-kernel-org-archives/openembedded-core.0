Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tz7jh-0001Ul-QW
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 16:32:19 +0100
Received: by mail-oa0-f44.google.com with SMTP id n5so1508368oag.31
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2013 07:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ADfKxCSUZsR3f6L3mvrmLHxFWk7e2Fd48RiUDphAh2k=;
	b=T8yVxaicS5wyOhzXKQ5LtNzSixOQtev7OoTOs9/fd53iAcIiGkZEfO1w+PCKOCog6X
	8Fk7rlm6T6FP1RsMwkHqD9JgMHt6JMdvxCOKQLXYm+oVZOc4eEcODqOipFXT+2D7xuS1
	jqu4kyXI/9FnhL0IQN2AWtT3Cm1qPLq8RNGk47TbWknG1Bt+aPqprTc2wj6Ke9QcQrfQ
	H0ZOnnoTEC1PYcrfzI+llmV42g3lVXZU5obReokLxp120QTdrh0zROnGQlSQjrw45Akq
	uBnGpmBpvvr45MiHE0Ad7Ro0c3YnTgqVpbA4HGKQERDkcu8ONsSFGZDgs/FR2MQw0Z3Y
	RiJw==
MIME-Version: 1.0
X-Received: by 10.182.187.66 with SMTP id fq2mr7235849obc.86.1359213389288;
	Sat, 26 Jan 2013 07:16:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 26 Jan 2013 07:16:29 -0800 (PST)
In-Reply-To: <1359155241.13917.22.camel@ted>
References: <1359153142-13425-1-git-send-email-otavio@ossystems.com.br>
	<1359155241.13917.22.camel@ted>
Date: Sat, 26 Jan 2013 13:16:29 -0200
X-Google-Sender-Auth: YDewIhJMGwvTsTnhVBuA8ClcmKY
Message-ID: <CAP9ODKqy6QW08tmPKYDJsuzu444RYOojxtKD4J3pogL=_ay3PA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Improve DRI handling support flexibility
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
X-List-Received-Date: Sat, 26 Jan 2013 15:32:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 25, 2013 at 9:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-01-25 at 20:32 -0200, Otavio Salvador wrote:
>> There're some processors which provide binary blobs for DRI and GPU
>> support which need to be build in BSP; to avoid some dirt and ugly
>> hacks in BSP we ought to be flexible.
>>
>> We splitted the glx and dri PACKAGECONFIG options and added a
>> virtual/dri provider so BSP can override it, if need.
...
>
> I didn't see the patches here but this would suggest the xserver and
> mesa plus anything that depends on them becomes machine specific.

xserver-xorg yes; but not mesa. Mesa will just be one of alternatives
for virtual/dri. The default used one except if  override by the BSP.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


