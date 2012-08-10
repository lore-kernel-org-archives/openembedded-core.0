Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SzovE-0000kI-ST
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 15:06:37 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 10 Aug 2012 05:54:45 -0700
Received: by yhpp61 with SMTP id p61so1355135yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 05:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=zn/JrSIJ1/0Lvii2iAYGQmHsTksO+JP0KYF85kYKSRM=;
	b=ehF9Czkr3tPsWRKIyAjXKZK4PYfi4TzbFP7MYGKcfpq91802KzjgvIY06LtwrnjkEk
	GDz9bPzCyVxArzh9RT7qYo5Q3takCJ+ETUawZN0vhQ1YzDLLEZ9jAGWi4NyevATa4rfl
	ffoCy+z5dhJV6mIu+d1NhFzRV3YTmeitv0tILrfXWZq3fb1I/IlmA0MPUf4jNNd2g5op
	de8XqGvxvLqqPGzcL0pC1Knf+CCFD+i2kPd1iNlWctXje6vHLkatCy1NR+D1kKsuZuJ+
	g6YewddoR8+V3Stec8diSfhnPLF1wj1vYwNhnmThMOgz1TL7WtWlqW5++uMSucnVBx9t
	unig==
Received: by 10.60.2.99 with SMTP id 3mr4054832oet.20.1344603284522; Fri, 10
	Aug 2012 05:54:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Fri, 10 Aug 2012 05:54:24 -0700 (PDT)
In-Reply-To: <CAEsOVNe9eWTVy7k2u5yNRGRZz==jRTZ0=nZD+xtdOhS=hSn7rg@mail.gmail.com>
References: <1343335023-28938-1-git-send-email-msm@freescale.com>
	<CAEsOVNe9eWTVy7k2u5yNRGRZz==jRTZ0=nZD+xtdOhS=hSn7rg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Aug 2012 13:54:24 +0100
Message-ID: <CAJTo0LZE-vT5bbr971-Ot7puBp1aXC5yO_XVN5AKVZLrC0A=_A@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkijE9lk1ejSlbCHav3j51Fu/vT2+Sp3i+SOT8LfS6W4Ir4NToImXwKGl/AKIkgIWjoI4Az
Subject: Re: [PATCH] owl-video_git.bb: fix compilation on Fedora 13 machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2012 13:06:37 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2012 17:07, McClintock Matthew-B29882 <B29882@freescale.com> wrote:
> Any comments on this?

owl-video isn't pulling in Xrandr directly, so something is wrong with
the linker flags produced by GTK+.  I wonder if -Wl,--as-needed is
breaking this...  Can you replicate and provide the full build log?

Ross


