Received: from mail-ie0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tssh3-0003kN-6c
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 11:15:41 +0100
Received: by mail-ie0-f173.google.com with SMTP id e13so1802489iej.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 02:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=7Ni+WSsad6X2BKGL1iFaPtMynAf9WecX25dgxkkl8QQ=;
	b=TxnHsV1BjdbfmjoExuRgBYa+5yCFfJJFMaXkpj3h+WhPuhkqiWjT/Cr5UemxStpEYr
	3xyNozBWYQcDprmpSxlReNK/qalokdo7Pkr/nTDJUcS3ZE1BOfGAiajVMR5iN/DeP2MV
	lMI87mVU08d2VZNeniW6AQytaOVtvd5O+5wavWS+kNJhZ9Za8KzVqwfOTlFu+TgDhTnz
	s+n8sI+W9KXOGfQvQ3prvu3VyPGvjw8r86lblqFJArgbtYdYIxGkB1k4Gl6ckVpSpTjB
	4aoFsKGAD+lMEn6WqYfjxCim/ULhEH/3CRf1A4tAOuJDDQ9upch+BOnebWStzkw8C9du
	p14A==
MIME-Version: 1.0
X-Received: by 10.50.40.225 with SMTP id a1mr941473igl.7.1357725620954; Wed,
	09 Jan 2013 02:00:20 -0800 (PST)
Received: by 10.42.167.196 with HTTP; Wed, 9 Jan 2013 02:00:20 -0800 (PST)
In-Reply-To: <388BD596D68348D5A465A83C5E148D40@intel.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
	<50E8FDBB.5080500@linux.intel.com>
	<CAF6bG8fBgAP_No6RkckjvEQ2XquwKagbyn-Rh01CY7Hi+8MfFw@mail.gmail.com>
	<CAF6bG8cuLp7nGzKUZscUrRoa1Z5_mrSduvWQ4r4YbvtZx2rFdg@mail.gmail.com>
	<20130109091303.GC3722@jama.palm1.palmone.com>
	<CAF6bG8dULrN_qQZWjvM2mJgQbyn0UvqzhcjV7e6Rzfj3h9GX4g@mail.gmail.com>
	<388BD596D68348D5A465A83C5E148D40@intel.com>
Date: Wed, 9 Jan 2013 12:00:20 +0200
Message-ID: <CAF6bG8evo8qRJ8hmORNVQ0GFQUDC48G0=Uj9KxDcKtyt_2U_qw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Wed, 09 Jan 2013 10:15:42 -0000
Content-Type: text/plain; charset=UTF-8

On 9 January 2013 11:42, Ross Burton <ross.burton@intel.com> wrote:
> On Wednesday, 9 January 2013 at 09:33, Marko Lindqvist wrote:
>> Exactly, except that it would be provided by bitbake, and not
>> constructed by each recipe itself - less recipe writing work + you
>> could count on it to always mean same thing.
>
> Everything but the last dot, or the first two components, or what?  For anything GNOMEy you want the first two elements as some packages use nano releases for development snapshots (1.2.3.4).

 Ok, do we have any counter-examples where you'd want, say, three out
of four parts? One out of n? Of course there will always be need to
use variables of their own in some recipes, but I'm after something
that would be usable in most cases.


 - ML


