Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TEKVG-00078C-0t
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 15:39:46 +0200
Received: by eekb57 with SMTP id b57so363570eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9QFJrf58cWmUDtLEVTWaIST1DXkQ30gT6Mtr5RbaV+U=;
	b=0754aYt0kUsYI4gIm7QuqZ5XdiJDkIIhO2ZTy8881ARSc4enFCeTLz068OAOcWgx1i
	SrUMJ/lV7Zudr5+dJLxyB/W04jj/uOnaJlH6qWSM9qBoxW92hQblbs9OgZaoF697ocpy
	j/w6kT3jPLAjb/9jWcWC39HdQ6GrJC7dSKQJMOitEFZ4hOs/4Zp4+6NYq6VdVVeuT53s
	oxaOdEVLs49Evtsf6L4MGP2HthKg2KBE9yOL5uZv/tZLgaAfDbDN2UCetHZPYjKJKKVJ
	scKpu3nPnh+6/4LEjCZe7PPUKy+6Zg3fiG9nCNrXzZLE91FrO/hx7+t1finBpm+yG+Ci
	45Xg==
Received: by 10.14.204.72 with SMTP id g48mr3573990eeo.45.1348061222025; Wed,
	19 Sep 2012 06:27:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 19 Sep 2012 06:26:31 -0700 (PDT)
In-Reply-To: <224680354.d9icDWC9tY@helios>
References: <70CC66F5C30A414DADDA6973E4CA391A68BAF6@039-SN1MPN1-001.039d.mgd.msft.net>
	<224680354.d9icDWC9tY@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2012 06:26:31 -0700
Message-ID: <CAMKF1srg0a1GhHPqY9dS_AjTJRXS7wSNzH1-UBMUJEuaXfuidw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: multilib errors
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
X-List-Received-Date: Wed, 19 Sep 2012 13:39:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 19, 2012 at 4:03 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> I have seen these errors as well. It definitely should be doing these checks -
> the warnings occur during the file checksum code but more broadly they indicate
> the system will fail to find these files should you try to build the targets
> mentioned. Looking more closely, I could be wrong but it looks to me that BPN
> is not correct at least in the case of lib64-build-appliance-image - I think
> it ought to be "build-appliance-image"  but instead it is "lib64-build-
> appliance-image", which means that it can't find the files referred to in
> SRC_URI anymore given that they are located in a directory named "build-
> appliance-image".

IMO when we inherit multilib bbclass then it should also add new
${BPN} based dirs to FILESPATH


