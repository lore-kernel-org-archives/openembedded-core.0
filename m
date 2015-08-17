Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7865E606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 13:17:56 +0000 (UTC)
Received: by igfj19 with SMTP id j19so56822970igf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=rEXKxMZu2V3eAwfJQIUG0dJ/4C4agGNRAPXTCrut9tI=;
	b=gkDDIirJJXdmSynn2XhMxZC+wC99Jt9vZTFR7AJwyvYkPK7byfIku/U7IV93JDWlMK
	7qnphO+4lrJkvMmnJG1ApN1YxV627U4aTD20SdTkbH5TlDlJEQLosP/m+E7Hu7+WlmTj
	ZPqu1N1g5qhxwLZWb6QEEeN7bXtECHqdlrTh4RMSQsQvh9MNJRokDEdg7iHxoFDXAWP8
	5N0R67k2Ipa2gpPc2Erh4+9MV1z4Vf5ZxA0T2JnMv5W9cKBPWVoOHJEvMw41FEzB/AVK
	rLYjH0wUyj73wzevK9X9uluKUSe9BnlVd0e0/2qGbPfIZ91YbFGDIPp9uvSNAf2t7Byk
	MX1A==
MIME-Version: 1.0
X-Received: by 10.50.122.72 with SMTP id lq8mr10441609igb.78.1439817476468;
	Mon, 17 Aug 2015 06:17:56 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Mon, 17 Aug 2015 06:17:56 -0700 (PDT)
In-Reply-To: <1996666.8cjXHH8UEW@peggleto-mobl.ger.corp.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSbR5fzUUs7F+s_NqesaQa=XG5E8j4gEew845-tVpE3AA@mail.gmail.com>
	<55D1DD2D.8040402@linux.intel.com>
	<1996666.8cjXHH8UEW@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 17 Aug 2015 15:17:56 +0200
Message-ID: <CALbNGRTvpkd5h0fXxYD+ij7XSknc4HeqYSPQR-fNvLBZ0Qfn6A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/22] libwnck3: add a recipe from meta-gnome
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
X-List-Received-Date: Mon, 17 Aug 2015 13:17:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2015 at 3:12 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Alex,
>
> On Monday 17 August 2015 16:10:05 Alexander Kanavin wrote:
>> On 08/14/2015 02:04 PM, Andreas M=C3=BCller wrote:
>> >> +PR =3D "r1"
>> >
>> > ^ Please skip
>>
>> Thanks, I also dropped unnecessary PRs from other recipes involved in
>> the patchset.
>
> Not sure if it's applicable here, but if any of these PR values were pres=
ent
> in the original recipes and we're not upgrading as part of the move (i.e.=
 PV
> is not changing) we need to keep the PR value, otherwise people currently
> using them will see PR go backwards.
>
> Cheers,
> Paul
>
> --
>
Don't know the others - for libwnck3 this patch updates version - so PR can=
 go.

Andreas

