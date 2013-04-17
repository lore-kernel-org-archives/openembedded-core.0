Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1USZFb-0007po-KE
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 22:46:44 +0200
Received: by mail-vc0-f182.google.com with SMTP id ht10so1696261vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 13:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=GFAjlTF+yZ9flGIStsAIqQPfM/tU8yE/cTypusTk8uI=;
	b=Pz0PyJGxiypnzQqWrujMy8yFJHhF9XUVNL8SFVk6wMp7YZWSOTkNAexQt/2tM/pBem
	buU5AjDR6bNubhu2adVZqFDPioTySDztQW6wn5Z5CJW4S1E2gf6Vrq5QAhdLND95BaR3
	u+sS/hNeZ3NSBWtVpRv1yXKS2wdKmi43pyxCvdjd8R39U32mIL40QkcXuy+lvOHz6Nnq
	dOLpz0+AWJvcUDKLwWZz2WrE1qWd8jcR8iogp3nYMoVik34eEP7vJePLjYcNjuE1ON24
	2/2y6Lz8gde52Xt9G/xoMouO8AVoZTNt/eK4JQjC0zNES0mwOdJ4NoQsefciZDXeUoip
	w7DA==
X-Received: by 10.52.108.10 with SMTP id hg10mr5155214vdb.34.1366230548867;
	Wed, 17 Apr 2013 13:29:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 17 Apr 2013 13:28:48 -0700 (PDT)
In-Reply-To: <98902250-F158-4566-962F-17153E77E39A@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
	<98902250-F158-4566-962F-17153E77E39A@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Apr 2013 21:28:48 +0100
Message-ID: <CAJTo0LYMGpjHpW9=y1tX2k6uodB8=Lijod18KmgSq_PvLLU21A@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl20at0PHiP3EUWEFGebhYlHl9TL2sSFsNmn92EJ6rWAz1RNZJ56h96uc4xe64u3M/DN0LT
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Wed, 17 Apr 2013 20:46:45 -0000
Content-Type: text/plain; charset=UTF-8

On 17 April 2013 21:26, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> 3.5 minutes is still a long time, what packages does it run on the target?
>
> According to the do_rootfs logs, the gconftool-2 ones. This is a full gnome image with a complete desktop and gconftool is *very* slow.


Using gconf.bbclass? Those should be running on the host when doing
rootfs, so checking the rootfs logs would be useful if that is the
case.

Ross


