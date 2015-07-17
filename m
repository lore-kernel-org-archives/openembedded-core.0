Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0201265CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:46:01 +0000 (UTC)
Received: by qkdl129 with SMTP id l129so70997211qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 07:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZGtTAA6KBwBeCxycfeyJnKWTb90jRIVxasFvSoLx4i4=;
	b=kjJjSKexn1Hz5gUPbQebh4gR8PnYVPJlx7kqGTXQd2wQtq9YPlgzQR8cSpL6g9GZAk
	iMYmMF34ZiCyDj51Snq3WIme4cddz9ay9QpiSwcSZfGpWnMs6ItBSY0nRul6UivOg1C/
	RsMRqokP8zqhtoHAvbGmVZ80Zf3fiRafwMzclCG0NUIqsXt5OIvIflmj/yWyboy/cNe+
	gGe4lHPyKUz0Sj3SC73d1bNkyCuTfkOAyQcsfLsjYPxK7n6MQDAsGJj+yjHywHNKDRfL
	mDkyAne1gKFmIQvyqEyaU/eaA0/lVa5z4Ff7X8qvfsrdcjhqYEayuLzPvxnG8Avhg/fM
	q7Ew==
X-Gm-Message-State: ALoCoQm5z93YxSEBIA3gdXAYt2KL3bolIeoyulH4HjUB1IHEx8EIB9P2Jes3ysex/GAQPgtjoYZj
X-Received: by 10.140.150.142 with SMTP id 136mr20173326qhw.17.1437144361915; 
	Fri, 17 Jul 2015 07:46:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 17 Jul 2015 07:45:42 -0700 (PDT)
In-Reply-To: <042E875E1B5D414CA9BB78B7D4FA691C287EAEA6@IRSMSX107.ger.corp.intel.com>
References: <1437142674-8167-1-git-send-email-george.l.musat@intel.com>
	<CAJTo0La3bqO7ssvWgRKTFNm9K1WU-zAnmZ-69_1o7Q56A6Ze2w@mail.gmail.com>
	<042E875E1B5D414CA9BB78B7D4FA691C287EAE73@IRSMSX107.ger.corp.intel.com>
	<CAJTo0Laa7JVVdJATFcpvMzd4C02TRoP9=QOzSdc3VFfZwk__4w@mail.gmail.com>
	<042E875E1B5D414CA9BB78B7D4FA691C287EAEA6@IRSMSX107.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jul 2015 15:45:42 +0100
Message-ID: <CAJTo0LZduKtUJBndiu4_Jf5FMxDFYGHYjyigpahi8z-9w8TT+A@mail.gmail.com>
To: "Musat, George L" <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime: Added skip condition to kernel module test
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
X-List-Received-Date: Fri, 17 Jul 2015 14:46:05 -0000
Content-Type: multipart/alternative; boundary=001a11357d4a2f0ecd051b133f6f

--001a11357d4a2f0ecd051b133f6f
Content-Type: text/plain; charset=UTF-8

On 17 July 2015 at 15:43, Musat, George L <george.l.musat@intel.com> wrote:

> They work on core-image-sato-sdk images and fail on core-image-lsb-sdk
> images. You can look at bugs 8013, 8014, 8016.
>
>
That would be because -sato-sdk explicitly adds kernel-devsrc but -lsb-sdk
uses the old name of kernel-dev (see
54d5e74a19d5773c3989d1d64b6a5d927013962b).

Fix incoming.

(see, this is why good commit messages are important)

Ross

--001a11357d4a2f0ecd051b133f6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 July 2015 at 15:43, Musat, George L <span dir=3D"ltr">&lt;<a href=3D"=
mailto:george.l.musat@intel.com" target=3D"_blank">george.l.musat@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><p class=3D"MsoNormal"><span sty=
le=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(31,73,125)">T=
hey work on core-image-sato-sdk images and fail on core-image-lsb-sdk image=
s. You can look at bugs 8013, 8014, 8016.<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>That would be because -sa=
to-sdk explicitly adds kernel-devsrc but -lsb-sdk uses the old name of kern=
el-dev (see 54d5e74a19d5773c3989d1d64b6a5d927013962b).</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Fix incoming.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(see, this is why =
good commit messages are important)</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a11357d4a2f0ecd051b133f6f--
