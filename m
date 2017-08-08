Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF416010B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 20:57:33 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j32so18298637iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=w4dKoOeag1YemmCxi8wMnVJ5Sc7f1ziELBOWag7d/sA=;
	b=a4VBigF5oECdE0QA6vkytKaGSojYxHN54HEGcCzN0vyHjjAwHRAtIoW2Q/zWNLtW0/
	o0yv82vWQ1/d0FCGlfk8JCvb3/8HWEfuT+d+qbF0PR/mhdonEpTIj1W/EA6bPa9wxYVK
	ZHnnAKDZsdgyzQ7GzMBFZETxg6H9tfem2r8LoQSzmAIAW3PaW4ageRChoQKZzsrnRjh7
	/VX0gUwj80tBYAyOOEYQHvHNmyUKhPWKtYIZctP2jDn9rmioE5LBIQfp9L2+NVJGSItq
	F29pDcJ7vnIgw7RNVIZ6gynMYhYHySJMQkr7Pj4dz2+LQUVOrFyPgS4NJPU7yGqj7j5O
	UL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w4dKoOeag1YemmCxi8wMnVJ5Sc7f1ziELBOWag7d/sA=;
	b=P6gLrzyst6v79+CybuoisZ5I8QDB8jAD+e3a/ErxXdfwD/kpr9ssfbNtogNCq6nn6L
	7ceOMoLvEEWOKWqOnrfTPS9QYWcb3o+CK0QkOHpUPEhS8Idqr22Ryl+ycKcLRAzj8jhY
	dbwyg4fH/jxN8Hpa1EEpQ0nPqaOUzdpm0HVZAsyeF9lcds27lmW6sIjkg1QFPwNYVdxs
	0WbvdTxzR+c3VwrMMzoDsnpUYR8cr2xvy1CZ6WHtGIEWuG7NBZ7zdmD2/zxZpYJwGLVl
	BuI6DrZAH48m619zjTCbRP3atf5hCpVITWX/71/lAutGw5+V6J8+F/rnnuj8zP1T/52D
	wzYg==
X-Gm-Message-State: AIVw112Mhl7B5P9GYhsU15xk6eiDjIoLvAmQYxwux5TyYf48ikPLkvo4
	YzNCZ3cD6G2tNQ==
X-Received: by 10.107.46.234 with SMTP id u103mr4503918iou.192.1502225854682; 
	Tue, 08 Aug 2017 13:57:34 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g63sm1108561iod.8.2017.08.08.13.57.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 Aug 2017 13:57:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1502225853.2652.2.camel@gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>, 
	"Burton, Ross" <ross.burton@intel.com>
Date: Tue, 08 Aug 2017 15:57:33 -0500
In-Reply-To: <1502221573.1934.21.camel@linux.intel.com>
References: <20170808014624.9506-1-JPEWhacker@gmail.com>
	<CAJTo0LaVB7h5ycSzGOcQgpLKcPVbByu9KeR7oqZWoF1Ab4KU4g@mail.gmail.com>
	<1502221573.1934.21.camel@linux.intel.com>
X-Mailer: Evolution 3.24.4 (3.24.4-1.fc26) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] externalsrc: Handle .git not being a directory
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
X-List-Received-Date: Tue, 08 Aug 2017 20:57:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-08-08 at 14:46 -0500, Leonardo Sandoval wrote:
> On Tue, 2017-08-08 at 20:32 +0100, Burton, Ross wrote:
> > On 8 August 2017 at 02:46, Joshua Watt <jpewhacker@gmail.com>
> > wrote:
> >         +        git_dir = subprocess.check_output(['git',
> >         'rev-parse', '--absolute-git-dir'],
> >         cwd=s_dir).decode("utf-8").rstrip()
> > 
> > 
> > Doesn't work with my old git:
> > 
> > 
> > bb.data_smart.ExpansionError: Failure expanding variable
> > do_compile[file-checksums], expression was ${@srctree_hash_files(d)
> > }
> > which triggered exception FileNotFoundError: [Errno 2] No such file
> > or
> > directory: '--absolute-git-dir/index'
> > Summary: There was 1 ERROR message shown, returning a non-zero exit
> > code.
> > 
> > 
> > 
> > $ git rev-parse --absolute-git-dir
> > --absolute-git-dir
> > $ git --version
> > git version 2.11.0
> > 
> 
> I also tried it and got same log. my git is a bit newer (2.12.3).

Ok. I wasn't sure exactly when that option was added, I'll use the
older one.

> 
> Leo
> > 
> > Ross
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 


