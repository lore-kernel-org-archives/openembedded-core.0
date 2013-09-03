Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id B9FE06BE62
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:46:35 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id gf11so4117050vcb.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 11:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ro8NELNfYDF0fUi8Dmp+8gFdc5MMKgX1fw3ceIPQDLM=;
	b=V2sL/4oeDzI7zD0i7kscfaNZCsSn7XBDbMc7nvYTbPu1OVSGUZWCKYbEyl4YQiL7y0
	kLTlX73mS2lf6IwOBGjoFy4rhclzse4evM2f+Q7U9l7VOYDpSUeNYKrVddGPjjtPTPHv
	k1jVAGRSa2wRXbWVRp/K09KlDxO3kK7MmyF8DILI/C2RAKvaq3z37h6Rjc7YeFs9c8ki
	0ayKqac9oytk3m3Th97Jn0aN8gx3UrWIQfKRjtjJZN4uQcel1LVOfne2/W9KB2Kx/GYf
	Bwpbs6ZrRKqEKxRzLjdMbDj12S837gQ32Pk293+hBxpklW7IqG1qTAufBr3RE30rbBS4
	GJIg==
X-Gm-Message-State: ALoCoQmIQEUmfSZ3OBsIoReeFn1JpnRVxdKwAIJxh5fAPrbLtD1VNo6CV1zsR1iBZtslx5WjLsw2
X-Received: by 10.52.229.165 with SMTP id sr5mr115450vdc.55.1378233996062;
	Tue, 03 Sep 2013 11:46:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Sep 2013 11:46:16 -0700 (PDT)
In-Reply-To: <20130903182941.GD11500@jama>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<e6abe1f4e6a41cf4ac4070971b6ec1757d79b9ab.1377792006.git.Martin.Jansa@gmail.com>
	<CAJTo0LbU5XC59qQ6mn5s161z4d3mvb+tdyjc5GNj-9-SFkNxSg@mail.gmail.com>
	<20130903182941.GD11500@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Sep 2013 19:46:16 +0100
Message-ID: <CAJTo0LZ-YBSEHe_H8+sC=nNOHkfsYgVx6ddHruooSytUxKAxqA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 06/20] libmatchbox: Add PACKAGECONFIG for png
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
X-List-Received-Date: Tue, 03 Sep 2013 18:46:36 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2013 19:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Sep 02, 2013 at 03:02:39PM +0100, Burton, Ross wrote:
>> On 29 August 2013 17:02, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > +PACKAGECONFIG ??= "png"
>>
>> For completeness consider adding "jpeg", although I doubt anyone
>> actually uses the JPEG support...
>
> jpeg is already in DEPENDS

I meant as a PACKAGECONFIG option as it's an optional dependency (and
to be honest, jpeg could probably default to disabled).

Ross

