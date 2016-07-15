Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 57CBA606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 08:20:11 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 38so98176706iol.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xa10OZ3Ek/fs/2TZtZp5SuNxoAbOCp0PhdstL0QTiDA=;
	b=jkZwRhe9si+2CYKRAUeexsrGcpKd3VhqJM/tBZTMkdfq9Q0RopkPcp5ahPEZCKk24m
	JTkX5O9qH9Z3FA2QFZipHOAMuPcfl1T+CivbyM0RYL2cX2AquGnhAWbPtTHm4bvTZjdv
	gKBFjLmF2q7mnY6AEYT7T0ngBTWs0J1mq2kZoKtMRdjZ29szWJ8pbsm8S0NqY+8Sl78v
	qJbOeiVvT88M5U9/PscrW6yeOJnpmJI+iKKOySNpEHn5vs8wzKscg2UaKPoMUJ+CR4M4
	mKZMw9GRBJ0b1Qhq+q6uZH0UoS3PKZHa12AXxM1t9Mv27HlxPaRnffr8HxNBaqyY24lo
	+2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xa10OZ3Ek/fs/2TZtZp5SuNxoAbOCp0PhdstL0QTiDA=;
	b=h9+FlT6joAllx6KxJi/z44vrRPeOWLuE1FOnFOBn6uh58yxt0mTrNlzVv+im5FeYEo
	5VU5yJahdqMwc9SZAcNLJT3T/yi6KNGQOz4OBc+TC6PCcfjQRon44g6nCatBJhqNGtX7
	LEWhPVJIHZ7+0DAnYUOcWG/NrDUGDhMPYS/+qF6VTIr1rmoaQo2xoqO8JHqlawsQMUvf
	Axply2kv+Ei9ZB2gNjIXd8KGYd277xIRI66nDlOOnyaBJlE6nQa2xFjsOgt2qUSnenvZ
	OZ1qIdl6au/KuD9Y3mtOHD8hRZ7Hj45aGCRw3oYcDwisa31XI5/7l10vgo8bwC2mNsrh
	U24Q==
X-Gm-Message-State: ALyK8tINADJK5jdfSiV4Ae/VC4WM0B9KgVha+jfLSy/PFDb77rTpdThfMd6pzLiXTzldR9c+7cfpjMhPjAzfHPz9
X-Received: by 10.107.135.142 with SMTP id r14mr21256472ioi.133.1468570812641; 
	Fri, 15 Jul 2016 01:20:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 15 Jul 2016 01:19:53 -0700 (PDT)
In-Reply-To: <1468553065-6553-1-git-send-email-Yue.Tao@windriver.com>
References: <1468553065-6553-1-git-send-email-Yue.Tao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Jul 2016 09:19:53 +0100
Message-ID: <CAJTo0LZAtLB7GLhTp_8zX5-Ecm8n4g_JWxd2RmyKgWTuQw1YcA@mail.gmail.com>
To: Yue Tao <Yue.Tao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openssl: use the perl of perl-native instead of the host perl
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
X-List-Received-Date: Fri, 15 Jul 2016 08:20:14 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc9d8c410537a849cf

--001a113eccbc9d8c410537a849cf
Content-Type: text/plain; charset=UTF-8

On 15 July 2016 at 04:24, Yue Tao <Yue.Tao@windriver.com> wrote:

> The openssl can't build with very old perl, such as 5.8.9, so force it
> to use the perl-native to avoid host dependence issue.
>

Considering that Perl 5.8.9 was released in 2008 (so eight years ago), what
distribution is still shipping perl 5.8.9?  Instead of forcing everyone to
build perl-native before openssl can build (and adding perlnative to more
recipes as they're discovered to fail with ancient perl) anyone using an
old distribution should simply use buildtools, as this is exactly what
they're for.

Ross

--001a113eccbc9d8c410537a849cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 July 2016 at 04:24, Yue Tao <span dir=3D"ltr">&lt;<a href=3D"mailto:Y=
ue.Tao@windriver.com" target=3D"_blank">Yue.Tao@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":xh" class=3D"a3s aXj=
CH m155ec9644b196e5a">The openssl can&#39;t build with very old perl, such =
as 5.8.9, so force it<br>
to use the perl-native to avoid host dependence issue.<br></div></blockquot=
e></div><div class=3D"gmail_extra"><br></div>Considering that Perl 5.8.9 wa=
s released in 2008 (so eight years ago), what distribution is still shippin=
g perl 5.8.9?=C2=A0 Instead of forcing everyone to build perl-native before=
 openssl can build (and adding perlnative to more recipes as they&#39;re di=
scovered to fail with ancient perl) anyone using an old distribution should=
 simply use buildtools, as this is exactly what they&#39;re for.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbc9d8c410537a849cf--
