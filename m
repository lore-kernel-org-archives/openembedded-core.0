Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id BDBA771AB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:33:24 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id q192so184864550iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jrOYBjDomcQO8JgjKuZ/j7FxHGSrjo/QT3kGCrCkyiI=;
	b=ez9urzjlhO1LB4ppsZgnqZQ3MEpBdDkwtCGUSlelbTsqWHm5hRndNqpiVZRUawZU1k
	msaVXtU3j0Dici9ZRRo8b/ZAnG6V9IFU0PW1JG2R/styULZplv2yaatNLo2n96nUp++L
	yORUHNlGrZmWagDkDg0vzm668lb+WKUaS2UkJ+V9BAOULc/lc3yAoocuKvmOWPrqprUX
	O8ql6xTETP/DD1po6jnMqnfXo2fVOe5IarFXL3scoFDkcyIoKN8mxaP6U81Os/gcvpmE
	DrbyrNTfDXj4B8MIWJTni3xCizHYmk/+AgHZ9Y83UvCeuf3e8nXqWguR6I5O1IZPz7Io
	7Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jrOYBjDomcQO8JgjKuZ/j7FxHGSrjo/QT3kGCrCkyiI=;
	b=aWgfQMhkSNRY7Y/9jZNIHq2vkNno97GJ4FRQg1btSfJl61ibdndPmaElP1PJbGHa+P
	K6kfI+BHANEs0Lau4EbU9SyFJnFHLjCrSASD6SfFnWr9FFkGAWR3seImBV8FXqHHm5OS
	mellg1V3HvPAE7TcN3/dMr1oebcMjjDum426EEPnUdxCFrd29lBntpSAHepZEEl0Zxhb
	8CAzr9xQeSsDD1QATTOQA8S4X6IQSSDlnp92o1L8ybO+1/i7LKKwqgmEdDnjNZBpMt3H
	soMBV0vZM0Pa3ewn6K29OhY2C/DRZyxxZs61/RYo4XsAynEQDOrpnsLxdACYjPgF8md4
	aw0Q==
X-Gm-Message-State: AA6/9RmV93hdE/hgar18U2TtshiAIyejnImpQgq4IyRd9emIXCANkfGgA1SkGuOkmoZDaH7HcrKuMvmpzGvMCSLP
X-Received: by 10.107.5.72 with SMTP id 69mr21601029iof.132.1476704005688;
	Mon, 17 Oct 2016 04:33:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.168.146 with HTTP; Mon, 17 Oct 2016 04:33:05 -0700 (PDT)
In-Reply-To: <44095a65-4aab-648f-5538-08b02f58bee7@siemens.com>
References: <44095a65-4aab-648f-5538-08b02f58bee7@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Oct 2016 12:33:05 +0100
Message-ID: <CAJTo0LYJXgjv=P1KTo1_k9U8zG5AAq0Oy57H5q4edUto=kQ1nw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: The future of qemuarm
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
X-List-Received-Date: Mon, 17 Oct 2016 11:33:24 -0000
Content-Type: multipart/alternative; boundary=001a113efe2cb2c795053f0df128

--001a113efe2cb2c795053f0df128
Content-Type: text/plain; charset=UTF-8

On 17 October 2016 at 12:18, Pascal Bach <pascal.bach@siemens.com> wrote:

> I read several discussions about lifting the default qemuarm target to
> armv7 or higher.
> On the mailinglist and on the internet I also found several mentions about
> machines qemuarmv7 and qemuarma8, but I didn't find any working machine
> configs for them.
>
> What are the planes here?
>
> Is the goal to increase the default to a higher arm version?
>
> Is there a bsp layer for other qemuarm variants (cortex-a8, ...)?
>

There is a qemuarm64 in master which is aarch64 based.

Ross

--001a113efe2cb2c795053f0df128
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 October 2016 at 12:18, Pascal Bach <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:pascal.bach@siemens.com" target=3D"_blank">pascal.bach@siemens.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1b5" clas=
s=3D"a3s aXjCH m157d267c38817d7d">I read several discussions about lifting =
the default qemuarm target to armv7 or higher.<br>
On the mailinglist and on the internet I also found several mentions about =
machines qemuarmv7 and qemuarma8, but I didn&#39;t find any working machine=
 configs for them.<br>
<br>
What are the planes here?<br>
<br>
Is the goal to increase the default to a higher arm version?<br>
<br>
Is there a bsp layer for other qemuarm variants (cortex-a8, ...)?</div></bl=
ockquote></div><br>There is a qemuarm64 in master which is aarch64 based.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a113efe2cb2c795053f0df128--
