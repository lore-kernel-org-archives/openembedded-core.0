Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0AD780CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 20:08:08 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r77so15500654wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1kmcLkPJDYvl40jKnVXcbC5SBwwQoYT/nU+Cos04FT8=;
	b=DEx+bV6QS50W+Q1JHwduekipIUZOqEVbiTy9usYyGUqPOJQbAyNrpaP9ZyDbmXqKmd
	8x6/n6Qm8NUwpVwYVx6rRfygZS82m7ZrT2lGwHhEDuiwrhNHCtopfXD79TZz8POGN+c2
	/3SY8gTNjg9eSX9gj7G/iXA3W3iBE2wBSsjN75FqVL4rQOD+XLgoceMXB2DMxrlC/8id
	O+p17ZNI9UZ1goOqLmmI4Cy+T69o0BOK6qaU/kKhSQkxg6rkByFO6lMlJhgtWF+QfXEy
	dtPK9cBm4+1lc7lurnVzANL7/i0YWJpTSeReDfvObz9EhfT3GbAvHvQRomxX6km/vexC
	/YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1kmcLkPJDYvl40jKnVXcbC5SBwwQoYT/nU+Cos04FT8=;
	b=AXJg3E2+Q3BMTw4w71VwFca2+GZwH1/GEXWFm+5POj09g+W8jTWKRLV4Iox0xBFkEU
	S+e9AXbXBzoC1qQl/FvQeZQXf+6Af0U3OZhy+plsdwCmikguqFzKmsgLETrzf5qETZv9
	U/abUAoIgLEeH0o0lGwrbVi1rvzuG8S6vLVZQePqsHFVFl//J06RNYHN49gYt39SJ682
	HjHgrsKHo6UBUtj00JlwmO7c8XML254gGqojQwZ6OhONWW/BNKCZc1S3vW/FZmUGuNp4
	GgSVbNomfdm26W2UdTXEm3eQVjoHz25ND9YLVDYK5aS9r0jycWSchWR3UvVPIV1jo6/y
	BEdA==
X-Gm-Message-State: AIVw111IpBgrLyIDaAPsjL8XK9DusYy+wo0EEDP+8Trgchm0QTpCxl4U
	esLrntNTYuzFzZlGdqblajMHW6iuFg==
X-Received: by 10.80.145.38 with SMTP id e35mr7955635eda.8.1501272490116; Fri,
	28 Jul 2017 13:08:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 28 Jul 2017 13:07:39 -0700 (PDT)
In-Reply-To: <20170728200552.GU26405@denix.org>
References: <1501267767-109163-1-git-send-email-denis@denix.org>
	<CAMKF1srgt4uLiwr3UjHjEG+ytPTBe0URvd-jboFw=N5gLkU_wA@mail.gmail.com>
	<20170728200552.GU26405@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 13:07:39 -0700
Message-ID: <CAMKF1srv3XS5TjV1aB0XmXtEvvFQuYqfNXwm0Dgy9rFSqT0hmw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf: fix typo in SUMMARY
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
X-List-Received-Date: Fri, 28 Jul 2017 20:08:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 1:05 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Jul 28, 2017 at 11:56:55AM -0700, Khem Raj wrote:
>> On Fri, Jul 28, 2017 at 11:49 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > From: Denys Dmytriyenko <denys@ti.com>
>> >
>> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> > ---
>> >  meta/recipes-devtools/autoconf/autoconf.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
>> > index f1b2dfc..ea62df8 100644
>> > --- a/meta/recipes-devtools/autoconf/autoconf.inc
>> > +++ b/meta/recipes-devtools/autoconf/autoconf.inc
>> > @@ -1,4 +1,4 @@
>> > -SUMMARY = "A GNU tool that procude shell scripts to automatically configure software"
>> > +SUMMARY = "A GNU tool that produce shell scripts to automatically configure software"
>>                                                              -----^------
>> there is a grammatical issue too :)
>
> Sorry, I don't follow...

s/produce/produces/

>
>
>> >  DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \
>> >  configure software source code packages. Autoconf creates a configuration script for a package from a template \
>> >  file that lists the operating system features that the package can use, in the form of M4 macro calls."
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

