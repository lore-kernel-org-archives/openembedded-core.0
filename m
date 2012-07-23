Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1StFJU-0006W2-Rc
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 11:52:29 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 23 Jul 2012 02:41:00 -0700
Received: by ghbz12 with SMTP id z12so4768078ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 02:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ibmhSzd2dHpMqdWSOE2ABg/J61N9eE8SpJLADN1QEOU=;
	b=Q0zeVFl2PjaQpzvEu7MEXZ86NZ4LprCvvX2EUaT5c+RR1HC7NnrNRvGNc2GzHu6E1P
	ZQlvPHnlrTE3XOW9tcDpSlsJhptFzqW3dDE1luflu6xRxEv5/zL6wjVdAKBKjdB2mkyr
	FyPfqycB+5ORyLV3+A4s5Q8TPVR75swh/GumG6t5lQQpFmD46UBdzl4/qIBaI+S5IVms
	Ox+6vaqEDTqUpXkMP6qYDuPvXCJG+KaIlZRiSzlWF2U9pBPSSUVIs/kUYN6V40FsUbuF
	eLtE/kWkXKa/pDupBwXLSNwaO4YD109OuWoYEJFI+kQjH5ZVg60x5I4at1LuDS/jn+EL
	xW9g==
Received: by 10.50.191.163 with SMTP id gz3mr4406556igc.30.1343036459403; Mon,
	23 Jul 2012 02:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Mon, 23 Jul 2012 02:40:39 -0700 (PDT)
In-Reply-To: <20120723091809.GC3271@jama.jama.net>
References: <20120722104320.C057610218@opal>
	<20120723081543.GA3271@jama.jama.net>
	<CAJTo0LYK43FiO-iJ3wQf3Dsid14ckSkW9cAGhKtBUV8sDACd2Q@mail.gmail.com>
	<20120723091809.GC3271@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jul 2012 10:40:39 +0100
Message-ID: <CAJTo0LbGnXz1UeVv6etPOsTVpi_mtFhBNLSDHeKK1Ci10zKOwg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmwhBIxoAaXsdZh5QL9A/9PNibAmHFk54qSDVfiD6+GzkNYD66rCS/Dz0Z6NHbg3/SOQQ47
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : Add gtk-doc-stub
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 09:52:29 -0000
Content-Type: text/plain; charset=UTF-8

On 23 July 2012 10:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> For some reason non-native gtk-doc-stub is pulled to image dependency
> tree for me after last oe-core changes. I'll check dep graph.. if that's
> not expected.

It's not in the core-image-sato dependencies according to depexp.  If
you could see what pulls it in for you that would be much appreciated
(I suspect some development task).

Ross


