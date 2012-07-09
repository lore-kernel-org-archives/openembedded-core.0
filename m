Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SoKtl-0002v1-6b
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 22:49:37 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 09 Jul 2012 13:38:26 -0700
Received: by qaeb19 with SMTP id b19so1782691qae.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 13:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=a94KuxO+HqnGcOowApnTZrzH4qreQ5fyCbW894jApeY=;
	b=mHWz7TPOaPBm6dQ/UgnOQLYL8pcjuc6AxsX4KKRNhdS3nebs8r7QtFOFq9hBIsZDeO
	oZeBPJFaJtImMvbZ9l2Kw5CjDJL1ySis6R77nV4OlpVvpAnv1CX04tAJjFv6RNmWvF1m
	gH6tCKNaGoU+4nF9BztD6TzMl+sWSAin/MKQOhqishitrKbyYdfevveXvQDmQQ7Z5FFN
	E/EIt5YGPewoq9zVv9yv+6JD7b5pqSny1Bx3OcNwkiARpu/S2B+GB6MOP9dJPq06nd0a
	5qM7hP52CmXukZ9vqI/8P4qHQj64QwgA2ALAMUrEk9hklzf1XNYHHM2UnVaZAGXU275N
	73yw==
Received: by 10.224.217.9 with SMTP id hk9mr51822976qab.58.1341866305717; Mon,
	09 Jul 2012 13:38:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.16.207 with HTTP; Mon, 9 Jul 2012 13:38:05 -0700 (PDT)
In-Reply-To: <20120709203539.GH6308@jama.jama.net>
References: <20120709160054.C9FA610219@opal>
	<20120709200357.GG6308@jama.jama.net>
	<CAJTo0LZBrgFmeJVV1RfA+N4z6t=vBip7PzA0bVjk=gBrzAQqGA@mail.gmail.com>
	<20120709203539.GH6308@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jul 2012 21:38:05 +0100
Message-ID: <CAJTo0LahoJnXnUaCJJW-x75115qGL0iS=KYfpt98Y0HyLNHaoQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkkYSDUl7vFD3QY3mw8rB8ey5ocJrKG1YPnDHncBd7VuzOYVlo78EmLaUSk1fiGnZ/xwhn9
Subject: Re: [oe-commits] Ross Burton : connman: ship the empty plugins directory in the connman package
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
X-List-Received-Date: Mon, 09 Jul 2012 20:49:37 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2012 21:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jul 09, 2012 at 09:16:13PM +0100, Burton, Ross wrote:
>> On 9 July 2012 21:03, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Ross: please make sure you add them in future patches
>> > sgw: maybe you're using different flow then RP for merging patches, but
>> > your SOB should be there too IMHO.
>>
>> I *always* forget, sorry.  Is there a way to make git do it automatically?...
>
> Not sure if there is smarter way. I'm using aliases for commit and
> cherry-pick to always add '-s'.

The config option format.signoff will automatically sign-off when
using format-patch, which sounds rather useful to me.

Ross


