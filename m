Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id AAD72788C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:56:35 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id e195-v6so3340591ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EA+a8rhzawlUBkaT5AZ8e3FJSI/0CKndMOXPQ858M8k=;
	b=LolV1I68JQ01T8OSTVKLaTluqK01ZyFJrXdtVEijdOmVdfxZxKUSb3V83QdAO5iV3E
	yXlxWVz50+0mTd+zALj1N8TT6fGHW/H5ZNaxFqf77P5hwXiU/z8fT5WI0USr/sWNMtMB
	nhuwJnG9M8T0Rd6vElVuKIvoNCeg4tCJCLE0O5NAtdpFbTl5Zz4Pg8epzvand7PPb3iu
	uns0ZLLanvtPFKOpk+GW3VpvKwjnXJeXGcs2wj6l0e7BiwGn7laRD49PidmlIPQvaesE
	TK6V7azVrcRKO4B7Ol1kW2MjLk+p9rYgcZnnTLsaH7kNyPCaQojtSXHdk2jbOyOjunMN
	wAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EA+a8rhzawlUBkaT5AZ8e3FJSI/0CKndMOXPQ858M8k=;
	b=rHdumvI7rjNMiJB/5zEc6WMjVxfBr5BQfYXSjj8pwpw/vCW5WE36yCFljSOsEUspwl
	dJHeqO7T2DTtoGOzJwsDmVpKl4V0EHXoR9kNZVru9jVSoH4V21Giu7HbHy2S2b1KXja+
	RGng0QKxgDfbkTHyhuZOvr5sbErFOZdw/5pisXq6LXzk5Eleg4fJWC+4j9qY2GwcrrB/
	AaQ95D+46XVdVWXzuN4bvx6Y6C6HGQ8npvcVXinxcE6L+O7ijUlKK10TpDbEFSt6lcO5
	Y54fHWvFgNuNPpe+W6LXFQ3EuhLVxALvepgQNS9Dj8FHjBHlq4hmSgI9PipdeXD5awSJ
	wYqg==
X-Gm-Message-State: AElRT7FsKj9gnUolwt926Oer7bKhysRBgrbIzw1BMPEYeNNLKqtEBZkL
	2m6Ur1Ft2CBbJmnVAwJ1Ur6JmK5Cp5HMKqhgBQle0g==
X-Google-Smtp-Source: AG47ELtxMh4vC61Cqsf4NRSnLEM65dgI3cZfiRJh80olRcWAykKaijFwwQl390LtUTe+FGZYZq7zGPOEvMRlGs2XrTw=
X-Received: by 2002:a24:cf55:: with SMTP id
	y82-v6mr13728474itf.127.1521824196812; 
	Fri, 23 Mar 2018 09:56:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 23 Mar 2018 09:56:16 -0700 (PDT)
In-Reply-To: <20180323114939.218c0607@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Mar 2018 16:56:16 +0000
Message-ID: <CAJTo0LanyOtHL7nTiHqefgWDA4XeaqTzjWXEaxiR+j=Q1Jxkkg@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Fri, 23 Mar 2018 16:56:35 -0000
Content-Type: text/plain; charset="UTF-8"

On 23 March 2018 at 16:49, Seebs <seebs@seebs.net> wrote:
> On Fri, 23 Mar 2018 16:30:55 +0000
> "Burton, Ross" <ross.burton@intel.com> wrote:
>
>> Because in GNU's infinite wisdom they're using renameat2() to do
>> atomic renames in the mv command, and as renameat2 isn't in the
>> headers for F27 it just does a syscall directly. This is in upstream
>> coreutils so once they make a release, everyone gets it.
>
> UGH.
>
> I... am really unsure whether it's possible to catch that, because
> I really, really, don't want to try to intercept raw syscall() calls.
> I don't think that ends well.
>
> I wonder if they can be persuaded to, you know, NOT use a syscall
> directly when it's not in the system headers, on the grounds that the
> system headers define the exported interface, and bypassing them is
> almost certainly a very bad idea.

Just chatting to the fakeroot maintainer now, as this is presumably
going to break the entire Debian build infrastructure when they get
the coreutils upgrade.  He isn't massively thrilled either.  They have
the option of just reverting these changes to coreutils though.

Ross

