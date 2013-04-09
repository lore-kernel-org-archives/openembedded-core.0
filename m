Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPVC5-0005bz-Re
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 11:50:27 +0200
Received: by mail-vb0-f41.google.com with SMTP id f13so4635022vbg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 02:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=eRo5Fk019jcV3Joq6SH+094rTIDynX78I1G+RIBI6TY=;
	b=fNq+G+aR2CWa64Se+Vm/cL4U8pwHNEM6uxur0Huae5p0EO4syH07NXwwGaEv2yNDRK
	xUFQqmAe3qErpoWkH/GBb1G/xJbUs5/Mp8c8O2cOm6NUHWKILbolYOpwaPrfevGuT05+
	E7sWRu3jP5rlEA7p64A1qqfteyWHxjUyN4lgvUikkJtePgbCzGavgn1oAXuP+H5kxdHj
	S41dS376j42rkjeMmvSLKCM73q6ZoGYrAdM103j+BnfmSwV6L7GHEAgckMpXmHkV0Zpe
	rHIcb2YiGu/gOCX3ezhcyx4qonVI5lYG64GSfB9Jr/9ArRkC2aYCT0jVCg2EAG20qayi
	w+lw==
X-Received: by 10.52.158.163 with SMTP id wv3mr5742964vdb.82.1365499980299;
	Tue, 09 Apr 2013 02:33:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 02:32:40 -0700 (PDT)
In-Reply-To: <51634C0A.5040300@pseudoterminal.org>
References: <5162038C.2020706@pseudoterminal.org>
	<51634C0A.5040300@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 10:32:40 +0100
Message-ID: <CAJTo0La+4zFbSu1s8mDQ=oWUEzasRgi9Ufg433qbB=8sbde1gw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
X-Gm-Message-State: ALoCoQl1vogJChHzt43vCNoZqaVLeAVR9f52s21NULkWApo1+O76/YWyITmSyJc2/dcvvPiRNB/x
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: gstreamer 1.0 recipes
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
X-List-Received-Date: Tue, 09 Apr 2013 09:50:33 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 00:00, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> thinking about this whole issue I began to wonder: why is gstreamer in
> oe-core and not in meta-multimedia?
> wouldnt it be easier then to move liborc into meta-multimedia as well?
> Or is gstreamer considered an essential component for many installations,
> thus justifying its presence in oe-core?

Yes, it's common enough, and I'd support moving liborc to oe-core in 1.5.

There's always a grey area for oe-core verses meta-something, but
there's no point in oe-core just consisting of gcc and libc.

Ross


