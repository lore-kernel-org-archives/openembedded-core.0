Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SINKc-000214-BI
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 18:57:14 +0200
Received: by qao25 with SMTP id 25so1799465qao.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IuJdIooI+zPha4m0DDD9DYZE/xwK+NZQYUzHCPLHmls=;
	b=lJT4io4ASC4lMJOPCYdPH+CjWIkFl4NsK2oNolx/htypyAPE/84IsY+pKq5adX+EQv
	6RAUKiBo6reQ2wYEesf2+JakzaiPl7pb8esyhw8cLjnuKlx/UuAvyDpLrXh4ragEpGKm
	GAW65voL0UREePhooHX1w5Tfe4JnCLCfm3AmeKRTUBxmjYs6bTrYb/WUGwkXJVOibG/r
	RNJGJmsuAHCFeLqFu1gRIynDUI28gmuw3lq1TqHpvxwuC8BJuLz8S/qvncL5w8RQBCdE
	jIqrSw+eWY6OFbVlDSDSHy80hTWa11fI0eOWGGDCWcJYlonT46+/vGQ82BENZU6BOnnN
	Zj/A==
MIME-Version: 1.0
Received: by 10.224.117.6 with SMTP id o6mr5048016qaq.18.1334249273758; Thu,
	12 Apr 2012 09:47:53 -0700 (PDT)
Received: by 10.229.94.206 with HTTP; Thu, 12 Apr 2012 09:47:53 -0700 (PDT)
In-Reply-To: <4F8704E4.7020400@windriver.com>
References: <1334179880.31685.12.camel@ted> <4F85FACB.8080205@windriver.com>
	<CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
	<CAGDS+nntS5YWw0U8wSJYBdgdhnaGsnLr71F6SdMFECoMsCVHRw@mail.gmail.com>
	<4F86F8D2.2050402@windriver.com>
	<CAGDS+nnQtcD7X4xLUnWTB1aBouceo99hE-zY+w57JHE0nBYV=g@mail.gmail.com>
	<4F8704E4.7020400@windriver.com>
Date: Thu, 12 Apr 2012 09:47:53 -0700
Message-ID: <CAGDS+nn-4=9JeOZtubh+H4bh7Lij_8NoL+Ab5dsprDraeQtooQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: Fix useradd preinst ordering issues
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
X-List-Received-Date: Thu, 12 Apr 2012 16:57:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Ya, if you could point me to the image recipe that eliminates BB and uses
> the discrete versions of things I'll look into this.
>
> I can try to do it with hob, but I'm not sure of everything I'd have to
> select.

Here is one of the images that shows the issue:

http://www.sakoman.com/cgi-bin/gitweb.cgi?p=meta-sakoman.git;a=blob_plain;f=recipes-sakoman/images/sakoman-systemd-image.bb;h=d1f1202528af6ed73171a9a26148f18da9ee389c;hb=HEAD

It pulls in a few things from meta-oe and my meta-sakoman layer so
this may be more trouble that you want to deal with . . .

Steve


