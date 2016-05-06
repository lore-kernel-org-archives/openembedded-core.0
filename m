Return-Path: <rwoodsmall@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF2A731AC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 15:28:53 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id x35so12811354ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 08:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=nWmQeg98EZPAiEvhOkoXEpeQfPgxb64+bZm4oV5Z7Vg=;
	b=YmaStuT9p8VlpYd3xRk8IDRRZ7ANtt0SgHBC4BPBw037ZJNdSmQ3AUMa9izBl/Vqvx
	B+yGieKRi+FC9+HJGMmYrELuWOXETFmk7vrRrZFRHPzYqlkKdbwvptsPQiLqOmJPjh3j
	vYZ1Hdw2QmfKz4oPLIajN8gGD8SJBSOoEnRq/R/hxz3xs2qZn40vT0KWzws2xrYaDyRA
	R5VKO05OnNQMj9zHp/xF2ghB0XFDNSo3+WT34dm2pjTGahUdX4ul57GDoNbTmS5AKP5N
	5f0vhz1xTgASCX0eVIr/QgGpWy5FYWamWnn/Z1moLELplOkkdmstPONpe0u17fWUVuZr
	nqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=nWmQeg98EZPAiEvhOkoXEpeQfPgxb64+bZm4oV5Z7Vg=;
	b=UmcUXSkLDb0MSWn/HqQaKX1MsUgdZ83t+E1/HtNk/r52hkA1QHyNBptUtgFsHSWz0Y
	+u36EUZBL725pl46dRfdU5tWPn63hSVeJseQtcRsTeaFMMF+lhDFYacxLE7jvw8tUJF9
	g2sTV+lbMGcIP+c6hnlOUgI8iBAifMFNheLm7LgZEymJex0GU1MtZRAVMXelO+9kut7+
	Zo6+COxoaSTeGgDpm37luH7UOD77Bagy6Y+HC0Rns+hx3992FGHtXHiJ1Tt/BOPZkAK8
	hgvaIERAmnEsXo0oH3k/XIspof+3alBWDOtWEeNEJ9pXVqad47hIFVKLSmStaky3rMJl
	wy1Q==
X-Gm-Message-State: AOPr4FW2AcePgEyv9uHfiudFTD4JQA821NApn3f9Swl7V459zzZCK+ol8KfF4oN6ZF8MJIY3cn9thNl4sL9u9Q==
MIME-Version: 1.0
X-Received: by 10.107.15.140 with SMTP id 12mr24608845iop.10.1462548534652;
	Fri, 06 May 2016 08:28:54 -0700 (PDT)
Received: by 10.79.13.9 with HTTP; Fri, 6 May 2016 08:28:54 -0700 (PDT)
In-Reply-To: <CAJTo0LYQ+hwbROgqxY5ts1uq3-DWj3Y4xhq2shPP7qC687x2aw@mail.gmail.com>
References: <1462507108-17945-1-git-send-email-rwoodsmall@gmail.com>
	<CAMKF1spYLh9=YybuH_aJ9QLhJ1=Ub79VMVgFpBv3QXuD8r2-9Q@mail.gmail.com>
	<CAFL-KX8ffjqey04OTBCndwyP61i_mzcDY8tnGknRyA1edBTsWQ@mail.gmail.com>
	<CAJTo0LYQ+hwbROgqxY5ts1uq3-DWj3Y4xhq2shPP7qC687x2aw@mail.gmail.com>
Date: Fri, 6 May 2016 10:28:54 -0500
Message-ID: <CAFL-KX8Hb2HPwCgEeGraU_whbCuubpJFDtvHbEfjrcSmDG2UAA@mail.gmail.com>
From: ryan woodsmall <rwoodsmall@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Make static lib builds (DISABLE_STATIC) configurable from local.conf
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
X-List-Received-Date: Fri, 06 May 2016 15:28:57 -0000
Content-Type: text/plain; charset=UTF-8

ACK, thanks guys. Rolling a distro is the better thing to do in the
long run, so that's the direction I'll head.

On 5/6/16, Burton, Ross <ross.burton@intel.com> wrote:
> On 6 May 2016 at 05:38, ryan woodsmall <rwoodsmall@gmail.com> wrote:
>
>> The idea is to build an as-close-to-stock-as-possible Poky (or another)
>> distro, but include support for static linking natively in the installed
>> OS. Some of the bits I build/ship, including standalone static cross and
>> native toolchains, target Poky as the stable reference source OS
>
>
> Don't consider Poky to be a superior distro over others, or even the
> default nodistro, as it's not.  It's simply a vehicle for our QA process
> and is a pretty minimal set of changes over the oe-core nodistro.
>
> Ross
>


-- 

  ryan woodsmall
    rwoodsmall@gmail.com

