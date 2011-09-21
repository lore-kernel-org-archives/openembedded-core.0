Received: from mail-vw0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6T0H-0004I6-Az
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 22:02:45 +0200
Received: by vws9 with SMTP id 9so1246371vws.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1XJdyh8VBdx4/dDYMkFl6yk1e9tGXad3AE6H7rdO4+8=;
	b=MpKUEYDZU6r65anSt2GVkZZri5Zm3OS7NQKqa/G4KVZ0RiBdrlV02DNlliF1u+eu8P
	jAxZmZ5Zh7T4937Txip6DnFOikK9OVBtOd8uZqwcHopBAvNgG4pdYwNBWtrDO381OuIp
	wXVEOicUvrcx2OGP7OVVvnMdPjGVcv166W2+0=
MIME-Version: 1.0
Received: by 10.52.175.229 with SMTP id cd5mr1062704vdc.363.1316635046288;
	Wed, 21 Sep 2011 12:57:26 -0700 (PDT)
Received: by 10.52.181.226 with HTTP; Wed, 21 Sep 2011 12:57:26 -0700 (PDT)
In-Reply-To: <87BDFF4B-3B1E-4245-BF80-7E784EFBB705@dominion.thruhere.net>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
	<1316630404-10336-9-git-send-email-dbaryshkov@gmail.com>
	<87BDFF4B-3B1E-4245-BF80-7E784EFBB705@dominion.thruhere.net>
Date: Wed, 21 Sep 2011 23:57:26 +0400
Message-ID: <CALT56yOoWAWsGL3_bTmHQud38LxNbtLrKaDLjvLr8Zy6CRodPQ@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/17] dbus-glib: disable bash-completion
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
X-List-Received-Date: Wed, 21 Sep 2011 20:02:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9/21/11, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 21 sep. 2011, om 20:39 heeft Dmitry Eremin-Solenikov het volgende
> geschreven:
>
>> Bash completion stuff isn't packaged and used. Stop building it by
>> passing --disable-bash-completion to configure
>
> A better idea would be to package it

Then we need bash-completion. Would you like it in meta-oe/recipes-extended?
meta-oe/recipes-support? meta-oe/recipes-whatever?


-- 
With best wishes
Dmitry


