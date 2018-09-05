Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id B5DE0745EF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 15:56:18 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id u11-v6so6173376uan.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S5cJoPe8gJm7MFXUvj+w7VXcQok07EiFncF/W6k3Xn8=;
	b=FyP5hJBf0Tt/Pr1/NuaHQdbnkrUu2jQ/59UftMsEKhZEwpb9OFHxd0PmCee+NKe5ps
	tOqmznw5219nekPgEpng0VACd4gLgdrp6SyFzlMozrvPULWPpJpUph8RrDIAQB3o+5Lj
	5SobgncWoT6QNdpJzNGg7SLfNXQkweAP+a1hIOMbe0xbYzVXriTTs5FKd5Si0h5CyWNW
	9W+A27mu4wfoy1xiIZb+jd+O5d87WGwGfmd1g2NKcaZ5hr8jDwBo2N0VDjncb9CtPopN
	7BXzVAJA9NjNoPObE52S2kwXY3+kwtYmQVOtnSQCkY/xYK00fXEct7KSz8YXBFIDnPpG
	Ooag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S5cJoPe8gJm7MFXUvj+w7VXcQok07EiFncF/W6k3Xn8=;
	b=jsNZ5ikSmMrDIYEU2C6BV9xKAWpMfwcbqeJi1FlqzMQOb+SwqsienW6p5FNgUx+SnQ
	cRFsc721ORZFEbNUTdjBA4ls4mizA7ZoHQIKxmy0V3gMunN2idbCDdHnam2ewDqaIQJT
	eHyfprWd3nG4I/q7HY1Xti6tOnlN3ue+VAuqy/g2HX2RP8P85GUEgwY/brbyWn5aO1M6
	NlHOeiZ5XrjKHVaBIjgVtHFctPNF3z6lDg61R7tp2EaVKguyH2e2HHgRHlf/AAFSwZw9
	X5a0VNRXxu8/aozfhrUTKQxYq64XZaWZkU3ecv0+AO3Fr7MMKubhj4qScmDtstbRcZi1
	xCHw==
X-Gm-Message-State: APzg51DldsBvCVXRBOdccIRLP9ZGIRFocDgxO/nPU5WxdlJhzrDYxkTK
	iNkmXOd1jy7/cOPQMMNVYAAMC6xOCy030JJd25A=
X-Google-Smtp-Source: ANB0Vdb0gm3vt/uyHjGdFpxOihK89V6iDkV3wTbwBCnuJA74ZW5csBxB3rwB+8L9I7qIlTtFwvdhA/jrzQ1Hb/ZKR5c=
X-Received: by 2002:ab0:5103:: with SMTP id
	e3-v6mr21316883uaa.62.1536162979622; 
	Wed, 05 Sep 2018 08:56:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 08:56:19 -0700 (PDT)
In-Reply-To: <31af238ebb7cd5b1be0188a4d705ba93db8a490a.camel@linuxfoundation.org>
References: <20180904155000.3715-1-ross.burton@intel.com>
	<CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
	<23275ba8a359cdc7edd4f0f85bcecda99bd60aaf.camel@linuxfoundation.org>
	<CAJ86T=V1rPqM8EYT+y-U2gt0znODtNZ7enaGM5TVBMnPmefgVw@mail.gmail.com>
	<31af238ebb7cd5b1be0188a4d705ba93db8a490a.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 5 Sep 2018 08:56:19 -0700
Message-ID: <CAJ86T=V08rjdLaEbGFnbF_NWgE1CEF8QA7LELwfrixmNA0DdnA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] os-release: fix to install in the expected location
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
X-List-Received-Date: Wed, 05 Sep 2018 15:56:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 1:47 AM,  <richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2018-09-04 at 19:04 -0700, Andre McCurdy wrote:
>> On Tue, Sep 4, 2018 at 3:36 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Tue, 2018-09-04 at 13:19 -0700, Andre McCurdy wrote:
>> > > On Tue, Sep 4, 2018 at 8:50 AM, Ross Burton <ross.burton@intel.co
>> > > m>
>> > > wrote:
>> > > This probably needs an "rm -f ${D}${sysconfdir}/os-release" too
>> > > to
>> > > prevent problems if install is run twice as lnr doesn't handle
>> > > the
>> > > case where the target already exists.
>> >
>> > Doesn't do_install clean out ${D} each time it reruns though?
>>
>> Yes, it does. Sometimes it's useful to rerun the run.do_install
>> script
>> manually though.
>
> We don't support that, I think its reasonable to assume that ${D} is
> empty at the start of do_install. To do otherwise would mean changing a
> lot of do_install functions for very little gain IMO.

Most callers of lnr already explicitly remove the target first.
Ensuring new calls to lnr do the same as they are added isn't a lot of
work.

