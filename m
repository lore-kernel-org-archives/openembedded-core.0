Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 215D160721
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2019 13:08:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44MflB6F0bz8B;
	Sun, 17 Mar 2019 14:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552828119;
	bh=7ONGQ+5m74DoOSBEN0UoZ4MCvisAxnkexJESssRMbZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPn6BZwVyCwL4kCWYZB8zRzkiWgUj6IiY3kmOoCTuZBOzZRk8wjNtpuhwk8t/Ko3w
	ykCL3syt6QjC+TveJyDd0Xv5tGytSPHT5UTjqevfi1CeyqgBKlv9k0I4kJ3G3A/heI
	U5phwx/8xoARFRv8Zcu1oLbn3fZMNQ7IZ+Kd/tZL+KQQ3Xr/ZSwE4QeCztn19Wshsf
	HjHh1nygKifjfdNTAWkOS4eRO20W43CAGkb1+1hmKVu+aPkzYg5uUCCgjfHYI+gg7N
	IExvVZW5TT2brbm5LADpUfkWSgJwbn89V15rlw8vqDqXviQrh1GAcgQ2ajsxWQ9OLg
	Q6XFe+7fxSVluyzgpeIA67oYDZQTG9LjjrhDSfekg1646Pg+kFJhMxcuqj7xpR87+O
	ztsV9t1cjDEyRbirnVRx/hQm2nWGo1y8w6HxPU2z0XGyGU0v8FPlAQ+LPLkmKhqQXo
	PnaVvNRLyZBv3BARTFpi5ws+u+01EXCQVkJCb1BDAcmc0qD+VoHIUTdcCivmXCj+fS
	Tbr9SXuc9d1eX5ERh7dtmiaoYVsegcH3nmxYu/ajECOYyyDa55iAIIL2OSM3kVVlda
	wOCsvwLbWxDfff0ooIqXv8V28Lztqy+Ocjxcs7/Ye5eFHSDvdS/6nTsh9bNBw04Id4
	vChGJVDMg0LTMnSUOIzLFZUI=
Date: Sun, 17 Mar 2019 15:08:36 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190317130836.GA3809@localhost>
References: <154947113576.452.14618413373824638023@git.openembedded.org>
	<CALbNGRRLfW_ih43gr8n_rG5YcLQizAs4Mhi0rU_TVjoCCyw1Ag@mail.gmail.com>
	<CALbNGRR0PjTSJWT=FARJrLNn4BPPV+XkS_RL2CiqSiOnj4Tfbg@mail.gmail.com>
	<d897cca3-2471-ecfa-c99a-da0df5649d37@gmail.com>
	<CALbNGRQBHySVaqLXNNTbM5xvo5fOh-UxzogyjC6Rm1_6_WETcw@mail.gmail.com>
	<ed62bdd5-c9ad-1796-2330-960d6072317d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ed62bdd5-c9ad-1796-2330-960d6072317d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch thud updated (ad0a553 -> 748f946)
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
X-List-Received-Date: Sun, 17 Mar 2019 13:08:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Mar 16, 2019 at 08:50:13AM -0700, akuster808 wrote:
> On 3/16/19 5:20 AM, Andreas Müller wrote:
>...
> > 2. This was applied on Feb 6th which is not 3 month back exactly.
> then its worst than I thought, I can't remember what my thought process
> was back to Feb 6th.
> >
> > [1] https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance#Point_release
> 
> I am glad you are bringing these things up, it helps me revisit my own
> processes and help me improve.
> 
> We are planning on revising the maintenance guidelines soon so I hope to
> get your input.

Was the boost upgrade in thud sent to the mailing list for review?

My reading of the "Requesting a fix in a stable branch" section 
would be that this is already a mandatory part of the process.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


