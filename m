Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 359B171AD4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 19:29:11 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id r185so1031533ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 11:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=NRj8I3Tb1E4cgo/wVgJOml4Q1yqKWYRvntPyzrV5f0s=;
	b=1n0FDP5Ym81tx4CRo9TkF55lOXsMdbco7fJZ928pp5tOUorZGbk2N1kxL+P+ZlLwbn
	ojU+TeTn7mKkKrE0lMQLK4oU4LbtNAknrI3Ai9tcLOK2iNOPRkTCBr19tH9Xvi12ss7K
	OAWJNxQZQ1O5WdMl2+tVD9urVv5YdE2SuCkjbQFrymxP7l8zEwvqo77+DsdRJW0eZ2Dz
	tN1AZ8kK5LeqIXtJuoHOlViVvxiF6j9vIA3T4hScYcKSc5bEt7oFc3K1iHOPb4nYcERi
	nya1kXAToce2idmzgWPiP7y0aowiYSKcSFlD9Ozxc497pSAjz/2+ClmSNCxho99OybDI
	TpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=NRj8I3Tb1E4cgo/wVgJOml4Q1yqKWYRvntPyzrV5f0s=;
	b=l9aZwawzUhXIW81y+z2a8OxaomCkZqtlU0QLdJZIEOzprDjz354LqvqVqDikrjrEVB
	5SujKmOr3CS/+ADlMuyqvzHhYTJ6ektCdBLDm/T28p1OBTHD0QMRHLbLwICpkksWsfIK
	+LAQJFfvnruKugLYlNQUvtraygUPRqwwI2RnZPKNjbrxq15ncYxALiUJR+8TLzJJ9wRG
	hHq06kZvbgQT9rJPxCBKtKc1ekI163Z76kD223EIN8D3ZbSj+PMEhXvx7Q25RkEclmaW
	wOGl2VLvgT275DNR/btc3I41HI79rf+MoerFw0lj7WRMOqpon5hiG3Tlgpxw2IdwSOMi
	gRrw==
X-Gm-Message-State: AIkVDXIgg1gHhxTbPfknFzTjjBHv4bbwan2iekcFTk3ZaLnwsx16SCajpMOn3B2nuIPB970C
X-Received: by 10.36.66.4 with SMTP id i4mr7442704itb.67.1486063752119;
	Thu, 02 Feb 2017 11:29:12 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E270.dip0.t-ipconnect.de. [93.232.226.112])
	by smtp.gmail.com with ESMTPSA id u63sm1392307ioi.4.2017.02.02.11.29.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 11:29:11 -0800 (PST)
Message-ID: <1486063748.14889.56.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 02 Feb 2017 20:29:08 +0100
In-Reply-To: <lyk298eb4q.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1486031880.14889.35.camel@intel.com>
	<lyk298eb4q.fsf@ensc-virt.intern.sigma-chemnitz.de>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: host-user-contaminated QA check
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
X-List-Received-Date: Thu, 02 Feb 2017 19:29:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-02-02 at 18:49 +0100, Enrico Scholz wrote:
> Patrick Ohly <patrick.ohly-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
> 
> > Recently the host-user-contaminated QA check triggered for the trousers
> > recipe in meta-security:
> >
> > WARNING: trousers-0.3.14+gitAUTOINC+4b9a70d578-r0 do_package_qa: QA Issue: trousers: /trousers/etc/tcsd.conf is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> >
> > However, that's a false positive in this case. UID 1000 got assigned to
> > the "tss" user in the target sysroot during the build, and tcsd.conf is
> > correctly and intentionally owned by that user because tcsd checks
> > ownership and refuses to start when owned by someone else (including
> > root). It just happened that the UID was the same.
> >
> > This is likely to affect all recipes with files owned by dynamically
> > created users, in particular when the host system assigns UIDs from the
> > same range as the target system (quick poll: who else has 1000 as his
> > UID on his main Linux box? ;-)
> 
> Usually, this can not happen.  There is reserved a range for dynamically
> created users (standard says 100-499, some distributions use 100-999).
> 
> In this case, there is probably some '--system' flag missing when the
> 'tss' user is created (--> packaging bug).

That's a good point. I hadn't considered that.

In that case the QA check has found a real problem, albeit reported it
in a way that it wasn't obvious what was going on - probably the message
should get extended. I therefore retract my earlier proposal.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




