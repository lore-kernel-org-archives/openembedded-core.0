Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id C722273163
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 16:52:06 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q09HT4SVzz3hjdJ;
	Tue,  9 Feb 2016 17:52:05 +0100 (CET)
X-Auth-Info: Qx4I8Svek1MJlu4iLbLI2S0kOeDlFVyOfFXMHAa2Mqk=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3q09HT2J3yzvdWV; 
	Tue,  9 Feb 2016 17:52:05 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Tue, 9 Feb 2016 17:52:04 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1455017471-6682-2-git-send-email-marex@denx.de>
	<201602091529.17418.marex@denx.de> <56BA0D0B.60104@windriver.com>
In-Reply-To: <56BA0D0B.60104@windriver.com>
MIME-Version: 1.0
Message-Id: <201602091752.04599.marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/7] binutils: Repair nios2 PLT and GP handling
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
X-List-Received-Date: Tue, 09 Feb 2016 16:52:07 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, February 09, 2016 at 05:00:11 PM, Randy MacLeod wrote:
> On 2016-02-09 09:29 AM, Marek Vasut wrote:
> > On Tuesday, February 09, 2016 at 03:21:17 PM, Burton, Ross wrote:
> >> On 9 February 2016 at 13:08, Marek Vasut <marex@denx.de> wrote:
> >>> Repair corner cases in nios2 PLT and GP handling. See the patches
> >>> themselves for extensive detailed explanation.
> 
> This sentence doesn't really add much value since many patches
> contain additional description and the logs here are mostly a
> few lines from the ChangeLog which doesn't count as an extensive
> detailed explanation in my books. :)

It's not from changelog, it's from the commit message. The real answer
is that it fixes incorrect computation of the GOT/PLT offsets in case
these tables grow too large. Then there's some sort of off-by-four error
in the computation, which causes linking to fail. It happens in one or
two packages in yocto. I had these patches in my tree for a bit, so my
memory is a little unclear on the gruesome details already.

> I expect that you're familiar with this but take a look at:
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Comm
> itting_your_patch
> 
>      Commit with a concise and descriptive message -
>      one that explains your changes in a way others get
>      a short overview without looking at the code.

Yes, I hope it's there.

> >>> The patches don't contain the ChangeLog entries, since the changelog
> >>> entries often cause trouble when applying the patch.
> 
> I'd prefer to see the ChangeLog snippets duplicated in the git log
> so that it's easier to see what happened.

You actually want to avoid that, since it'd make it really hard to apply
these patches onto subsequent versions of binutils if this was necessary.
I hope this won't be necessary and will be dropped once the next version
of binutils arrives. The change which happened is in the patch's commit
message, but it seems like some of the binutils guys are not very fond of 
writing extensive explanation.

> If you do a v2, please also mention that the patches are backports
> since that's important to people when they consider whether the patch
> should be accepted.

This is a V2 ;-)

There is "Upstream-Status: Backport" for each of the patches, it's actually
needed to track the status.

Best regards,
Marek Vasut

