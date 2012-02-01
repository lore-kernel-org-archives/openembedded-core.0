Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RsWU0-0008Np-AM
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 10:28:04 +0100
Received: by lahc1 with SMTP id c1so533885lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 01:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OHrFxn6d6/DhzAxnFgAa516bQHiH5HU9BDFRugmQRF0=;
	b=HySOyIkzZWpHi5p7dttANTJIeDDdqxDI1MMLghOCdxQz5bi9AcVtiaJsJAMDWmvTVP
	j0BwKb466HngvH+mf6zaKxjoNnBAzXkgUaEVFuavJYbrKVa05C3/Xro9osb794FJjZNO
	BAfZOP0v9VyTQ1gwwEZ1VunALJnyW95YdHvlc=
MIME-Version: 1.0
Received: by 10.152.132.104 with SMTP id ot8mr13129840lab.17.1328088009621;
	Wed, 01 Feb 2012 01:20:09 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Wed, 1 Feb 2012 01:20:09 -0800 (PST)
In-Reply-To: <CAPhnLPCXc6j4W8k_Ed=_Q52fLYvDB5EqFm0V8-Yg19ZC36JNEw@mail.gmail.com>
References: <1327795253-24794-1-git-send-email-schnitzeltony@googlemail.com>
	<1327795253-24794-2-git-send-email-schnitzeltony@googlemail.com>
	<4F26CD01.4050700@linux.intel.com>
	<CAPhnLPCXc6j4W8k_Ed=_Q52fLYvDB5EqFm0V8-Yg19ZC36JNEw@mail.gmail.com>
Date: Wed, 1 Feb 2012 10:20:09 +0100
Message-ID: <CALbNGRQg80gvCMjwEXeddMnUO2A4aMVG9KZsT04iH082b=MJTA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] atk: add native / disable introspection / merge atk.inc->recipe / change license
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2012 09:28:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 1, 2012 at 2:07 AM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
>
> - LICENSE needs to be ast parsable. It should be:
>
> LICENSE = "GPL-2.0+ & LGPL-2.1+"
I grepped around: We have exactly ONE hit for each ( GPL-2.0+ /
LGPL-2.1+ ) in oe-core. This approach does not seem common to me..
>
> - LGPLv2.1. It really does matter, IMHO.
>
> For some reason OBS says this is only LGPL-2.1+ I haven't looked at it
> too closely, but COPYING is pretty clear here.
>
> -b
>
Sorry to say so: The original patch did not touch license at all. It
just moved it from inc -> bb. I feel a bit hijacked here and loose
motivation of further versions of this patch...

Andreas


