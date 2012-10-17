Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOVL1-0004AG-TR
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 17:15:16 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2012 08:01:56 -0700
Received: by mail-ob0-f175.google.com with SMTP id eq6so7535994obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 08:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=UXj6ZhGx7ws70Q1Ph9NVwEgb3eaaWy6e7qbplXKjVsM=;
	b=KnXAZam+G2Z3TvUxTgcyaOI9pyyKxG2heNzW+SYt3STB4mUCo2Sp26HlstSRW1o3D4
	9IdzBLNTcG1LPQW5p7K11CxWzj8qclSdaMM8VUaOrx4Xpbn4gp3BhsPoQHmmEUhSk7op
	4OWcVmJ15BO5UrvnDoGN/G0OjXBLNRO40xg6L7bLNKxta1x0v3cH6s2vwVvaabPeFYhV
	7lP3pp080TLhK0a88rjuZxG01E7CcayhN2wYk6e/KlsXLsjftjEVoqI09Z5hp6hATkSE
	798/YejiFqWyKVZd70rZduusar74Yd4qTznJS6AtJ2xEQphJ3ty7T16z2Q+uJWiq/963
	bKRg==
Received: by 10.60.3.6 with SMTP id 6mr15859240oey.117.1350486113768; Wed, 17
	Oct 2012 08:01:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.70.6 with HTTP; Wed, 17 Oct 2012 08:01:31 -0700 (PDT)
In-Reply-To: <1350484172-9188-3-git-send-email-s.stirtzel@googlemail.com>
References: <1350484172-9188-1-git-send-email-s.stirtzel@googlemail.com>
	<1350484172-9188-3-git-send-email-s.stirtzel@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Oct 2012 16:01:31 +0100
Message-ID: <CAJTo0LYzc2NMN2Tu4ecT-BYfG9LjAy-AevUx2YBsaVS=85NgyQ@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Gm-Message-State: ALoCoQlmOCB8pv5fUGbjt4eNM3sE0cOZq94vxL+OZQu/r8dJhbmMOSKzddZ5iMsm0jAm71CjqVta
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] matchbox-keyboard: Use gtk-immodules-cache.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 15:15:16 -0000
Content-Type: text/plain; charset=UTF-8

On 17 October 2012 15:29, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  .../matchbox-keyboard/matchbox-keyboard_git.bb     |   21 ++++----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)

Missing PR bump, but acked once that is fixed.

Ross


