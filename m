Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD0660249
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 10:08:11 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id n127so73590914iof.3
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YUhLle3upr3BA/ACCHi8vMPoFlvtde0BaVcAb2EuDic=;
	b=TWdPFr2//HtZicNh9z8+ITjlmPCzAwgYj4tTdhMQAp7pKXAZNHj/FDuWXc0mA91Ze6
	Rf4INDATPOlE3CF11b5fawU9+dfxJDKJp+SPcrL3xzPEI4dX4JaLVnANpd7k5/3OFX5H
	fM3SdeAkgnOrbsC/ulC1E/0Z9PFjJvN6wFVfpEt33+CsA8zeaqWawMb48LaoPVrKCHFC
	m1ctytci+gPwH1w8c3PDlsjrUm37NMOaNvnefWaPdADPJ+DMsULjhhuLS9wyFaDxOOwk
	Q+Qpm7jhdzbgyAij5bBxccNnx8XiRluOMU+bgZyO/XA5oNtKn0YnQe2jtxo7TUjDmj0r
	L5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YUhLle3upr3BA/ACCHi8vMPoFlvtde0BaVcAb2EuDic=;
	b=RokySfC+2htMXQsZ0EAMwF0zu3XZlCBp8Sv3DgBOzd6Jfrb5sWjbx1wfP6QEOLzVac
	yvmZO8gj00Chqp7xjhNFvS/e/nU5ajE0ntSdq0a/s9WZo2buS+mpSSf41EsUSTiAAzSN
	sfi5uJ2XOy6or1ojcgROf62AgW+nEbvdVwwr+EKBUdTWiiN2O+V0tD1gJG2SQmOb4mLM
	juMdqKzQikRIFlRT3B7aEPkTIkRLQ8KFVysIfFEE9zDrua5GgS1pUhq0DIEs0c4tZYQe
	HjUd1EBrGPgXSLuedn5P4rfC+IBQSUGxIrK1RUQKmlbVP14dRjS0Rs7BGKhwa0evxrCw
	5MCg==
X-Gm-Message-State: ALyK8tIkX8FxZwca4bi2cxp8lxP9gnm9gTmj9U8DRPgPjkQeTobXLqF7SO9X+cGZlhq2sMlht+/MrxYS6KXjeBhH
X-Received: by 10.107.154.210 with SMTP id c201mr1687640ioe.99.1466158092379; 
	Fri, 17 Jun 2016 03:08:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 17 Jun 2016 03:07:52 -0700 (PDT)
In-Reply-To: <CAHiDW_Fg2tZFYWxewuNFJakxfd_2iHVcp2KgUJnWPdZqxTKZRw@mail.gmail.com>
References: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
	<1466110195-5473-1-git-send-email-mark.asselstine@windriver.com>
	<CAJTo0LaEQgDLM2vxL7tGW8oefR6Jc1gEkWoHz4J7DkAD7N=sEA@mail.gmail.com>
	<CAJ86T=VA5n8==dM4v-AdToxkKfgTH3vTgOBijpJBYjcvygp_Jw@mail.gmail.com>
	<CAHiDW_Fg2tZFYWxewuNFJakxfd_2iHVcp2KgUJnWPdZqxTKZRw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jun 2016 11:07:52 +0100
Message-ID: <CAJTo0LZUBa0p0QhyFBTaJF8fx0vb1USH+LToWy5BB3bEG0yiSw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] vte: bring back old version to support xfce4-terminal
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
X-List-Received-Date: Fri, 17 Jun 2016 10:08:12 -0000
Content-Type: multipart/alternative; boundary=001a1140fab648362f053576886a

--001a1140fab648362f053576886a
Content-Type: text/plain; charset=UTF-8

On 17 June 2016 at 07:37, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> > That's certainly a good argument for putting the old vte in meta-oe.
>>
>> The meta-oe layers generally have a higher priority than oe-core, so
>> having an older version in meta-oe and a newer version in oe-core can
>> lead to unexpected results.
>>
>>
> As far as I know the versions are parallel installable so that should not
> be a problem. I removed the old one as there was no need for it in oe-core.
> Should have checked meta-oe as well, but there were just so many moving
> parts to juggle here... The right solution should indeed be to add the old
> one into the layer where it's needed.
>

If they're parallel installable then the resurrected vte could have the
version in the PN so both can be installed at the same time, until
everything has moved to the modern vte and the old one can die for good.

Ross

--001a1140fab648362f053576886a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 June 2016 at 07:37, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span>&gt; That&#39;s certainly a good argumen=
t for putting the old vte in meta-oe.<br>
<br>
</span>The meta-oe layers generally have a higher priority than oe-core, so=
<br>
having an older version in meta-oe and a newer version in oe-core can<br>
lead to unexpected results.<br>
<div><div><br></div></div></blockquote><div><br></div></span><div>As far as=
 I know the versions are parallel installable so that should not be a probl=
em. I removed the old one as there was no need for it in oe-core. Should ha=
ve checked meta-oe as well, but there were just so many moving parts to jug=
gle here... The right solution should indeed be to add the old one into the=
 layer where it&#39;s needed.</div></blockquote><div><br></div><div>If they=
&#39;re parallel installable then the resurrected vte could have the versio=
n in the PN so both can be installed at the same time, until everything has=
 moved to the modern vte and the old one can die for good.</div><div><br></=
div><div>Ross</div></div></div></div>

--001a1140fab648362f053576886a--
