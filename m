Return-Path: <max.oss.09@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id E6FAD71440
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 22:20:01 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id z107so1558810qgd.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 14:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ewUqUIzTalQ8L/TuPf3DFPImdiBowwhQkWtAbvVufX8=;
	b=TYMoexHJsoP+EbA6fh/9daspVggO4fxMW4n+QCHYYNIxPXSxAj0MOJgtSzJdgYFRai
	R5G8MaXjYMAFvjwVDvuSg6rCQCg0icVmVuhdyKKeJe1/KRoM8ORptOAAc0yHQKiBMpAK
	cRMqD/m4pIIiViZn68v/tVw76rYDGXJRHnhgLsgIT40eayxt/fgvvPXJNMpx3g8UGeru
	oqWXHcOvlvSWi0UgN7pJiZnAbaj/U32BRw0QgOYcHY+j3TIevtCs0dJ8oISn+YqoqWoN
	F2yfwb+2FNtvg70TjOrMsXQmcImywKQWLg9ii8anVRTe1Pszh2ZsYDtQ8xUXTh2TWoe0
	5dKw==
MIME-Version: 1.0
X-Received: by 10.140.43.195 with SMTP id e61mr8180929qga.13.1420669202007;
	Wed, 07 Jan 2015 14:20:02 -0800 (PST)
Received: by 10.140.40.169 with HTTP; Wed, 7 Jan 2015 14:20:01 -0800 (PST)
In-Reply-To: <CAJTo0LaTaRFC=HzC9qeU6DOnxso5re66wYvhdRdUyPdVwPkJ2g@mail.gmail.com>
References: <1420233904-26745-1-git-send-email-max.oss.09@gmail.com>
	<1420233904-26745-2-git-send-email-max.oss.09@gmail.com>
	<CAJTo0LaTaRFC=HzC9qeU6DOnxso5re66wYvhdRdUyPdVwPkJ2g@mail.gmail.com>
Date: Wed, 7 Jan 2015 23:20:01 +0100
Message-ID: <CAEHkU3ViZ35X7ELevxRBgUtvtC_Ybe6Z=VpngjFeMr7VRXcpUQ@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCH 1/3] libfm: update to 1.2.3
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
X-List-Received-Date: Wed, 07 Jan 2015 22:20:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Ross

Thank you for looking into this.

2015-01-07 16:17 GMT+01:00 Burton, Ross <ross.burton@intel.com>:
> Don't use absolute paths such as /usr/lib/ as those paths are not constant -
> multilib environments or x32 for example use different values for ${libdir}.
>

I will rework the patch along with the menu-cache one and resend a v2
of the patch set.

Regards
Max

