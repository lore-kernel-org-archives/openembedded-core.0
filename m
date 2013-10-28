Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id A9E026D273
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 15:59:50 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id m17so3743464oag.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 08:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zYN86wnV4awOr/fsP4yTWcjwJcYkDHBF/g2f5toPv8k=;
	b=eEgnN3+I4cxEpP/mjnuUMiFRptxDvQmBD8cRdKLXF3SLIXKzVO3xcOSdoUHU9GW/H9
	+qXFMvOV4SFTwiSYuBEA+rZbBOgE85frHJCkeJXbV0LrGKMe4R/h9GICwdt5FreIMCik
	dMdfewMLt4qyBeemNqOOrLLY9iTvku3qAKSif7JokqIIBpvmd/Z9IxP1gZuD7K8591Zl
	BP6e6KmuWxzzT6a7QM1BmU0POhI1owxHJCMLcZrQWhBQRtM9qpXYQCSsubwbcRAhW+cJ
	yxszuuu4nF5/00Kbx3ll9TRCzUeuYUQYZufQr5y2kpz5eYKlV1e6Ar9wt9DjBTQapeD6
	kHTw==
MIME-Version: 1.0
X-Received: by 10.60.131.232 with SMTP id op8mr785723oeb.75.1382975992494;
	Mon, 28 Oct 2013 08:59:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 28 Oct 2013 08:59:52 -0700 (PDT)
In-Reply-To: <1382970798-13574-3-git-send-email-ross.burton@intel.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
	<1382970798-13574-3-git-send-email-ross.burton@intel.com>
Date: Mon, 28 Oct 2013 13:59:52 -0200
X-Google-Sender-Auth: p9qIf-6hspXQjOjywKabFaAzns8
Message-ID: <CAP9ODKp-MyNi5Vso9qTUP4Uoyf3+oeX6D5UcXx69Upidp6N-iw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] xorg-proto-common: set UNKNOWN_CONFIGURE_WHITELIST
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
X-List-Received-Date: Mon, 28 Oct 2013 15:59:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 28, 2013 at 12:33 PM, Ross Burton <ross.burton@intel.com> wrote:
> This include adds configure options globally but not all X libraries support
> them, so to avoid unknown-configure-option warnings add them to the whitelist.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Does not match with the commit log.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

