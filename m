Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 78CE465C9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 11:45:43 +0000 (UTC)
Received: by pdea3 with SMTP id a3so145310859pde.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=szDqk1mySUHzdeV8NtrMEBnAgV78lbYobuGeYKHS9lM=;
	b=Qclsv8d8HzFcQfs8j7BuVFTXHVQ1cR1AtPZ7fLFDHAFdN0VXvc8b3ZJbuaiGD//mAF
	47Fa6TKYngXgaf1FbQ4D+WAFMJ8K9nRzb0A5TUWQP6YGNNklCWHZzqk0OFs86BS2JN86
	HnIVr6bTbLe4ifefjHWgdz4AQkXZDehpjIm2cDZfkt0sYo5hL4fLwZQOIeL5u27EJr2G
	V+q1o5UZ5/yKA9dEpK2SZOxBW/n2nvDYaTd2td2hOljLo1BJjoURRU+ThjtwXVgLenfg
	nADkHIx1/D/EWJ8HElx4Jb/rZdQ5nvWTedhvrABW9sfS782hp4NNugcT4R2/IdYCKOzz
	bwFA==
MIME-Version: 1.0
X-Received: by 10.66.250.12 with SMTP id yy12mr43526988pac.2.1431949545380;
	Mon, 18 May 2015 04:45:45 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Mon, 18 May 2015 04:45:45 -0700 (PDT)
In-Reply-To: <CAJTo0La7EummgKK7-dp7oubo4XV_-yjn0WMbAysDJN4Btmah2A@mail.gmail.com>
References: <20150312143521.GD2338@jama> <5501D4CA.2090209@r-finger.com>
	<08f401d08df0$aba9be00$02fd3a00$@lge.com>
	<CALbNGRReufGQXfR3eYqQKN6CRwhcEk5-EaeTfctenBdWeoYm_w@mail.gmail.com>
	<CAJTo0La7EummgKK7-dp7oubo4XV_-yjn0WMbAysDJN4Btmah2A@mail.gmail.com>
Date: Mon, 18 May 2015 13:45:45 +0200
Message-ID: <CALbNGRQzOdn8mGX-8E+7f9RLttmnESqjBw86v2pV4KOJhxpEmQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gir issues and maintenance
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
X-List-Received-Date: Mon, 18 May 2015 11:45:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2015 at 1:00 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 18 May 2015 at 09:00, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
> wrote:
>>
>> I would appreciate to have the gintrospection more central - this
>> would give us a chance to get the gtk stuff out of stone age..
>
>
> Well, oe-core already has GTK+ 3, so we're "just" missing the bindings to
> Python and JavaScript.
Sorry - I meant gnome not gtk.
>
> Changhyeok, you're welcome to fork meta-gir to your own repository and wo=
rk
> on it independently.  If you can update it so that it works with oe-core
> master then you're the new maintainer. :)
>
Andreas

