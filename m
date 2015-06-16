Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 983C174051;
	Tue, 16 Jun 2015 06:50:49 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so7650849pdb.1;
	Mon, 15 Jun 2015 23:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TCUs/TqQXq+RPOjI8f7bMNAq0Aku+29Mw8y9aeeZSkY=;
	b=nKt7YaiV+u6P615j8SjtRneDgRxNvCtdjI4QDO9wIa6vGx5sXQ+gRYNJH/QcRAKG8+
	+6hScH6rlvV2KOOJJSGf316cItsQNO3S1YyoedcEZmQomt24WUPB+Mzk0b+mUvOt/p+J
	QhX2Me2TYQmUfig1rjIkK7LbJcceoefXT82BTh1Xa/OSuWvHpWTgHXaA7O4jcHOtMZKi
	np7rmMUQzpaYF+f51zU6y+xwhmXDR0GZVj+tjx52D+jv0T/xGJ/ps9rA4Ag65xGo3j4A
	LDqSyBd+yWs2OpUa8IQpe7dmKahZaQs6lHbZjkGrPrMpwxhDEEWi/fzS9DxKnwFXQL+I
	cVVA==
MIME-Version: 1.0
X-Received: by 10.68.57.170 with SMTP id j10mr56048769pbq.150.1434437450552;
	Mon, 15 Jun 2015 23:50:50 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Mon, 15 Jun 2015 23:50:50 -0700 (PDT)
In-Reply-To: <557EE4C2.501@linux.intel.com>
References: <557E9EFE.1030703@linux.intel.com>
	<CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>
	<CAJTo0LbRVqw3h_3igs59=DTnaz6nf4w=A5ZpXepmh6xiKtVdPA@mail.gmail.com>
	<557EE4C2.501@linux.intel.com>
Date: Tue, 16 Jun 2015 08:50:50 +0200
Message-ID: <CALbNGRS-xR52wapA2viFa0oZJ6kotFdjhXpb6kyOtpRyn--5=A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
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
X-List-Received-Date: Tue, 16 Jun 2015 06:50:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 15, 2015 at 4:44 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/15/2015 05:24 PM, Burton, Ross wrote:
>
>> If you actually compare the build dependencies, you'll see that Midori
>> and Epiphany are actually almost identical.
>>
>> We need to upgrade WebKit as the release we're shipping has known
>> security flaws and is very old - and the community is rightly moaning
>> about that.  However Midori doesn't build with a recent WebKit... if you
>> have an alternative solution then your thoughts are welcome.
>
>
> Also, Webkit2 itself ships with a tiny browser wrapper called MiniBrowser:
>
> http://blogs.igalia.com/carlosgc/2011/11/04/webkit2-gtk-minibrowser-ported-to-gtk-api/
>
> That may be enough for many people's needs, and they can simply not include
> Epiphany into their images if it's too big and bloated or whatever.
>
>
How about doing same as others do e.g fedora [1-2]: Keep two version
of webkit-gtk based on same recent code:

* gtk2/webkit1
* gtk3/webkit2

Andreas

[1] http://pkgs.fedoraproject.org/cgit/webkitgtk.git/tree/webkitgtk.spec
[2] http://pkgs.fedoraproject.org/cgit/webkitgtk3.git/tree/webkitgtk3.spec

