Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 071437723C;
	Thu, 12 Nov 2015 17:03:27 +0000 (UTC)
Received: by obbww6 with SMTP id ww6so51432758obb.0;
	Thu, 12 Nov 2015 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KXYR/m+Pqf9b60VmEuEBKhg+T9NJRHMBEb1iBQGrlmE=;
	b=zQWZWHqQCz0SZ/FGnuswi+ubv0IBJwNLxIB3D/riCbcChqCNem6x4tGUgb7TnNmwWr
	CgQwQCF3BoAzAsKk4jb9ThTAPrIa6MVBbOp0+jqFjSViJHLDv3YWejFd9I3tWPQj2sGZ
	TfreTDnMD/LAn/vqjZH1pxtV1ELTPuWp6psDt8o8sLERIm3kfIO803ae1xGNCPhtkKOO
	VAP06ZS+W7BRtHbsa9SFbvgGnyW9RG9gJsVd6L2Af3Iu6/PDINrgSTYhVzxfV3rGnnM3
	vt2A6AhQXFCv80cv0Q6CbPrnIpUKGTUDD6av3gap3JeuuJAo7R8IucGwJXyZ3dAOaCf7
	KIYg==
MIME-Version: 1.0
X-Received: by 10.182.111.167 with SMTP id ij7mr9459618obb.85.1447347807678;
	Thu, 12 Nov 2015 09:03:27 -0800 (PST)
Received: by 10.76.75.135 with HTTP; Thu, 12 Nov 2015 09:03:27 -0800 (PST)
In-Reply-To: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
Date: Thu, 12 Nov 2015 18:03:27 +0100
Message-ID: <CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Thu, 12 Nov 2015 17:03:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 5:45 PM,  <alexander.kanavin@linux.intel.com> wrote:
> Hello,
>
> now that 2.0 is out, it's time to move the Qt4 recipes out of oe-core.
> This has been discussed previously here:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-June/106355.html
>
> I'm not sure where the recipes should land, and want to ask your opinion.
> The options are:
> 1) Make a new layer, meta-qt4, under meta-openembedded tree. Move also
> everything in meta-oe/recipes-qt (and possibly other spots) to that layer.
> This is somewhat more disruptive to people's layer configurations, but
> would clearly separate qt4, and slim down meta-oe.
>
> 2) Simply move the qt4 recipes from oe-core to meta-oe/recipes-qt, so they
> will be next to all the qt4-based software. This is less disruptive, but
> adds bloat to meta-oe.
>
> Preferences?
>
1) or even better in a separate repo

Andreas

