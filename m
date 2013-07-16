Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id B38A26B201
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 10:25:26 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id pa12so342025veb.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 03:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=i2JwZ3N6hcqSwr/+H/aQfGBa/9PgX1fb5L2vpGHcgHY=;
	b=KoUfZCeppOpXh8h1IGG3prsKuEVeuDgnBKMOd1UKZBTU8LZeg/ApV49T48+/HqcKOI
	KWoZJDN53HqkImbVdIhHglTWeXAmbQY0vznv99lKJ2ATaMM/55suiI3aj8YMpdwKZ/Za
	mIJylk2NxjaDfncGrahuvAzhcptZDHdCuJnFu3vhhffcwML/sO4tzB121HEyA9ujBNP3
	QDuqV27Ia5l0XlrRfGo4dppk7dLWB1CXjFv2wCsYngqibzQSwzvzCgD2kz8dNm7JXOIA
	PvcyBJ+M5FYEq+rCFFa6fYRIS6VBHOdZwqErmPlmR++ig5Mln2SuCTaiuU+Q1SXwyxep
	xlMw==
X-Received: by 10.58.181.225 with SMTP id dz1mr212566vec.95.1373970327003;
	Tue, 16 Jul 2013 03:25:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 16 Jul 2013 03:25:06 -0700 (PDT)
In-Reply-To: <d286aa3737442a72ce766dc8ef71f763209f39b8.1373881980.git.jackie.huang@windriver.com>
References: <cover.1373881980.git.jackie.huang@windriver.com>
	<d286aa3737442a72ce766dc8ef71f763209f39b8.1373881980.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jul 2013 11:25:06 +0100
Message-ID: <CAJTo0Lb4NpO+fjQ61f1oYo1-PFWQv4rdF=0OoPXx5HHE4mLrQg@mail.gmail.com>
To: jackie.huang@windriver.com
X-Gm-Message-State: ALoCoQksyAhMcgORFIcRxXzpJymnQBWiLG79fENTY6rThAQwEWeEHc1bb4QOnDH2MLxWyTojLNw+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] acl: fix the acl self contained test cases issue
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
X-List-Received-Date: Tue, 16 Jul 2013 10:25:26 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2013 11:01,  <jackie.huang@windriver.com> wrote:
> +Upstream-Status: Pending

If we're patching the test case because it's wrong then we need to be
contacting upstream to get this merged or rejected, there's no point
patching the test case to make it work when actually it's a subtle
problem in how we're running it.

Ross

