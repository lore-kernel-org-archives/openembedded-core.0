Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Uauw8-0003wC-4u
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 23:33:12 +0200
Received: by mail-oa0-f50.google.com with SMTP id l20so2511159oag.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=NL1i6G1WvcSUkPCr89SbGUEYfDOtJe+NkKUQKo8skyg=;
	b=0DXfOu6E5SE5JjE0tfH134biryy2jMLMFi08EBJVxyeHYJeZGofYSQ224y2TIbMtCw
	Q6IFeZsBEyd/LNMOaFegJtWm/nC26S2TRzU5P9sC854CQHXzNUjYxBR61Psg03tsYS8I
	U795z7JzMz2Dc+aPfkI5Qvxn59QML1zqV2AYqACGZeBQAMrkaJJNQ3als/V/npLtwV+r
	9O6XSw/EfRPgn4mpb++9v4zLhnW7iQmQjDuSJUwkYP0N2qNljDMZh0QbeOd11bXYakBJ
	wXbF7c5dBT/sQrmikpfnWQbfJfoy7O9aHb1fus6bQ+IujqhVHcU8IxUMqoRJQn8uHDdI
	J4MA==
MIME-Version: 1.0
X-Received: by 10.60.133.112 with SMTP id pb16mr7788760oeb.93.1368220501456;
	Fri, 10 May 2013 14:15:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Fri, 10 May 2013 14:15:01 -0700 (PDT)
In-Reply-To: <518D5A7D.20606@windriver.com>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
	<518D5A7D.20606@windriver.com>
Date: Fri, 10 May 2013 18:15:01 -0300
X-Google-Sender-Auth: 2WrCWhtgR_fgvap5-3fxMwpDvuA
Message-ID: <CAP9ODKpaeJ3im1LRhuS1qVnzWF3DaTZ1kOGi-ZbHoDyxR5QzoA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Fri, 10 May 2013 21:33:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 10, 2013 at 5:37 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 5/10/13 3:22 PM, Otavio Salvador wrote:
>> Well if layers make life harder it invalidates one of points of Yocto
>> which I always liked and depends on heavily - modular design.
>
> One of the key pieces of the oe-core, it must be able to work without any
> additional layers.  It also much be able to be tested without any additional
> layers.
>
> I personally don't have a preference for the clutter and related items on
> where they live... but I do want to make sure that oe-core can standalone as
> a starting point for people to develop devices.  Part of being standalone
> means that it is capable of being tested.

This wouldn't be a regression as it was not used widely for testing.
Clutter would be much more useful for users if it could profit of a
more active users base and avoid 'in-house' solutions and forks so I
only see good points in split it out from OE-Core.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


