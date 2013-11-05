Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3A29D6D160
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 13:03:29 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id oy12so2479482veb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2013 05:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Aot7vmVLOs57v8gNd0JeoA20yshaUOHByPz3nMvXuFA=;
	b=mhawXyzAMzfglOe+WAsiQNesl4wcTKea+fM/kCKd0FIphWWIQm+03awbvu2u6PX4FS
	E9h0fZt84aDPVHOUiUPNos4MzD8lwTNtLScOpbyLHoTvKu69jA0u6YJ1PbDv577N/SUV
	3T0XzSc6oiMLr1abBqH9C39o/ryLatSb8fsgEOGuPLTgt7aOebGpHSFsHYYtCLovTZNG
	Ef8UD69AEG4Xx9lpEsPuDPw24fMACO9vKlcNDt+Z/0CzetvZTAq64ojzY4/yNrhZqwEV
	W6C9BtvENlWa0D06DIdtb9tswlG65ruQuk+tWngE3Nv5nLJNhrlqazHqP1ggnROpMf0x
	XQwA==
X-Gm-Message-State: ALoCoQl6aeG1HXcfYLWPPMVDS9cq3cd3YEtUlntDJ0u1usCgGrWlDB4edYjghpELi+Us6P5N7FYI
X-Received: by 10.58.254.200 with SMTP id ak8mr15697060ved.12.1383656610675;
	Tue, 05 Nov 2013 05:03:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 5 Nov 2013 05:03:10 -0800 (PST)
In-Reply-To: <20131105130118.GE27969@lpalcu-linux>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
	<7b7e2f1f2c529a2867a48e0ddfe78faf2b702c2f.1383643350.git.laurentiu.palcu@intel.com>
	<CAJTo0LbP5517bBCnBH2tFoF0C6KKShwSrfw355XcZuK0c-iiiQ@mail.gmail.com>
	<20131105130118.GE27969@lpalcu-linux>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Nov 2013 13:03:10 +0000
Message-ID: <CAJTo0LbetsOvU4ERuctszaF9mUCJhLE1B6p4bPrnQqD9F4mLAw@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] diffstat: upgrade to 1.58
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
X-List-Received-Date: Tue, 05 Nov 2013 13:03:29 -0000
Content-Type: text/plain; charset=UTF-8

On 5 November 2013 13:01, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> On Tue, Nov 05, 2013 at 12:16:55PM +0000, Burton, Ross wrote:
>> On 5 November 2013 09:25, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> > -diff --git a/aclocal.m4 b/aclocal.m4
>>
>> How does this work, considering do_configure should be replacing this file?
> For diffstat, in particular, aclocal.m4 is explicitly renamed to
> acinclude.m4 in do_configure ().

Fair enough, thanks. :)

Ross

