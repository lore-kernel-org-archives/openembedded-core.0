Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBVaX-0003Ph-Tz
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 20:53:34 +0200
Received: by eekb57 with SMTP id b57so645377eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QjZTjHtoUOXXeCBK19AQYwMdgITsy8YX1oaKnkMi5yU=;
	b=gqcIWkuvpGyOv7NlFE7DZ7z1Kw5REQv1VD3MTq8/VQCUFZG+kxUAIMqmMf3ngXT4o/
	AJoweoozZsUkG4R4SgwNnqAAFyouD+uTrhayHgf7kMjgXp9lubrY10q3dLLqLs2kYc7/
	358vnxaiKfDKfXwaJamWGKiXilX+xcVrzzHExfH6ONJMJ7FM+ANw/gbvXG5SP+KkbhYQ
	OECMgsrSDUPCbDnmzRwjWp8+nMz9JetuOOTLiIdN+kfSPDdpvRiDehw7arNxF2kdWpdr
	OXLf4jhRDTiDuUW99m++QgQVhO+R55Y03J1buDJdEW7FgveAVdjf6k9+r0zR1TbczV21
	LQvw==
Received: by 10.14.202.66 with SMTP id c42mr27387474eeo.35.1347388862858; Tue,
	11 Sep 2012 11:41:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 11 Sep 2012 11:40:31 -0700 (PDT)
In-Reply-To: <A6372E3C-A8A4-4987-9C2B-D65FFBBCEF5C@dominion.thruhere.net>
References: <20120911130155.GC14077@jama.jama.net>
	<20120911134814.GF14077@jama.jama.net>
	<504F5E0C.7040502@windriver.com>
	<A6372E3C-A8A4-4987-9C2B-D65FFBBCEF5C@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2012 11:40:31 -0700
Message-ID: <CAMKF1spX7cpvrb=zLOxi+qFaYhW2fpccOdFQ1-=-LVgv1gETKg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ARM-tuning -- was qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 18:53:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 11, 2012 at 9:13 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> From a gcc point of view both are the same ISA, but using xscale will take in account the absurdly long pipeline on that SoC.

Not really, when you tune for XScale it will use ldrd/strd and pld if possible


