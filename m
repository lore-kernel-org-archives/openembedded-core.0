Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF0F7024B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 13:48:29 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so731227qge.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oiQkjJYIfQ/6+JRaY3G3kT+ZfJEU+a7nbTyGYL3HR4Y=;
	b=dw713wVumYlNCeFwz3oh/EEH1vDWMN4t3UqPd+gnSgdmNXWxsMXAmmAlZty+ZNWLmI
	I+yJ1/kLoK1czV6lKNrTu1koOV2YC5zBbc8hVkkGhUpPMgMwEWg4ASqz5sTy+pMf8rOT
	rVTJBK/ctrrfn/y+y+XnXsiFZqYJnYaRABHUcrjhfRW3IZ/yA5xYGAUOLlsPoRoJct8K
	9wCPc8sh9jAkPqjrTmHunwUm7t5OIAoTiR5tPQJQqK2YJTowlDgdgRKE2ynk2q5QIQy5
	24bfdFcwLgGWTqTdsRGPdcVqHAGphqESRCFdqb+eGltusKkSyPctHYEBDAqiUweDSBP1
	OYLQ==
X-Gm-Message-State: ALoCoQko0HWzZVTveC835U+ITthufuou/bkhnsYkJUdcttIqgmT1u9hdnrvWy93lJTsAr55JlNIE
X-Received: by 10.224.122.83 with SMTP id k19mr17660698qar.78.1405518510106;
	Wed, 16 Jul 2014 06:48:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Wed, 16 Jul 2014 06:48:10 -0700 (PDT)
In-Reply-To: <1405501880.20402.17.camel@ted>
References: <1405388483-30716-1-git-send-email-akuster@mvista.com>
	<1405501880.20402.17.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jul 2014 14:48:10 +0100
Message-ID: <CAJTo0LY6uP-92RmP31eTNZtb5cPkor1d2Ornw0q-Okd2E0KGYg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] V2 lz4: update to latest version
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
X-List-Received-Date: Wed, 16 Jul 2014 13:48:31 -0000
Content-Type: text/plain; charset=UTF-8

On 16 July 2014 10:11, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm still a little concerned about this change from svn to git. Which is
> the definitive source? It looks like the svn repo is active too?
>
> I just don't want to end up in a position where we're pulling from
> someone's hack'n'dev version of lz4 rather than the place considered the
> real "master" source...

The revision histories *are* different (commits marked "untested" and
then fixed in another commit) but the owner of the git repo is the
same as the owner of the svn repo.  It looks like git is his working
area and then changes that have been tested are merged and committed
to git.

Unless there's a good reason I'd keep with the svn repo for now.

Ross

