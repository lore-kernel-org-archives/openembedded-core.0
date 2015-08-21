Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 788997391A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 22:01:05 +0000 (UTC)
Received: by igfj19 with SMTP id j19so23480397igf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 15:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=iGsY7VvF4DLb/JkAl3rlpNgAkn5Kf7Jb4BkSdNb8OtU=;
	b=atOyBweHCwy1rrEey9K+eq9P3dS3PCl8VWPC2bP3XLJkfXZsFTi1QFRuIFqBzyo+LI
	iQgpJ5cWV+d6wio73O8cHerLxS7P6OzxUtxm10LoAxLhimrZys09D7dSC7IF12ZxM+Cm
	/UQtqCUma6BgU1bEfTvdhQ9JPxWx+vKWkrpPVlTfO0K15BTZWIhhRRdv7tI1qPxpKcA8
	cWxy4Glga+L5Ed64MbPXwaR96UAFfsz1j/DfYmC+xK8V5S+RTZUeHxPDRUV9Ksa7e/LN
	8yp8JcE/UU8myqY7A/ByNG7RYWvZzVTDERQxPBId4SrBMLtPd0k4mCz1Sl60GaSPIOr3
	D16g==
X-Gm-Message-State: ALoCoQnX3LxpVKuhd6yRV916WH0SaNHBvxzSzdrXLhip0a/5yOYfSuISW291knj1kxrEBDDx1l26
X-Received: by 10.50.73.41 with SMTP id i9mr5320644igv.14.1440194466139;
	Fri, 21 Aug 2015 15:01:06 -0700 (PDT)
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com.
	[209.85.213.172]) by smtp.gmail.com with ESMTPSA id
	qq7sm2773309igb.13.2015.08.21.15.01.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 15:01:05 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igfj19 with SMTP id j19so27479086igf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 15:01:04 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.88.8 with SMTP id bc8mr5507165igb.46.1440194464763; Fri,
	21 Aug 2015 15:01:04 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 21 Aug 2015 15:01:04 -0700 (PDT)
In-Reply-To: <55D79ECC.9070308@pseudoterminal.org>
References: <1440167394-20065-1-git-send-email-b54851@freescale.com>
	<55D79ECC.9070308@pseudoterminal.org>
Date: Fri, 21 Aug 2015 19:01:04 -0300
Message-ID: <CAP9ODKqcyRt_Yc=aO=7dN0hreYnwHXOEE-FiuSbG0dPDqecMVQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4 0/2] gstreamer1.0: Add patches for Gstreamer 1.4.5
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
X-List-Received-Date: Fri, 21 Aug 2015 22:01:06 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 6:57 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> These are backports, so I do not see a problem with them. However, keep in
> mind that GStreamer 1.6 will be out in a few days, so I recommend hold off
> any patches that are not backports. I have recipes prepared for 1.5.90 (=
> 1.6 release candidate) that I will then send to the mailing list. New
> patches should be applied on top of that, not 1.4.5.

In this case it is better to not merge those and wait for 1.5.90 to be
send. This allow for testing and also FSL checking for any other
pending fixes.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

