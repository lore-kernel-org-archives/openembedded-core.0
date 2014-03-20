Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id A2DA86EE45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 11:34:36 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id w10so796914pde.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 04:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=IXQvADjy+vXXaLieARlBI3gbbCA0hQJwv6uPKkwt9HU=;
	b=D9cgZ/593LgCj/XXjP3wwoJettsM/026GC++0/vdCXEw3GUwQ+vMFcUScBSVyU6HTe
	cF9sF/ltQJ2gQcT+mAbeUFFt7wQDGVpYrLfct8Okra8P02V67jlfbD0U2tuOsuFve/a9
	PP4FZ5T/QxvRZM//3pNiMrRJAZGXbWZ0rchTLOvqbjF/w6iIQSDwDEzqZ29GifVRyZ2t
	r5D1iWtfQyURL3OW4iiMnVUWVvYZIt8MBYF4xksuYljCFTwUiERJWKHpgqw5L22EBXLv
	XAG1O0lgC0g6XsaakYmRuLoptQu5TgnEoeIvzkMLVQtDXCyF2dAya3WOr3eCq1Hz9Xu4
	4Mjg==
X-Gm-Message-State: ALoCoQkDZ2YPF8DO0OH2WVF3PmvD2OodNBoVxVYP3FMq2DmSRCTEN0lwbwfDH4HkPagYBxOxrsHj
MIME-Version: 1.0
X-Received: by 10.68.239.70 with SMTP id vq6mr23112203pbc.152.1395315277754;
	Thu, 20 Mar 2014 04:34:37 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.11.164 with HTTP; Thu, 20 Mar 2014 04:34:37 -0700 (PDT)
In-Reply-To: <CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
Date: Thu, 20 Mar 2014 11:34:37 +0000
X-Google-Sender-Auth: I1rGs6SYGz4l6FssDQA2fd_V2Gg
Message-ID: <CAOMwXhN2Tu2cWwopsRs0EGJCDVHJRe0rsiPQ_3Ty+w3ezTN5bw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 11:34:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 10:45 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 March 2014 03:26, Laszlo Papp <lpapp@kde.org> wrote:
>> +PEER=127.0.0.1
>
> That doesn't seem like a very useful default.  We also can't use the
> NTP pool by default, so this should copy the behaviour of the ntpd
> package in meta-networking and default to no peers, and not start if
> none are specified.

Yeah, some real timeserver could be put behind comments.

