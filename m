Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1bH4-0007D4-H8
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 12:56:30 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 03:44:31 -0700
Received: by yenl8 with SMTP id l8so1465366yen.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 03:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=aN4AqF7adtgsT6NZgiXH1YPfTHp0wTlTvlDxleHzf58=;
	b=OAS0fJc2zmTOV9OpI6JbrQPTeIwzWlfA0HKCypfS5FyyscAsCJ5kRRBCgI3zS9JqFx
	K7GjpPXT/jIvV+zvVvzy2FYW8mfux3t3CKnlddh28ejKxHGpXR6/x3w2H5cku+u2Lga2
	zZ4bOuVDFUGyAKNJJryckv8iEscs2g4Dprmgxa/ElI+wSk0TJAlz3S4Gguj2PJgKe6VK
	QNTLaGQRmoMR3nc8mRRwgGCGreDjFjz0CWVHdJcjUxKiKQOH04g75/eC4ZmF8UfC/Ehh
	Dn6zx5i7SzVvt7uJimOXUBPWvkchlpeIUy9cNiG2mFG0KYbBTd2TD1g0KaJPLl7mdthj
	9P9A==
Received: by 10.50.158.229 with SMTP id wx5mr17803282igb.23.1345027470714;
	Wed, 15 Aug 2012 03:44:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.146.103 with HTTP; Wed, 15 Aug 2012 03:44:10 -0700 (PDT)
In-Reply-To: <502AF9CD.9020508@linux.intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
	<502AF9CD.9020508@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Aug 2012 11:44:10 +0100
Message-ID: <CAJTo0LaCWNcPTh+0zz-HyUZrYbnd_mB0Sg+Ma=GwGkXURLYWsQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmOy981JoHqLBYYSLRI1poq8xK+nWalqQBB+ZtFb8iSn4w3Nn+g6UwtXLhrMZrXzfu5Rxi8
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Enable EGL and GLES in x86 Mesa
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
X-List-Received-Date: Wed, 15 Aug 2012 10:56:31 -0000
Content-Type: text/plain; charset=UTF-8

On 15 August 2012 02:22, Saul Wold <sgw@linux.intel.com> wrote:
> Sorry not quite yet, there seems to be an issue with this patch set:
> (found with and arm and world builds)

I think I found the problem although I couldn't ever replicate the
failure.  mesa-dri was failing to declare a dependency on libdrm (it
was setting variable but never using it in DEPENDS).

I've pushed a new branch which fixes up the dependencies.

Ross


