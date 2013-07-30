Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id E92836B4C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 21:01:47 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j6so7947942oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=pFGD+h0CYWFvx6al5WwojWUgEQpAiGAA6oY+sXQK2Y4=;
	b=IF70a+KTkjeA7iOxydfNqAUpxWbGAtxNaStDoPo2uCsu/NLqlhHfQ1TdSPPbWp7fV5
	wso2lqeUkWLLEi2wTSfTx4cmprJW9dT28LP5qcE4lBaHonPLMQG3RYcXQqt5QkgGqKuW
	Q73BUaBpgRj/7pTRzIdZfpgZljbwOnJKvghGzs72Gxr59QEegFyCmP0b8Bqdu0+hNktq
	YF+AgQNFs/j+wtyvgvLVubWKwgRKB+Zs1LuCd08kp22yIqd321JcWxx9EyXWFXt4MOTt
	Pvd4yyMddk+9rJTXdga8t0iGbs4ucFuDmdTYkHo1V0R1jIOn43vaJEpxGw1eGte8Wnq4
	dDCA==
MIME-Version: 1.0
X-Received: by 10.60.97.74 with SMTP id dy10mr63411729oeb.27.1375218108697;
	Tue, 30 Jul 2013 14:01:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.125.199 with HTTP; Tue, 30 Jul 2013 14:01:48 -0700 (PDT)
In-Reply-To: <1375200330.8017.26.camel@phil-desktop.brightsign>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<14478313.i1FmA8Di2T@helios>
	<CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
	<1375186489.13247.55.camel@phil-desktop.brightsign>
	<CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
	<51F7D1BB.8010405@windriver.com>
	<1375197551.8017.6.camel@phil-desktop.brightsign>
	<51F7DF2C.9030207@windriver.com>
	<1375200330.8017.26.camel@phil-desktop.brightsign>
Date: Tue, 30 Jul 2013 18:01:48 -0300
X-Google-Sender-Auth: iKoepeD_1Vt1jfDrbguRAfCXF0k
Message-ID: <CAP9ODKpW5XxxGgyAYU5T=ZPTsVMWM=sCVKfjaw91YLtDxhm3zQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 21:01:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 30, 2013 at 1:05 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-07-30 at 10:43 -0500, Mark Hatle wrote:
>> That only filters out recommendations though.  A good example is some x86
>> packagegroups have a requirement of 'vte'.  It turns out a class of end users
>> don't want 'vte'.  And they have no easy way to remove it.  Telling them to
>> generate a new image, with a custom IMAGE_INSTALL value that includes everything
>> except 'vte' doesn't make sense to them.
>
> I'm not familiar with the particular example that you mentioned, but it
> sounds as though the packagegroups in question ought to be recommending
> vte rather than depending on it.  I think this is probably true for
> packagegroup dependencies in general in fact.
>
> The intended semantics of RDEPENDS are that anything named in that list
> is absolutely required for correct operation and can't be removed
> without breaking the functionality of the package that's doing the
> depending.  Things that are desirable but not absolutely necessary
> should be in RRECOMMENDS (and can be suppressed with
> BAD_RECOMMENDATIONS), and things which are entirely optional but might
> be "nice to have" should be in RSUGGESTS.

I think we're getting off-topic here. I think we ought to focus in
distro-features discussion here and handle package installs in another
thread.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

