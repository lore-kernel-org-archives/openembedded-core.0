Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id AB887608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 10:44:00 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f12so3040731vbg.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 03:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uONGS5sD2S593SIKMQ+T0Y0rFs8U5wU3Y/dT0Q7lrKY=;
	b=TIPlL8oqyJpKH92Fjx6B19Ru8FQDjIsc6rbu31eD+N4imytcgru3jxX5MHStG1nfJa
	BbBIaDk+5vT8XMqutEsq3kHDfF7NHeInu03nbCeWm6Yi88dTE99AvyXszhr5Lk8d2o35
	oKwL6x7ClXNMIlK8w3ddUifdjcZ+fWFWBu7F+BFOu8RKbMD0Q82iQ7+qWP2BSUz1Thp/
	z65FJ3+UjX5RnhuBB85/TZGJD+9DYdKAxH1jHJ84GdmI8nl6smtC0QD2I81lQiTg84bC
	OO47EEpSq2ms/TbMPvx6KCiE5N7jAQcaNuBV9zKZ9r+F4okoQB1Zt6SezwKSieEj08P2
	Agsw==
X-Gm-Message-State: ALoCoQkmh6xNKMum09gDiCVJuQDdmD155NiWXgmo3M5HKeNYjldtCB4p0jZczCxZuNGOhMdscKHH
X-Received: by 10.52.73.33 with SMTP id i1mr2347454vdv.51.1375958640696; Thu,
	08 Aug 2013 03:44:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 8 Aug 2013 03:43:40 -0700 (PDT)
In-Reply-To: <9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
	<9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Aug 2013 11:43:40 +0100
Message-ID: <CAJTo0LZgSV7RRPE6qjNp9fkRD9abiWoW6teRdYq2zBXEWdcmew@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libdbm-sqlite-perl: add version 1.40
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
X-List-Received-Date: Thu, 08 Aug 2013 10:44:01 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2013 10:01, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> DBD::SQLite is a Perl DBI driver for SQLite, that includes the entire
> thing in the distribution. So in order to get a fast transaction capable
> RDBMS working for your perl project you simply have to install this
> module, and nothing else.

What's the rationale for putting this into oe-core, verses meta-oe or
even starting a meta-perl?

Ross

