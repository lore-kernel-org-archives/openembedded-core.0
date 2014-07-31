Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 70EF7706FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 20:44:00 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 131so1925403ykp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 13:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=q78agGn7bX5YBHzCoNYZdTfFMtHmCxyTh9BXbd6vfNc=;
	b=z+rOllX920Pl5531+fwKz4+WrrJmNlu6Fjap0k49eerJP6RDRTXmR4Zqg7OnYyc/iK
	5+8nplqNou6AS43mHY+Too4hZzeGFWKZXreVlQDtrPx40Dm4P5g6nhv8Pik9QScd2Upp
	i5m8oFV4NC9wYp4rmYS8cAvcs1KrEoZEH3Hf0J63HSleeK0DCR0amaGTM5/VNyEOfyZi
	DWIfWBAz+MDG98/axzncLCv72hbBW9X9c0ZFu9fGDd5xQvC47mM0WTAGGDvcRYfF3pND
	gybm4O90RoVIzBzOrZ1fw6UNCe9MUJFMnYOILkbntjcS6EV2AElk3Ww7k/lnCWi9k49F
	Ivkg==
MIME-Version: 1.0
X-Received: by 10.236.79.230 with SMTP id i66mr1022234yhe.136.1406839442174;
	Thu, 31 Jul 2014 13:44:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Thu, 31 Jul 2014 13:44:02 -0700 (PDT)
In-Reply-To: <ly8un9biuj.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1406818740-17681-1-git-send-email-sujith.h@gmail.com>
	<ly8un9biuj.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Thu, 31 Jul 2014 17:44:02 -0300
X-Google-Sender-Auth: lOpm9bth590NS3CBVJVwIcjydtI
Message-ID: <CAP9ODKpYgA9jQ2u4Nwh2=+NoQJcZiydtZdkDu0-jvnKfZxHvvg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] netbase: Adding loop back for machine name in hosts file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jul 2014 20:44:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 31, 2014 at 1:20 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Sujith H <sujith.h-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> +     echo 127.0.1.1 "             "${MACHINE} >> ${D}${sysconfdir}/hosts
>
> This is a very questionable setup which causes a lot of harm.  When
> really wanted, it should be made optional and not the default.

What kind of harm you see?

I think moving this to postinst works for me and does not cause
problems I think.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

