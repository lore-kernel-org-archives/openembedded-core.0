Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2F468606AA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 13:10:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gKYB4GCzz3r;
	Sun, 15 Mar 2020 14:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584277823;
	bh=1T4eWiSKaSlmVNDdqddZeQVuHYzNS7t0KUtNZLKRfiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZ8hDG4/IaFDBNu9iBR6UwR0J9E7B+4nqfs1J+8bPwH+L0An0+ZlpUAhxCyJEAJpp
	3AGhoprVVNgg/oldf7diIu1xIu23IaSmCDZcpghuwJqbGzI4KcwS7pJmWvijRuq1mW
	AxRsh8ui7as1Hv47x2XgUvcA55SY52Ls4r/8lbWOivbfu3a6+9GB9BwVhSS2oPfWhd
	S0abiLPSakCyFOSVLQQbs0qS2fbENQ4zvLFZY1ZNPbQ3hZLuYzO45UljCbjQ+3oKyA
	Rhp2x+s3Vyuq+3tDbSiNOttLR0CdULbhxLNB0wChaCj7cISXTY+2GBy5A4Ov9qBsYB
	KTZzcLOP6Dzvn9JE7nJ2o7paYQ3OmYnUgyb1UBp/H9Mwz0BqatFqx0jVPB8+6FdExy
	gR77+zulOzhjBxexZLOxnQW6BTsWVRQPEhEy9CwEAPN365llrvsmGsAVqbM+YF9V/4
	8HmVMmqK3P3ge+Jp+45Du4waNUlQiUrpge9fnuaJGyha57+jbZYZ9hXE8ZtOu+HDKO
	X/onZpm6pLz/VVW2E+4JPJoByEti9UlgP791y27EaNLUWAq91vvygKpZkWrVj+zpvL
	3Dv2KJ4x+WUtfYvF7pNaw958WJSu9uoJlpE+FbrHMISxNkN4N0LR1wL8nQSJke99+H
	xiAnHtBKeQa9Ize3USqNAobs=
Date: Sun, 15 Mar 2020 15:10:05 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200315131005.GA31660@localhost>
References: <20200315042947.3257882-1-raj.khem@gmail.com>
	<CANNYZj98XmAvvu5PTmUKyFyGU5+f4XDo7J6=cHFEr2u3Ge5T1A@mail.gmail.com>
	<CAMKF1sr=3OvOCLiAzeYN+KD1LqkcUj2QfSHE3A+5GNT3QWm+mQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr=3OvOCLiAzeYN+KD1LqkcUj2QfSHE3A+5GNT3QWm+mQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bison: Reset load average settings if specified in environment
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
X-List-Received-Date: Sun, 15 Mar 2020 13:10:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Mar 15, 2020 at 12:52:25AM -0700, Khem Raj wrote:
> On Sat, Mar 14, 2020 at 10:38 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> 
> > Shouldn’t the race be fixed? This might still happen because -j still
> > parallelises the build,no?
> 
> It perhaps is a make bug which only triggers with -j and -l being both
> present  it’s perhaps easily reproducible using these together on bison
> builds
> As such I don’t see anything wrong with bison makery

This is the second bison-native problem in addition to
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13825

It is possible that the gnulib issue was a red herring and it is
actually is a parallel build issue, but both being in bison-native
does point more towards a problem specific to bison.

cu
Adrian

