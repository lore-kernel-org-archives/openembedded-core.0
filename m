Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id C5FBD60809
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:41:21 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id t59so2231251yho.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zwOT2K1dO9F+ziiiL+eRQ/nlGTWatTDeR1n5Xu+PKB0=;
	b=DBVgY7STz+oqGaO0rzBEN1dNxB0y6ADAAm6gy+KVX/0zsAKkd2pwyJv9MqVWo1I0PX
	TQ26WsIo7KwvjeVY2ryVQ1MiocKge64G65UWPiYlV8KeNBTjLOHeAiu+EzRmNcdvepny
	Pn/8/GJvyExiVpjTff7/rYSVr2NroyNs7wr9pLjayrVt0lSRIcFzZmFfKYwlppRAuvvL
	MrFblY6TVO5jn3XU34OMJNL7b/IRqyembYwZyyKo5pTZPyahn1s5SkuQZY74YdIH293C
	J1nhqZWTjAeXriBunVKMAYW7Nitiq09ABnHWztqCRjBZenC9308FsVGhTkDAAuMg3M0D
	1k+Q==
MIME-Version: 1.0
X-Received: by 10.236.220.101 with SMTP id n95mr5475954yhp.63.1410792082507;
	Mon, 15 Sep 2014 07:41:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 15 Sep 2014 07:41:22 -0700 (PDT)
In-Reply-To: <CAJTo0Lbz62+cNOohg8LqJ+4fHA1u5podgELqJsyJLYJnBSdD6A@mail.gmail.com>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0LaB+e=o02t4pbF6kSNKvy8R8YHT5tijT9T43U=6Y_yXdw@mail.gmail.com>
	<CAP9ODKqtnPzfJ2PwBPQcwQ-jF=yT3dxQiNjWvLB6K71woMX4Vg@mail.gmail.com>
	<CAJTo0LZur5=dt6pfPawcEAM50M9W7zd-0_uoDvj5s74RCgNubA@mail.gmail.com>
	<CAP9ODKpSNOeXfgLbviu4G_Bw2Tc9y86cTNmoWDFeSsOFZC4M3Q@mail.gmail.com>
	<CAJTo0Lbz62+cNOohg8LqJ+4fHA1u5podgELqJsyJLYJnBSdD6A@mail.gmail.com>
Date: Mon, 15 Sep 2014 11:41:22 -0300
X-Google-Sender-Auth: HfFg3ZBPDpJKEepQGvisXZUG4qw
Message-ID: <CAP9ODKqbfGW2FkmtTwMA08PL+Gu2AmYaFTJysYUExXXo5F3_mw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Mon, 15 Sep 2014 14:41:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 15, 2014 at 11:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 September 2014 15:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> I think it is a way better base for work but I really don't care as I
>> use my own recipe in fsl-arm and so does TI.
>
> And that's the problem really isn't it. :)  Why do you both use your
> own recipe, instead of keeping the u-boot in oe-core up to date?

Well we both require patches; this does not mean we ought to not keep
OE-Core in sync (or close to).

This is the reason why I advocate for the inclusion. Denys were
working on this update for a while but he must have been pulled out of
it due work commitments as usual ... so it ended sent now.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

