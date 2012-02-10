Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RveeF-0001sM-Vv
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 01:47:36 +0100
Received: by lahc1 with SMTP id c1so2085161lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 16:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=wbdlp+ZduiKthrEGL/p5UpHPAAgExRZf1z9vHF+zZyo=;
	b=nUUSSZiKcALLvAMo06KqNCPo9YTzs4pPoRYq3epAnHB629nZahVfQmY23hM5mMVU03
	/MQVDB4bfaP+/jzUxYQDkZ4TWQDJcMzF5uMO2QvWmVvvgMQAm73ZN/jKVyIZcaCN3AoW
	XvQbdLRcRNVy2ojyuY/kd6UsHBOwmGMjsNGqQ=
Received: by 10.152.125.20 with SMTP id mm20mr2680523lab.6.1328834370246; Thu,
	09 Feb 2012 16:39:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 9 Feb 2012 16:39:00 -0800 (PST)
In-Reply-To: <1328832372.10451.47.camel@ted>
References: <1328832372.10451.47.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2012 16:39:00 -0800
Message-ID: <CAMKF1soksEad4TP5upRjW2vG6_OjeQjyYTAL88PH_qgy9yyiug@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Some small performance tweaks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2012 00:47:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2012 at 4:06 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"


note that we will need to ship zlib-nativesdk as well if we do this
so hopefully that case is covered by this.

other changes look ok to me.


