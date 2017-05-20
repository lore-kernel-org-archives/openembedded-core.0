Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id F287F77E1B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 May 2017 04:49:31 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id j17so36039033uag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 21:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=+C6+FjknW0gRnMFG7KU4YDJRNxr5JSxa5kfKLZEoyOU=;
	b=XZiTsleJ70gN1EdD7QciZY/GBCy9jGbye3YE8wmX5/T0Wt7ds4+njxjzt953AWHy7W
	lSp3slWmEtfVUaUJ4H0QzwJIk2oz510I7y3Pb7ZSHu99mpccHTHAciUCW8SIb7eaqCCS
	CTyEgWv8q36oMpRaO/uhNH1nEJp+Le0O3VbDlmleB6hmQRwJY5ik7AP0E345g4WJlZiB
	H2ycOq+irHf12YAWEPIcEgQewXg3FsVibWou2vdGYI92YZLwT+tu1q+ahOxg7WNRFimG
	/ZgWs8AKdzzUSbWD2ISYkk32eenGfJT/B+Tgvcbq+QTusQmJvBupWyrwV7xFK5E7ymbk
	qOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=+C6+FjknW0gRnMFG7KU4YDJRNxr5JSxa5kfKLZEoyOU=;
	b=YX3kEig+Apb3PYFNIX1mIfVk5xGhZpBkTFI3C4ZwWWdfNAvKrs1UvGe/0/vLyxt8A2
	WEkmYbshRvNShvQHARAU3fJfuCuFDPesSHtNgXUEuFN9pQzj6jIJ0VbJpIS8cIu0TIRH
	ZjWFdMoXJakjB4hZMTvkDBwz7/6s5z/uFMxwWR330F17GyRHj2TEVAAdiD0QBHvB98eO
	VQR7XPt0tJF2ZlUQFSB5pMVOGyMzQ2obNBUxhvDr6iRtU5PeAOP/nz3mBoNYy8wgfmCn
	BQD2Pkw2spIXh9yC8PSoAoAqVowLHD53uQvqIenCytt54r48DInh+nk5a1r3GDsO+Kk9
	XggA==
X-Gm-Message-State: AODbwcAPsR2qB2AOKIlq1aCMfKNN4u+I1Y3YfxFhWI8ApfPexyBrgBAb
	4ksv0NZ/nrJrY5dzr9QGzJ5Ua8Q/uNzX
X-Received: by 10.159.37.105 with SMTP id 96mr6488909uaz.92.1495255772573;
	Fri, 19 May 2017 21:49:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Fri, 19 May 2017 21:49:32 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B61195C6DE@ORSMSX112.amr.corp.intel.com>
References: <1495141509-4582-1-git-send-email-juro.bystricky@intel.com>
	<CAJTo0LbY5NPD8PY8dFiCvg8h47DCWYBgM6yEWLVDk3Vg-C-MUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61195C6DE@ORSMSX112.amr.corp.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 20 May 2017 00:49:32 -0400
Message-ID: <CAHUNapSwJtsaLgavq3VMjXsHgPb-AwX-+yu0-j_7fV2oDLCEnQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Sat, 20 May 2017 04:49:33 -0000
Content-Type: text/plain; charset="UTF-8"

Should this be configurable?

Is there an assumption everyone who uses oe-core wants reproducible builds?

Could this affect one's ability to perform debugging?

