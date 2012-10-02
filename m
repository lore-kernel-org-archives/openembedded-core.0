Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJ50F-0005mt-7R
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 18:07:23 +0200
Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 02 Oct 2012 08:54:23 -0700
Received: by iebc13 with SMTP id c13so15443209ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 08:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=lGS17MHgEIhe1U5VWZjdlhqQfG4GBrVYs7hSkJLPjAw=;
	b=D4h+5uiGa0Gdt3NY+XrK5PYYwlYtcLAGya5gtDBDYbdSOsJuovfMfKl6mMgILhKw5V
	iKJOFI9fP+co9UaddBVxuO2sUl85axrRPLN15Ofe89jPudrQKYbCKiGEJtPUgMmErUlZ
	1ULzeB6JZ4TNhPODcaHI+VBPiHfoyp2FV+A/ScfSNyNyU4fyDh52xGtd9Xw6Dt30kQz6
	QlHu/MswJmQvxiR9YNCENwgPxijGgMsPhjoXiXXvOYzsK3gH15uxlHCmyarX/HDCKOds
	+d3oHOf78GFiWWU8RC2zWKQ6h++Wvrnmteg2LtMyCIz5ikUurr4k6MgzHcAu/9B/cNfN
	w2Pg==
Received: by 10.50.7.212 with SMTP id l20mr9213497iga.43.1349193262874; Tue,
	02 Oct 2012 08:54:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.141.70 with HTTP; Tue, 2 Oct 2012 08:54:01 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6CA1BD@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
	<1348795994-21695-10-git-send-email-msm@freescale.com>
	<CAJTo0LYnnA868v3Dd5yDWn9wpXS3QsHLt0P8Ejj0BZiGmwd-RQ@mail.gmail.com>
	<CAEsOVNeVxSgoZR6jQyEQ16P-_b+1_AQPcpFqcO5NPr=j8SkDVQ@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6CA1BD@039-SN1MPN1-001.039d.mgd.msft.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Oct 2012 16:54:01 +0100
Message-ID: <CAJTo0LaecR7m67KAK6rpQg5t022zxWufvZ3+PPbx-Kpb=-6vPQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Gm-Message-State: ALoCoQkg9bIPPWRgpWKUdx8bTQbZBOJRSyGPBANbHFPIPQNrvX9M8AbAo33bZ+PmpUOJZGNqhvmC
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 10/10] libx11.inc: fix build issues for older CentOS distros
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 16:07:23 -0000
Content-Type: text/plain; charset=UTF-8

On 2 October 2012 16:50, McClintock Matthew-B29882 <B29882@freescale.com> wrote:
>> Yea,  I suppose the the host compiler should be checked by autotools
>> if it supports these warning flags.
>
> Should this block applying this patch to oe-core or will there be
> upstream fixes before 1.3?

This is the right fix for the short term, fixing upstream is more
complicated because they have the pain of Solaris to deal with.

Ross


