Received: from mail-ia0-f178.google.com ([209.85.210.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxltN-000720-JY
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 23:00:32 +0100
Received: by mail-ia0-f178.google.com with SMTP id y26so3662021iab.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 13:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=/UaigrtjpTicOeCf0WHtEkpgu6pTpbHUs2d+nKFQnaU=;
	b=ji9xySz952R6a1oHe3hDP8OnjkzuG2txRtXhPQlD4SYYDsv+P8N/x/dR7KP+nNJWyt
	H4BbmaKmvUfsTxCsvLqfTXxxIG+ua/0mXEVyPEkprmA33cPHbSIs25sInM1haf8B8Wvw
	jeE3Q9YCzdnwJul7pyfx1riULM2XJhqVgnqeryqBwbeopTh9TiW2UHE/Uhb25+wzELhk
	jQc5jIxJ+ilWXahOnokl83MteAY288mmg9xtMt09pUpj6Im+nn3OMme+igFYMVkqgUQu
	5xytOXIOp8xe7nrusLFke1v3JgKjNLz9tqsdhYUWR5L9tuWWMT9v7YKIuKuayZiShvdO
	9C+A==
X-Received: by 10.50.184.199 with SMTP id ew7mr13232126igc.84.1358891098579;
	Tue, 22 Jan 2013 13:44:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Tue, 22 Jan 2013 13:44:28 -0800 (PST)
In-Reply-To: <50FEFA22.2090008@linux.intel.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<50FEFA22.2090008@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Jan 2013 13:44:28 -0800
Message-ID: <CAMKF1spq_du8mB2nAvqcYQG7izORFHTkZFTBhUCE3SrJZ3KU2Q@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 22:00:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 22, 2013 at 12:44 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
> Makes me nervous... only because I'm not well versed enough across the
> architectures to catch some little gotchas. How much testing has this
> seen? Which architectures?

little but then I did not propose it for inclusion into master yet so
why worry ?


