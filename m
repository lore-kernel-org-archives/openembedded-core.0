Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id B7E7471DEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 21:46:31 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 203so85276829ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 13:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=oX+cAGbTrvYJEtReGaLbA5Z1F6HGFK0saDWhlT5l0XA=;
	b=1aTeXZ/4ESUzEOFYHcTxkOSbjjGn2qvlGoPtTRdqwz5Y2bTNIUF6Og7MaIcXA77Jf5
	XV0JHRt53Si82pvOHUzbugP6DlndJah3plS7WDsVX6iUvPlDagZHIYvbKmiyz6p5qF3Z
	V1bZlWwYpdBBEPauUwKyIybIV5jcy0mOuFXUpjXVl3rxiArytGDJ3OrQ2X/olNTkzoXB
	dMuUSdBuC+F75TGIHR9SCMvAknLm25Gy5Wfi5js4r1mpFIb5+GSFI+FVJsF+rT1xfF8z
	pNVKSnMk889A/1mtKYwDkJmjwZbeYnyiaSVDI5Xg7WZoudsUGiE0CVv4snwk235bz3tC
	V1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=oX+cAGbTrvYJEtReGaLbA5Z1F6HGFK0saDWhlT5l0XA=;
	b=HZ0kDq1nWnB/gsuy3gh/7xwujK2ewlu9LkNSBJfEKXs5pgkWvToppak+VghuTDyBi3
	20eldXZT3IVdizVl4TC7aIM4T/Bz0qOoMuUAn/uxISudTFHNAAzP3fMGXWOyXjxb4rYx
	yW7o/sZaJzgO+z420nLKm8hhqgXhPbNMr7OQIW3FuIwqKM1NR+HU/nwB1lnd4V5Fo03l
	jLyoghhTpLTul8NnqAoyKDmZhDAksLdyHMBrx1JZaVP11RbJ4GMWfymQ+rge/pz+u1ET
	jjl4FV30ZAWWOLaOMH1B0NPGnVNaTrgrd2CPogwHi4Udy0WIRkaoit2hgNO7YWtsBrfH
	zaNA==
X-Gm-Message-State: AMke39kAukVtG4wyWh/iNGiKdN54ytWML1R2k0iedrlouOSoCX/rGT57mOBWCJGxExdppAc9
X-Received: by 10.107.187.133 with SMTP id l127mr17773082iof.1.1487627192892; 
	Mon, 20 Feb 2017 13:46:32 -0800 (PST)
Received: from pohly-mobl1 (nat-wv.mentorg.com. [192.94.38.34])
	by smtp.gmail.com with ESMTPSA id k16sm5396727itk.2.2017.02.20.13.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 13:46:31 -0800 (PST)
Message-ID: <1487627189.4285.58.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Feb 2017 22:46:29 +0100
In-Reply-To: <CAJTo0LbtbBawLavjDkbxo4xWpqZZMp=ACDmwiLP=ab2DRHZ7xA@mail.gmail.com>
References: <CALbNGRQNaoktrh_Jk75DxkV-qVv4B9T57oCP3js5k=JApbO+pw@mail.gmail.com>
	<CAJTo0LbtbBawLavjDkbxo4xWpqZZMp=ACDmwiLP=ab2DRHZ7xA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe specific sysroot: handling recipes creating same files
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
X-List-Received-Date: Mon, 20 Feb 2017 21:46:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-20 at 17:08 +0000, Burton, Ross wrote:
> 
> On 19 February 2017 at 22:04, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
>         This needs love: One can guess that libldb is trying to
>         install stuff
>         already there - nothing mentions samba and the error pops up
>         for gvfs
>         which does nothing really wrong. I consider this as bug
>         introduced by
>         RSS.
> 
> Yes: without RSS this would result in a fatal error when the second
> recipe wrote to the sysroot.  Can you file a bug?

So it is still considered an error when two recipes produce the same
file?

One (IMHO valid) use-case for allowing this are configuration packages.
You could have a /etc/motd packaged in foo-motd and another in bar-motd
with different content, and then build different images where a suitable
motd config package is added.

With a single sysroot, one had to introduce alternatives, which is more
complicated and introduces unnecessary symlinks in read-only images.
With RSS, it is possible more easily.

Having said that, the error report generated when files overlap in the
same real sysroot definitely needs to be improved.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




