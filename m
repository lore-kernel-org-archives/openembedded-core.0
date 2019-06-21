Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4181D7D716
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 21:37:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a15so7492312wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 14:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4YVVoTR9YEmTvSUeFlnpMmS74WodPhkonwsK1pnWwqs=;
	b=AUfgyUmri+ljJDiL+T6vvG+kZ0ROmRv0Jr6DiUZBr7B6NBqvGpq+7sow0M7Hv64sZQ
	1iqOEDwS/P3D88D5/D3VqtxTfohF/8gngB7m8rQHm5XvqSvg5F0WZ0QhPTLUAvyD8Her
	yc708Tjgs7LbXBTfQZBvdKNq4Bw5NncRYuq7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4YVVoTR9YEmTvSUeFlnpMmS74WodPhkonwsK1pnWwqs=;
	b=NjxZPaHcEsJRpJYc755yHDLJAMt6E9G5IoTp3SAatO/ppp2RY8Ja/zYEnjYNEZYSf/
	qRnboryTrRvU8QsQpbdPvhVJ3wBSEp2yW1SxinjVAfzuyGycSlbZJpSn82XarkvJQuI4
	FTrGUT5rWabka0/XQ7a+0/LZJDdfLxmeZrwrOZ+H+nfJuFydeVt4YLJ0arZgv/ypBSXW
	jsHkH+mOlcOdNQRgBYICUKk3bayhomAP+U4t+nckPFZzmnCu/r5lBJwb3LP703sfQd2f
	G1OCix3OPWfjdBL1oNHw+yFo3JrccP9BF6wtVLokNW7jf4YID1IPgXM23+1tWgnR8AdR
	RR/Q==
X-Gm-Message-State: APjAAAVtVjP9C+BYuLe1dblm5bQ7fKNWeXsRx7waplfdgMbgz7O8Rn/v
	E+65c/7VRi4+xaSVKEonQMOfCA==
X-Google-Smtp-Source: APXvYqw/+IgS2DY738J/stK1q7J7xWY3Z3ovheMBTn1xB6Yg+Ip96X5si71mwbpj2eQ78DwOelEWPQ==
X-Received: by 2002:a1c:65c3:: with SMTP id z186mr5627662wmb.116.1561153073911;
	Fri, 21 Jun 2019 14:37:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z6sm3471271wrw.2.2019.06.21.14.37.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 14:37:53 -0700 (PDT)
Message-ID: <962677500f191acbfedbc026a5dd231155e2e744.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jon Mason <jdmason@kudzu.us>
Date: Fri, 21 Jun 2019 22:37:52 +0100
In-Reply-To: <CAPoiz9y+hqO5CNxxkL3XdpHMDJoEeF3LrGU_kFzhrhxiQacR-w@mail.gmail.com>
References: <20190621154213.12761-1-jdmason@kudzu.us>
	<eea8e0445b82a8fd472fa9333a665555a990728a.camel@linuxfoundation.org>
	<CAPoiz9zekGpeDRd=PMCneuzNeBgEBzHjgoKvcrR5WjnWHUDSiw@mail.gmail.com>
	<1a9c38dca2be655c935d435a6cf6f52ae8342bf6.camel@linuxfoundation.org>
	<CAPoiz9z-5w_jGUtzJVtAfByUroGAo+6-rkuDP+WkKk1s89r3HA@mail.gmail.com>
	<CAPoiz9y+hqO5CNxxkL3XdpHMDJoEeF3LrGU_kFzhrhxiQacR-w@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe_syslog.py: Handle syslogd/klogd restart race
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
X-List-Received-Date: Fri, 21 Jun 2019 21:37:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-21 at 15:26 -0400, Jon Mason wrote:
> On Fri, Jun 21, 2019 at 1:44 PM Jon Mason <jdmason@kudzu.us> wrote:
> > On Fri, Jun 21, 2019 at 12:58 PM <
> > richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > I realise there is slightly more overhead but it might give us
> > > more
> > > chance of fixing all the races?
> > 
> > 4 extra function calls would almost be statistical noise.  I'll
> > code
> > it up to do the check every time regardless and add it for each
> > syslogd/klogd call.
> 
> A timed run of testimage on a Cortex A57x4 system (with KVM enabled)
> went from ~1m21s (1m23s, 1m22s,1m20s) to ~1m23s (1m22s, 1m25s,
> 1m24s).
> Without KVM enabled, it went from 20m6s to 20m56s. It's possible with
> a larger sample size that they would converge even more, but I think
> this is sufficient to show it's not a deal breaker to run it every
> time.

Sound good to me, thanks! :)

Cheers,

Richard


