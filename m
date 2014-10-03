Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 946EE71624
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 10:44:49 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id q108so694856qgd.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Oct 2014 03:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pkUCT1buAiMiSEbynGVCHZgl4vg9CZkZJGMn80fBmkk=;
	b=iy5hjPgjK8OtG7I20+wx4H2/JxuU26GDmSDvD8FelUg7BgJwSDvF1M2NU2OiNwE7Ga
	CvS8u/BYh/PIn7TA1AgRgVuvNcIPdTnlkeZu4/xD51xojDz5IMdGWgUC8HeyczK550cj
	PRuq2/q7En8vISesrNFxJRAnWz5Jw4kVb8o4whTd5tO2CRmx+dYUPYcugbDQFqmOXevk
	ZRMTo8Abw684g/hXTxfysfFPrSM9AWZyB36kFpWeAcHvymOIg/I453pP2mAPcJEnWQY/
	LwNRZz432R884S53OP9+9YCgt3bPX4GHRIuhU5SFbOqKUASnj9zStUdxTN0rNKE3XNYA
	uVZQ==
X-Gm-Message-State: ALoCoQmwb9OGS1tARBAOjFGVMsmoh9OHXiBr7Xvai60cj4KI7oTHV/Mk1+wa82rKkvFjfHG8ZBfI
X-Received: by 10.140.84.84 with SMTP id k78mr3725200qgd.80.1412333090277;
	Fri, 03 Oct 2014 03:44:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 3 Oct 2014 03:44:30 -0700 (PDT)
In-Reply-To: <CAJTo0LZDeTCp7E3ZMX6To6Ox-bOLS625d_T2QBjjuQ+RZ7==dw@mail.gmail.com>
References: <CACS+7ZRU6R--qxKFxWmCKGQaHgyDMfd=cUrnLnjZVfsktmhxAQ@mail.gmail.com>
	<CAJTo0LZDeTCp7E3ZMX6To6Ox-bOLS625d_T2QBjjuQ+RZ7==dw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Oct 2014 11:44:30 +0100
Message-ID: <CAJTo0LaP2Zu7z8Dp_1uCzkdLuBS_TgZ0xn0CXg5QtNTt3ZCAbw@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Fri, 03 Oct 2014 10:44:57 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2014 08:23, Burton, Ross <ross.burton@intel.com> wrote:
>> +++ b/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
>> @@ -0,0 +1,176 @@
>> +From 00138d820fc0dfce6e5fee03d1edda66db34aa80 Mon Sep 17 00:00:00 2001
>> +From: Dan McGregor <dan.mcgregor@usask.ca>
>> +Date: Fri, 5 Sep 2014 06:28:58 -0600
>> +Subject: [PATCH] Make root's home directory configurable.
>> +
>> +OpenEmbedded has a configurable home directory for root. Allow
>> +systemd to be built using its idea of what root's home directory
>> +should be.
>
> Patch looks great, but please add signed-off-by/upstream-status tags.

Going though my list of "needs work" patches, this still needs patch
tags and I thought I'd just go it myself but the patch got corrupted
somewhere:

patching file meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
patch: **** malformed patch at line 107: the root user]),

It looks like something is re-wrapping the patches.  Are you using
git-send-email or pasting the patch into a compose window?

Ross

