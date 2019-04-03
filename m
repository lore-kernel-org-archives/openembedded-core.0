Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id E9E2A7D2C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 10:30:49 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id u65so10399559itc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=benLBz9hW99WBZEeOFcAKwfVLMwfm2Ry36HGmFBMO8o=;
	b=SQGw6pGWvV2BQfEH99p7lXhGhjcxoLinT1QzUJdM/cQ07HykT5GXxeC6yZD+3i6J+X
	pYHqo/KFvYz845co3jIpoQlsvIHElrtN0kvQ5aV15PYAXWG5SKIMiZbkM0Bp3pN/XNsT
	Vx2Z9zfSg9kQLT5ALyhUrwa3tPnsCHiQQQxbpwOchmY5Ajn5Jbilrf9pZqCpJUEFCVFa
	NXABdf59YdyoygoexNO9IUM901Og5rEZZ8a+Fu2KKVoVI4Stjr30gAxNwJVdpfvp3VLI
	1UlceUPoOvXBtCcfrFUqoXquAWS69f6EPiBatVcf1nJ5PlNyOZj9QMd7UzqKv94ZVu2b
	qmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=benLBz9hW99WBZEeOFcAKwfVLMwfm2Ry36HGmFBMO8o=;
	b=tDkXD5dFahH1O0QvyRF5LlXXXgRqdd/y7aaBlAqFS1FEQukXdEuR3u3cfYUhjvnNPi
	+FCSK3TmgLclAnN0c067Ui1quBbxYK4rvcuoJt/nmEnDXzYqmHmjPXAHELBS26WrmRr6
	nLp+Ej5sanu3TioqgYFKJJDFoYYeARISbwGZZokE458HpbnTpRVi/EiswpHrjcaPp2t9
	Cq2D1jrRwhW3j82XYXEdc9yyh6nBefRxWmTGBCvyrrrnqDNuJQk/2fyvLCdotA5FqAsN
	M7lkbYD7jy982FqT/o6w0isaW0sK36Q6RUk98qRjo5iCgu5t8ouM+ni9Kcyko3ISBVdb
	geEA==
X-Gm-Message-State: APjAAAWElbCtosDug/hu0qZ6x+z4l5eofDXu67OxOYCT+Y/u8inUx5sB
	q7LfdHEwKQyWuKINQoVQqyWjkg+QHtl/F9ii3v8CSw==
X-Google-Smtp-Source: APXvYqz9krAoYmJ9iEH/W+3fq3fSBkvPRClYTS/J7SbBKgtMn7jrBaEwTrpgcTIIbVLkW9iqmfnndk6VjuO+p7DetYc=
X-Received: by 2002:a24:d643:: with SMTP id o64mr1186771itg.148.1554287450951; 
	Wed, 03 Apr 2019 03:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<20190402065121.GA31468@localhost>
	<20190402194614.GY4664@bill-the-cat>
In-Reply-To: <20190402194614.GY4664@bill-the-cat>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Apr 2019 11:30:39 +0100
Message-ID: <CAJTo0LZ5qeDA+rQ5Eh3_LCbGtQyo732LrDkiZ=O4sh52cjXU=w@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [oe] Git commit process question.
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
X-List-Received-Date: Wed, 03 Apr 2019 10:30:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2019 at 20:46, Tom Rini <trini@konsulko.com> wrote:
> > The kernel does not have "upgrade foo to the latest upstream version" commits.
> >
> > With the Automatic Upgrade Helper this is a semi-automatic task, and
> > most of the time there is no specific motivation other than upgrading
> > to the latest upstream version.
>
> But since that's just filling in a template the body can also be a
> template perhaps with useful AUH data (run at ... by ... ?) ?

Apart from making the commit message longer what does this achieve?
The commit already has a timestamp and author.

Ross

