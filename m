Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0D379F50
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 16:29:49 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id e11so675475itl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 09:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t51/0YlzHn5tUXhRHyidVc0g0fSchg3ZwRZDiLON2s8=;
	b=WCVzFVrAkGSTU0lVozJ5IteDlS1wFPmSj5VgwS4z65otAHKCndm1vwxhrkX4d3rWVC
	7QYSomXc1Q0ESjMJNDxvbZogy+ScmB8+WLkGBK/V9QW7Mkf3soWfB1ZbB5kQwhvZfG2/
	9/8O0YR1JKWQjPA4C6k7fi9OYf2sTx6cOIaRmrl2qEz0ngQxygMhKJ/GVCveuBbwgywF
	coY6p/MwCBBsBc7tN/oHofIe5/hHGXrUTi6ePp8G4aGxkmIsNNIkRjf205SUthvgKmxK
	+N9X+5EFxhK1gnZri0va9W3Y6pIGICyCCt8kILo6c3H6sEV5/X/xUqui37JkHOH18lga
	ocmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t51/0YlzHn5tUXhRHyidVc0g0fSchg3ZwRZDiLON2s8=;
	b=XSAqNl4fVj3tvzTCoWsjwE1+M3W1KVqyHxbyRG7scOEaGIyxsh5OJ2UACfbHsX9btV
	ww3wESOORAW7erVgviR6Iv105U8n5fJvYwu1Kmwvh8Ula/9MaWnryN0QYubfMaOynFUF
	QraXgqodPP1fDLT00KdFPqXRdNRh7pKikRAnTrCK1yowgUT5pI7ODVJqq2Jmoqkw2Tiv
	NhTDeyGdmmgzU5CgHPJzZEaMgYRUTW5fm5ru8XHWcCjKXDTiMprtlwP3HEWv7/LfGdfq
	XPUBhzVyECCWqNxD+7/zjfSq56OWDaWcZFmXiBoWtB4Kls8XUQubQxsHfuwbPNmoosVo
	tzcA==
X-Gm-Message-State: AGRZ1gKTOwm1COaDhw+7LBocvQFUkLh29obv9VJDMJN1jdCK9aQissvz
	MxxuTkTMKuw+l2QhJAsrKe4ouE6wDQ//TP03ThfotQ==
X-Google-Smtp-Source: AJdET5e9Vixt0S0aNakqNKqS7MEd1CL1a5wN/3qtVoHhAy7zGJBvseEt6mn51S+MCi4etTr6AmQVPLnrYGhQbXa1zck=
X-Received: by 2002:a05:660c:a06:: with SMTP id e6mr374852itk.62.1541176190145;
	Fri, 02 Nov 2018 09:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20181031144648.28277-1-sno@netbsd.org>
	<CAJTo0LYJrmBh1_3AXZXH7xBY1KSCG_9buGfsqtG-D2MLRb=Qmg@mail.gmail.com>
	<9750133E-11F8-4833-9CBF-DB7B6998E3AE@netbsd.org>
	<CAJTo0LYqMLLp9T89CvR0jzSLuiHH7w2M2rrdoE0z-tS54ity9Q@mail.gmail.com>
	<CAJTo0LaoWMZBv0_o8b1MYLq=CnFQFbOgCn2ptpqH0BeGCmN+RQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaoWMZBv0_o8b1MYLq=CnFQFbOgCn2ptpqH0BeGCmN+RQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Nov 2018 16:29:38 +0000
Message-ID: <CAJTo0LZBqL3rckX3jEbWauwFWZNs=6gc7p+NGNDH5RbQeyiMdA@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 Nov 2018 16:29:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Nov 2018 at 16:17, Burton, Ross <ross.burton@intel.com> wrote:
> Turns out enabling reproducible builds breaks the test suite:
>
> test test_py_compile failed -- Traceback (most recent call last):
>   File "/usr/lib/python3.7/test/test_py_compile.py", line 125, in
> test_source_date_epoch
>     self.assertEqual(statinfo.st_mtime, testtime)
> AssertionError: 1541175127.6495416 != 123456789
> 0:11:47 load avg: 0.41 [269/415/1] test_pyclbr -- test_py_compile failed

We're patching in SOURCE_DATE_EPOCH but 3.7 supports this directly, I
think we should just drop the source-date-epoch patch.

> test test_venv crashed -- Traceback (most recent call last):
>   File "/usr/lib/python3.7/test/libregrtest/runtest.py", line 163, in
> runtest_inner
>     the_module = importlib.import_module(abstest)
>   File "/usr/lib/python3.7/importlib/__init__.py", line 127, in import_module
>     return _bootstrap._gcd_import(name[level:], package, level)
>   File "<frozen importlib._bootstrap>", line 1006, in _gcd_import
>   File "<frozen importlib._bootstrap>", line 983, in _find_and_load
>   File "<frozen importlib._bootstrap>", line 967, in _find_and_load_unlocked
>   File "<frozen importlib._bootstrap>", line 677, in _load_unlocked
>   File "<frozen importlib._bootstrap_external>", line 728, in exec_module
>   File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
>   File "/usr/lib/python3.7/test/test_venv.py", line 20, in <module>
>     import venv
> ModuleNotFoundError: No module named 'venv'
>
> Urgh, venv.  We just changed this, I wonder if it's not being pulled
> into the python3-modules depends.

Missing dependency, I'll post this fix for master/thud.

Ross

