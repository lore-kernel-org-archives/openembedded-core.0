Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id A4ED371A91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 15:49:45 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id c7so38139391itd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 07:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=FjU6DbmI64KTTfUn/iMDF+gmZikaKjzCt2AXcb6X0Y4=;
	b=SM3PBbd5qgdM6y+lkD5ZCteTf5iUpy6+XCDhuBNnL51KV7DYWcBXGQfxL+ejxwMZqO
	mzaTSBF07BtRB3Nf/o0zjG+vfCWKzesrfiMLakoGpfwfJBJzjpAco5SY4Rk3UuwrEF9u
	fhx9kjnwGld9IeKWewzkeED0m8AxR6oYX5h1BDngX0VJyOzCSyrx4OfrB3k0y0OLbSIk
	+m9mc/9un8WyS3HniFqviqBPhziurl9kSpDK7Jw6kIt+OnhlKVyNEMKuagtyVgp/3lsH
	cG5klIG9wkloAuZMPjXsUO8vH9jPjNuDbJkawMaLL3AqMLU0xgdIB3uuY7wLVZz0lneo
	pXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=FjU6DbmI64KTTfUn/iMDF+gmZikaKjzCt2AXcb6X0Y4=;
	b=Z0/lHm9caZsZt5Diznu7PkklUI1K+fAy01lQYfIzFlo56sKc4/tyVtyqxaoE8eQe9p
	spkuzgHFiV1g/iDdNMmPzTVeUU+pB2rDHMjK7lq2scexQRet/t0NpJ/U/50n8WXZ1Zg7
	/nLNYIa11lJ/8+8F12AwT9+EuNzPsfyOYXK55/gfD8ib0kx3MdRn/BvkEcqcGQaXCuZC
	6el2X6wwUbqR+2HvfPjSG4oALFvXYIr4eKbldT0hsYpanTnP2m0wFIJ6aFSLonK2Fvn8
	QOYuB3ltSItTDySFzP2XRL7sbkt3cuCBC831i9tNln4Mfr8/qnjB9PAYScUFjmmFAu9y
	MsCQ==
X-Gm-Message-State: AMke39m+Ad5zitOgJcXymMUvJnXW7fUqFhqwiJoQ7uUPpKseul/IbnGWu/o7wRMzSeqBkmj8
X-Received: by 10.36.88.207 with SMTP id f198mr4129337itb.44.1487087384996;
	Tue, 14 Feb 2017 07:49:44 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E015.dip0.t-ipconnect.de. [93.232.224.21])
	by smtp.gmail.com with ESMTPSA id d12sm478067iog.53.2017.02.14.07.49.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 07:49:43 -0800 (PST)
Message-ID: <1487087381.13854.350.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 14 Feb 2017 16:49:41 +0100
In-Reply-To: <alpine.LFD.2.20.1702141011420.29478@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702140930180.28864@uk63952.mitel.com>
	<1487083875.13854.331.camel@intel.com>
	<alpine.LFD.2.20.1702141011420.29478@uk63952.mitel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to select for non-volatile /var/log?
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
X-List-Received-Date: Tue, 14 Feb 2017 15:49:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-14 at 10:12 -0500, Robert P. J. Day wrote:
> On Tue, 14 Feb 2017, Patrick Ohly wrote:
> 
> > On Tue, 2017-02-14 at 09:31 -0500, Robert P. J. Day wrote:
> > >   i recall, once upon a time, a discussion of how to best support a
> > > non-volatile /var/log directory:
> > >
> > > https://patchwork.openembedded.org/patch/90151/
> >
> > A more recent, but also still unmerged patch for this functionality
> > is here: https://patchwork.openembedded.org/patch/90839/
> 
>   "more recent" would appear to be a relative term, since the date on
> that is may of 2015.

It was reposted late last year, I just didn't pick the more recent entry
in patchwork. Here's the current one:
https://patchwork.openembedded.org/series/4028/

> it seems that this topic comes up every so often,
> then just dies. so is there any *current* discussion to add this
> feature? be nice if this issue was just resolved, one way or the
> other.

Fully agreed.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




