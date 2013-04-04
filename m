Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec13@gmail.com>)
	id 1UNlw1-00074u-CR; Thu, 04 Apr 2013 17:18:41 +0200
Received: by mail-ob0-f174.google.com with SMTP id wm15so40925obc.19
	for <multiple recipients>; Thu, 04 Apr 2013 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=CyRfn7mKRsiQV9HksXWNWFf+bRRR6JiBVu0588bnMuQ=;
	b=UlqhbqQthXd/z8huXU3Cm6AOXWO+xBDsN6MGjUeJmfwb+m8Tg5yBl26oQCDnsfR/E4
	T60Rv+ZrawdSpdCzNdxV8HRIr61GozZfGiyVcUJYPh3nCaSETneGLcy9DWuADSNdwKiH
	9O2kgB0KUkWxsAQQRyjzeNi4QKFNz8Q7J40Y5qqMPvN9ndpamWlcpQcY23y4kS9PT5I8
	ObvR642E56RS1yitwYI+PBXT5DT0sk16hDBGByw/gJO51OngWpQejHhncvdYSSgGQT34
	TvhmXtkccavT61sJFvxijh1gHpnxHLP5hYbasGAxFCHzZFBhO8GioOjRGXiaMxp8wyiM
	vrzQ==
X-Received: by 10.60.142.164 with SMTP id rx4mr4621122oeb.83.1365087687854;
	Thu, 04 Apr 2013 08:01:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.34.39 with HTTP; Thu, 4 Apr 2013 08:01:07 -0700 (PDT)
In-Reply-To: <3982011.Guen6pOcoq@helios>
References: <3982011.Guen6pOcoq@helios>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 4 Apr 2013 17:01:07 +0200
Message-ID: <CAOT3miKi62MtFGjiNYeykNKAsFQ+srtwqSbsSyge3ZzGHD4DOw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: yocto <yocto@yoctoproject.org>, openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: New OE layer index now available
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 15:18:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

this is a really useful addition! thanks!

On Fri, Mar 29, 2013 at 10:34 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> The index also supports multiple branches, but for the moment there is only a
> master branch configured as I'd like to have people check the layer data before
> adding the additional stable branches (danny and denzil).
>

i was thinking it might be useful (in fact at least it would be very
useful for me right now) to get version 'history' for each supported
branch. if i understand the design correctly, i first need to set the
branch I want to search, then search. but what about an 'all branch
search' that displays recipes version *and* layer for multiple
branches, so that we can easily see version change and recipe move
in-between layers between all branches.

does that make any sense to anyone?

nicolas


