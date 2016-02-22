Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3957E77245
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 23:34:57 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g203so195271746iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 15:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KU5wqWa8bqzMFk5NNWceSFFauca6hb8W9H4T6AWoosI=;
	b=aJQdLiAR7dLWmkGuABvW975p8RE1eDmRYZQgejZv1kWKGn6FvdcOHFYFuT8b+MZzqy
	h7yZCoz65ngHp3OAtu32sNOP3CM3YwbGyoxCovUG4hX+B68eGie9iiPSlCKBaBXJ+Q2E
	lTlvK33ZflR3jhrff008nxOsW0qfcMZFmQxVMRuLCQhlCtuWkdfjHEog3CCLvkPBaFWx
	5mEgdyNMgwbdjN1U/eajBnVjFteudR7WTkVPgq6VqJMQ828xCIPPW+K6RIBMvuaZn0oO
	79V4RfWy9SZhzPW57qS13twlMG2ZLqAVRRAm/oQmRpTEoj2HvupHW9PlH0ZC7qXClzCu
	mJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KU5wqWa8bqzMFk5NNWceSFFauca6hb8W9H4T6AWoosI=;
	b=OL9dxuEOwMWpPvsr2smrWWu1/vkutUSMOaVHOU4goUGoebwEeA3Bu4KIyQm6ZjTzju
	Sef2cOy87hpLRxgcjcdcnEinzcaTtpEJEGmdLq/RwBe3beQsyC0OFlGV/AykrRrUEoZ6
	7p7bp9AX1OyB8O2KiiwXo3jBKvQ3NwW+kvLJWvsP0Mxm4iCtUtAf7dBcq6IfS9HZ8b48
	h5q/k17bhDwvbq4fRMn1mTBsSp7v2vjcfRdcMsqkbo8vbB/JrbpKowHWJPWvb4Dy8I4c
	yW/lhcikgbXGVV3PBu/IeTOX90vZXCxkH/ZaID3L9g3To1HirXbqMXKhcXbJTstzQ8De
	nz+w==
X-Gm-Message-State: AG10YOTYmZR/1yPCG/SfVXM9biNQqlU6FoAJK211K2grNT15ENLCdWcYwi5mQB20bWBFMWsFhlOx0PuC08pHGGG8
X-Received: by 10.107.164.15 with SMTP id n15mr28348213ioe.148.1456184098493; 
	Mon, 22 Feb 2016 15:34:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 22 Feb 2016 15:34:39 -0800 (PST)
In-Reply-To: <1456183794.19577.5.camel@intel.com>
References: <1454588030-26081-1-git-send-email-cristina-danielax.agurida@intel.com>
	<1456183794.19577.5.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Feb 2016 23:34:39 +0000
Message-ID: <CAJTo0LYFqPjSTVAYPT=afX4o1Qp8cp4wPNjC7DAHfp6=NR0g+A@mail.gmail.com>
To: Saul Wold <saul.wold@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/parselogs: Updated whitelist
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
X-List-Received-Date: Mon, 22 Feb 2016 23:34:59 -0000
Content-Type: multipart/alternative; boundary=001a11377682eb3dc5052c6447c1

--001a11377682eb3dc5052c6447c1
Content-Type: text/plain; charset=UTF-8

On 22 February 2016 at 23:29, Saul Wold <saul.wold@intel.com> wrote:

> Ping, this does not appear to be in -next or ross/mut, any issues?
>

I meant to reply about how the grep code is insanely overcomplicated, but
that can be fixed later.  Marked to merge to mut now.

Ross

--001a11377682eb3dc5052c6447c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2016 at 23:29, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:saul.wold@intel.com" target=3D"_blank">saul.wold@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":b5e" class=3D"a3s"=
 style=3D"overflow:hidden">Ping, this does not appear to be in -next or ros=
s/mut, any issues?<br></div></blockquote></div><br>I meant to reply about h=
ow the grep code is insanely overcomplicated, but that can be fixed later.=
=C2=A0 Marked to merge to mut now.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a11377682eb3dc5052c6447c1--
