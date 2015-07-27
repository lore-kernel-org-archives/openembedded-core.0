Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 40C1C73237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 16:53:50 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so54897586pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=qtjvgYb/v9qbuJibT5boRNaxN29E0F3S8YmW3kJDKCc=;
	b=VkkCw6bUI6+Gy2Aj37AaDg+rxqCmjHEYpDfz9WwROcvFWc3jL8wlJvefzeiLGq7pmn
	tiEQuarIsMSEAXlE9kWJVNbI1NFgtOKLl2TY+2NSIW117Dx6XD8ytbeZcVziw8lEqILY
	Hnob21aUwU7Dqwl885pQC7p9/NqiTOsMC/HeuZCWXTkJiobsqXvnUxrnF7ek3g/bVvnJ
	ftZFTkftkcIzgStvZghN+aqZTaJFOYSM90m6K36wkBjbhoHMLq1j+N7FTzm8or407hQB
	IjA4cDVEr6lJPZlG1IN3q8UXY90a43cawkCEGdiOs1KBXtuf3Xz2+KJ0Ez5gSrrf4FHX
	oLvQ==
X-Gm-Message-State: ALoCoQmaSioQqrmp3JkeMEmj13alRCCdMmKMMFvisMyrdlMAMlhAxFzLQ+F+lK9vEXPSsjtpDA4K
X-Received: by 10.70.42.105 with SMTP id n9mr71114334pdl.78.1438016031304;
	Mon, 27 Jul 2015 09:53:51 -0700 (PDT)
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com.
	[209.85.192.179]) by smtp.gmail.com with ESMTPSA id
	i5sm30632766pat.42.2015.07.27.09.53.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 09:53:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbnt7 with SMTP id nt7so54789457pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:53:48 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.133.42 with SMTP id oz10mr71141650pdb.85.1438016028676;
	Mon, 27 Jul 2015 09:53:48 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Mon, 27 Jul 2015 09:53:48 -0700 (PDT)
In-Reply-To: <1437996407-29463-1-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
Date: Mon, 27 Jul 2015 13:53:48 -0300
Message-ID: <CAP9ODKoDnEisgG1_AHb6qq4+frCJBuK7rr11eqw52XUyErfwMg@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 0/6] Upgrade to 3.14.38-6QP_Beta release
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
X-List-Received-Date: Mon, 27 Jul 2015 16:53:51 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 27, 2015 at 8:26 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> Fix id3demux issue
>
> Handle audio/video decoder error
>
> Update video alignment after video alignment
>
> Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF, keeping buffer writable
>
> Gstvideofilter use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
>
> Don't ref buffers twice when mapping
>
> Keep sticky events around when doing a soft reset

I stopped reviewing the patches as they need rework.

All Upstream-Status need checking, they were not using the right format.

Last time I reviewed I posted the link for the commit guidelines[1],
it seems you didn't read them. Please do.

1. http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

