Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 739D3796DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 18:29:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z14-v6so6877097wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 11:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7Wz0D4UJ8QeAvD88fnYLbtVsAqUTy9+A/Rk2Ooy5RTo=;
	b=S0udYZkGhjWqgd3n1HvuO7fB8Uyfp/7k5fyOJ03/pVm7mL6jkNccqJnevi/6QF6RKD
	F0/CeH34BLb5Ry3VphqyUbtucfjvU6l2OdvYFMeLsy8+LyytT0Ev1F5tcFcb5FChj5Ze
	liuA06EkTiBQ71zH3ysfIGWajkCejhBXSWOeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7Wz0D4UJ8QeAvD88fnYLbtVsAqUTy9+A/Rk2Ooy5RTo=;
	b=ZWU24e1GUh2NEpjhaY32zST0BBP5hoZoN9h6xi1wuzmCrdWl/56uv+Bvzw/arQrDuQ
	yMZhwryIu1ltzQ6NB2x9obPrhilo/D+JrFGIGB3edAKxxE5dlfXUpRZMbimUajCfIJAk
	VqVSWBTJ+dPXZQyRQt+sIZDuauGTePIa/T3FIiBe9cd80jT2E97Y6qGVYiBm/ow/oeTV
	dAlgE7moAi6UlDxKIs+jLEnklokDOkMeSt3jBOczEk0Fv3dXJf1Kk6baLlkx7s3jJfwl
	sykyikHtkl+8DQ9V5GVWbh0CqfbyWr6+ACpFw4nTNvtjXCylMAE22h8Mzp14sUNjd8Hr
	iOmQ==
X-Gm-Message-State: ABuFfojq/sMjastqjqAdEv7S1ZfvKLBMOri216r6N8Kyjt/AWY2Xlr+5
	NtogS/Xf1eGSDVtQJvjtgAFgGA==
X-Google-Smtp-Source: ACcGV63/9aNRdwH2AkZS6KWLhDtQD7nRNbRsgjowep1PCEM+PBoAulltPj7i/Xr+eBEMNYM8j1rm7Q==
X-Received: by 2002:adf:c3cd:: with SMTP id
	d13-v6mr2292774wrg.68.1537900164902; 
	Tue, 25 Sep 2018 11:29:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z4-v6sm2294983wrt.89.2018.09.25.11.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Sep 2018 11:29:23 -0700 (PDT)
Message-ID: <1eaae84530b4f3f3c7c5eb2a3ad961aef7f8fbd6.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mikko.Rapeli@bmw.de
Date: Tue, 25 Sep 2018 19:29:22 +0100
In-Reply-To: <20180925171119.GV9430@hiutale>
References: <1537871293-32494-1-git-send-email-mikko.rapeli@bmw.de>
	<20180925104443.GP9430@hiutale>
	<576c5e5174123059cfa49e8cf647716497a35610.camel@linuxfoundation.org>
	<20180925112117.GQ9430@hiutale>
	<4d8f4e7d3c76db6acca576b8b31c5fbe9832b285.camel@linuxfoundation.org>
	<20180925171119.GV9430@hiutale>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC] insane.bbclass: add buildpaths_cmake and buildpaths_pkgconfig checks
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
X-List-Received-Date: Tue, 25 Sep 2018 18:29:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-25 at 17:11 +0000, Mikko.Rapeli@bmw.de wrote:
> On Tue, Sep 25, 2018 at 04:19:39PM +0100, richard.purdie@linuxfoundat
> ion.org wrote:
> > On Tue, 2018-09-25 at 11:21 +0000, Mikko.Rapeli@bmw.de wrote:
> > > On Tue, Sep 25, 2018 at 12:08:24PM +0100, Richard Purdie wrote:
> > > > I suspect we need to talk to cmake upstream about fixing this
> > > > properly
> > > > but adding something in the class may be an option until a
> > > > better
> > > > upstream solution can be found.
> > > > 
> > > > I am puzzled by the need to add a .pc file path check since I
> > > > thought
> > > > there was already a test for that in insane.bbclass?
> > > > 
> > > > package_qa_check_staged maybe? "Check staged la and pc files
> > > > for
> > > > common
> > > > problems like references to the work directory."
> > > 
> > > That check is not enabled by default. At least bash is producing
> > > a
> > > broken
> > > bash.pc (and several other files like Makefile.in and bashbug) in
> > > sumo
> > > with embedded absolute paths to build sysroot.
> > 
> > I still felt I was missing something:
> > 
> > ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig
> > la 
> > 
> > which sets "pkgconfig" and "la". package_qa_check_staged calls
> > package_qa_handle_error("la",...) and
> > package_qa_handle_error("pkgconfig"...).
> > 
> > do_qa_staging calls package_qa_check_staged() and is triggered by:
> > 
> > do_populate_sysroot[postfuncs] += "do_qa_staging "
> > 
> > which is set for everything and should be running on master?
> > 
> > I had a look at bash.pc in a random local build and there is no
> > hardcoded path in it for master. I then found a sumo build and
> > looked
> > at bash.pc there and also no hardcoded paths.
> > 
> > The issues would have appeared to have been fixed by:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dabbfe23de0615
> > a958fac31b83684ade024cf17d 
> > which should be in sumo.
> 
> Cool, but this ignores nativesdk, which is where I saw the problems
> with this test. Somehow missed that nativesdk part in my reply,
> possibly because of plain recipe name in the error message.

With the addition of nativesdk, this starts to make more sense...

> > What may be the real issue is that sanity checker is quite specific
> > about what its looking for and does do:
> > 
> > file_content = file_content.replace(recipesysroot, "")
> > 
> > which may make sense for .la files but perhaps not .pc files, I'd
> > guess
> > its to stop compiler flags triggering errors. 
> > 
> > So the real fix here may be to remove that line from the .pc check,
> > at
> > least in the target case (native case it would make sense)?
> 
> And .cmake files?

We should add something to cover those. I was just worried about why
tests I thought were there weren't working. I do think we should
fix/improve the existing pkgconfig test rather than add another similar
one.

> I've fixed issues found by this test in my tree by following the
> pattern from these "improve reproducibility" fixes. Some recipes were
> installing generated .cmake files from build tree (bad, bad) and
> several recipes were somehow generating .cmake files with absolute
> paths for libraries. It's completely unclear to me when and why CMake
> decides to fill in absolute paths, like with libical.

I'm afraid you probably know more about cmake than I do at this
point...

Cheers,

Richard

