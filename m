Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0A161EC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:24:40 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id f8so4181636obp.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=aeKgCuiuXzg9Fvo+oF28vcgqQPwcdYb/YWN9BX+cW6E=;
	b=l9K45dBgAfhF/LiAtf7nH9Kmc+uqWZZUahAklZ34Bm6ESYLzXY1LQdaxWRcoTOOomO
	yoJVki/auHKNCWVEYxLpldhdbVYLrIztLdGsOGERqnr8tCIIN1WqkeCG9zhdBkoFGV3D
	FsXTA17VWkHMSrkBjrzDyQBZkdoJK8HmjudVj5DLYJ8Xn2JoEcovFEQcOJngV22cbdMt
	RURLLRxyygiW/Ed2nAuqUn5wcEVumXZg7Gxth/HebLMADLzv7tstg0ol30L0sTlbATx6
	cswxhLENH7466EmRWPv+Wv4BCBIMNsjbUYhkygRjUk2JdTHZHttB7tIGskAHI7qn6VBz
	mpgw==
MIME-Version: 1.0
X-Received: by 10.182.104.130 with SMTP id ge2mr15502109obb.6.1377192280858;
	Thu, 22 Aug 2013 10:24:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 22 Aug 2013 10:24:40 -0700 (PDT)
In-Reply-To: <1377180295.6762.19.camel@ted>
References: <1377180295.6762.19.camel@ted>
Date: Thu, 22 Aug 2013 14:24:40 -0300
X-Google-Sender-Auth: 2O8ffSwlm7gZ9vFhLpRtoPIaPAw
Message-ID: <CAP9ODKrFSUns_pGOq4txhw2cLnaPt8CG=c_wyuACZW5AaijfQw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Web browsing and HTML in OE-Core
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
X-List-Received-Date: Thu, 22 Aug 2013 17:24:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 22, 2013 at 11:04 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We've slowly been shaking out the definition of OE-Core and as part of
> that we removed web and web-gtk which were the only browsers in there
> and were admittedly a bit limited/broken.
>
> There is no doubt that web technology has an increasingly important role
> in the future and in embedded devices (e.g. kiosk type devices, digital
> signs and so on).
>
> With that in mind, I think some kind of HTML support in OE-Core is
> important going forward. Equally, I dislike having things there which we
> cannot test. I know some people have looked into this and it appears
> midori is the best option for something with a small number of
> additional dependencies. I therefore currently think this is something
> we should make a decision to include since it gives us significantly
> better coverage of things like webkit which are a already in the core
> yet totally untested at present.
>
> I'm open to opinions, equally we do need to make a decision on this soon
> since we're nearly at the feature freeze point. Thoughts?

Qt demos has a browser which might do the work.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

