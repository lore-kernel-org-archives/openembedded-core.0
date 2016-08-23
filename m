Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 405CF6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 22:59:00 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id 97so270571821uav.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 15:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to:cc;
	bh=JwKK25m34m+VwshUsD1eK6sqFEkB5wTnFk4grKfHWYw=;
	b=ZELJpj3dL280Vf5HhxGJ/gR/hdOW73lJaMx3IV9z8hZnZ7A+9n2T7HwU+VAnrVDW0V
	Ud74vdb9ebunn7FiwW9FN8h0pBCUJo9a7ajugM7ubdKEfa8JGEdFs82pjt6psagWlRqH
	OG1Ok/5Om1YvRMZw79BRyQPm9RUos+JCBix11GIXCtCoZf+4tLYAGuwPm7bmXTUNZP7J
	9YEoXo/FZiGfm5vDWoXnyduOmVGJdUPx3wdmILoz4frphwnvCncTO+STqZUUF069g++W
	30A42ySJAEnjX9a/RhOwxEm8o74fiQ50iimQYMjbl+PYrDkdjt6Wur1Ja2Aj81/lcvJX
	PeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
	bh=JwKK25m34m+VwshUsD1eK6sqFEkB5wTnFk4grKfHWYw=;
	b=m2jF8LcY3ERw+8gs/hpPJROaLJDWYnpzmGJt7ZQi48YGQOky53SnEo8LNs92Vjq/dW
	hP6qC8sDIgbLAvDSgK5phuNY+OSyEEwyFwdAJkgalZHqxzb6lLtd34EwHPoO7LVD8nMR
	nPIKD0K9ujktpjt/ptCzsNnBF4SwwLd8TSEZqydjgimBXhI/aSXBAHMYW7Y13GDaITYf
	6QXLikmviQMUXxioKpc5AM86qkVlvgl1xyhppF09GkjcPJm4Q4JLoSAQp0IT+etcct54
	n9eHK+MtGzbYdppNrC8i3qau5HbWS9OyCOhlYp9JMZhZWDSWZDGN80scYaMK87vE96sy
	uEKQ==
X-Gm-Message-State: AEkoousXUyeCj2AwanHkmSI0fF8f/JgOM2EkZo+wxqIUWoI6wvfYkTgAiGlsLkiyhmX8Rg==
X-Received: by 10.31.56.201 with SMTP id f192mr9522664vka.6.1471993140607;
	Tue, 23 Aug 2016 15:59:00 -0700 (PDT)
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com.
	[209.85.217.175])
	by smtp.gmail.com with ESMTPSA id 89sm1360195uai.3.2016.08.23.15.58.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 15:58:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f175.google.com with SMTP id 74so270896926uau.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 15:58:59 -0700 (PDT)
X-Received: by 10.176.0.212 with SMTP id 78mr13127785uaj.107.1471993138836;
	Tue, 23 Aug 2016 15:58:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Tue, 23 Aug 2016 15:58:58 -0700 (PDT)
Date: Tue, 23 Aug 2016 19:58:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq61gqG+EU2g=K+6SPZqZHo_gv_u6-fEd6FJDG=2EE7qQ@mail.gmail.com>
Message-ID: <CAP9ODKq61gqG+EU2g=K+6SPZqZHo_gv_u6-fEd6FJDG=2EE7qQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <angolini@gmail.com>
Subject: [ANN] Heading for the Yocto Project open book
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
X-List-Received-Date: Tue, 23 Aug 2016 22:59:02 -0000
Content-Type: text/plain; charset=UTF-8

Hello everyone,

Today is an important day for Daiane and I. We want to announce we are
working on an open book which will cover the Yocto Project from a more
general perspective.

We wrote a book[1] about the Yocto Project in past (released in July
2014) and it has been a very pleasant experience to follow its
repercussion. However the fact that a printed book is a static book
and we cannot keep updating it with errata fixes, improvements and new
contents, has been driving us crazy. So after a lot of thinking we
decided to start a new book.

1. http://amzn.to/1qJHycB

We have never driven a project like this, and we faced several
stepping stones during the planning on how it would work, including
for example royalties and authorship.

If ever there is a printed version (ebook is always going to be free)
of the book, we want to give back in return of all the help we got
from the projects, donating 100% of the book's royalties to the
OpenEmbedded Project. We are in the process of including the book on
Amazon and Google Play store services but the PDF[2] and the Git[3]
repositories are already available.

2. http://bit.ly/2bToiu8
3. http://bit.ly/2bM856N

As this discussion is off-topic for the forums here in copy, please
get in touch with Daiane and I directly if you have any suggestion,
critic, feedback or comment.

Best Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

