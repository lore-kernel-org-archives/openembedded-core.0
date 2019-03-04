Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id C32E46D494
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:45:31 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id z124so6850796itc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 02:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kGLbLc1eekfSbrxsKpAp3vmVHRZhrKKIF82IDh8iTJw=;
	b=xw8JlqszfmJCa+7bWOqJCOmI3qMdyRh0AdseOmkPCGNMlykrBLX1KUKJuDOkogMOkW
	LrF6STZ5Yn0ZoIWdMwbYirpYNRlCxad6nNwyU2k9FU8tYpMeyv3HMc0fTxr+eLufyBF0
	P0KJjyj24Jil1u37j6lpkfPjz3RIc9CaF10mKXiYN4wTBcPWW6m3qUAo+DlXx+pzNOMV
	rwrKt+UyYLl4J6G2sOfNm4nhbgf0/negMbEmzp0tgT8TWrN3e4jNoNJMM3JdlvEsQWAs
	X8gtsTlI0B9sKo7oQQIybUhUd91ntgKKqeRn9HnaXsWTPMvXOVPtTAAI8DIs70DQE1Mo
	v2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kGLbLc1eekfSbrxsKpAp3vmVHRZhrKKIF82IDh8iTJw=;
	b=HLIftmOpfD1XK7c4vC/ZQf7APKrhTL4DFp/8pYnp0KT0L4GeK9BoAeGrpFHp8bX/wu
	NAQbPK7jE3C2uFUfrXCIHUYxMzBpdjAYHpVeMrVNOL9Jl/MM9M3dPFvaT1rB3SNGPpuM
	3l82c98vS84L2KiRtTCR6SLd1ldeC+aFIw7kf9KGrgjNrxZN6SvT/MsMu9zf8RRkviQ/
	2FS/XQTttaCbtf45lfMo4Zm0vyd+wSTv5PbppdvdlKHus7EAVpLDK3ev0l4AsvRvmwsH
	As61LolK4nXW86wJPTrYiAFNvC07hLAHZVZPRDFGuOAekaCSfZ8I8/TLi+YESK0KZf29
	Lytw==
X-Gm-Message-State: APjAAAWJeL4jR/79enmQ4QFsBQTdUmtZBTa+DLeULvRnTaVBvSzdChmO
	mcsa3/6IHz2fSWphCQUEMIWwgZC2KyTi3xZNTxqaeA==
X-Google-Smtp-Source: APXvYqxWxVo6kilsHfigHqVyaRJXcaU1uLHvbXdsPoG2nIOYhPfQ/r1vnSekQzDJkC0lQljF9EUzTRdwfxXY8ydn/eQ=
X-Received: by 2002:a24:7294:: with SMTP id x142mr9617078itc.26.1551696332805; 
	Mon, 04 Mar 2019 02:45:32 -0800 (PST)
MIME-Version: 1.0
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<CAJdd5GaOk=asx=r1yVOEokMbiVPsk_8bdArYq1KzrNR22_LcNQ@mail.gmail.com>
	<20190303225159.GM5026@bill-the-cat>
	<CAJTo0LaOGr4iJh0r1s=wWOy3XA47-L+++Dq+zQOV5hD3LCD4Kw@mail.gmail.com>
	<CA+chaQeQ6CBXZLs_+-8znBkjNPLG1S49WcA3X7bivr-2fAmZeA@mail.gmail.com>
In-Reply-To: <CA+chaQeQ6CBXZLs_+-8znBkjNPLG1S49WcA3X7bivr-2fAmZeA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Mar 2019 10:45:21 +0000
Message-ID: <CAJTo0LZtAYkROXuABefAfw5WeAaw=1+fKX4OQnCAPM3sb8YnZQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 10:45:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2019 at 10:27, Martin Jansa <martin.jansa@gmail.com> wrote:
> There is, you can prune outdated duplicate sstate archives while still separately building multiple DISTRO_VERSIONs.

We don't all have 4TB disks? :)

Ross

