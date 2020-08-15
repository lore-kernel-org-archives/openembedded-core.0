Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.1794.1597478135452810514
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 00:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=R9D7WtZ7;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rxex=bz=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BTCKH2nZlz4C;
	Sat, 15 Aug 2020 09:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597478132;
	bh=2Jjrg46lfk+46vDy0HmmMk2T1YUR5/J39s9A0rk8wUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9D7WtZ7pDDpg94aUu0eIhJtqKGHMomRpqfe6aP72OiR7oi6bs2LMddGMgOhLVwAS
	 7u3Uir96aKpubz5ZUDdjDEUY5GtR7RrRoW/JVKZvjsLoEG/CikSEXlTUax4Ph1YLCW
	 oYmUUC/AzjZGjUxErvAouhutI3e6U8Wq2QSZLf9hupfzIgEDgbAuEPSHzwai0/0bEq
	 J0wWbKPvacht5lYhiwnYNoGgTFntoCEWlnwg+Kn17dsi5qjd/oITQMvVXeq3CpqaKJ
	 UiFEBcoMvURT2r5f65lL28vNUzjCot88AwkSP5RbgLvH4di69xbYzLV+LS/swd90Qs
	 EjK7xkT3ZK1S/4L6qKAmctNepk/h+eXCfyVbrdO4DlgUw9xma9XxobVTx2tGHI0yXI
	 QIOC78qg3maKh1WyotyQjX4XOi9NhTLZBxE6Nr3FHD6kRg5as/ybsYwNrt4lHadjHK
	 zyNBT8ji92m/lxwWGMaxbtGYSn3twYk6IJvTfYBDB4xNpOoyflFsgy7TLtqsnxOver
	 pZtnCfoXBkDDzU9ClyspZA+wfkasa7zIOTqiRID6rLku3Y/dK8FYynpW4zKlc9rteq
	 x3yDuqwJbh1BZmU9kK9A3iVScfDGNC25AoezsYJOfweleJoXsoSYi5gPsdgVFQC04L
	 x3aeC6n9Z6Bn65LtQ2I6XOzw=
Date: Sat, 15 Aug 2020 10:55:29 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Leon Woestenberg <leon@sidebranch.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell] [PATCH] cmake-native: Use cmake-provided zstd library; supported host distro zstd may be too old.
Message-ID: <20200815075529.GC31467@localhost>
References: <1597438000-20251-1-git-send-email-leon@sidebranch.com>
 <CANNYZj9i+s2ORHFtJDZDHJUQ2pfFHAbJdK+vp3cFSp5ZHNuitg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9i+s2ORHFtJDZDHJUQ2pfFHAbJdK+vp3cFSp5ZHNuitg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 14, 2020 at 11:44:17PM +0200, Alexander Kanavin wrote:
> This needs to go to master first probably?

Better for master might be moving zstd from meta-openembedded,
and then DEPENDS on zstd-native?

IMHO moving target zstd to OE-core is already overdue,
so this would not be solely for cmake.

> Alex
>...

cu
Adrian
