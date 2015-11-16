Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8A79A6E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:05:32 +0000 (UTC)
Received: by iouu10 with SMTP id u10so155927553iou.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JXBmi4V8GghInLVKkl4FE7+Nk34CKHf8CeVD93rYTms=;
	b=WmGI2IjYMPCkPPDp2+OxV9MRqdciUoemLk2PiP2cHxKdDaNsCqtQ5Ux98411KsXf2R
	UWWfXReyPq4gK9S9wwOh7Cn8wRtncJU5QGbF8weBUEWtMIZxYkz952eFnJZwipoEyvuE
	noUr+wglaT4smuUjpA64vXgomcFuhS3haFgQ021zFQ+2fO9Mb4N9V/emecqdKfOAd6PJ
	mEpsbgl774HLmY28rbvLxhJ+hxEIHkkGmTke0kGIfhnTotdWAGfHm/Eej5eSm49BGDu+
	RyI5vb4MoUJhO6ms9aydfLSjq6iUgkDuy01OMmsZ/Hdfa++UPkbzhzBwydgU+0aFpC9l
	Sl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JXBmi4V8GghInLVKkl4FE7+Nk34CKHf8CeVD93rYTms=;
	b=C74Urws8wgkNzms6jqkm2DXS5nqpXf8r8G0GWrgDvCKvgwM0yWIEbceUQODbsFu+zN
	tsGfFD/SK0f0O+RQx95cJoztNvUdhsOkCFXTGvuUfIfAKtHQHnpaGSbpLj3mjWIquGgG
	ErXkkWgjxHqUwez4tenVxgJF7qI9tXNHM5NAPbQG+5qRfzCYx/IWuxmHe/Lx2kXkJaSz
	0jX/QtY1dYQkyeg2Pgh5b0CTPM1qHhy+F/q3cGUSPTNM2fBq/l3LLapZjpO8i+1LZC5d
	SYLXw5y7+jyHhdsDfFEknY7vIHJYnW5RfVqCQQdxHB5tBRQkoB5+V250SuPZKYfRFc37
	zc1A==
X-Gm-Message-State: ALoCoQnI9eYpQDwzKSvCqB1TmUHgj2mVSMbTi/Apw8GZkmtj5p5wJrDyH+HZCiOYYEilo+rgU3M1
X-Received: by 10.107.3.144 with SMTP id e16mr28416046ioi.99.1447686331692;
	Mon, 16 Nov 2015 07:05:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 07:05:12 -0800 (PST)
In-Reply-To: <CAP9ODKrR+6G7tCZQNukw11yKGbxhB=FUEe53=n3KGgXUu9s5YQ@mail.gmail.com>
References: <1447432009-9129-1-git-send-email-otavio@ossystems.com.br>
	<1447432009-9129-2-git-send-email-otavio@ossystems.com.br>
	<564661AB.9040201@mentor.com>
	<CAP9ODKrR+6G7tCZQNukw11yKGbxhB=FUEe53=n3KGgXUu9s5YQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 15:05:12 +0000
Message-ID: <CAJTo0LaSAEduWF_NWiU7h5H6rtCs+BBXeP8y0H4pkfwqqo6yog@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Nathan Lynch <Nathan_Lynch@mentor.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Mon, 16 Nov 2015 15:05:33 -0000
Content-Type: multipart/alternative; boundary=001a113ecf408c12370524a9bda9

--001a113ecf408c12370524a9bda9
Content-Type: text/plain; charset=UTF-8

On 16 November 2015 at 11:42, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> I think it applies fine, I can add it to the serie if Ross prefer
> though... Ross?
>

Yeah I've updated the patch and merge it to staging.

Ross

--001a113ecf408c12370524a9bda9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2015 at 11:42, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":28r" class=3D"a3s" style=3D"overflow:hidden">I think it appli=
es fine, I can add it to the serie if Ross prefer<br>
though... Ross?</div></blockquote><div><br></div><div>Yeah I&#39;ve updated=
 the patch and merge it to staging.</div><div><br></div><div>Ross=C2=A0</di=
v></div><br></div></div>

--001a113ecf408c12370524a9bda9--
