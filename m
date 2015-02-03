Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6A755601DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 12:04:58 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 9so24276307ykp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 04:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=kU2lPNSf25cCNRbAx1FGSGo0fx6NQ2CijJnbSCmXfHQ=;
	b=oX0geHQibPe+t80RMvHMdImXiGgDPxjT6M+sn/08yD6iypK00qv8c3d1ZnRYwpl38/
	fsjKrbMw2xMZadbvkzvH5C/R00C87Lu4M3qGH8ahlmYyGBNGxmgAIUc+1B/SXt3di1U2
	bd662HDMkrIZi92LigsG9Zc9fG+ycDGkesiFbAdAlbRMzBXgXYDoxgTCZpYKyHZHRSO/
	3nshrSBmpFMk63ifFgKzS3h8LKN/aTpyVhHjPWBj59GfJw8Fes2/8e2qviNlNkzJNw01
	lWWrQq5Zj2ykK8dlelKzZcdZfef9aKpNNGP8y9aF9kLfnbcnW144ch6PM9dNyTo/joFN
	taPw==
MIME-Version: 1.0
X-Received: by 10.236.199.103 with SMTP id w67mr9998487yhn.37.1422965099166;
	Tue, 03 Feb 2015 04:04:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Tue, 3 Feb 2015 04:04:59 -0800 (PST)
In-Reply-To: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
References: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
Date: Tue, 3 Feb 2015 10:04:59 -0200
X-Google-Sender-Auth: NpOYFk_CsJAeVw9t4jbBSV4qHbs
Message-ID: <CAP9ODKrSVAaspV7pv+s-eVuhjf3ptFuO-+qc+johEYQbpGaPFg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Use bb.warn instead of bb.error for deprecation notification.
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
X-List-Received-Date: Tue, 03 Feb 2015 12:05:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 2, 2015 at 8:30 AM, Florian Boor
<florian.boor@kernelconcepts.de> wrote:
> An error in bitbake/OE context is something fatal and interrupts the build.
> A deprecation warning is exactly what we have bb.warn for.
>
> Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>

The PRINC support has been dropped so it indeed has to raise an error.
The layer you are using needs to be fixed instead.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

