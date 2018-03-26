Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8A057784F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 20:12:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v21so17772824wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 13:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mSwtwfs+cdIHpefX3FggTUesp0k9w+sYECZfk4SuU1E=;
	b=VQwdZzfjmbd29pgJHzrAs9JvUmGn1rWNhVi4Zj4BHvFTcerKT41eTsM7AJbd/vixBx
	7gmcnbksrPfq7DJtz/FZq8bFG4B2aUXgMYKnip8crPZkE84pYFWEYMuFa6fDnnG6V7Ad
	qlAaiNdQUKR1TSroFN82HxIpE0QJGAJs6aAZanAbPMczRBaLD/CLdyabaFWPVrKC7BxV
	wXIfLnfJYBfgqc1xpUtXk9blYVmkrwVE6mVZj/g1IuEutqeKuZsoH6choISiGzk5hYWt
	wPzrxuTrbWxDyUrHcvVttAYHbHzcRsKKJcIhhFFTsHa6lPX0T6KzBQ73gEzSJoDo/WCt
	+ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mSwtwfs+cdIHpefX3FggTUesp0k9w+sYECZfk4SuU1E=;
	b=ngqv2l9sq4ZhJiTtOhz1svEYE7n1rOVXG4dPcRsHE3diBJkohoxRzB5JHYyoliy9Eg
	evsWH5Bbl5fm9WTGqhfngZwi+FFETI9fIHC/DOc2hKaHqz9UvJIX5yt839htnXGWXihT
	fygFpmbimXKM4L3inOfEZfx0DOEv/JYZAPv2qCipuiu3M80C2EqBcWCEysv3nDJmR322
	STLPrugM8Lg7N1AaOv5ijte9OkEynG+6xz1S4HEiBjrdjqlgFlKGvnxO4NqK5qTnJnpm
	Ztj07G9sLjj3uumHPStpzjgLP4E/yzkKP/JYhDjr4eYEUN9VP8HGBXuZth0FjESG0HoV
	TPYg==
X-Gm-Message-State: AElRT7FxuS/oYC1aYNoaDEHLqjd+jtm89JUOIWSn7000OvnRJA89mL9D
	vvbQVuao++ZP8xUh84fAy7CvaZChDqjgAogtFe8=
X-Google-Smtp-Source: AIpwx4+GWD7k1WpQUkdtiQPVglzS6y7T1dBTe+OgD10OhdyjjHHNBHGXG+l2WSywDdNxWzX9YXu2ZQcrtulqsDrMIjk=
X-Received: by 10.28.53.194 with SMTP id c185mr6700220wma.27.1522095165071;
	Mon, 26 Mar 2018 13:12:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Mon, 26 Mar 2018 13:12:44 -0700 (PDT)
In-Reply-To: <20180326143107.48f153a5@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 26 Mar 2018 13:12:44 -0700
Message-ID: <CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 26 Mar 2018 20:12:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2018 at 12:31 PM, Seebs <seebs@seebs.net> wrote:
> On Mon, 26 Mar 2018 20:49:30 +0200
> Andreas M=C3=BCller <schnitzeltony@gmail.com> wrote:
>
>> Interesting background: mv/renameat2 change seemed so important for
>> Fedora that they backported the changes into 8.27.
>
> It looks like the reason for this is the RENAME_NOREPLACE flag, which
> avoids a possible race condition.
>
> FWIW, I've traded a couple of emails with the coreutils people, and I
> think at this point I'm going to try a custom wrapper for syscall that
> just yields ENOTSUPP, because any attempt to do something fancier
> seems like it's going to be potentially error-prone.
>
> Since the man page gave the ia64 example, I went and checked, and it
> is indeed the case that calls other than syscall(2) will clobber r10
> after system calls, so it's actually not possible for a C wrapper to
> do what we want on an intercepted syscall.

That's based on your assumption that a C wrapper needs to care about
results in architecture specific registers, which I contend is not a
correct interpretation of the syscall manpage.

Did you find any evidence to support your interpretation? e.g. Did you
find any examples of callers to the libc syscall() API which use
architecture specific assembler to examine the result of the syscall?

The gnulib code calling syscall(SYS_renameat2, ...) certainly doesn't
do that - it just checks the C function return value and errno. Since
there's no architecture specific code to examine the syscall() result,
do you expect coreutils mv to now incorrectly detect errors on ia64?

