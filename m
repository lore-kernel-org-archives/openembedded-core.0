Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6B760B13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 07:51:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v2so1772077wrp.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=FetdnZf6EsKi/nXRHr+ciWhhoRRoNMUbCzXLW6ZoB7s=;
	b=bHACZ0MKmRI/9yhstZcTw37AhlJH1Gj3Pj/NPorfXFHw9YqbRtDTCpSCY4OOEi1irA
	bEfKda8eWUW1hEQYrKj1rdjNMyjQVjmC5FXynerawDawdVZtGik8oatr42mRES5XOLyi
	rbeybFLcmZe+1eAQbj7i0AOVYLlotnyFboDiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FetdnZf6EsKi/nXRHr+ciWhhoRRoNMUbCzXLW6ZoB7s=;
	b=efD2nBdc/PF1gy3y5QrgsF2ijWOrscab0pLHDeMWMMmRoIbrBEInzj6tv5prAzcvFR
	IleSQmET3+1tzj5MXy1tpQRB6vqQ0vILkdQXz9JlRXCbMYGKIwdYBiTKu3Z6eMQShd1g
	Hnb+qbThKTRGIozWyMEK7h5fCTpoXC0k4I/oUTSyy569q1ST1g99WBOXWFzzyiQiId96
	+lzG79blGJNVEzdQdPt4YXzgK8h9VVQVRSqBQAmR6nxFly/jVfeEJwfkHqIvQ11KsN99
	d3x7nkaqUNY6HO4zevTygfeb/KjuwRA9ceJIKXPHxDQ2BxXtUh8knjFqKo83nqdAKN+K
	l+0Q==
X-Gm-Message-State: APjAAAUesawf8wXgR3VrLP8HAjO1UaiHIu82DYxiHkeBjNL6ZKn1t8no
	9hdQm+IvwznDacB9SuElKNxXvQ==
X-Google-Smtp-Source: APXvYqxHhOA6ZDeNcHe1xl2lZwFgUbfARuWxBXojXT69XpNm2RIQ014DMA2o390UKwyQ8Kbr223O1Q==
X-Received: by 2002:adf:f745:: with SMTP id z5mr1737411wrp.54.1582876289884;
	Thu, 27 Feb 2020 23:51:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b67sm986308wmc.38.2020.02.27.23.51.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 23:51:29 -0800 (PST)
Message-ID: <749ffe7adcb1acef017652e71e8d36b70d79d3fd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <trevor.gamblin@windriver.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Fri, 28 Feb 2020 07:51:27 +0000
In-Reply-To: <40e95e22-241a-d98b-63a4-f557bdb8ef9b@windriver.com>
References: <20200226180746.121476-1-trevor.gamblin@windriver.com>
	<20200226180746.121476-2-trevor.gamblin@windriver.com>
	<CANNYZj-EJ8kzbvRd5fnb2HKGUHFVnmnZfMfta99cFxO+q8Abpw@mail.gmail.com>
	<a0aceaefac62b9b582f8dba155f5d6118d096bea.camel@linuxfoundation.org>
	<40e95e22-241a-d98b-63a4-f557bdb8ef9b@windriver.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2 v3] coreutils: add ptest
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
X-List-Received-Date: Fri, 28 Feb 2020 07:51:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-27 at 18:51 -0500, Trevor Gamblin wrote:
> On 2/27/20 6:26 PM, Richard Purdie wrote:
> > On Wed, 2020-02-26 at 19:13 +0100, Alexander Kanavin wrote:
> > > valgrind, gdb and strace are already pulled into core-image-sato-
> > > sdk-
> > > ptest (the one that runs the slow ptests on the AB), so there is
> > > no
> > > harm in adding them here as well.
> > Actually, there is.
> > 
> > Adding valgrind to the RDEPENDS of coreutils means all builds end
> > up
> > needing to include valgrind. We really don't want that.
> > 
> > I know this is bad but it is the way dependencies work today :(
> Should I resubmit with gdb and strace?

My personal opinion is no, these all end up enlarging the dependency
chains too much :(

Cheers,

Richard


