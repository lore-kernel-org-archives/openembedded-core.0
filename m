Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA4879EE9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 11:43:52 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h19-v6so6225777iog.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 03:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FQxj9dEtgBqG7tmSYUUlMrEwXwNOKJ4WIxxaRlcW3Rg=;
	b=HWRGqSgblnqxOeGuE1NO3Q8tEiyDtkd97xNCf9al3cJ7bAnDpyNJrgqfVREWiUSUkx
	D/9FzL2AhYaOu2OftCyRxFki7Bj7ZEVEZX8xACl94a2iJKzN8RnqDKYDkjaHyDQsNRui
	2OAix87Df7pUKf+LMbshMAhtz2jao/qYbWA2KJnW9Kot51FB3XXrTuMlGclSg4iyO1M2
	4m9tSsdt+m9q5Q+fXVNfC3WqAaI5/KwRrgVX1l3Wnnu0TB1aADbIb2f0H7qcD8a4bOac
	d8rxhG4oDahhC8VFeqpdQzQdqZXfvVYbB+FcXlGlLQhc52nA5DVSTOxuqQyqsBfrcbkV
	cEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FQxj9dEtgBqG7tmSYUUlMrEwXwNOKJ4WIxxaRlcW3Rg=;
	b=eYhxYWRER0MIQORwFyOaAH6mj5bcBbCvcP2ZeEUvtY/89MjkvZOyI6ae4J8AXfETk7
	wc01OR3X3Y1l/011vCGUhvy6g0vDua17Gn+uJ+rDG4xPho/W5ZerF1efProq3l3HMUuU
	RlovtOXihJ+Gx/rmHZDSdCM24mPNSa6jYSJyeo15KEghcXbxHGYrH6oqrZTvNpl5RHQX
	tO9cleWp27WbDmQTACrx9SVLttVWUC3fyJI4IrjTDDYkPl3lro8Sdj3J+KQinryL21w4
	2qMPd2nduwOGccxJQs/dbdTUog+Fh2OMhGBRSr9ZhKpivY1RV00q98CoPPcE1yZ6nxfj
	liZA==
X-Gm-Message-State: AGRZ1gKXL9EMLhSuj1SESfYN0EvSTKwwerF6er9jp6rJJ6f17YsUWkX1
	9H2zfFfgBpoZM7dglI6lsOT1H4qvBzppFMd7BB4AIA==
X-Google-Smtp-Source: AJdET5eUbKCjPkLihRirRPeNd2+ISGacpKABOR9jXuCbDjVY5i8YMLbOYGHffItjpCBSpCHt5BswD0LrM9X15uBCJyQ=
X-Received: by 2002:a6b:2cd4:: with SMTP id
	s203-v6mr6354977ios.20.1541418234119; 
	Mon, 05 Nov 2018 03:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20181103131223.28268-1-sno@netbsd.org>
	<11534e53929f6a521560cdf97f71b6af61afdb29.camel@linuxfoundation.org>
In-Reply-To: <11534e53929f6a521560cdf97f71b6af61afdb29.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Nov 2018 11:43:43 +0000
Message-ID: <CAJTo0LbMLafivJjzW-12cJe11Jf5jxkJch9LsaqEEXpH40iJ6A@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: Jens Rehsack <sno@netbsd.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3_3: Update to 3.25.2
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
X-List-Received-Date: Mon, 05 Nov 2018 11:43:53 -0000
Content-Type: text/plain; charset="UTF-8"

Mining the list archive shows that we keep on getting sqlite upgrades
which fail like this.  Maxin reported that it was due to the
full-text-search code enabling itself and failing to build, so one
solution is to explicitly turn it off.

Ross
On Mon, 5 Nov 2018 at 11:39, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2018-11-03 at 14:12 +0100, Jens Rehsack wrote:
> > Update SQLite3 from 3.23.1 to 3.25.2 for UPSERT, window
> > functions and improved ALTER TABLE support.
> >
> > For a detailed list of changes since 3.23.1, see
> > * https://www.sqlite.org/releaselog/3_25_2.html
> > * https://www.sqlite.org/releaselog/3_24_0.html
> >
> > Signed-off-by: Jens Rehsack <sno@netbsd.org>
> > ---
> >  meta/recipes-support/sqlite/sqlite3_3.23.1.bb | 10 ----------
> >  meta/recipes-support/sqlite/sqlite3_3.25.2.bb | 10 ++++++++++
> >  2 files changed, 10 insertions(+), 10 deletions(-)
> >  delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> >  create mode 100644 meta/recipes-support/sqlite/sqlite3_3.25.2.bb
>
> How was this tested? pseudo-native fails to build with this:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/161/steps/7/logs/step1b
>
> and many other similar failures.
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

