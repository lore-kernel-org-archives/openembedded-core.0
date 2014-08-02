Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 19FFD60C19
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 19:41:23 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id tr6so7462223ieb.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Aug 2014 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=S8ppLGW9e+XAwOgPyXYbzx3fWSA8oBN5k30uOUjE2cA=;
	b=bpxlH8mBNRzf/nCCZmKTovY+pHIq+znQOSgiTJ7MtW2TYerlgCsNOSMy5j/bxXidln
	2PNmlz53nXPlL5EhRClaegIfEooLYq/1zu9iqjLjJGxMMddSKvxBZOwj5ILiZcZEpXYE
	2v7+GrQo7s0GxNUP63om0VSLhrFrWxK8xpVqCJhtuUCCQLNJouOdTcT0PLNkOsZS5apf
	ZckQCPSIDizjtgX9RYaV69jlVR+9D5TBoPWFpdagsB9HSaLG3C4kFyW6YnqKwl9KWsUN
	GTEUmioYvq+DZKzqQW5t+5qnJgohW2zGFwbD8YLXO/GX8eyYchgUrapIkOHVDG3O38Aj
	by+Q==
X-Received: by 10.43.64.198 with SMTP id xj6mr12438271icb.70.1407008484944;
	Sat, 02 Aug 2014 12:41:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Sat, 2 Aug 2014 12:40:54 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1408021229180.24061@localhost>
References: <alpine.LFD.2.11.1408021229180.24061@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Aug 2014 12:40:54 -0700
Message-ID: <CAMKF1srw7Rho8mFxL9nfB-wm3OQsx8QPV_DMqEQ4Miv8uxiFdg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can pkg_{pre, post}rm functions be run at all for image creation?
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
X-List-Received-Date: Sat, 02 Aug 2014 19:41:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 2, 2014 at 9:34 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> say, pkg_prerm() functions would never be written with respect to the
> variable ${D}, which would be relevant only during image creation. but
> i can see things like this in sysklogd.inc:
>
> pkg_prerm_${PN} () {
>         if test "x$D" = "x"; then

note that its not ${D} (bitbake context) but $D which is evaluated in
the context when the script is run.

