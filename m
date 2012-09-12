Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBolq-0000Ad-RJ
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 17:22:31 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 12 Sep 2012 08:09:57 -0700
Received: by oagn9 with SMTP id n9so1073328oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 08:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=G6ILZftlh8dwnCfkjArm1xo6q3wmx2/nlLRygIx7FwM=;
	b=AM1VYeI14Q4ovC3vpihmViWQj8L9v5iu9k+o6X/Q/101/UIyItKA8maxAAfG/UikGN
	4iHSCNP3ZVhd+vcRYme5YGtXpUQqQ5Tqmr43VSooMv1k2jDWUiOo3lLVrQi+5hAn4LI7
	v1EE/nEBdKpF3BnPgb3yzftX3u8X0NBy0EwiyPV/VKxFqFM3Z9mNPzEBYpfc04ZNeP6M
	2Do6lyVF+o18QuInC/WibHZhPwaDHTTsBLCla0iVsjwDbB++bbiHkAVv0Bds05iJ/BWu
	Gf+Hf6nQgr9CQHuEktviI0oyvRi3qUQt/edfgFHougtdSZoJ9AoYrQKBByDUNWOL9+Xu
	F0og==
Received: by 10.60.12.106 with SMTP id x10mr1802804oeb.103.1347462596199; Wed,
	12 Sep 2012 08:09:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 12 Sep 2012 08:09:33 -0700 (PDT)
In-Reply-To: <1347459798.11710.27.camel@ted>
References: <CAJTo0LbTipjuhpvyxgL1Z=WTn0yHNcLB4tQqcQeXCUth8ygWkA@mail.gmail.com>
	<1347459798.11710.27.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2012 16:09:33 +0100
Message-ID: <CAJTo0LbNPMkSZ7ftDkyKsbxbL50o7St5rj-FZaeiYuYDOv7Wbw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQlzTmAogaW4NUuNsk7Gsd/zxaJq/2HXIZigZGNXmZechy4Dd1+oapBHgjUGu2RtgZgVx7Hh
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: libx11-diet removal
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
X-List-Received-Date: Wed, 12 Sep 2012 15:22:31 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2012 15:23, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Is there any way to add in enough functionality that gtk/qt would work
> but still save some space?

The big piece that gets removed in diet is the Xlocale functionality -
this is what brings the size and the compatibility problems.

libX11 as it stands now is actually smaller than the old libX11-trim,
as some optional features in libX11 (Xcms, BigFont) are disabled by
default (packageconfig to turn them back on).

The important distinction is that libX11 is (practically) unpatched,
where as -diet is chopped up.

Ross


