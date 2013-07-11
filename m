Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6FB6AE90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 08:52:58 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x17so333642vbf.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 01:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=FBc4SLCWu+fREWFfAMGlLs31/3zF5ngopPvoEemFEEw=;
	b=ZTtODXiqR7Enjyq2S/yyjiYuNxHDv1wIwaP9G0KXd9emMpfh58fW9cmLw98dLa8Je8
	IqbC1fN68oF7c01jNJ6K3n7Q/gs1OSpwDW9Nt3tjdY/XqxOnMCI5d2V8o5xk2idP+tJf
	JqlDFw9EqF85pOCpkcacX8XNkyPexBrru7o/FYvvOVmmnZbE5CkYHxuxjZ6BCCTQWl4i
	ZR+5aX1hTEznW4VAdDDDVbCK4eQLWrpG4RH8w5VWfoVW/YaPsvoHv3KER1RHCne3q0yD
	w0Lv4CloqQc7pVB3OrhcmJNvEliXWZPbJPs0ZKlAACMKSTZmI7q9wZ56Ei9VGRfLhgd0
	WSyQ==
X-Received: by 10.58.171.4 with SMTP id aq4mr20821147vec.26.1373532779325;
	Thu, 11 Jul 2013 01:52:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 01:52:39 -0700 (PDT)
In-Reply-To: <1373504197-9550-3-git-send-email-obi@opendreambox.org>
References: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
	<1373504197-9550-3-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 09:52:39 +0100
Message-ID: <CAJTo0Laa7if2poYd_8AeLYDq8obefuw5F7ygSi+uz4LYpWrOkg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
X-Gm-Message-State: ALoCoQmBX3LXmC59mOSIKkJmLNDOiant9x7NTGa7w4d8vy9IpJ/FcdN0e2hNDHM6aPxFkYFS8euG
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] cogl-1.0: add option to enable GLES1
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
X-List-Received-Date: Thu, 11 Jul 2013 08:52:59 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2013 01:56, Andreas Oberritter <obi@opendreambox.org> wrote:
> Only PACKAGECONFIG options for GL and GLES2 were available before.

The rationale behind this was that the GLES1 support isn't tested,
mainly as there's not a lot of hardware that can't also do GLESv2.
Was this enabled for completeness or are you actually restricted to
GLESv1?

Ross

