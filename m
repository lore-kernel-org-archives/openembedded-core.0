Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 141F379F95
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 16:31:13 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q18-v6so1781663iod.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lRM5aVY8sQFYBU/nVBXcNi9QqOKjpFDWTQ45SyEDH+Y=;
	b=tRuZFiHYIeIIZ5P99JwoPY+bTQI96ck6SYzPoaiPFeSWLoymoScnSm5VYVmVmYsMHW
	lO+u4NRwq093Q/tNp7hcvM/qPhRWd5dAgoU2pGOkWj5iFp//+hVrHBK6x5yJRCNDnLDV
	c94fWlNAfpVdFhxtoOiHN8zCujHBruxRyv4Tk1+jf+sGgoQNFbYpg6oUB4pUsTS8fSEO
	He3TXgE77ICts8Iv/6BfKwHCaKbXVqkZ/JuaNc6qG60ZHmyA72F5PdFRChg3k63CSp6k
	Qwfjvt0OqnoCJ1FA7+MpFg9LZ0Dl1LePv+59pDtJhvPOgy0FD9FTNQSmsJ4wrc0ReOV2
	AAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lRM5aVY8sQFYBU/nVBXcNi9QqOKjpFDWTQ45SyEDH+Y=;
	b=Hzj6UoZXlJOFngsS+0ncQ4MY+OZIFGNpLp0WSfx4yBErLiUy9lrqhp57EhecFkI8k1
	XB44x2foUr2Zbw6XARiH5ZHta5UlQpwvVopPbQfw3VClEpJ7N5LmwtcuabYnMfYfnA9F
	JrP7E3G05l3eF/k81h00veWjFI7O8Gw4j+S4sakvPD4i8hUxuyf+y6V8nhWzzlGd3fwi
	YG3cXmV+KGxFrM0mF/OLNEeC5F+mK352XSxVtyao9IziQt0nefUjaHeYDB69K5f1HNR3
	pqouP/po40dL5SOtK8RQVxtqdc4KJH4QYLiAPArRVQmt0vyJkJJGKNzSu4EegANQsHs2
	HnAA==
X-Gm-Message-State: AGRZ1gL9Y2PO7XTc5lDpaCqBM1qvH8UYvRxR9Ld9B4H1M0b3yw+NFngZ
	mG9ULXTaUQtURwm8sc7lRnLHwY0SsmSvBrg3pBKZQw==
X-Google-Smtp-Source: AJdET5eu6dQWqmHLsRiT/+5DN47dVT4WiftKfTh1zBdWjK/PKvdqZQKZ9a6JQb+kMmZlPXmuaaqR01PLm/ceKDDQv8Q=
X-Received: by 2002:a6b:1602:: with SMTP id 2-v6mr3654474iow.201.1541176275100;
	Fri, 02 Nov 2018 09:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181031144648.28277-1-sno@netbsd.org>
	<CAJTo0LYJrmBh1_3AXZXH7xBY1KSCG_9buGfsqtG-D2MLRb=Qmg@mail.gmail.com>
	<9750133E-11F8-4833-9CBF-DB7B6998E3AE@netbsd.org>
	<CAJTo0LYqMLLp9T89CvR0jzSLuiHH7w2M2rrdoE0z-tS54ity9Q@mail.gmail.com>
	<CAJTo0LaoWMZBv0_o8b1MYLq=CnFQFbOgCn2ptpqH0BeGCmN+RQ@mail.gmail.com>
	<CAJTo0LZBqL3rckX3jEbWauwFWZNs=6gc7p+NGNDH5RbQeyiMdA@mail.gmail.com>
In-Reply-To: <CAJTo0LZBqL3rckX3jEbWauwFWZNs=6gc7p+NGNDH5RbQeyiMdA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Nov 2018 16:31:03 +0000
Message-ID: <CAJTo0LYQM9=5SO3DN=xTHf4VSUF5RZOszA8ztZw0C=mNTzGu7w@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Fri, 02 Nov 2018 16:31:14 -0000
Content-Type: text/plain; charset="UTF-8"

Oh, and we should either backport
https://github.com/python/cpython/commit/7bd6f0e5500f778e940374237b94651f60ae1990
or move to 3.7.1.

Ross
On Fri, 2 Nov 2018 at 16:29, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 2 Nov 2018 at 16:17, Burton, Ross <ross.burton@intel.com> wrote:
> > Turns out enabling reproducible builds breaks the test suite:
> >
> > test test_py_compile failed -- Traceback (most recent call last):
> >   File "/usr/lib/python3.7/test/test_py_compile.py", line 125, in
> > test_source_date_epoch
> >     self.assertEqual(statinfo.st_mtime, testtime)
> > AssertionError: 1541175127.6495416 != 123456789
> > 0:11:47 load avg: 0.41 [269/415/1] test_pyclbr -- test_py_compile failed
>
> We're patching in SOURCE_DATE_EPOCH but 3.7 supports this directly, I
> think we should just drop the source-date-epoch patch.
>
> > test test_venv crashed -- Traceback (most recent call last):
> >   File "/usr/lib/python3.7/test/libregrtest/runtest.py", line 163, in
> > runtest_inner
> >     the_module = importlib.import_module(abstest)
> >   File "/usr/lib/python3.7/importlib/__init__.py", line 127, in import_module
> >     return _bootstrap._gcd_import(name[level:], package, level)
> >   File "<frozen importlib._bootstrap>", line 1006, in _gcd_import
> >   File "<frozen importlib._bootstrap>", line 983, in _find_and_load
> >   File "<frozen importlib._bootstrap>", line 967, in _find_and_load_unlocked
> >   File "<frozen importlib._bootstrap>", line 677, in _load_unlocked
> >   File "<frozen importlib._bootstrap_external>", line 728, in exec_module
> >   File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
> >   File "/usr/lib/python3.7/test/test_venv.py", line 20, in <module>
> >     import venv
> > ModuleNotFoundError: No module named 'venv'
> >
> > Urgh, venv.  We just changed this, I wonder if it's not being pulled
> > into the python3-modules depends.
>
> Missing dependency, I'll post this fix for master/thud.
>
> Ross

