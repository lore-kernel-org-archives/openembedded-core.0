Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SEwOo-0008DV-Ug
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 07:35:23 +0200
Received: by lagw12 with SMTP id w12so4100293lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 22:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=hLIYldAXynvm0yYA2/z1TPNnxaoo9STTv6KdFNNfUoM=;
	b=zGVpKamVzdrk+4SDoSwFNS0OXwIcJamIZPqmlkXYwG842L/am1ptJp1ZwyKWazT1tB
	OL0FVJgYouiEqArfQMvNHJUm2odb1976rOvSFdTeu2ez5nCVe2OU3yrkbILJ4UL+2MZD
	gf3gnaQzDRcLTqLmHjIenWbHZKdVzw7sSbfxdXltPqQjIVjrsc/hPYoVHWZ4sYGMEJHJ
	r/AbFbN/9qEDjZeQW6RlXSCSyL4OX7djCZ/6Rx0yqj/5jLzDX8JbPkuDIESSAITKhJlF
	T7U3Kx0eo4+uRZPYN8tY+WsWLguwkGtVa+feJSLKjx7h+4YJFFRWpkfSvkcxuCuJgHI/
	6iCA==
Received: by 10.152.113.229 with SMTP id jb5mr12530500lab.45.1333430774085;
	Mon, 02 Apr 2012 22:26:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Mon, 2 Apr 2012 22:25:43 -0700 (PDT)
In-Reply-To: <1333367425.647.23.camel@ted>
References: <1333367425.647.23.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Apr 2012 22:25:43 -0700
Message-ID: <CAMKF1srj=MZVNuyJp=iDRGSMHV8k8kA97wVEDHwun8mcaZ+RyQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-ffmpeg: Fix build failures from sstate relocation
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
X-List-Received-Date: Tue, 03 Apr 2012 05:35:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 2, 2012 at 4:50 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> -
> -# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
> -CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"

yep right thing to do.


