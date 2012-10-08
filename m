Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TLG6w-0004Ig-PZ
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 18:23:56 +0200
Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 08 Oct 2012 09:06:00 -0700
Received: by mail-ie0-f175.google.com with SMTP id c13so10038853ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2012 09:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=CQ/TLEAEXOXoxVIk5kOhvZa6n9CrxmH5sLXm0zaUsao=;
	b=bmxLdaAj+oAMfjw2D1sEjxzoVs85LlJ5tksgCrikPhyUZGb0+gwC5eOuWfDc2Il5wQ
	jGtMx0xEwjMdehGlD1Fb5lb2Nk/NIBjW0pjvj91AIzW+vid8IC797M26D2qUVqy8uSm4
	xMmyBz5DoI/ZTUqPqhtJrZ3N2gJwhMvhc1U3v+2BHxzfHhdO7PIefVuEzMf95oZVl8ag
	vqCKDBDzPB8sjOGJ3SfFUkyXI7J7V98AaEiF5eqxZ8IogaurGQhgBqtNI/Q1C60tq8Tw
	j114KqRfPHfq3QwYI7JiGSQu86VNEU2MjDPtMykTDJvhr1uuH7FMjSdyEBqSALytkcR3
	qucQ==
Received: by 10.50.36.169 with SMTP id r9mr6371143igj.67.1349712370077; Mon,
	08 Oct 2012 09:06:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.141.70 with HTTP; Mon, 8 Oct 2012 09:05:48 -0700 (PDT)
In-Reply-To: <CAK18fxGx+aH7nnGOa-36hAJkUQJEaEzrqVK9HOZ_gPs_w71-fA@mail.gmail.com>
References: <CAK18fxGx+aH7nnGOa-36hAJkUQJEaEzrqVK9HOZ_gPs_w71-fA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Oct 2012 17:05:48 +0100
Message-ID: <CAJTo0LZxZYY-w78mP2mQSwOJ+4E9QSPvZWfFp+2AWzDjQWWmQQ@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQnzQYmAU4dwU35Zcz1UWuOi6nFvSErs3lACcnGK48G+tRQiAv8psEOkaT4mZx0KkD4m1MxG
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: Systemd fails
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
X-List-Received-Date: Mon, 08 Oct 2012 16:23:56 -0000
Content-Type: text/plain; charset=UTF-8

On 8 October 2012 16:45, Andrei Gherzan <andrei@gherzan.ro> wrote:
> tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/systemd-git-r7/git/src/journal/journal-verify.c:69:
> undefined reference to `uncompress_blob'

See [oe] [meta-systemd][PATCH] systemd: Add patch so we can compile
without xz, from 14th September.  Obviously it wasn't merged.

Ross


