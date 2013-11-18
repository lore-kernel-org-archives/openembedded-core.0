Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 112796D2C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:21:55 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id w20so984862vbb.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 06:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MpihtmyaPkXwcG7atAP2gMrLCnaKLsxYB65My2A/8ZE=;
	b=bhPZyrOo5VKu1jEANgGUGJgR+ZDG/EDLMFrx/I8t+yF6+A4oJLab+ssEYbboO7C228
	Df2UiubKJ/RQCAOzxnIscIapkhO33BfTrGL6SGJGq6IfvkBw/PQDhYecrfcsMhliVqzW
	2hT+tv/Ttv8I53dD+sqGCySo7EapuzfAxSOvyDp+BEBCi0Wq35zWgpFPW8k0Cm+vLxTL
	m1gcE6wXHpPVrYSaNYXIeNdQp4BLgm+w+njWi4eyoP0Ip0GhFRcVmhW0yyx7QqPmTbOP
	cn10zD1fqaTHLjqAeYyL+WTO1g1FHEzoiMXc/ttX//zTKV8D0tImXttzovUTqilrOUZp
	7aMg==
X-Gm-Message-State: ALoCoQmuary74nIuiQZ+T7lQW8S4MDdfcq8gWKmM53sKBp9EpoEUC23oaQ/pnwr3vwxvU97HRhaI
X-Received: by 10.52.120.78 with SMTP id la14mr13600263vdb.9.1384784517229;
	Mon, 18 Nov 2013 06:21:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 18 Nov 2013 06:21:37 -0800 (PST)
In-Reply-To: <1384778925.6460.229.camel@ted>
References: <1384776180.6460.218.camel@ted>
	<CAJTo0LZZg3tsdVCSFQBzb_J2bSmCcJY9PwuXRuiGW3ZX2y6q_w@mail.gmail.com>
	<1384778925.6460.229.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Nov 2013 14:21:37 +0000
Message-ID: <CAJTo0LYapCtQOmaMYtft_wEBsZFZ9NATE1w5cUZrVon_cdzVSQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg in svn?
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
X-List-Received-Date: Mon, 18 Nov 2013 14:21:57 -0000
Content-Type: text/plain; charset=UTF-8

On 18 November 2013 12:48, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-11-18 at 12:33 +0000, Burton, Ross wrote:
>> On 18 November 2013 12:03, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > recipes-sato/puzzles/puzzles_r9765.bb:SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
>>
>> Seems like a pretty good reason to ditch puzzles, IMHO.
>
> Somehow I knew you'd say that. I still maintain those make a great
> demo/test app. I'm sure we could just point at a tarball by default for
> this ;-).

Isn't puzzles the upstream that re-generates tarballs so the checksums
suddenly change?

Ross

