Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tgxdl-0006cq-7u
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 14:06:54 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 07 Dec 2012 04:51:38 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so2100814oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2012 04:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=hA2vkezEiw5AjxnAPrEDaIsPQUgxoUfQlRBNgG3j5+Y=;
	b=Q+oUXgqoky3dM4lDedMMbqRLXpCaJSHF5RNdkd4bBF6201rPGHqp1OJNYn6WJYOtMl
	WxS/zjB43hOcfv8SZ9cdn0pOO5+1jJERcBkFMvXK0r0Jui4q/Sm2mdVj2kg1HLRbX5J5
	r7+zTAym3BeFtey9XPZPsBne8AVnKJhAHf7EMbW7yKpNJEvJRQaWCURjJe7bktChOK+n
	xMtS6BJCfKDxXsQuAXerApX5vDj2NEy3GlMDBugCi4sjtEGB+ZcKp7oTFmKifKCLCqZJ
	OBrXBxddOlx0Y72a1mtg3dKB9w8a/QGK/KDzzQpHJXWaNs2Gm8yzq9TgRIJHPc0xwyCq
	WR5Q==
Received: by 10.60.12.99 with SMTP id x3mr3271543oeb.71.1354884744739;
	Fri, 07 Dec 2012 04:52:24 -0800 (PST)
Received: by 10.60.12.99 with SMTP id x3mr3271537oeb.71.1354884744628; Fri, 07
	Dec 2012 04:52:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Fri, 7 Dec 2012 04:52:04 -0800 (PST)
In-Reply-To: <1354881744-1827-1-git-send-email-ross.burton@intel.com>
References: <1354881744-1827-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Dec 2012 12:52:04 +0000
Message-ID: <CAJTo0LYgMT3WUkoyAopf-dp7a4Cxsa0+KaMp+cmnRkrCTN56xg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQlIOhocWYyYsncJzY6j+cC5pL1nhSf1tJ2OyaScAp9OP4JQzHTDNnlE2jlhXtGXDG64P9oPfaKUaNEdLYdDvSERwlPu4lXNz3CWSFtB4LoIhD2u9wiP3/TbibsrjMFyI8wkJLV3kjpLuT4qvskouURDnk8z35LbWQAwhdEMkGa1BfAvUtfN9TdKQaE54fTPDCQxD4S+
Subject: Re: [PATCH] rt-tests: add missing build dependencies
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
X-List-Received-Date: Fri, 07 Dec 2012 13:06:54 -0000
Content-Type: text/plain; charset=UTF-8

On 7 December 2012 12:02, Ross Burton <ross.burton@intel.com> wrote:
> hackbench links to but doesn't depend on librttest.a, so parallel builds can
> randomly fail.

Retracting this, I was beaten to it by a few hours.

Ross


