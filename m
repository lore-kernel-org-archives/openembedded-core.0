Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2825D7C4DB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2019 16:25:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Ml6s4Vwjz4T;
	Sun, 17 Mar 2019 17:25:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552839958;
	bh=E2SagyqZQ3hzeO3xMwqi0GxenQwRWdA2VsyqcuuEVhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFZQDIQ1kCuMHufYQGLhe1Wq+NUz5+QG3zjTzTV+vmxqTtj0Vi/xqoZT2gzHPc/0v
	Pq/EJ5OaABc0DiaPB4MmSGbuhRugjN1eQ3a4sMUWd94deUNvX6otW+bjBpa1rML69l
	uSFLxNYE6Wi7daeiBUeOskgzhuHjGowwFKxfRF/Ibcnr+uQ7DlP7wDk2Lrb3q4s5pB
	O20XjM6c7A9AwVWEX67SCaVFLJ8YxOoAXGoVPiq3r7BUUdOeF+UfMoPqWasTKHcTHR
	HKLzclETlr9d3ugCwZmUzQVNYzduhfyp5kSRTe63UPJepZsZaYSSCII+oZW/UQQsAh
	JqlkqQxxkHJr7xNQ+gBQLJK6TP7tahwSIAXxPoi7ulpHLy8V+TyDQldrc4dMcAuRTa
	slVZ21R9sP+QG267QTPa6ptDAQp66xfqB7D9z4/amKgHU40s+qJDnbzH3c75rXWtSM
	Z1+KMoY33GcL/cIZ4YNocOOfi35KibcM5V3bMabuCcGNIvjZpS1V9pnv+RaEPgd4mP
	3mew/WfQq8fxXng5OyjpXtS+Jfpc0DwMSfz04/Ux/kbifBdOYsARgyMdTytg1jqJ4O
	UWB2rcxZh6qiXphTzHBjtaexteddhFDFEUwxANs5i6nGwxQvdVAeirrvmbGmMsdQ9N
	w7D4zrl1ERpiP38ZZpKlgAMg=
Date: Sun, 17 Mar 2019 18:25:55 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190317162555.GB3809@localhost>
References: <154947113576.452.14618413373824638023@git.openembedded.org>
	<CALbNGRRLfW_ih43gr8n_rG5YcLQizAs4Mhi0rU_TVjoCCyw1Ag@mail.gmail.com>
	<CALbNGRR0PjTSJWT=FARJrLNn4BPPV+XkS_RL2CiqSiOnj4Tfbg@mail.gmail.com>
	<d897cca3-2471-ecfa-c99a-da0df5649d37@gmail.com>
	<CALbNGRQBHySVaqLXNNTbM5xvo5fOh-UxzogyjC6Rm1_6_WETcw@mail.gmail.com>
	<ed62bdd5-c9ad-1796-2330-960d6072317d@gmail.com>
	<20190317130836.GA3809@localhost>
	<45f8b8f1-95b5-3b76-b955-91be44f5a99e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <45f8b8f1-95b5-3b76-b955-91be44f5a99e@gmail.com>
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
X-List-Received-Date: Sun, 17 Mar 2019 16:25:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Mar 17, 2019 at 08:38:20AM -0700, akuster808 wrote:
> 
> 
> On 3/17/19 6:08 AM, Adrian Bunk wrote:
> > On Sat, Mar 16, 2019 at 08:50:13AM -0700, akuster808 wrote:
> >> On 3/16/19 5:20 AM, Andreas Müller wrote:
> >> ...
> >>> 2. This was applied on Feb 6th which is not 3 month back exactly.
> >> then its worst than I thought, I can't remember what my thought process
> >> was back to Feb 6th.
> >>> [1] https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance#Point_release
> >> I am glad you are bringing these things up, it helps me revisit my own
> >> processes and help me improve.
> >>
> >> We are planning on revising the maintenance guidelines soon so I hope to
> >> get your input.
> > Was the boost upgrade in thud sent to the mailing list for review?
> That series did not, the previous ones and several Sumo request have.
> 
> So you are the second person to mention the update, is it causing a
> problem?

You were requesting input.

I am not using boost on Yocto, but in Debian it is pretty normal
that several packages stop building each time boost gets updated.

"Drop signals library as upstream has removed it" in the backported
commit shows the tip of this iceberg.

What went wrong that even the removal of a library from boost
did not prevent this change from entering a stable branch?

> > My reading of the "Requesting a fix in a stable branch" section 
> > would be that this is already a mandatory part of the process.
> 
> That is not under the "Maintainers procedure" so it does not apply.
> 
> I have taken requests via IRC and a simple "please add this to stable
> branch X" emails so I have not been enforcing the letter of the law. 
>...
> Like I have mentioned already, the processes mentioned in
> "Stable_branch_maintenance" are under review.

One problem is that changes to master are getting better reviewed than 
changes to stable branches.

Upgrading boost in a stable branch wouldn't have survived a mailing
list review.

A possible improvement would be to always use thud-next, and each time 
commits are added to thud-next an email thread with all new commits gets 
sent to the mailing list (similar to the review threads for new upstream 
stable kernels, see [1] for an example).

> regards,
> Armin

cu
Adrian

[1] https://lkml.org/lkml/2019/3/12/1290

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


