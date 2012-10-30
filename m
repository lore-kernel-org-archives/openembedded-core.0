Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TT98a-0004VA-BI
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 11:33:36 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 30 Oct 2012 03:19:27 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so266594oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 03:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=vVgdwSIZTBQOtAbj1JzBxIZcvGGDeQV4c1UOjDpxJQI=;
	b=NqBS5B1xS1oUOCmPFsTffn7j3ZCVJt6k+8qZwq9+t6CQEMcoTZs4maqOTOqzOPgvsc
	QpQ50+CDrAq9/mI5AXeRU03cmXrRKlG7+utBWgmHl7EQxC19dI2ssAfUiDsiJkSktggE
	0BMw7NJ3jCAxFsDBmcU+N7S8AGAob1XyYV7iG8cobxVad339K7HN9jh6SsHTwXeUemh4
	p/Gw3+Jps+i+FezbvFnr9RZn3cvn88BO9DswDF8B53GdmkH4xLtCRSHIrX7IDS+dHLle
	2GcKU6N/cETApbxRDSvLvU8jlRnTHGO5FJOMVpcr9KcTz3imJKpjIKjgmi+EgNUpuyuc
	inhA==
Received: by 10.60.169.20 with SMTP id aa20mr29069613oec.105.1351592396172;
	Tue, 30 Oct 2012 03:19:56 -0700 (PDT)
Received: by 10.60.169.20 with SMTP id aa20mr29069609oec.105.1351592396088;
	Tue, 30 Oct 2012 03:19:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Tue, 30 Oct 2012 03:19:35 -0700 (PDT)
In-Reply-To: <CAK18fxGFUy_+pzBvGtvknjj3AQFkGqBA6mjkHDgJTamXOMr5RQ@mail.gmail.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
	<CAK18fxFzwdCszev=Ss+rMdytAqUgDcnA4e9HEC4_psz2SAJbxw@mail.gmail.com>
	<CAJTo0LZ=t_sWFtkbdt=uwyCEGuMmHnWdu7cO3=qMmseiMtVTHQ@mail.gmail.com>
	<CAK18fxGFUy_+pzBvGtvknjj3AQFkGqBA6mjkHDgJTamXOMr5RQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2012 10:19:35 +0000
Message-ID: <CAJTo0LZcHi16POq8_bQpURnjLxvj7fy=9m_LX27+Nz_RADQT2w@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQl4NIlIMFaK/q8mEh/6gXgn9nfgI7q0Zcb403M6j6ixPsNvsahhc21A930wkbQIxYnW+fYNFXHaaNyg5m+XSeyQCEQ8r/NT537orQL1+ruiolac+/kYvwIQOZn+yWUarZoKR0O6Kgxp9as857UGTpMUiQa3Jp0ecnRfvbgoXjIHqUr0t7gYu1hpYoWuqTwE7yKwEz/z
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
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
X-List-Received-Date: Tue, 30 Oct 2012 10:33:36 -0000
Content-Type: text/plain; charset=UTF-8

On 30 October 2012 10:10, Andrei Gherzan <andrei@gherzan.ro> wrote:
>> What causes gconf to not build without GPLv3?
>
> pulseaudio depends on gconf (because of that racing issues). Now, gconf
> inherits gnomebase which adds to gconf's DEPENDS gnome-common package which
> is GPLv3. So this is the chain.

Oh joy, one of those instances where GPLv3 isn't actually a problem.

gnome-common is some scripts and tools used at configure time, so
there isn't any linkage, so there isn't any GPLv3 in the images, so
there isn't a problem.

The question is how do we express this?

Ross


