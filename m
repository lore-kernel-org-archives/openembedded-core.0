Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6ED65DB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 19:20:22 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so1382095iec.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 12:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MF2D1KmwOJdOqKkcgdTy1RboJfJ9qyHIkdB9EWF64RM=;
	b=bDT8jqqGuO6esUcVbE2F6RRI6elYLK/S7RqjyN0FSL41mxBv64F7nrBREGCzs8hLbp
	zahyIoDC2Mlm1cJBM7ptFHx64IXVTCA7XylG9Tdw/niuUNOq1jrnuuMDPdfwDTEXGse8
	SKxWbIo/oEDjjFwKokDj4GJ6poEw+1+VHi1LP/M4ft90fZ8mEX6/qeqhNjKCmyH3RI13
	IeC2WDAadv+Sb3SPNzfCRLz0vzZvvJV1Zv/shR2/MZ0yV+UQ/jcKcyQ+/vwk0bS7zpiP
	dmNJSlampZuCGVt+mXEdIDxEAwGbGHohQ81WHGkDNs8gOdWAQjRzxM2pVwlJ2taXgvkv
	6UwQ==
X-Received: by 10.50.138.72 with SMTP id qo8mr7145157igb.2.1406143223600; Wed,
	23 Jul 2014 12:20:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 23 Jul 2014 12:19:53 -0700 (PDT)
In-Reply-To: <20140723190326.GA2492@jama>
References: <1403176695-18917-1-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1spKr_JzstojPa_ALCJKwBF=cDVh2bZmkucUO6hfB0ipsA@mail.gmail.com>
	<20140723190326.GA2492@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jul 2014 12:19:53 -0700
Message-ID: <CAMKF1srVPATzyhGWiB7ycsOd2fB=X_HuJYR5JBijr8piWNezQQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [DO-NOT-MERGE][RFC][PATCH] DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
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
X-List-Received-Date: Wed, 23 Jul 2014 19:20:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 23, 2014 at 12:03 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> FWIW: I've this patch in my world builds and I haven't seen any issue
> caused by it (python3 builds fine there).

thats interesting. Can you make sure that there is no host system
intrusion happening ?

