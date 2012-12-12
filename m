Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiiDT-00018b-50
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 10:03:14 +0100
Received: by mail-wi0-f182.google.com with SMTP id hn14so277118wib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 00:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bgEMHn/gQsHoXlnQJmx4szRJn37+af56//0Zy9AJJAo=;
	b=sQzS60WZfZqA+wFe9StROraxqvF6kIF0kS23DDxZ4d/94/j88fUK2b0R2sOoIjtKLK
	8+/U7hz2X/F9I3etHFMYhrN7rwYF0T0U5UxAvR/rmsFmnyeZu4Huidyiwxw9H6zuKw4i
	h3PLcvdk8EPOkkdYy90IjXScrz5tL6MfcYzZrJO2p40uA4fqWW3iEMSNC3MK0PkU3WvV
	2Ce+GZiEcjNcsHt1LsRrev5mDUu2mlcq+pazF5O++u2PmHP91oBkxNf/jSZwhv/se71n
	1osoT6Cy5o/qn+uY8zzD6NpMRkF9vxGSufUYp0oNszqJ00J3bzg5+omq2Dw/wQas6Uhu
	DW3A==
MIME-Version: 1.0
Received: by 10.180.74.108 with SMTP id s12mr1609079wiv.12.1355302106026; Wed,
	12 Dec 2012 00:48:26 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 12 Dec 2012 00:48:25 -0800 (PST)
In-Reply-To: <1354806692.25268.191.camel@ted>
References: <cover.1354779942.git.sgw@linux.intel.com>
	<1354806692.25268.191.camel@ted>
Date: Wed, 12 Dec 2012 09:48:25 +0100
Message-ID: <CA+chaQdM0_=XGogBBaG8LCsv57e0VCdFQMStA4KqEi0uoLPCCA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/71] Updates and Patches (cover letter only)
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
X-List-Received-Date: Wed, 12 Dec 2012 09:03:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 6, 2012 at 4:11 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-12-05 at 23:52 -0800, Saul Wold wrote:
>> Martin Jansa (5):
>>   scripts/sstate-diff-machines.sh: add simple script to compare sstate
>>     checksums between MACHINEs
>>   scripts/sstate-sysroot-cruft.sh: add simple script to find files in
>>     sysroots not tracked by sstate
>
> Further discussion looks to be happening about one of these so I held
> off for now.

Comment from Enrico Scholz on sstate-sysroot-cruft.sh was resolved in PATCHv2.

Further discussion was only about preferred regexp style without any
change to functionality.

So this version is still valid AFAIK:
http://patchwork.openembedded.org/patch/40491/

Cheers,


