Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id D7BD578A8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 00:33:01 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id i4-v6so14279660uak.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 17:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R5+QONSm4NZunkwY3OoQY8DOyvnt6sAX877oRU4OpWI=;
	b=kPlx7KAP952BOHzKQ3jb9CDn26LCe/dWcT0vFyiw+XWAi0udiMkjUZ/ZDvEKg2IlGL
	sc6m2j28B24dNKhJVWFLVElveBK0f1VJUa4O+PvCWGYVLfL+hY5yyBRiQKEoNZw2YtZb
	lS+onXwIId/Ps7wdLyxJF7lT+tulb8CMEFSGc3Zc22+pD6tIcMZWC2T42c3/W3VtyU62
	V291W3j79st/EB03e+Mxngy1ohisQWKrh1QmiZworKlZxSralCa7aInEr2phhXQyN1mI
	A+oNqw1OPKsphsenbzY5U5VZ/vp00YmbFpeCOcPNpqWoVrwyTpYUpZUdMLAuQhjyeTcb
	FV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R5+QONSm4NZunkwY3OoQY8DOyvnt6sAX877oRU4OpWI=;
	b=JfLbOkSyX99nSXSc+J17ea0bWeGfaG2Ebo5MDu6ovFnoZhKdeH/cAR+3bhjB6HJNov
	p05nHlBCCIVMWlUaj1nWmrHV0mhXYr/ruzVj1a8PAMMYgztf/izyoyjDqW9s5WQjjeWn
	oHvDBrWEvcsHcGKpWqSNI7XbDvUTB27+ln1C8x9FSik5K/BkqGbGWWW9oAAzGfYGQUHr
	OakmKLU6IURmZSw7TYJ6512ry32PgnDKljDF26XMT+OIf8M4bgDAGcyzHISrm8jwIVjy
	7kjtFGk0qUIegNHE3rMxi+NoKqgMHThIUReYlURQ3T3QhLdnilc2TEFYggMFPnVX7/Li
	F0aQ==
X-Gm-Message-State: AOUpUlEgUlGP30/c8TsF35LvxcIB6ZcL0wd1uQ5b+FQUqZSo7I7OwSJ/
	3N2UNACUNqvfRXMm5PhDUcflc83WorgDotbPr0I=
X-Google-Smtp-Source: AAOMgpfsneWRlR1ZsfmoRXnbgXcvm8ktDAdnHfobcuMaBbqNdHz7rtYXYWPJ386UBPa+RA5SSf8yRem9O8ChYhB8lnU=
X-Received: by 2002:ab0:1544:: with SMTP id
	p4-v6mr12125950uae.81.1533601982783; 
	Mon, 06 Aug 2018 17:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 17:33:02 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84F3610608@ALA-MBD.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84F3610608@ALA-MBD.corp.ad.wrs.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 6 Aug 2018 17:33:02 -0700
Message-ID: <CAJ86T=UjPWPwr2_sM1vHz6kJ13OP9zOUP=xrhgtUZkjHfe6=gQ@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: when is native.bbclass applied
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
X-List-Received-Date: Tue, 07 Aug 2018 00:33:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 6, 2018 at 5:24 PM, Slater, Joseph <joe.slater@windriver.com> wrote:
> This class clobbers a number of things that might be manipulated in a
> recipe.  If, say, I want to add something to CXXFLAGS, what/where do I put
> it?  It looks like "_append" works, but "+=" might not.

+= should work. Either way, "bitbake -e" will tell you the definitive answer.

