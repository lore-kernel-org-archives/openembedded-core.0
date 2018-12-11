Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 66AC06C4D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:42:06 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n9so11380066ioh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 02:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eieUAOiaXD6LvC9+9PtXa14AWE9Ekp4wPmJxlpANZRg=;
	b=wzjb0y9O7vKST4tTxW3DkG7qK5JMKAJMWtWrxuKdVImcq0wOgTNsqY2oyelFmoZGe0
	hN6fSa9LY0aFDFwzDfh8DG4pp0bea/FgllDFX2nMagukHe+JDi+IQzV2Gi4c/cyi0U9j
	HAIoNWPxYF3bCg1Iwi9xaOsF5hr8xiQuG2FlO0eCayLHTePOJ68ORGAYB2um2VesP51R
	GCjUlWKmv9Jk3YAHglet7gogJP0dyk6GwMWUZ0gUKi7pVM4YfnxYtJ/iUv50H6aC2KUg
	wqbgEpxfA+Z1CrERN4zrcvK4pA9zcBlvY02pHDulr+oo7NofYNvVB2ND15h1RcDD+9x2
	XTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eieUAOiaXD6LvC9+9PtXa14AWE9Ekp4wPmJxlpANZRg=;
	b=fW1Tvo2Q3ZX36Jb4/+wH5isDbtKZvWQx/SSdaX+pCErNvylN+EsV3id9ygsmf7mH57
	PpIPst296y97NVQBB8iFOD8hT8OxSBaVXwy11EdZ6zRF6Gv7hJYfCZ4k7HA8uUunKekP
	eMsKgjfy3qJnijCCHY+xBGf0qqzXlB97aUljW3bTJUrmUSY8aVoHG5Bt37i6Ck+b0vzH
	IpisHAZKfDTqXOsJAJwaSxBoJ8Ls4Ik2QOisyptEPLJrcCLiVFaTe/2ez8zDFkhWSCtc
	Z7Hch1UqvX4HAnXU82P60meadNlms4iF+9tdwbBubR9+mtkzM+2iD6b2ekMG5QV8KZRw
	BEBA==
X-Gm-Message-State: AA+aEWbZhK7P6ZvF6AEgtmbLHFfuWUhZanpzLyAV10bLz9FVoOqdsRI5
	j9xeNS4MqzxHW2hhTXakPI9aOUsqjlRMdgA+tyFxmXiH
X-Google-Smtp-Source: AFSGD/WRkm+qhrZlmmA5lNc0W1ndp324Hik3dxyFzg3KPytuTi0JAAbr5AuB9QKI+hUgC7ANtXFEhoPEG6WDOQ4CIKc=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr12195903ioe.20.1544524927406;
	Tue, 11 Dec 2018 02:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20181210171141.10722-1-ross.burton@intel.com>
	<20181210171141.10722-4-ross.burton@intel.com>
	<2c6649dd-c527-e71c-135c-15177787c71c@windriver.com>
In-Reply-To: <2c6649dd-c527-e71c-135c-15177787c71c@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Dec 2018 10:41:56 +0000
Message-ID: <CAJTo0Lb+w8+zj9iSAzOMePdf_nNVz74wLoR+Z+ZSSCH73hzymQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] oeqa/sdk: rewrite lzip test
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
X-List-Received-Date: Tue, 11 Dec 2018 10:42:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Dec 2018 at 09:44, ChenQi <Qi.Chen@windriver.com> wrote:
> There's a failure related to this patch.
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/80/steps/7/logs/step1c

Strictly speaking the test was already broken, now it tells us. :)  Shall fix.

Ross

