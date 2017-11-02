Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 19F466093C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 22:54:36 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id m72so1825804wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 15:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nsz8BCvX0d7FfXGChZlD2lzAGBmkpt75CtMf55ReKGw=;
	b=jXQG+egt9zBZpELn+Io3NTPs08tAfEL7HHA2ssxGAHupjU/JZCv9QL2NWfSPiC409x
	rUO0gN6tsuWLYx+E/nL9nP+mSsOTm3+ZpEBpMZvV1wNPuHf8ugkoAC//wrxOG43dqdU+
	4Oi8Od8hvLWLL8gqFJQai6xqPuzBhUpBPLR3NiTGwn4/bzlYlRCbTEmy+KLzFs7oQJBq
	pgvyNnW2VxsXHtank+ItRF++W2eVgsMjZmrzYqsJdbaM5+GCsEQH8pZMD+uzJqHl1ksL
	Yr/paDfxw4tLhffZ/I9UCSl/c0LED6go87M6vU5qlSO9XJ2wQ+8pCEuv2weZLMk2kAvg
	tbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nsz8BCvX0d7FfXGChZlD2lzAGBmkpt75CtMf55ReKGw=;
	b=LMIBSSBmlBr9fxthmh5HK+msqvo6mCHputYmTxW6Do6Iashpy/w/oRHym1BS9XADEZ
	38RvjEobDNZ1JWHZE22QuygQSYJy0hEPyYVzt0zoPtrmszqTRA16ZDHOCemKYKPNFq76
	c2oVphDEkKqmKpC+IfAcPswLxcnPqTPWeJt4PoOJ3JZJY+5wfW89UBg6frWIJgy/5xA7
	VAAxaJjUkCG+kFbukjrrRdI8Qg+OGcvc3Fp8/dTZ+gisrUEwx3abuj5BARTCJkyusjLc
	FpkETcQF71vYmzGAcPKrPIocgK3wTo4DuKVTdeQoc3lWIqt4rWQa0b46HICYUjxN+gvB
	wyHA==
X-Gm-Message-State: AMCzsaUFDa5zLnZ4Tx1frhTjASyXFS7o4Pl4xZDlQon15/jdbdc4Q606
	i1DozC/AJ0Fl97ofwnOobgytKN+CJb9O90Gukkg=
X-Google-Smtp-Source: ABhQp+TZ5/fWxNRiOc8I7f1ACBZ+SZ/uqmHWPssTlbdnxsWonxidXkQlNkC/xCvQqWK9rUxktM5Cs0dwaM5ySscZ8HI=
X-Received: by 10.80.212.133 with SMTP id s5mr6257437edi.286.1509663277967;
	Thu, 02 Nov 2017 15:54:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.204.200 with HTTP; Thu, 2 Nov 2017 15:54:37 -0700 (PDT)
In-Reply-To: <CAMKF1sqOZXCdo+oS8hYPava8er8Y7bX4iLTxeWPXMkC_yLU=Jw@mail.gmail.com>
References: <CAAQYJAvQo_buybnL8OUmwYfhezzuxx-dTO8wzuM=aQvKGYW+5Q@mail.gmail.com>
	<CAMKF1sqOZXCdo+oS8hYPava8er8Y7bX4iLTxeWPXMkC_yLU=Jw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 2 Nov 2017 23:54:37 +0100
Message-ID: <CAAQYJAukc4-Q6mVMMoeC4OqRFY4obf=3TiMFqk6uux+QoMgdAw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Backport gcc7 fixes for armv5e [ARM] PR 82445
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
X-List-Received-Date: Thu, 02 Nov 2017 22:54:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 2, 2017 at 9:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Please open a bugzilla entry too

Done, Yocto [12297]

Thanks!
Andrea

>
> On Thu, Nov 2, 2017 at 1:46 AM Andrea Adami <andrea.adami@gmail.com> wrote:
>>
>> Hello,
>>
>> the gcc7 shipped with rocko produces unbootable kernels on armv5e [1].
>> Bug was fixed recently, apparently in revision 253892 [2]
>>
>> Khem, please take care of this, thanks.
>>
>> Cheers
>> Andrea
>>
>> [1] https://www.spinics.net/lists/arm-kernel/msg594654.html
>> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82445

