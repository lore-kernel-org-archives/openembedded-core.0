Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TQeo9-00005c-P9
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 15:46:13 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so4138134vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 06:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=aH3eYqeXHWiKEEtArMHP3X3wQz27ESdBBgXMjsSzhoE=;
	b=A+XxOyx9hHLYRxTCCSpVpgPVks9zv45+CubGgSqLmLvZy2kvTY2RUOJ8PkaFWWCb8Y
	+pp1tdOM9H+Rm4jF4AJQl2DkbfjtSRAUzuXXi8P2NVjTLFGqxiwMk5/YfvTZe/TeIUPl
	F2PHzT2Gp+MNMROGr+bxOrniaANGRatbhPgOZGk21dArBw4rmPguTW9fwH0yZuWwVpIS
	vTdFsQQjbnSRsKu/vwZ9EU9oOgjxtfnmaX+g5ROy7BzQnwLXXnKxncrRV1pyjwxVTifi
	i12VbL1dceHahsavnVFKGag6Zb+ww0aDgyRnOzlo8T8wB1zjTtmlZEnh3e7fn1+4wBF0
	v6PA==
MIME-Version: 1.0
Received: by 10.52.74.135 with SMTP id t7mr16626132vdv.18.1350999166976; Tue,
	23 Oct 2012 06:32:46 -0700 (PDT)
Received: by 10.58.170.104 with HTTP; Tue, 23 Oct 2012 06:32:46 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <50866ACF.8010105@r-finger.com>
References: <cover.1350898066.git.ross.burton@intel.com>
	<dc59bf999e1f8a6d5953c02d21c6e45c53c204a9.1350898066.git.ross.burton@intel.com>
	<50865F91.5060002@r-finger.com>
	<CAPj87rP+FHP8QeBvqVHVDX0dUHh-fFL1W_BQbV-1HErG5dE4FA@mail.gmail.com>
	<50866ACF.8010105@r-finger.com>
Date: Wed, 24 Oct 2012 00:32:46 +1100
Message-ID: <CAPj87rMbdH=AnT2q2M=GKcpUUA29ATimts3kbHueHMi28OG0Bw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>,
	Ross Burton <ross@burtonini.com>
X-Gm-Message-State: ALoCoQl0BSDG4ekbs4FuNaXwNH19L1fzxT4QHnUfNmQR+Fi6gCsHPjVftqnzL8b1Sn2TzgMcsiAF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libxkbcommon: New window system-independent xkb library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 13:46:14 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 23 October 2012 21:00, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> On 23/10/12 10:15, Daniel Stone wrote:
>> Not anymore, we use Python for makekeys nowadays.  (And, in an
>> unpushed tree, don't use Python at all if we can avoid it.)
>
> Good news, but perhaps you forgot to push this into the public repo?
> makekeys seems to be C program even in the current master, certainly in
> 1c880887666f84e08ea1752bb8a5ab2a7bf1d8a0.

My bad, look in master now and then you can remove everything around makekeys.

Cheers,
Daniel


