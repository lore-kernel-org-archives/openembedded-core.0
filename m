Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id E112E74750
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 20:23:00 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id l15-v6so1162108oth.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TC94qT6cT6Q5kdyApdV5yE2IZKkF5zYsUlvup70S3F8=;
	b=XSq8fJG4o4sECc7mkcMGq5uXb/MALZOYV3xqcuBj/IvvfVDJAPOydBTZ3TUcTb4Z1o
	ywXBVq9XIVrZXXZX5XWTIDH7C7K1/CGIzfodod9utjZ5rsH4QSwO2Gq1hDNPaTh1Z1qN
	5EMwjtg8nZVjliWoGEKode8gOYfcVIev4J97wnqjQ5gRlga41nZK88/82mSkDYNufcDk
	2Ffet6srV8ajEdbH0Ky5mPJh++uB3UOBvMAemW5wUkeTZnFth6kSKlr2GNbs+3D13Txy
	U2+gR7zflhHgs/E6mMgRgM/ZhRxVmMTAZxJ5Lm9QvkzrxhQXlb3NmoSMLiXTs6dK472+
	2QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TC94qT6cT6Q5kdyApdV5yE2IZKkF5zYsUlvup70S3F8=;
	b=hMqGeyIbYdP3WXy4kd3iqU0aZ/NyrJ6ZB4TFGzyILdZriNfoY7u+7LK4kmJ4p+W/qm
	eYTAFIxdtmfIHbCunckX/7FwqL9OjhGTpwqdXjCjm+MFi2unDov+5oelkcD0Igi3Pw/x
	o8R6bIoa+/rpYE+gzcHRosiTbRmZbTVF5ZNdQnKXpId9uzUG+2i6gWzYYbGfKn630OeE
	5SGfCYRNAz4sl594e0nLO2EOtPwIA/FaOYoXVq+jSUnyPUobnjknoQnUrFF6m7OPuaBo
	UvzOMfnZ6B7UuYSJZnBfTs5pmsl5sWWRE1f/Ych56bJj0OotCUpK96Qr+qFL5xoZJLtA
	kAuA==
X-Gm-Message-State: APt69E0A3u3Vh9Cg/hk2Lax7XugZoLiBR6CzIOd+CLBbyHtLs+KHieok
	aio447bLMGTD4L9jrmNfkZhC6hHpyUZpu1bT00pLlg==
X-Google-Smtp-Source: ADUXVKLPie3GXUo2eLlwDv/7Vd/JLs1CdW/m5crz8FD3qPyGM9COLqUpBpiW3inkxONHcT+79OjG7k+FxytwiF6v3F8=
X-Received: by 2002:a9d:5170:: with SMTP id
	u45-v6mr10765703oti.89.1529439781990; 
	Tue, 19 Jun 2018 13:23:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 13:22:41
	-0700 (PDT)
In-Reply-To: <4cfebd9d-73bb-613d-65e5-ca2abfe86eb7@windriver.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
	<282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
	<CAJTo0LY-xmzar7jRYeboJJ5krAULqPMdwpS7hxgbC8m52uTEew@mail.gmail.com>
	<4cfebd9d-73bb-613d-65e5-ca2abfe86eb7@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jun 2018 21:22:41 +0100
Message-ID: <CAJTo0Lb-Q_fDnFrb+W5GuQYvgxTLSaMMuwJUPBX-NMSPO0PLtA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 20:23:01 -0000
Content-Type: text/plain; charset="UTF-8"

On 19 June 2018 at 21:06, Randy MacLeod <randy.macleod@windriver.com> wrote:
>> -fPIC
>
> Hey Ross ^^^

> fPIC is there, look again!
> I just send my reply as your email arrived.

I'm clearly going compiler flag blind...

