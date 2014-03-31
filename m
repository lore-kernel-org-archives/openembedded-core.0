Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 830456E00C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 13:55:15 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id c9so9008270qcz.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 06:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v3C/j4LhDyOM8Vffb0+wLzDGHlI8C5OXwA08q+yo32A=;
	b=LCENx15DlpDPnJ3d+LEYpAd2T83c4jcqJ4XyYD8/tKwOtz4uzW8R+n6Ha/FJipzMq0
	WJXCF3hxZkZ9g6CIFXqrUl9/WtgFHg7dxho/YU4+UalFFIpt6WQ3GTyd/qU5weNLa3fT
	TfSvFpBs42Vssct6YK4d2aZ2FOhmnVWLPxfjKp04LVkHMpy+JOhshRJtOrSEJMji1yTn
	KVnG5tq85/DOLDdBPpnyDiEK+guiPhx9EztcYL4WDjVotIc0PG3qlitMLXUam1PVDiAX
	whoRATwB4SDlzroDs3+UJ+4X6P+Mw13MTU1O+H1xgUA5DoF0G6Lo793tD/8b+91V61vH
	wZUQ==
X-Gm-Message-State: ALoCoQkRFaMCH1y9g0+kmUJAxssY8UcbDcF3VFqnxIXtkfVkHaNColdCS1uYgvGrd+Gq8Rc3WbiD
X-Received: by 10.224.75.5 with SMTP id w5mr8602801qaj.52.1396274116722; Mon,
	31 Mar 2014 06:55:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Mon, 31 Mar 2014 06:54:56 -0700 (PDT)
In-Reply-To: <CAP9ODKo3P_KvAYhbOs0VdHS_yQJ5Dk0EjhZ-vC387vAJ9XBonw@mail.gmail.com>
References: <1396123481-6064-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LbBHoO-_M=C7rc8FPjfzeOQxM2PAXjXbenBXxCwGW2oGw@mail.gmail.com>
	<CAP9ODKo3P_KvAYhbOs0VdHS_yQJ5Dk0EjhZ-vC387vAJ9XBonw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Mar 2014 14:54:56 +0100
Message-ID: <CAJTo0LZuA-9dKePrBGmwuwYkea2ij_46Wsx6z=v2X-L=E0HN+A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] packagegroup-core-tools-testapps: Move GLTOOLS to X11GLTOOLS
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
X-List-Received-Date: Mon, 31 Mar 2014 13:55:20 -0000
Content-Type: text/plain; charset=UTF-8

On 31 March 2014 14:47, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> I'm surprised that piglit needs libx11, waffle should be abstracting
>> that.  I'll have a quick look.
>
> Could we merge this and then fix piglit? I will send v2 as suggested
> by Richard, so we can address this.

Sure, this might need a piglit upgrade so would be 1.7 material anyway.

Ross

