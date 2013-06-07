Return-Path: <eu@felipetonello.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0226A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:51:14 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id cb5so1467065wib.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 10:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=TgQ4rIo6z/0l5JBc/z/ADO38kYNodQBk39CuU+jR7VM=;
	b=IwpA+uDQtVXGtmtcjiCVAk4jzBkJm7Taj5EO+2s7gnAp0+WMlsaA4rR0GjW4WOqZBZ
	tarYGggqfofw/FlfBCuzceyxnppYLq/DZw2sSiNbUaZzL3dkVJelgJ17Hdy0xpI7oqFW
	gAyWHrxmcJHH1A1BxxrvPr/maI/L3OdWBPzQzGCK7Fn2lBZ3bPPESWTlrtikFFD1r2Ym
	J7i2sTA5iFbFP1aPKaFsn2V97e/PaL4FoOhy7MLhFIkKF67gFxd3I+W5g2Oo01qzzNHt
	3zWC1Eb+dhzITL4fXbhxmIe+MDuwhpeoANVaOKvXD4k9IWHb8lkXIYrKvtgWbOZ5M08L
	cNrA==
MIME-Version: 1.0
X-Received: by 10.180.184.112 with SMTP id et16mr2120358wic.58.1370627474731; 
	Fri, 07 Jun 2013 10:51:14 -0700 (PDT)
Received: by 10.194.59.203 with HTTP; Fri, 7 Jun 2013 10:51:14 -0700 (PDT)
In-Reply-To: <CAGrhNMwW6mbg7WUKbVtjRX1qojb8j6q2krcL9cMVz3JJHaRaSg@mail.gmail.com>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<20130607174252.GI22710@jama>
	<CAGrhNMwW6mbg7WUKbVtjRX1qojb8j6q2krcL9cMVz3JJHaRaSg@mail.gmail.com>
Date: Fri, 7 Jun 2013 10:51:14 -0700
Message-ID: <CAGrhNMw_82j-RUx7gfdKMqawBQ=JhZ6cusRivSpv=aiU0mHW5Q@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnUUVAUX6pJQkZI/E3IRFy/dBAW0ZSE1CD+QPQNFTWsdwJxav0HM2Dyo1FcwNtG6Dbs8ghR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: added perl dependency
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
X-List-Received-Date: Fri, 07 Jun 2013 17:51:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

I got this:

valgrind/usr/bin/ms_print
1:#! /usr/bin/perl

valgrind/usr/bin/cg_diff
1:#! /usr/bin/perl

valgrind/usr/bin/cg_annotate
1:#! /usr/bin/perl

valgrind/usr/bin/callgrind_annotate
1:#! /usr/bin/perl -w

valgrind/usr/bin/callgrind_control
1:#! /usr/bin/perl -w

valgrind-doc/usr/share/doc/valgrind/html/manual-core.html
165:<code class="filename">/usr/bin/perl</code>, or whatever interpreter

valgrind-doc/usr/share/doc/valgrind/valgrind_manual.ps
55978:(/usr/bin/perl) 77.7083 Tj

Do you know if these "binaries" are part of the main package or can be
extra? I'm not that familiar with valgrind.

