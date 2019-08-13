Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B83527D3B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 15:54:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m125so1896752wmm.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 08:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=7cwEVbbuMJMXhZAvze+EYlPd8ACZvr+YlvcbQC/duVA=;
	b=HdiYnfXrx9gDhGiDt7/COeE7l7f0NkJcTd9c4pUwAc1bYg6Wa3QoOXhjPS1Gi0trU4
	5IDcRqhFSX3tDGtlzGjIGsDEV8t9a/d/iVPoTPfpIJPEc+YlhFFBu906RaT6vuZ3sQKf
	RB4Avf8YfBZY2fc/DP9QCfhjHjx8lXeSppB3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7cwEVbbuMJMXhZAvze+EYlPd8ACZvr+YlvcbQC/duVA=;
	b=H9wi6qgLGNm4oCJodzrpU4ql857cMrPTHELuTYifisWFO9fXvnFlokWA+hCp6J+oRq
	nPpX2Jve7CMO2PmWaVme+RMOQ0u0QoaamrPQKemlknoOQ0zFMIDqfxCwCNHRBnm9juGJ
	UhUhwaA1dU/jlX4LSwMxI0F6CFtUj20mDnXvQFfhHLhMN3qehqltSceSWQa70Ql2H6dw
	fz3LNrilaeg+pR9FsWUftA4J09mPb+5ik21sOkFdSli7oGMhSmfXnnAlId6+WXnE4D+8
	05qYLDP2pWv1b2EMyqzOxOYgEM9P7R8SPjVLXAQ9aIhSHIWnTJB9nO5hAZugX+zPgut6
	MMRg==
X-Gm-Message-State: APjAAAXSWveEQAYwdDk2tKsXmFvFuCZwwXGaMTu1ueGEzPC/eQfuLmAt
	kBY5lxjKer+ChlVus8xHy5LclQ==
X-Google-Smtp-Source: APXvYqwA7/dVGpiTB11euF4b1C8UVXg0Ow7rk2EBjP7BKGOTptMtzyxnUzMeMexonU+krGLI7xcXaA==
X-Received: by 2002:a1c:4383:: with SMTP id q125mr4007529wma.16.1565711648281; 
	Tue, 13 Aug 2019 08:54:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r15sm114826339wrj.68.2019.08.13.08.54.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 08:54:07 -0700 (PDT)
Message-ID: <a726717439704d783b7634cf4843f9c4258290ed.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>, Michael Halstead
	<mhalstead@linuxfoundation.org>
Date: Tue, 13 Aug 2019 16:54:02 +0100
In-Reply-To: <CAMKF1sp7BmgtiMpRBLiFDorbmQePhK2eyH35wreprETK+kPPtg@mail.gmail.com>
References: <20190812134903.55045-1-alex.kanavin@gmail.com>
	<20190812134903.55045-2-alex.kanavin@gmail.com>
	<72c38e8826111b832afe9df09ab350b099918f8b.camel@linuxfoundation.org>
	<CANNYZj96rpe3di1jNa9d9N79YWE0Ax8_=wcG1kK5Z87H+dDOiA@mail.gmail.com>
	<ea008eaf-88a9-5551-7e57-fe45973ac6cc@linuxfoundation.org>
	<CAMKF1sp7BmgtiMpRBLiFDorbmQePhK2eyH35wreprETK+kPPtg@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python3-numpy: update to 1.17.0
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
X-List-Received-Date: Tue, 13 Aug 2019 15:54:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-13 at 08:35 -0700, Khem Raj wrote:
> On Tue, Aug 13, 2019 at 8:34 AM Michael Halstead
> <mhalstead@linuxfoundation.org> wrote:
> > 
> > On 8/13/19 2:54 AM, Alexander Kanavin wrote:
> > 
> > On Tue, 13 Aug 2019 at 10:34, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > This doesn't build on opensuse 42.3:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/907
> > > 
> > > Its numpy-native and looks like it might be the old compiler :(
> > 
> > That version of opensuse went end-of-life about a month ago. We can
> > hold this off until the autobuilder is upgraded.
> > 
> > Alex
> > 
> > I'm ready to drop this worker at any time. opensuse-42.3 is still a
> > SANITY_TESTED_DISTRO. Is it fine to go ahead and remove this?
> > 
> 
> sure, also a patch to drop it from SANITY_TESTED_DISTRO before
> disconnecting it

Patch queued.

Cheers,

Richard


