Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1S0zZu-0007QI-LL
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:09:10 +0100
Received: by qao25 with SMTP id 25so329249qao.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 10:00:46 -0800 (PST)
Received-SPF: pass (google.com: domain of kergoth@gmail.com designates
	10.229.135.85 as permitted sender) client-ip=10.229.135.85; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of kergoth@gmail.com
	designates 10.229.135.85 as permitted sender)
	smtp.mail=kergoth@gmail.com;
	dkim=pass header.i=kergoth@gmail.com
Received: from mr.google.com ([10.229.135.85])
	by 10.229.135.85 with SMTP id m21mr2716074qct.26.1330106446407
	(num_hops = 1); Fri, 24 Feb 2012 10:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=0Az5kcUY1A57adRcMNYp+cpYS5IxpQUg95IENZQY+eg=;
	b=iJGec5TTdUX51FdIa48PV2T490/j0Lam3CU4jhk8sd88m8lZXnHfp4HENQ+iJF5iYP
	45xqPG/NvuaQ/5d5+/NlH5L08AgC2pldrmZThvujqdq8qTaUYP3xIZDEhTiFrdIcgjkU
	aA9tgUV5CKDtHY82ukrxkAErMl2Pu1IrbBFL4=
Received: by 10.229.135.85 with SMTP id m21mr2239036qct.26.1330106446088; Fri,
	24 Feb 2012 10:00:46 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.224.145 with HTTP; Fri, 24 Feb 2012 08:59:39 -0800 (PST)
In-Reply-To: <1330088135.32006.14.camel@ted>
References: <1330088135.32006.14.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 24 Feb 2012 09:59:39 -0700
X-Google-Sender-Auth: Jx4X76O-bdgXb0BgSz2zYcRxxWs
Message-ID: <CABcZANkQPVQHhBKW06=y6OKbxAcngvhGzD2oeOZ8Q8GPwwfzGw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using external source trees with OE-Core
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
X-List-Received-Date: Fri, 24 Feb 2012 18:09:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 24, 2012 at 5:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> You can also -c clean and it will wipe
> out WORKDIR but it won't touch ${S}. I picked libfm effectively at
> random. It won't remove the autoreconf changes from configure but I'm
> not sure I care much about that.

This is one of the things that srctree handled a bit differently. I
think we should think about pushing the clean improvement bits into a
core class, to make it easy to select slightly different clean
behavior. Either that, or add a hook for it. As it is today, it'd be
slightly painful to make the recipe both wipe workdir and make clean
your source tree.
-- 
Christopher Larson


