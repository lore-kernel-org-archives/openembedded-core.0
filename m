Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5258360C02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:34:34 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 79so786079ykr.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fl7velKYiQJijqZRDZSykZKne6QqUIG/OMjBE+bpjpY=;
	b=0KmHGC4HO0wgx4nmOEnXruIsAjuATGItagVa/29g/Yg38oqKgXh6DkTxOVDwKdvgFB
	SLKhslmpS65Yi10BIR042kZ8hw0sk5ndfEdQnrtCTtToW8V/kAADcJeWnfeuwrSlMydw
	mM6sBMsjpAJTSYmPMO9zr+Vc6UoTXNEnszUMf3gPkyiVKzgddyNcnOyEhyuBYMZgJocx
	8uZoQYXiHjrPB2CEhJBP5htK7SZmhOEdnQ2eI+sGHXvPknwie9lcvSh4131n/wSM4gmA
	qV5MYwAR+D/HKw/A25D2uTV/v0YSqAUsJHXjTR/OXI/vZC4JaAagBhBZZxIjAEpuoqNU
	sEAg==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr1193941yhb.155.1395844475504;
	Wed, 26 Mar 2014 07:34:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 26 Mar 2014 07:34:35 -0700 (PDT)
In-Reply-To: <CAPybu_1O8oCHy4KUm=UPD6qkL2hFs=kjCOQtdNYqGq=F5xz9Lg@mail.gmail.com>
References: <1395834050.24890.87.camel@ted>
	<CAPybu_1O8oCHy4KUm=UPD6qkL2hFs=kjCOQtdNYqGq=F5xz9Lg@mail.gmail.com>
Date: Wed, 26 Mar 2014 11:34:35 -0300
X-Google-Sender-Auth: RQkUa9jHSupd8UyeWwaqCNG0BkU
Message-ID: <CAP9ODKoObs4uDAoD+xZdM8Nkrk-MVjD-cBqUp_5CJW_sTOA5FA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_manager: Fix apt-ftparchive index creation problems
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
X-List-Received-Date: Wed, 26 Mar 2014 14:34:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Ricardo,

On Wed, Mar 26, 2014 at 10:19 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> My fault sorry. I dont have a running system on master. I tried to
> port the patch that I tested on dora.

Please try the patches in master before sending them, specially when
it changes a so core feature like this one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

