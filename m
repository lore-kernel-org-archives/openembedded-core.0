Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4086A9F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:22:57 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id aq17so2357827iec.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=C1DDFsXdT9ZA9jMsUu0mvQ4gQCqji60MYQNcaipyygE=;
	b=q0xj+5jwqUdZrhvsNQeZ61DkdgGIqAr4Sd7UdrsjMj7FHsGvT2wzIMAtZXcmfm0N5u
	4qHqEQJHaHAVmqaNltRc/iV3dbOOqQ7LP/kCE3eY2Ftf2AyH5wY0qDrwjI71NtLcbol5
	/n+t4pmQ5sHwUP56WcBb763szsNZ5q6nOFnjAqA1Q2K0U1lxs4f+gsaf7hFeCyY3HBIu
	PK5SMiAt2/k5DkOkFsR4QLcPcg4BWlSvMJUZex10jXLvh2CgHclqVgt0R599StRvovdq
	2lIkVILhgJqv68wKGJLHFyH3GxKCNr0bkmtWrBFWSt5LkQBAmGVoEeelZiKkTUNM3PUo
	XUKA==
X-Received: by 10.50.28.112 with SMTP id a16mr1188666igh.74.1370964177977;
	Tue, 11 Jun 2013 08:22:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 08:22:27 -0700 (PDT)
In-Reply-To: <1370963003.27750.80.camel@phil-desktop.brightsign>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
	<E947360C-AE06-42E4-AD51-2DA926D1448D@gmail.com>
	<1370963003.27750.80.camel@phil-desktop.brightsign>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 08:22:27 -0700
Message-ID: <CAMKF1srGhvZLyhEZbYbFepZADbAKF1kJM2ObBEjc8OevQ5CCqQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Tue, 11 Jun 2013 15:22:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 11, 2013 at 8:03 AM, Phil Blundell <pb@pbcl.net> wrote:
> Er, don't RRECOMMENDS always go into the build dependency list?

if they do then whats the difference between DEPENDS and RRECOMMENDS
functionally.
since now rrecommended packages will always be available and they will
always make into images.

