Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id B504561883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:04:29 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id d10so2603583vea.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 10:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=0IYFnC+1pvLUJhrMG26/J/SMq1HyOME75j87bbkBmpc=;
	b=KZYpSLdkEYZigl3SpZxNU/ih7aVlLFpGPsKz5ylNZFnr5ARYQFmWKBQjIj+S5ZCymC
	+sOnboQZJdTij9PmVzuDAic4fR/2hue23ug5gFPNrGLjsjsFSnTXG3fy6ols797MuOgu
	YylsskEAsBKpzMqOE8rMnp4ftDWpQBPqW4hAeXKGYB3dsrnwwe/7DGF+9FkY0o2PRedq
	KREN3ubcW9LEc07JG/oOozWuHgD//CgLbV6BMk7GOTTqD+FT8+y92ksTp2t+vawVk7gM
	M5ZCxqfAbeczmsrlPvTmadQ1qKdJVvMBbm29bz/4QNGNAM8PT3wKmhFtIkjjd2QzNmGt
	6p7A==
X-Received: by 10.220.1.9 with SMTP id 9mr790413vcd.37.1375376670323; Thu, 01
	Aug 2013 10:04:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 1 Aug 2013 10:04:10 -0700 (PDT)
In-Reply-To: <1375369300-13471-5-git-send-email-jukka.rissanen@linux.intel.com>
References: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1375369300-13471-5-git-send-email-jukka.rissanen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Aug 2013 18:04:10 +0100
Message-ID: <CAJTo0LZBTjMMt8SuSXc5j3KueTBsmVXASeRJbHKtZp76f90S-Q@mail.gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
X-Gm-Message-State: ALoCoQkSs0gRgfXcnSGtO+BFFJcIR7jVFOkDIJdpyJ1ekWAnHnXKJwxVrG/QjEZDT82eZ3Nc8JrU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 4/4] ofono: Move do_install() to ofono recipe file
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
X-List-Received-Date: Thu, 01 Aug 2013 17:04:30 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2013 16:01, Jukka Rissanen <jukka.rissanen@linux.intel.com> wrote:
> This allows the ofono.inc file to be used by a recipe that does
> not have or use ofono init script.

I'm not keen on this.  I presume the situation here is that your
distro has an updated ofono that doesn't have an init script, because
your distro is systemd-only.  Can't your overlaid recipe ship a stub
init script (touch files/ofono) to be installed that will get deleted
by systemd.bbclass?

Ross

