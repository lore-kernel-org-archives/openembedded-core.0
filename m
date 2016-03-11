Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC166E680
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 15:55:25 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g203so150632336iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yaRM2aSa2dFKfWj1B4Z6RLheN7LyggpTegMrwe1+VRo=;
	b=KD2huPQcnQptXtMzFJV/vFlHDsNVQRRXacgKSAODwbQXVDSJHjBIaBC456kreEUmwG
	otipoFhHUSAHbPuCmAzjCAwWjqnmAdSCzRaitBL68p99T0Vlz5dV5U0rjBPhGTR5dFGu
	wUNOMn6PisYNz80KNgr8PFfqneZ0NBDvnskw5WHZLiKoTluXhdcBAg1w9PZ1LAipaamb
	qpOQnKbEdSkyHg/9UpJwkXL6IINIRdYKMXkQYFpGTIKNqpKrLqR1PN+6SCZa1ca9+g2i
	TGB9eOI6BOUd7Gxz80JS8Ni+rR5Pb4FcGfIap8vvmUa6NIwkuhO5k0XAmVEnlgnaIRT6
	fHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yaRM2aSa2dFKfWj1B4Z6RLheN7LyggpTegMrwe1+VRo=;
	b=caq+w8vIYMjitmdDQKqY8ril543GUFeNX8jPvwehg2XNlg8t+f5c4oew8Ubn9KAIW0
	dOQBFA3M4uP82d1cYCiDMGDww30QTPKJo9/c1sDaFINSFum3jy5IHKZrYD7vgVYOGW8v
	r4zto9ansY7x41vqyJeTOw7P5NYdoozUcvFSyDU9LL+H19hE9MYioeakiJfMxjVONmui
	uFYJ6rws9GHSzXnBx7Tokz5O7Y9MRRquR4QoyHgq7jx96h5PF34ZPB7MYk3Hh8VHBbuj
	XfP7H6QrLr5XRvMnxlDGwr1Oj97z/HREPN9mzCwWSDtBR8hf2oheTZlymMpcDa7yHv7G
	bpyw==
X-Gm-Message-State: AD7BkJJo13h/rUuJ+0M70c90/Kt4oEAOMYw+5sZ6YE7+F4RSRPDsStOKTU/ykvQu8skJFQ0/0JkHbnl+zLUXveY7
X-Received: by 10.107.16.19 with SMTP id y19mr10455003ioi.148.1457711726773;
	Fri, 11 Mar 2016 07:55:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 07:55:07 -0800 (PST)
In-Reply-To: <95245B46D926B348AEB132E99037C59B36A9FE3A@ULM-DC01.bmw-carit.intra>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
	<CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
	<95245B46D926B348AEB132E99037C59B36A9FE3A@ULM-DC01.bmw-carit.intra>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 15:55:07 +0000
Message-ID: <CAJTo0LZVFTPSXpOi4bg72xFBqKcGDshaWZEQn84+3RjZD5gMtA@mail.gmail.com>
To: Helio Chissini De Castro <Helio.Castro@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 15:55:26 -0000
Content-Type: multipart/alternative; boundary=001a113fd1eaa8d416052dc7f5a1

--001a113fd1eaa8d416052dc7f5a1
Content-Type: text/plain; charset=UTF-8

On 11 March 2016 at 15:53, Helio Chissini De Castro <
Helio.Castro@bmw-carit.de> wrote:

> Since all the packages now share exactly the same license, there's no
> reason anymore to specify each one of then, unless wanted to keep the names
> to know which packages are related to this recipe.
>

That's a good point, thanks.

Ross

--001a113fd1eaa8d416052dc7f5a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2016 at 15:53, Helio Chissini De Castro <span dir=3D"ltr">&lt;<=
a href=3D"mailto:Helio.Castro@bmw-carit.de" target=3D"_blank">Helio.Castro@=
bmw-carit.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div s=
tyle=3D"direction:ltr;font-family:Tahoma;color:#000000;font-size:10pt">Sinc=
e all the packages now share exactly the same license, there&#39;s no reaso=
n anymore to specify each one of then, unless wanted to keep the names to k=
now which packages are related to this recipe.<br>
<div></div></div></blockquote></div><br>That&#39;s a good point, thanks.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a113fd1eaa8d416052dc7f5a1--
