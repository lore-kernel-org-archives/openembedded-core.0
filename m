Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id DC13460173
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 21:44:04 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id j5so1653590qaq.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 14:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qYKCCcY8pAOY9hWwG/C2Wt3+bwCjk/FV4CV3mUW7Aeg=;
	b=Pa7OFx+EWLP6tSjKVAQzrM9oycCtQTIJ7tlF8nSBVHabrD1TGltcZOaBRfQns1Co1g
	s0CAc1BOBFFKsQhvVHdMYEDUwrg6NgIB6bYXOzf3d8dHUiOe9M9L969BcXo4Snm7MMEU
	VDuZrQ4I4Iz45jxstK5ufYzl8s970PYvpeIwcjbsQv8k4gXkwbrJGDLor2SNZMTqbYks
	Yr47y9JuSYkOAkBjIOf/GwaJfKpyqnMF7ci20MfCdFNTQy3IynDlNaNjPlhbCZRwf5vC
	Jg1ZfPfPJ+EjRpg9va24QXeaLdyq3BBohBWKsF4Um2J7E2MirXGE3LRPOOEV3iL97qBp
	cplQ==
X-Gm-Message-State: ALoCoQnHuGQ/5K0xYk4HT4HP9/XHp+R8xf+exvwJ9gueNmN+WdOK7IJE4b1IWW91t4m5HUn9RYwO
X-Received: by 10.224.115.68 with SMTP id h4mr69795673qaq.35.1399499045271;
	Wed, 07 May 2014 14:44:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 7 May 2014 14:43:45 -0700 (PDT)
In-Reply-To: <536AA62A.4000005@linux.intel.com>
References: <1399478735-27819-1-git-send-email-ross.burton@intel.com>
	<1399478735-27819-2-git-send-email-ross.burton@intel.com>
	<536AA62A.4000005@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 May 2014 22:43:45 +0100
Message-ID: <CAJTo0LZR_KuuTCm49-J=Y2warSyQnGGXjTngeCaePo---8hkwg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] glib-2.0: upgrade to 2.40.0
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
X-List-Received-Date: Wed, 07 May 2014 21:44:08 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2014 22:31, Saul Wold <sgw@linux.intel.com> wrote:
> This update seems to have introduced a definition of g_ptr_array_insert()
> which causes an issue with gst-openmax.
>
> So a patch to gst-openmax might be needed.

Good catch, I'll sort this tomorrow.

Ross

