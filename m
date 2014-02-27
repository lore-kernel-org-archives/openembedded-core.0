Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5569A6E908
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 10:33:16 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id w8so1776221qac.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 02:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BcGCxSRCqLPwP8HM+W/zQJiNw4MFW3R/iBs1iI1BGVk=;
	b=FUxY/rlkFq8sJOan+DxTAr6K0Ix8zYg31pJNCOUkdqxjaQEBjQwzOLZwZYwL65t+xl
	gZqcTjprIJTVvrHL/vtURzqh5TOqWys7kHo84owTDmF5EuM85VuhTzHlQieX9rt6BKsx
	R/qkaSzwEmrKEfwaH2q0HSh3v5ZBw7TxQRoCRB5N4AuDQka1sr2L+FR0cGXf90+Nxkkv
	qdf6PRdteEbFKENL67h/yt9W30vEyweWBM0Xi/ge2Hfi/GVIk1FRLoJunuzRR6oz1MPB
	Mj5i+WsMf/Hg5XOdD/lPz7GDemMY5X+QB0AD2Lzo1Q+Sz0cUFHldsc90vljgU9+4oOol
	gDKw==
X-Gm-Message-State: ALoCoQlQ0/UiyHIqUYlhgfOgaGvBTktiNjCJUFlQaL3+8Wmk+EUTgEGgy0NFhhbeefBhAMWpNgpa
X-Received: by 10.224.43.144 with SMTP id w16mr15192672qae.93.1393497197400;
	Thu, 27 Feb 2014 02:33:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 27 Feb 2014 02:32:57 -0800 (PST)
In-Reply-To: <530F032E.8030804@windriver.com>
References: <1393471408-29014-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYcdFjkgKH3fRdt8F3Tyfc2pxbAXMnP77pEc9CdnsMAgQ@mail.gmail.com>
	<530F032E.8030804@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Feb 2014 10:32:57 +0000
Message-ID: <CAJTo0LZN50QA4+uNdaV0ntYJgoHiiBOS4aPcBTb_HSX9EEbSLA@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: proper error handler should be given after send_negotiate_unix_fd failed
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
X-List-Received-Date: Thu, 27 Feb 2014 10:33:17 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2014 09:19, Rongqing Li <rongqing.li@windriver.com> wrote:
> I send it to freedesktop-dbus, but my mail seems block, I can not find it
>
> http://lists.freedesktop.org/archives/dbus/2014-February/thread.html

It's there now.  However the DBus web site states:

"Please report bugs (and submit patches) through the freedesktop.org Bugzilla."

So you should resubmit to there.  The list is currently flaming over
kdbus and I expect the patch will disappear.

Ross

