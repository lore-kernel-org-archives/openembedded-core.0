Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 50DF073198
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:29:19 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q066l3DjTz3hhwX;
	Tue,  9 Feb 2016 15:29:18 +0100 (CET)
X-Auth-Info: Cohn1KQxQU1h+uQn7iF4oeKapG5gjVw4b+JK8XxmhYE=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3q066k04ZZzvdWV; 
	Tue,  9 Feb 2016 15:29:17 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 15:29:17 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1455017471-6682-2-git-send-email-marex@denx.de>
	<1455023303-8137-1-git-send-email-marex@denx.de>
	<CAJTo0LbuO5c=Hv7LUHMpuOYtLG48YFN7t+ZpeTR+cjdHrpdXNg@mail.gmail.com>
In-Reply-To: <CAJTo0LbuO5c=Hv7LUHMpuOYtLG48YFN7t+ZpeTR+cjdHrpdXNg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201602091529.17418.marex@denx.de>
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
X-List-Received-Date: Tue, 09 Feb 2016 14:29:20 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, February 09, 2016 at 03:21:17 PM, Burton, Ross wrote:
> On 9 February 2016 at 13:08, Marek Vasut <marex@denx.de> wrote:
> > Repair corner cases in nios2 PLT and GP handling. See the patches
> > themselves for extensive detailed explanation.
> > 
> > The patches don't contain the ChangeLog entries, since the changelog
> > entries often cause trouble when applying the patch.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> 
> We've got binutils 2.26 in master now, can you rebase and retest this?

I rebased yesterday, well, let's try :-)

Best regards,
Marek Vasut

