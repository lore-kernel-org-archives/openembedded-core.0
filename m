Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UeMLq-0006ny-7M
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 11:25:56 +0200
Received: by mail-vc0-f174.google.com with SMTP id hr11so4972129vcb.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=ViNLwHbmEREMUxh2VMnytTI6KjXBVVTA8ETeKPQUu+4=;
	b=0wsRTncqUYfKiicykz5Pw9q4Z0HYTu/2P5I/OwS96g1WcuojKkkrVkNwOM+ATPt/eI
	oBi5lmIpqUgoXaMVhJKSPa1zUoVZk3EkiVYr3NPCFCz8dVi+WpNetFL8kBbcpllIBU1w
	81X5wCIKPmW1noV1kI8Oc0LMRhd1HnlLJ7u4lEmJGOWR7K2dBchXP7l+8lH0Ij0EA8jf
	z2ZhBcDNTapUiHY05PpFn26Zde2t9sRY3mJ/ripc0/12pxGC5pSpmiNF4gWzjWf9DrWO
	G628UizFdJo9PDeOfo3jDml06J1AbFuKsTnTX+11UMNYQRKxZ9KGDcFgWVuo8uCxl1c2
	zMuQ==
X-Received: by 10.220.168.71 with SMTP id t7mr30460846vcy.39.1369040853689;
	Mon, 20 May 2013 02:07:33 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Mon, 20 May 2013 02:07:13 -0700 (PDT)
In-Reply-To: <20130519125451.GH3196@jama>
References: <CANyK_8eXDE0PFgtzrBdXw3=eXrn5H_hdZ6ivVj4+TRQbnC1+eg@mail.gmail.com>
	<20130519125451.GH3196@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 20 May 2013 10:07:13 +0100
X-Google-Sender-Auth: SfobruRDfnsVFMB9klS9OrNp0ho
Message-ID: <CANyK_8cb3Oe5yJCKamtVJOT3v9wPLPhvjjOxH_7ioTG46GTaYQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Clashing man pages
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
X-List-Received-Date: Mon, 20 May 2013 09:26:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 19 May 2013 13:54, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, May 19, 2013 at 01:00:24PM +0100, Paul Barker wrote:
>> I'm generating a rootfs image which I intend to be usable
>> interactively so I've added IMAGE_FEATURES += "doc-pkgs" to my image
>> recipe. do_rootfs fails with the following clashes:
>>
>> <snip>
>>
>> The best fix I can think of at the minute is to add a bbappend to my
>> layer which removes the clashing man pages from one of the packages in
>> each case, leaving the files just in the package I do want to take
>> precedence. If anyone has any better ideas let me know.
>>
>> I know we have update-alternatives for executables but is there a way
>> to link this with the relevant man page? So for example when I select
>> kill from coreutils, kill.1 is provided by coreutils as well, when I
>> select kill from util-linux, kill.1 is provided by util-linux as well.
>
> There was some discussion about this already
> http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/034744.html
> but only response I got was about conflicting /usr/share/info/dir :/
>

Just looked at the recipe for util-linux and there's already some
update-alternatives stuff for man pages so it should be possible to
add entries for kill.1 and reset.1. Will put this onto my todo list.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


