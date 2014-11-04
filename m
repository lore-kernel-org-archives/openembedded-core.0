Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id D042E71F62
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 12:12:42 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id c41so2294705yho.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 04:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=hCIoCsG4Yas2uz988meJR05ZC92QUV9x9DpezvsBs64=;
	b=jCFcc1S3NGS2siyCFChMCsIXL+uGj6P/twKORcHAlJIljADWqMv+PrGmCznXwFtAn3
	qnE06qo2whPq/hwceBHAFLUIoONzsQBgwMN3xB1uIdxX1D+qEpOTKsn2D3hhzd0d0Nyk
	zei/3CLao2vKG1Erd86ns3aIaUrosizkH8PDA8+7MrZ3bUU1+aBwU46DkQVzXr4QKp+t
	/agjhAa/KapyN6neKQ3koq6FQFEXxRUhkysVNhIzTnt56PUyt4RGGqHvtalCf+VihqIL
	m6qc6iECCrBZxtYP7zAJv1xOmATL06eh2rqNTGex7Z/bjRptyjQibcKocGm+pUe84bf/
	qmPw==
MIME-Version: 1.0
X-Received: by 10.236.41.71 with SMTP id g47mr34956221yhb.90.1415103163188;
	Tue, 04 Nov 2014 04:12:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Tue, 4 Nov 2014 04:12:43 -0800 (PST)
In-Reply-To: <5458C1A5.7060800@mlbassoc.com>
References: <1415100396.23396.17.camel@ted>
	<5458C1A5.7060800@mlbassoc.com>
Date: Tue, 4 Nov 2014 10:12:43 -0200
X-Google-Sender-Auth: EnlnupidkWyREKmVvvfpINPcK38
Message-ID: <CAP9ODKpQmRo-yXMMURRDU8QpSo1fA4vx+wcXFXuBaT=hOgTC_A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf/base.bbclass: Drop PRINC support
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
X-List-Received-Date: Tue, 04 Nov 2014 12:12:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 4, 2014 at 10:08 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> Won't this just silently make use of PRINC a no-op?  What about
> the users that had their head in the sand for the last few months
> but still expect PRINC to have some effect (and maybe don't use
> PR server)?  I would think escalating this to an error would make
> more sense (and follow other warnings that are now errors).

I agree with Gary, move this to ERROR now and drop in 1.9.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

