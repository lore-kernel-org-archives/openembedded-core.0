Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 927FD6067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 15:41:53 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q62so8875620qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=1+lYKlLv4tTW6qEQ6UmMiceT1jANB4L4umArgkDA9sE=;
	b=RdHT1m/G4Fv/2eznc0b15fQXavxJo71m3xnrbxw6Byhnu5V1Z2QYHxkQxYh/39PtQ8
	TAzkLBER6jCHLv5MolB9nqjDQxQIYkuo2Uo1tXY7VcMfPjwQetC5+U0DI7l8RjGTSb4F
	5KF4QeDN7NhUKKX2BlhtNYGXigO/zKFCAfu/5EXq/xzTdKf+99ZQwHKSvjBMfEg4Vw9t
	yy9PBCS6WwE328ZiCohBW+6FqaqE2WsUKJot0DFCSm+Z8R9xpZWTspSvTFAV309voKFI
	Q+bnJ5aEGqxNP1ALpkfXjGJXyWeW90QzBHnlGGmHKUD1GgmkMD9WXi9ZNSbrJX8Y5M7b
	HgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=1+lYKlLv4tTW6qEQ6UmMiceT1jANB4L4umArgkDA9sE=;
	b=XAmxOhePD3mik4oqc4XUibJR2x0jQQBfmrA4ytbHi+ID++2IChatu9mqLnS2Y9zT02
	g634dNWvJpcKfckHqqkb2AO5mZjuXXNRCLEYMxnmJ7UyrPWih8zrMIcwjsscOR32GbLZ
	08zkYdAlA9fo5Yl8jF5TW1rzQMAYz3VtqpyeHGqSg0lPop0yCUeLOB1ho1mtdGlVozTc
	OfX7Oe9A5FkENHkR5LKETUaXRHmRzwUTagnHkoALDqchjhTGJoX4cJjZNIgWr7iqhf1y
	lOWUkXr/Fen0XXGmqJV90Youv9aoA9dqeLyhuMlk4ElNQ3sLdwoW79GOCINu3cUDx18O
	fGvg==
X-Gm-Message-State: AEkoouv0KG80utBgvTakrwOnq2M2jwsE33LdjUz8fz8M/a/Z0EFtY1BCOegwhWNbz9b4fCdFbiov4Zei3U6AiA==
MIME-Version: 1.0
X-Received: by 10.55.74.138 with SMTP id x132mr5521508qka.26.1469202113772;
	Fri, 22 Jul 2016 08:41:53 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Fri, 22 Jul 2016 08:41:53 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Fri, 22 Jul 2016 08:41:53 -0700 (PDT)
In-Reply-To: <CAJTo0LZCPbO2p3quqztesy0dj5UeueNuzgpBG9ZPMVOeyC6V5w@mail.gmail.com>
References: <1469196210-29675-1-git-send-email-ross.burton@intel.com>
	<CAMKF1sqfNqA=EDATUOBauPBDOTQ6uYXhvfH9SuP84jDmT2xw6w@mail.gmail.com>
	<CAJTo0LZCPbO2p3quqztesy0dj5UeueNuzgpBG9ZPMVOeyC6V5w@mail.gmail.com>
Date: Fri, 22 Jul 2016 08:41:53 -0700
Message-ID: <CAMKF1sqO6QpZtdKgNK8v7UvQUAih5Lok0kzfVWmmmzqtA_5MbQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oeqa/decorators: handle broken links when creating new symlink
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
X-List-Received-Date: Fri, 22 Jul 2016 15:41:54 -0000
Content-Type: multipart/alternative; boundary=001a114a82f818452305383b468a

--001a114a82f818452305383b468a
Content-Type: text/plain; charset=UTF-8

Yes ok

On Jul 22, 2016 8:11 AM, "Burton, Ross" <ross.burton@intel.com> wrote:

>
> On 22 July 2016 at 15:13, Khem Raj <raj.khem@gmail.com> wrote:
>
>> I think it will fail if the existing file is not a symlink ?
>>
>
> No, the only difference between lexists and exists is that exists follows
> links.  So in the case of a broken link, exists returns false.
>
> Ross
>
>

--001a114a82f818452305383b468a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Yes ok</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Jul 22, 2016 8=
:11 AM, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ross.burton@intel.co=
m">ross.burton@intel.com</a>&gt; wrote:<br type=3D"attribution"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On 22 July 2016 at 15:13, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I think it w=
ill fail if the existing file is not a symlink ?<br></div></blockquote><div=
><br></div><div>No, the only difference between lexists and exists is that =
exists follows links.=C2=A0 So in the case of a broken link, exists returns=
 false.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div>
</blockquote></div></div>

--001a114a82f818452305383b468a--
