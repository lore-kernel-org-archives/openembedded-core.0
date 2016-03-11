Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 63A15612E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 19:09:28 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id tt10so106773077pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 11:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=kt2Xy34Y8uMJR2xZRu7p9dKYO8JIQCsNQVJQYkJ5BoQ=;
	b=XDk0sQyMv02SAC2JIZyoRSRRyB+jakNwF8h+miVsQrEU9JHg2A87b+FYi6quyhvIng
	fJQrNGr4ArxOnt9LdZNwxhcwzkK5pmcws2yk4vfOykBho5AKGqrI5234eDCmezeJeaWD
	ySyciITUDjTi2MWbYRFerJaE4uVE8IZOsBGRq0JP3DrpqBGna753K6jJkkcTvj3kj8Jc
	blQEMDLIfyEaVtXmqTkTiER28KkoYGMaNgsQzuEd/HXgHRDvcMDybHxnxQqWUfRVvece
	9yt/HABDC/GK/kFEEP5Qm449yEVut5NrbNTqFGghU20uWSluJewQjKo1QdnPbc1ZzQrn
	N6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=kt2Xy34Y8uMJR2xZRu7p9dKYO8JIQCsNQVJQYkJ5BoQ=;
	b=Ng015GVkg7dY0bT7pqI6COUnLFG33WchYC9UI6KHeFxfGwFJv/Xo3r1cnuWFbkYeRU
	1OiEHVZ16OcUSBtmv44Xz4npeQg2xMfpBkdidLiveCmZyFlJ2jJRPDNpdiG16MvGtbw4
	hKVjH0lw0mygDm+Q2YZ4BUDKvfRcHtbsaYK+P3AH2XgRUjr2X/Z0JXSrg/lhBRWjAjix
	j0Ksd2AQ/hy80sEBevc15dPOYP0PeeS4A1HiBPNESSIJlTNUO3fYFSdKTAEPc6pT7zll
	LDzEd03AsfJKsSvWwwcsDNl22d4Hs0yl8RGcZjbeyck5zrcD7+1OtsrLoHQD2OxoLeyE
	PYFA==
X-Gm-Message-State: AD7BkJIp8hIRs4Z6etn1td4DHPEqCpTKNdLY3qd1OZmOgdMzi8ZTqIb5zDFZx5dEuY8lGQ==
X-Received: by 10.66.190.229 with SMTP id gt5mr18468223pac.118.1457723368906; 
	Fri, 11 Mar 2016 11:09:28 -0800 (PST)
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com.
	[209.85.220.42]) by smtp.gmail.com with ESMTPSA id
	88sm14686492pfj.20.2016.03.11.11.09.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Mar 2016 11:09:27 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f42.google.com with SMTP id td3so79564864pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 11:09:27 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.235.9 with SMTP id ui9mr18224960pac.135.1457723367090;
	Fri, 11 Mar 2016 11:09:27 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 11 Mar 2016 11:09:27 -0800 (PST)
In-Reply-To: <CAJTo0La3B=bGXGC1_M8c5qsUEF_kSZpGwfmw8+DHUUDEuOQdGg@mail.gmail.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
	<CAP9ODKrZMfa0bW6e3VRS+mks+OJNDJwSmXqxtRM_QgBTSK5mQg@mail.gmail.com>
	<CAJTo0La3B=bGXGC1_M8c5qsUEF_kSZpGwfmw8+DHUUDEuOQdGg@mail.gmail.com>
Date: Fri, 11 Mar 2016 16:09:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrdGLcXWLmuYbG=UdGLdUfY6ZoOaO+Oh6K7qoAXVUV_ww@mail.gmail.com>
Message-ID: <CAP9ODKrdGLcXWLmuYbG=UdGLdUfY6ZoOaO+Oh6K7qoAXVUV_ww@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 00/12] Sato desktop upgrade (Gtk3 etc.)
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
X-List-Received-Date: Fri, 11 Mar 2016 19:09:28 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2016 at 4:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 March 2016 at 18:53, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Is matchbox still the way to go? To test OE-Core maybe a custom GTK3
>> app might be better.
>
>
> Do you mean desktop or window manager?  Window managers are very non-trivial
> and matchbox is a known quantity, and the desktop is a custom GTK+ 3
> application.
>
> To expand the functionality of Sato as a test harness I agree that we need
> more custom applications, there's a bug for this already. You'll notice that
> over time the PIM applications have been removed leaving tools for testing
> only (such as gtk-player).

All them; we might use GNOME (MATE or other WM) and write just a GTK+3
demo like app for test the desired stuff.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

