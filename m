Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1B50A7DC76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 21:26:46 +0000 (UTC)
Received: by mail-it1-f180.google.com with SMTP id e13so7955880itk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MJoRHxa6X4aTaxvBvAynkirZ0k2wM/P2xqVhbwL8j0Y=;
	b=nWJB6xh7FVRtJOt1A+oxO2PevkCXuK1iRuvXHaavtZGNLcrRGxTLoSfTtLvscDIWVY
	4tkRkBaZc7wkRRbwea3eFMYNdw576QebvnQ1jCIm5zOnip5g8QkQNFTU/s4Paxg7gTTH
	SHu76Qr4dt9loa1LAorK5HQ8yyx+mizURnrRRVUrEae6InOAKOKivU3imdPqcNT5olzm
	D/T/s+MVf3c9rBPOKoqDJsJYvF1GKiXibASP57HooOsGTgDyCgPTZBg4/cp2o5zLF9xC
	ZnZOIHY/oHJ6ri9C2XtYN1+uwJrh3Xj7EntVBW3M1BkGktJbRt4O4tN4x+ipmN7RdItC
	u57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MJoRHxa6X4aTaxvBvAynkirZ0k2wM/P2xqVhbwL8j0Y=;
	b=JZ9AnT/amgg/2wsEwJM6R4I9NRM34GTtTeFkf3SCEcEgjB6rZSXJ1yVoRjQysALzhM
	vnc41R0nBJSmhvZmG4ETYu71OYrrFsJhfnVS1e2meM4gLoo039Z7kzxZOFCRAxo4nv2g
	owMTJ4f2OoiDsCF6l8FQ97PBaZ8Jw2djhsoQPeNPAh5UxUrYnMvR1wCwpKWpZ72kPv1g
	jr7ZqiNnaN01ZMS4rUeZ3WvEplYRDzINjB6kWrVCHemfUS9RojF757OXh2vbhyWi8eAA
	B4atdMit7nExGLlJx0HcmwTvcZhav0Rf2ltZGX1lU6HZs8Slbac6gUVmdYqCqDBMhY5R
	5+4w==
X-Gm-Message-State: APjAAAUsG+YuyTRJwPtoBr67yFkcziXXZX1In9C+W5UG22JWNPUJc+ZE
	RFxxWUzCTEd4GSMwIGjzDjxo3R7IQLawNUOCQVY=
X-Google-Smtp-Source: APXvYqzwQf6kRN5tPBfaxTTgMRNXxk90UBWvdaSHQWva68+2BwViDoacEB2FGfHfc9SPD/5q8HwtROchUtDTQV2ySjc=
X-Received: by 2002:a02:b088:: with SMTP id v8mr25784842jah.21.1556314008132; 
	Fri, 26 Apr 2019 14:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190424091318.18154-1-schnitzeltony@gmail.com>
	<e290569afc4a08a1489cf033195e32d58ba78e19.camel@linuxfoundation.org>
In-Reply-To: <e290569afc4a08a1489cf033195e32d58ba78e19.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 26 Apr 2019 23:26:36 +0200
Message-ID: <CALbNGRTMzeWHgAO6MdLs1HmiCrMWfmpd3=OLUrJdSDBbbT44Gg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Fri, 26 Apr 2019 21:26:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 10:34 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi,
>
> On Wed, 2019-04-24 at 11:13 +0200, Andreas M=C3=BCller wrote:
> > * license: COPYING was replaced by
> > COPYING.LGPL2/COPYING.LGPL3/COPYING.GPL3
> > * prettify recipe a bit
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >
> > V1 -> V2: Fix build with musl
>
> I think something with vte-native is not working quite right with one
> of these patches and is causing oe-selftest to fail:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/433
>
> (oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk)
Will try to reproduce...

Andreas

