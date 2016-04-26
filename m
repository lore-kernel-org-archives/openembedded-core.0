Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8045F6FF01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 14:49:22 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id r5so7492094pag.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Fsml3EAWepWxfbCfwfXKsdUcuH88ZEkqCxE4NQVke3Y=;
	b=jekAqynPB9XxhfRFDqp0gAASQmm6QpmxRXx9YvgsNeJGVL0WRQ88G+PCNxzkj+vp0/
	gXarrJiQvssHo8+r1ZFiN6fMAC/gTpd+fSbVfVxc5GPeBQQYq2TkrAJLZfCSdEFFXZ5E
	NmkC5iiJEhVBzIsAt5TkaVhvssdRrRtqMuiEPBymvOhiypBlygMhWDtt5Z74/kgsd7Mx
	/4IOIrmVaxhO9BlizazHKRwAVwGPHxNOAkto+QWtg1lKwLTr1EyPtO4IK/aaMjV36/xV
	XTTewcbLholHrOeiomNlCuS+cGfVCa0bWiDkdJ/8U0vgPDqm1qpkWtOzd4atWFS0RUOI
	SlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Fsml3EAWepWxfbCfwfXKsdUcuH88ZEkqCxE4NQVke3Y=;
	b=inIydkN18E7/g+Sy2FyZmK/1n3xZBR7ax6z+dCU+ghbk75zqGCZwDTs1stsKGkDJWu
	PiOSUpF+25RiLpmAllAA6Ee9DnNuVG86D3B30HovHVXURAVQ0jolzjD2jn6cpEGzU+yQ
	LW277yWztg0a6KPI07t2p/pceJlQgl+HkiGiXxdrgZcGMajph56LuwOXzFsaCKHr5U+m
	Ye55tzGSnWaT4kEs6oP9BCavAz5Q810zd6IA5eA4WgAE/5w5cuoaD/pULLzdfTDh9rLj
	ffUU+idutPYF1ymvr2TyxYr/y59wqPioOk6F1ZMyEIJjcmjfgYJ8j+TYDriaob/3e0oX
	w6xw==
X-Gm-Message-State: AOPr4FWhKFQpF8dl8CL2KkbKaluh+/lYzpN/prcEUm2gionFIGJxygJdQanh6i3LuoNHMg==
X-Received: by 10.66.67.11 with SMTP id j11mr4164363pat.45.1461682163469;
	Tue, 26 Apr 2016 07:49:23 -0700 (PDT)
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com.
	[209.85.192.171]) by smtp.gmail.com with ESMTPSA id
	79sm37646056pfq.65.2016.04.26.07.49.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Apr 2016 07:49:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f171.google.com with SMTP id c189so7738425pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 07:49:21 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.87.11 with SMTP id l11mr4132804pfb.95.1461682161473; Tue,
	26 Apr 2016 07:49:21 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Tue, 26 Apr 2016 07:49:21 -0700 (PDT)
In-Reply-To: <20160426142703.GE31113@denix.org>
References: <20160422000519.GR16135@denix.org>
	<CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
	<20160425165011.GV16135@denix.org>
	<CAJTo0LZCgoyt8GyvbkhvsK4_Q8v5MgU3O+0FFXGaajyyiDS0Zg@mail.gmail.com>
	<CAJTo0Lb3pwi-BewA3kyU+QhgP2_s5uXd=vXH0fXRA8wM-9fMgg@mail.gmail.com>
	<20160426142703.GE31113@denix.org>
Date: Tue, 26 Apr 2016 11:49:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKra2rghspNPLPJ+sXHDGUK0QN3+ebvdiQPeGp+vZcqj7A@mail.gmail.com>
Message-ID: <CAP9ODKra2rghspNPLPJ+sXHDGUK0QN3+ebvdiQPeGp+vZcqj7A@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Christopher Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: mesa, libgbm and weston
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
X-List-Received-Date: Tue, 26 Apr 2016 14:49:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 26, 2016 at 11:27 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Apr 26, 2016 at 03:00:59PM +0100, Burton, Ross wrote:
>> On 26 April 2016 at 12:59, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> > I added a PACKAGECONFIG for libgbm to mesa.inc, enabled it for mesa and
>> > disabled it for mesa-gl, and mesa-gl still build fine but didn't ship a
>> > libgbm.
>> >
>> > I've forgotten the details about all of this: does mesa-gl shipping libgbm
>> > make sense at all?  Or in the real world will BSPs either use mesa or their
>> > own GLES driver + their own libgbm + mesa-gl if required?
>> >
>>
>> I've just sent a couple of mesa patches, can you see if these help?
>
> Thanks, making few builds now to test those.
>
> What about virtual/libgbm package and updating mesa's PROVIDES list?

I think it would make it even more flexible; I am in favor of it.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

