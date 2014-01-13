Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3504E6CAC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 10:01:44 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id e16so3868793qcx.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 02:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ynJHe2Utt83u5YVB48GRRQzNTDcP3mQz9COgDnjtfy0=;
	b=ANl5MkrjlW1sGF5Ws3v/BqvdFpynOKjjrv9zcBexi/UpCmpgxmv/k9OExfC4N1fjQ8
	FuLALjHhqRvMR58m0voXvUCdbNnfppNXhKhf007k57TnrnaoFVcK6EykfShY5I+1Iclh
	LsqKtPjIXGKspfeiwLg5YinMtLq/AetE0QPHFSh+TBKxdeVUc+TSEW7NwnEF41LGh7Mu
	nJM6MUWBw4kZozitJFwGC2sqiFer3cXUyU0VYZYkNdRyp8O8QRGwWSa6xJoVXW8NmE7O
	pleIh4f0HNQuamS0HLToHCvk5iI8rr3FaDH2M3gF+cjgA+xwbE84uYx7PHRtYh8BY9oS
	Iiyg==
X-Gm-Message-State: ALoCoQnn1ELVXcDVDJVMQncij3pcNyZi3PqHFRTrg8GCv5hazrYXDC5XPgKaPx3E1+fDxz82wXHD
X-Received: by 10.224.15.74 with SMTP id j10mr37819854qaa.26.1389607304913;
	Mon, 13 Jan 2014 02:01:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Mon, 13 Jan 2014 02:01:24 -0800 (PST)
In-Reply-To: <20140111204837.GB16995@jama>
References: <20131214090923.0609C50407@opal> <20140111204837.GB16995@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Jan 2014 10:01:24 +0000
Message-ID: <CAJTo0LZYMte2JV=d5-pxSeotySSy8-_BHpGdrEooEqg11XnbXA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Cristian Iorga : glib-2.0: upgrade to 2.38.2
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
X-List-Received-Date: Mon, 13 Jan 2014 10:01:45 -0000
Content-Type: text/plain; charset=UTF-8

On 11 January 2014 20:48, Martin Jansa <martin.jansa@gmail.com> wrote:
> WARNING: QA Issue: glib-2.0: Files/directories were installed but not shipped
>   /usr/lib/glib-2.0/ptest
> WARNING: QA Issue: glib-2.0-dbg: found library in wrong location: /usr/share/gdb/auto-load/usr/lib64/libglib-2.0.so.0.3800.2-gdb.py

Fixed by "ptest.bblass: Fix package QA issues when disabled".

> glib-2.0-dbg: found library in wrong location: /usr/share/gdb/auto-load/usr/lib64/libgobject-2.0.so.0.3800.2-gdb.py

It's not a library!  That sanity check should probably check with file
that a potential library is actually a library before warning.

Ross

