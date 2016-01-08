Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5B528731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 02:29:59 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id u188so120873492wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 18:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6nU/Wc0Z4oSUyR9moByajJYyyY8z8Or/cR060aPK0Bo=;
	b=vbQbSUFO7z606eGK02bDeqfwfhdakjo0JlLdm/0aGbd68FFDCxtwwaXg9wpYpW9LX/
	oOEv9bo0KGas3TjGUJvpBm1fjRqKEwDodf8zg7nx/1tD37/kTOxa5qi3igGnKsItDIoe
	iFQcHCSrbLGXn8Zf+4uFByq1iOBU/R2gAqBeAUV4QZ4FrGEJ7RjWj95anKnf1e9sMT+i
	YSxzQhOj5vi84rjRqWmrcXml1IHVbPfHV0oncwvEdjjmG2XA7Asd07AmPSgi3wHqbY3F
	Foz9phBsuPFSuGhXN7kcjo5RC0QQBp9nZzXV6czSLqvqqDaKf4iJRCp4V4kuZCdTI2o7
	cePA==
MIME-Version: 1.0
X-Received: by 10.28.104.130 with SMTP id d124mr19179682wmc.72.1452220199304; 
	Thu, 07 Jan 2016 18:29:59 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 7 Jan 2016 18:29:59 -0800 (PST)
In-Reply-To: <1452210004.2002.129.camel@pbcl.net>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
	<1452205752-6353-4-git-send-email-armccurdy@gmail.com>
	<1452210004.2002.129.camel@pbcl.net>
Date: Thu, 7 Jan 2016 18:29:59 -0800
Message-ID: <CAJ86T=W+YDQSnwU+TDfYP2VnkJ-KoR=OWt3LMiM9UY1xwKEvHQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/4] libav.inc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Fri, 08 Jan 2016 02:30:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 7, 2016 at 3:40 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Thu, 2016-01-07 at 14:29 -0800, Andre McCurdy wrote:
>>  FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
>> +FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
>
> I wonder if this would be better as just FULL_OPTIMIZATION_arm.  That
> said, the OPTIMIZATION variables are primarily distro knobs and it's not
> entirely clear that individual packages ought to be overriding them at
> all.
>
> Does anybody know whether there is any actual science behind the use of
> those flags on armv7a specifically?

They go back to at least 2011, so whatever science there might have
been back then is likely invalid by now.

  http://git.openembedded.org/meta-openembedded/commit/?id=61e4b696de080545e6ffe80d28a9c6ef8990695a

> p.
>
>

