Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrdWH-0000p6-T4
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 00:51:45 +0100
Received: by mail-vb0-f49.google.com with SMTP id r6so17856628vbi.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Jan 2013 15:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qJEHmbOIj6ya9D0dkY3rYHGQFZup7NX+cC/rKQ0mQzo=;
	b=yyZyz5vUW/YBrdPzL7KM0Fj4wdVLhfGahRuOaAbncSZYO5ceq8UqiMR/kLNrV0onPs
	2+/Fp0ixUeT2IF7sQQx/XE7iE2jXi+wSaADm3V3/E34mSTceioypVKKC0A39jJOizEIf
	dNatem7BwKpwJdlEMQQXotElEAFvOGdzqUQjC06EVBptGXdK6cEXUZ3Cv5OD40lol3SU
	7cXMtJviU5Gkt9g2jzN13mf5C2H5qEAfYwJB7+ia2ZcF3rdYKMdmPTNETrA0yPiGQWr3
	Vuyflj26wWtr53sW1gxhlxy6+RFWpyEMEpMNvX8AqGCq6AbWknVGUeEz6j+2hgkbuU5K
	0VHA==
MIME-Version: 1.0
Received: by 10.52.29.175 with SMTP id l15mr69667369vdh.2.1357428970534; Sat,
	05 Jan 2013 15:36:10 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Sat, 5 Jan 2013 15:36:10 -0800 (PST)
In-Reply-To: <cover.1357366840.git.sgw@linux.intel.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
Date: Sun, 6 Jan 2013 01:36:10 +0200
Message-ID: <CAF6bG8cXvNWQdzc0EhoZky2Jfz67ep0mDh-4y83=uceb8zgNLQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sat, 05 Jan 2013 23:51:46 -0000
Content-Type: text/plain; charset=UTF-8

On 5 January 2013 08:22, Saul Wold <sgw@linux.intel.com> wrote:
>   harfbuzz: add recipe, version 0.9.9
>   pango: update to upstream version 1.32.5

 Is it either all or none going forward with these consolidated pulls?
I'm about to submit V2 of HarfBuzz patch fixing build occasionally
being unusable for pango (namely I will add glib-2.0 to dependencies,
as without glib present harfbuzz configure disables parts needed by
pango). New version of pango depends on HarfBuzz so if current
harfbuzz patch is not going in, neither can pango update.


 - ML


