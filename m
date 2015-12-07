Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 35FA560124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 14:13:49 +0000 (UTC)
Received: by pfdd184 with SMTP id d184so65647733pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 06:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=JI6m7LwvJNIOum48fESmkB0i3tkEM7z59yMzORcYP/I=;
	b=jnZcXHfuNaQQ8nPV9qDOqzAvcVjEuoLlOUgg5RCN855Qk7GMG9f3FWEGRifmd7uv+q
	a7R/9m2/4G+GWIi1LnCXD23whusXrioddYGey9Yx9HsoTPdLZqn2Jxi0jGVBQfSY4nAn
	TF3z548cgNBjzWLCTDZ8NUvjp2PVTGBNdZrrSEIVMHRku2opUXCgzNuabowXr/yjRF63
	fLINZ+ObdF64saw+hfd35OkYPPF48uAQ6IqMX/la0VuVzoqV92ibNO4k6NVA25tdL/63
	zVLLVDADTkotwtyUJBulmuJAmaU1FgNqvS0egJtYPgKwbFRdmwgXH+Xff2gLTztYUMjY
	6NLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=JI6m7LwvJNIOum48fESmkB0i3tkEM7z59yMzORcYP/I=;
	b=Vm/GTOLnASVtsY9WHY7PxflgCf7Yyl1BUPUfg/g1o0u8unOXbVxmNmP7L+i8fTwMV7
	5dHKA/vxeVL0BPMTeI7zsXMM3WbCUHtfgbqRwlnciJJnJ26CXYhZWw7o0ke9Fm2DMiwb
	7VyM4sDoNU48T1zzkLBZ+MgYPHAzltIqldOxXiISHs8MpPGPBiQHgXiYadUbDzDgmq1o
	wdBmyNwaucVb3pq3ptbCbmbL4p9xODEl41Zg9xqsIGgQFQpYAi+6lWkT/xpgPgNVWkUG
	yjn8eAcl+f9DiBA+S5DPahian9Zx1pGqIpFjkmDg1NbICA+1FxIsepUAJql43BK8cwFh
	G8yg==
X-Gm-Message-State: ALoCoQkpvyM4vgsWyL/JnQUEYNvs3YDmw5LiRYk5C0X3mrf8DrZLTZan1XS+XjGJwk3I6iumY11T
X-Received: by 10.98.73.133 with SMTP id r5mr43028626pfi.160.1449497630566;
	Mon, 07 Dec 2015 06:13:50 -0800 (PST)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	o2sm35185941pap.31.2015.12.07.06.13.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Dec 2015 06:13:49 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacdm15 with SMTP id dm15so125649359pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 06:13:48 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.160.194 with SMTP id xm2mr43122143pab.68.1449497628790;
	Mon, 07 Dec 2015 06:13:48 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Mon, 7 Dec 2015 06:13:48 -0800 (PST)
In-Reply-To: <BN3PR03MB1415F09661073294ECA6D2A2E8090@BN3PR03MB1415.namprd03.prod.outlook.com>
References: <1449001866-29286-1-git-send-email-tom.hochstein@freescale.com>
	<60070.10.252.17.232.1449008484.squirrel@linux.intel.com>
	<BN3PR03MB1415F09661073294ECA6D2A2E8090@BN3PR03MB1415.namprd03.prod.outlook.com>
Date: Mon, 7 Dec 2015 12:13:48 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr8E+mYH3rY-XKLnaWMUr0r9bLQhfAmp9iru1vvYQ0MZg@mail.gmail.com>
Message-ID: <CAP9ODKr8E+mYH3rY-XKLnaWMUr0r9bLQhfAmp9iru1vvYQ0MZg@mail.gmail.com>
To: Tom Hochstein <Tom.Hochstein@freescale.com>
Cc: Sundararaj Prabhu <Prabhu.Sundararaj@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Mon, 07 Dec 2015 14:13:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 7, 2015 at 11:19 AM, Tom Hochstein
<Tom.Hochstein@freescale.com> wrote:
> Hi Alex,
>
> We're wondering how best to fix this.
>
> The Weston website seems to give the answer for a run-time solution, which is basically 'if $DISPLAY is set use weston, otherwise use weston-launch'.
>
> http://wayland.freedesktop.org/building.html
>
> Is that the right approach? Another possibility is to make it a build-time solution where the bsp layer sets a variable controlling the selection.

Runtime is always better, when possible.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

