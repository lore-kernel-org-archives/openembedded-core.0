Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id B241A73243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:06:36 +0000 (UTC)
Received: by qgt47 with SMTP id 47so32726265qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 05:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=h9uySsIr2GQoQXWFj80VvXBPXK3Z87mQJrnInx7cK9s=;
	b=HIX/mObqeL4skz1Cc9ohUEpxlKEiMRILDav2s9XUYw/O8gHwYko58vQ9laiZVfGiAS
	dbPZdmuYP2W4FqixeRyvFfFhOIxzlddxAE7JINsRI78O1mivfkg3yRlph8RkKOXtGTGn
	aS0rgrPGcsaX9PCeckkXhxXAisSEgTk8k5cmwkB7m3bf6T5nKRa6Fhtk/6ZRYCqor8aF
	dQe94oXQj66+xFk84VSt4nxTZc8f1WdBj/8NqRXZ8Y1lBcwtG8gxCCv0XrfLVIjRxp4G
	nrgDw3f9kgFmBDMii7FvS5VvfRxxifjAAyWEpr+KpOte6Ai4dRnHkyNU6kcKS38wHJJk
	3L2w==
X-Gm-Message-State: ALoCoQlomPQmHWrfg/8xhjD85XT51Z4PsoiUqEeeLwHChFmhLpQdhXkNp+NFCTzVlp0oeIwAjThG
X-Received: by 10.140.89.10 with SMTP id u10mr52565998qgd.15.1441886796383;
	Thu, 10 Sep 2015 05:06:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 10 Sep 2015 05:06:17 -0700 (PDT)
In-Reply-To: <55F16E82.1070708@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
	<55F1679C.5090508@linux.intel.com> <55F16E82.1070708@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Sep 2015 13:06:17 +0100
Message-ID: <CAJTo0LaBtTo+RXw-Z2stbyU75nor=5UCgpsUNJvR5MZctUvJ9g@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close
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
X-List-Received-Date: Thu, 10 Sep 2015 12:06:37 -0000
Content-Type: multipart/alternative; boundary=001a11c1211a4e45cc051f636e51

--001a11c1211a4e45cc051f636e51
Content-Type: text/plain; charset=UTF-8

On 10 September 2015 at 12:50, Trevor Woerner <twoerner@gmail.com> wrote:

> With so many maintainers on so many different layers/etc we would need
> some sort of billboard somewhere listing the names of people currently
> on the "naughty" list ;-)
>

I prefer the concept of a naughty list to blanket rejecting...  and I have
a script for internal tracking this sort of metric so when I have a spare
hour I'll see if I can extend to do this.   "pending" lines added per
person or something.

Ross

--001a11c1211a4e45cc051f636e51
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 September 2015 at 12:50, Trevor Woerner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":15r" class=3D"=
a3s" style=3D"overflow:hidden">With so many maintainers on so many differen=
t layers/etc we would need<br>
some sort of billboard somewhere listing the names of people currently<br>
on the &quot;naughty&quot; list ;-)</div></blockquote></div><br>I prefer th=
e concept of a naughty list to blanket rejecting... =C2=A0and I have a scri=
pt for internal tracking this sort of metric so when I have a spare hour I&=
#39;ll see if I can extend to do this. =C2=A0 &quot;pending&quot; lines add=
ed per person or something.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11c1211a4e45cc051f636e51--
