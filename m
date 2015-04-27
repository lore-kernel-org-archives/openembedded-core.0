Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAAB65CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 12:09:59 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so67345374igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 05:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=YvrsIg9fF8gbeZhUN/dOrocjSPLBdZ99sJL8io59EoI=;
	b=FA2YQuscd6bCf3lZ26ZmYwt49nqCnXivXweD5F1/SLD18SQOImxDzCKrze0fr5T613
	H8DrKFloUTmTa2+9BCgWX8q+kiAZVamThCl3yD8wc0YZ5+TsXQEKkYPnj+cIiH1A11wE
	8o2nTlxgQaTayUdAy9dkE+T52Bqhef0tmZw+17Q6Ct2FtRYvdOZUzFC7jXtrhJTFe2t7
	d+k5d/vN3dRGUkwX0KYgMNz1I73jqZ5nFYxMPDW16mOOBl28K7MrSPbCSsgmXPOel484
	Hpn5TVira/0N/ebLCGC6SSbSVFFG+r2f8o9W8Af5+sAnq6nKql5hYGBnjmUf/vHH2f9C
	6klA==
MIME-Version: 1.0
X-Received: by 10.50.35.195 with SMTP id k3mr12892277igj.11.1430136600503;
	Mon, 27 Apr 2015 05:10:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 05:10:00 -0700 (PDT)
In-Reply-To: <20150427110404.GD2379@jama>
References: <1429613583-15734-1-git-send-email-Martin.Jansa@gmail.com>
	<20150427110404.GD2379@jama>
Date: Mon, 27 Apr 2015 09:10:00 -0300
X-Google-Sender-Auth: 0FGphatGCfpFRke3q45VplLiYRo
Message-ID: <CAP9ODKp8PkbjYebqTeKzG5bKrMcm=rF54im3i_8HtUhJW_frOg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy][PATCH 1/3] pulseaudio: use stricter PACKAGES_DYNAMIC
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
X-List-Received-Date: Mon, 27 Apr 2015 12:10:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 8:04 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Apr 21, 2015 at 12:53:01PM +0200, Martin Jansa wrote:
>> * I don't see any usage for libpulse-* packages
>> * adding '-' resolves the issue when we have separate recipe for
>>   pulseaudio-modules-droid which isn't built to satisfy RDEPENDS
>>   with the same name, because generic pulseaudio recipe seems to
>>   RPROVIDE it through PACKAGES_DYNAMIC
>
> ping for all 3 changes

Ack for all 3 changes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

