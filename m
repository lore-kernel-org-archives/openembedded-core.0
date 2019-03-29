Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6F7237D106
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 11:58:08 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id u65so3370462itc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 04:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4DgdPAUItXfBOl7R9RdLLW1i0MKUNKAnzQfPuf3ewOk=;
	b=u5QIhmjVr3jo93+X/D3cJ46QEPbXXCd8aGQHJbB5Ht/ok/ZcvWMWTnuNe00QWE3/bX
	37I4UNF0/yEHdG9pDSHY6wZWhfw+R2whj1ehZN2E4xRe/9Si8GzCg0LcVytHYcdSX89l
	ei6KN+CtBkJDmOKev91y6dMlERoQmGwsKn/m6Oc4+ZUFl5Bq25jUspGtGAAe11XpFyka
	8jt47SDvpRKfKxKav8EoPi0eiNjAWxxWMuABFuEM4NhMankHQURfDUHz5OBoXWLCP7zg
	M8Ja+J9qu9kGfJay+P4Lc1AUbilBph55kRmUVpC7QgFGdo+X47NS1g6r8x1+cnl3YIIt
	iJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4DgdPAUItXfBOl7R9RdLLW1i0MKUNKAnzQfPuf3ewOk=;
	b=I/AQNoHwjl68UMG2SJbO8qGG1418YrGvyVwK5Pl0bSVO8R3X4Bay6gsoTVP2Pf7unG
	piaGX3mhXqf5XRQYHvYOvcBC68zwqwaUNS6AIFtQewf3YbKmXVYJl8dmO12gfm544Fv1
	ozdL4k8fdQJaKY3WIMZV9FL0oynL43KjN3MKUX9bVaM7MaoNr3OuICi7UbjGCQgwsvHb
	ctOSbxp+50VIZ7e0qWnDG+m/Ub8q/vHWByyDILXxz4X9wf/Eo4QSFs6C5uegxSciGpx6
	CQohSTvwwOnQD81l92PpAlx8HMYusR5P/GW7+/7V74G4xv9amrAIiKVffRKKIYh13YJ1
	KISw==
X-Gm-Message-State: APjAAAVMZbwaVhIkfDJTAe6J7ui2MJ5pwBLdhjWFA3aVV7H0tNWT0bMC
	bzw5KW0hjvpBL2i+sSZiP7M7OFwa3rQ456lfNB7Y+w==
X-Google-Smtp-Source: APXvYqxQspHpQrMPmxFguV0BzmPmf4pA8GnnpRmP8fDF1U44ooVhreQX5PMPmIQ6jkDBUmjKYd5AucSZYjMM76hLQ6k=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr3838204itj.62.1553860689266; 
	Fri, 29 Mar 2019 04:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <1553841683-296665-1-git-send-email-changqing.li@windriver.com>
	<1fedf511-ca21-6586-6c4c-4355d9e65d46@windriver.com>
In-Reply-To: <1fedf511-ca21-6586-6c4c-4355d9e65d46@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Mar 2019 11:57:58 +0000
Message-ID: <CAJTo0LYTPzM_YPZJ4AH1uwbGE0vMRYqX-VFaS4cqsG3H9SHvUg@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: fix run query-loaders fail
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
X-List-Received-Date: Fri, 29 Mar 2019 11:58:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2019 at 08:18, Changqing Li <changqing.li@windriver.com> wrote:
> Upstream replied that:  should be xfconf upsteam bug. So this is a
> workaround,

Yes, that's definitely a xfconf bug.  Let's fix it there.

Ross

