Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvxKy-00087w-OA
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 21:44:56 +0100
Received: by lbol12 with SMTP id l12so1642713lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 12:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=FEnk+ksmR5FrXZVfB4jLGCwnnwGRFYQcB33wjFCEeOk=;
	b=OpY5LRKaXzlMnO2C8bZlOVOQ5TgQUCs7PZ0XNHB3eo5faEHN6BpX8qknczbjhitO2B
	QiFyobsV2xhbDXZi2hPPrTaUaUiiTyL0Jk9fKHBslI/ErpEzoEHzsggUuOCGSYhjANeA
	X7JGLpUM+SNun8jPmvfNdFMXK7NGJgM726HaY=
Received: by 10.112.28.169 with SMTP id c9mr2563901lbh.42.1328906210420; Fri,
	10 Feb 2012 12:36:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Fri, 10 Feb 2012 12:36:20 -0800 (PST)
In-Reply-To: <1862774.ijFNRjIgdo@helios>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
	<CAMKF1spuyaA4ZJTe1pH8qyRA0nXQfJ67hAKjs5daf_Lmxy=8Tg@mail.gmail.com>
	<1440799.NqLiKZanR0@helios> <1862774.ijFNRjIgdo@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Feb 2012 12:36:20 -0800
Message-ID: <CAMKF1soxtqT40tKKUQQe1tkhR_5=sbeuwq5R80gLyVJA_n9OYg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Fri, 10 Feb 2012 20:44:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 10, 2012 at 11:31 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> So, I dug further into this, and I discovered that the reason for this
> breaking was that the Qt configure script thought we were not using g++ as the
> C++ compiler (!) thus it did not detect the gcc version, and therefore when it
> came to the check to see if gcc 4.6+ was being used in order to add the -Wno-
> c++0x-compat option to CXXFLAGS (which it already has code to do), the version
> was not set and the option was not added.
>
> I've updated the contrib branch to fix this as well as reformat the other patch
> as Koen requested.

Thanks for redoing it.


