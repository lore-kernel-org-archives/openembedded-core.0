Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id F0D7A60782
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 02:43:59 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 20so1882565yks.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 19:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fZ8LZhnAvnn7qBYty2yUzpfD5FUDgD6B0p2cPFSuiko=;
	b=vY7IXcrtV22BlIvCDNMboHh34Q3GSZWokeKxyGqUldjsPjG8k6e9N6BZUOvyKlTVtO
	ClSBbk6BRDUjRUj0ko/a2eVqmmFrqVnsN+AWt7XbeD3rLtaUfS2HCHCj1VVRI0zKu6+9
	BOiP80VRLG0dQP6vP2Ixk9H48DdYXNQHROLHE7Kf/7X7qVBwKQ4nq6zwMN5wF6aDwAD2
	qBgI1TpAXQk3tGw/2Da6pjBAAPE4cIrXElV3flZf5b69xKo9K6I2gv4XgooGzkk5qMMl
	Gdrf4q+aAQYcnUFPmrl4xoPhuCAZ+2FpweqKsourt5jMoNcmGtJPA/AZ+IkSEjSFN0FR
	NbTg==
MIME-Version: 1.0
X-Received: by 10.236.14.5 with SMTP id c5mr17921yhc.73.1397875439866; Fri, 18
	Apr 2014 19:43:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 18 Apr 2014 19:43:59 -0700 (PDT)
In-Reply-To: <534BAC4F.9040405@pr.hu>
References: <534BAC4F.9040405@pr.hu>
Date: Fri, 18 Apr 2014 23:43:59 -0300
X-Google-Sender-Auth: ys1HENwOmrynfXfBv31a8fa09s8
Message-ID: <CAP9ODKo6QrHv7hoQVSOnJaK6xrwh_vdD8xsbZY3cnCMcbo_Azw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Boszormenyi Zoltan <zboszor@pr.hu>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
Subject: Re: [meta-freescale] binutuils-native from master fails with GCC 4.9 on the buld host
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
X-List-Received-Date: Sat, 19 Apr 2014 02:44:01 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Mon, Apr 14, 2014 at 6:37 AM, Boszormenyi Zoltan <zboszor@pr.hu> wrote:
> one of my build machines has Fedora 21 Rawhide with GCC 4.9.
> I tried to build an FSL image and now binutils-native fails to compile:
...
> | cc1: all warnings being treated as errors
>
> This happens with the master branch of the fsl repositories.
> I know Fedora 21 and GCC 4.9 still has some months to be released.
> This is just a heads up that at least this new "-Wunused-value" was
> enabled for -Wall in GCC 4.9. FYI, the bugzilla report about binutils is:
> https://bugzilla.redhat.com/show_bug.cgi?id=1087374

Thanks for reporting this.

I have added OE-Core mailing list and Khem (who is working 4.9
support)  in Cc :D

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

