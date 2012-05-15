Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <manuel.bessler@gmail.com>) id 1SUOnJ-0003MO-8E
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 22:56:33 +0200
Received: by wgbds1 with SMTP id ds1so4593291wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GjLrvDg+YfA1VJcKhR/6lGNCLH7fFmHccKSPLWoaGI4=;
	b=LJ8RgCXjU/eeTnvZta7qhgRqnpuIIndAKco7IokOORK/JgnKDBp9weweUJxaNv/Ixz
	6E3al6b43HNhn+cGz02iMfbYyCfQXiiVYJ6WYkp9GempSxBk8AkdST0WJQrtnoqXBl44
	GCTF7Q3E62ZVbhCV3Mx+tQctml4ED44J1rZ6b4e55ZmUrAegyC6TXfQwGbbhQ1/tH9IX
	ZnVrDIBqX1mKjWG6aDQKiK326lJzcoWciV2ZV+zc2Mnd3MAJjY09FoadsfFM6EcKReQB
	dqHlEpu+63k16Sv1lBW3Fa3uKTB0pG7qIDmx+ZmlLI27ZZ6Gqq/0x1+L2CFQnT5RpFRQ
	9avw==
MIME-Version: 1.0
Received: by 10.216.198.14 with SMTP id u14mr281026wen.12.1337114792751; Tue,
	15 May 2012 13:46:32 -0700 (PDT)
Received: by 10.223.70.197 with HTTP; Tue, 15 May 2012 13:46:32 -0700 (PDT)
In-Reply-To: <20120515140110.2ba5a1be@wrlaptop>
References: <20120515140110.2ba5a1be@wrlaptop>
Date: Tue, 15 May 2012 16:46:32 -0400
Message-ID: <CAKSdS8K64oTpq4asBcL9k4BgCe6BOEAwX3exQyq4GoTHtAxW9w@mail.gmail.com>
From: Manuel Bessler <manuel.bessler@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: FOO_subtract, the logical antidote to FOO_append.
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
X-List-Received-Date: Tue, 15 May 2012 20:56:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Just a few minutes ago I was wondering if such a feature did exist...

I ran into a situation where I wanted to remove something from a .bbappend
that is added to a variable using VARIABLE_append =3D "this and that"


Manuel
On Tue, May 15, 2012 at 3:01 PM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> There's a few cases where something is a huge list of space-separated
> things, and it is desireable to remove one. =A0The example currently
> afflicting me is DISTRO_FEATURES_LIBC_DEFAULT; I want to end up with
> the distro features including all but one of the words in it.
>
> It seems to me that a counterpart to _append would make sense. =A0Here
> is my basic idea:
>
> FOO_subtract =3D "..."
>
> means that, when you expand FOO:
>
> 1. Fully expand it.
> 2. Fully expand FOO_subtract.
> 3. Remove any words in FOO_subtract from FOO.
> 4. Yield the result.
>
> The rationale is that the semantics of things where we're using _append
> seem to be consistently of the form "this is a space-separated set",
> and being able to remove things from a set would be Super Handy.
>
> So I'm proposing the semantics for consideration, and if people like
> them, I will go try to implement it in my Copious Free Time.
>
> -s
> --
> Listen, get this. =A0Nobody with a good compiler needs to be justified.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


