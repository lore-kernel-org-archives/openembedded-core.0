Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6848E708DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 00:56:23 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id tr6so7685357ieb.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=t58oe8710D8QcK2YNoay4xKEbcXAjnK/f7e5TUu5W1I=;
	b=SLpcdTmuzoMDcumkWaMxaWbFot+qaviUNbOYWzWpODPz/ZyDo/ENSKi4RRXImQWYBU
	lZNFLrot/8xs5vlD0MuqYRuxLE4hhgmIg8HqQ0S6R1Mq6EgnjrcnvTQYOHlCZD73zujn
	utXe8MRcf8F/oU+l2hPvMdNewwQNpjFcS5pomefeRx04umpIUzD8qDWvBWzExlrg/ol2
	FOzmbJbrDneU1hf+oPOhOz3FCT/7Y5IYALKLN9aFi7ufADA5MlGHCHOZisMZBGn0SN75
	i8tcjIhbj4IFox4JSLZ1QISAiBKPPDf6j9EvSbNTAz93SlcyH+BbDu1+6tOJ+8xO6TDW
	LxGg==
X-Received: by 10.50.134.136 with SMTP id pk8mr38181124igb.20.1406595384969;
	Mon, 28 Jul 2014 17:56:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Mon, 28 Jul 2014 17:55:54 -0700 (PDT)
In-Reply-To: <53D6F081.5080200@windriver.com>
References: <1406545263-7393-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1soxPmXjX6bbcto=c1qHvJB1bgdJdgTpz8dA-ibBp-7Tgg@mail.gmail.com>
	<53D6EC88.1000001@windriver.com>
	<CAMKF1so6G_mGW0jMXYS6Mf+PFVXQV8Vt=fkb=55Gc6p4LsRoTA@mail.gmail.com>
	<53D6F081.5080200@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2014 17:55:54 -0700
Message-ID: <CAMKF1sr=3wcExsbu+CjeyxGRzQP-efoHhSXSbOa6qFQLdrd_5Q@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: redefine a function
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
X-List-Received-Date: Tue, 29 Jul 2014 00:56:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 28, 2014 at 5:53 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
> But If the author do not like to release it under GPLv2, what should I do?

it has to then be a clean room implementation.

