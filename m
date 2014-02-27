Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 167606BD75
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 20:06:03 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id v1so3274187yhn.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 12:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CuTminoV0GH/9xPjYUdqU43ximiXWInA+RR7KQ5oXwU=;
	b=Hn1tdjFtY7QNzmam5Fs0ZRYc6vbaC6gYX5e/MwJsFuIHxG93mZ5RBCrxpHpKbjoQ1o
	Zwtq7fb/67GxHaM4yJnyAmlcmB8aWmHFJYxtcsuaMqXPwk5ZjMTlPdE6g8WYJ4Wj/iAl
	AuDWxC0O/O/kWDqqSkVtOlMj6Wo8nMxh7Bj8Fl4AlIwQ7AU7SENZr8gUEeSsmIP/eHpX
	MWKgRhVTPS7Kj+QA2/MAwhTg0ZNdEd5go3Ee3u9DV5Lz+XeZjCYGv7s19gCzriIlHgUz
	61TpJvnofF68oJn57V9aejRnHMwOMAIJSHwVeYnDpepqA3DQJuVSUM2OQkk1sORVlYgA
	9CaA==
MIME-Version: 1.0
X-Received: by 10.236.86.1 with SMTP id v1mr17245786yhe.1.1393531564391; Thu,
	27 Feb 2014 12:06:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 27 Feb 2014 12:06:04 -0800 (PST)
In-Reply-To: <CAJTo0LaG9SeGd2Pi3-dksPd_FHH4TEWK2MGJU-d=2kte6aTg7Q@mail.gmail.com>
References: <1393524104.31769.148.camel@ted>
	<CAJTo0LaG9SeGd2Pi3-dksPd_FHH4TEWK2MGJU-d=2kte6aTg7Q@mail.gmail.com>
Date: Thu, 27 Feb 2014 17:06:04 -0300
X-Google-Sender-Auth: GB6At3OgAD8b0PNgw0at3ql6h5E
Message-ID: <CAP9ODKrpyH-R4LYRt6kt0SiQEfAmaVUPHZq0XEzcYJxXY7BuRQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools-brokensep: Mark recipes with broken separate build dir support
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
X-List-Received-Date: Thu, 27 Feb 2014 20:06:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 3:52 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 February 2014 18:01, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> +inherit autotools
>> +B = "${S}"
>
> Why is this preferable to directly setting B in the recipe, which
> seems more obvious to me.

I see one benefit for it being easier to grep for; so we know this is
one recipe which ought to be fixed and that rely on autotools.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

