Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id A9E886B0AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 09:47:10 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id m17so2900952vca.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 02:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=3ZuUySRTB5LK8YV+tqybjUeIBIotDj3ATtxj6gBNi88=;
	b=BCiU3H11m/6mh8N4Wcp/Q1VzTIO9kNt6tCattDFejCf7zWoNQPji7tQ83RSfXCQQnO
	nIDJ7yGivU0apC1X6dz5RjKeW82X+zBLaVLK4QPCcOef7cwwbauHmt6zZRzYHhGDWRdW
	nqqw2uKA/RMfBUXdbN8R0fTviUUhW1rTTtyUb5HsV2eL3vVFw9Epy1Iz8HWLOMj0FooM
	1sU1i+3W5uHJ4t6m0BEru9chfNSLw6aBQC9Bmb8y71JoU5thbMrHhsLAWNxGqZni4JTF
	TEVWiEtUYLTuIVdDCW0GZCq0mlvc2BXYCqwYVguRRJRiP2OmS7zp1V6cyKhEnASS8vBl
	7GCQ==
X-Received: by 10.58.181.225 with SMTP id dz1mr27091136vec.95.1375177630934;
	Tue, 30 Jul 2013 02:47:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 30 Jul 2013 02:46:50 -0700 (PDT)
In-Reply-To: <cover.1375164419.git.sgw@linux.intel.com>
References: <cover.1375164419.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jul 2013 10:46:50 +0100
Message-ID: <CAJTo0LZk9HR12mR7nozaE0yZ-DjMPkagf1GvagEeKmkF2i6M9A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkaSbXyFUA5LIc77nvNcknl83e+WvxeykqTC3bnW3+pMfC6Trp4orDln830KfMeJSOfTDfy
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (M3 rc1) 00/26] Needs early review and ACK
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
X-List-Received-Date: Tue, 30 Jul 2013 09:47:10 -0000
Content-Type: text/plain; charset=UTF-8

On 30 July 2013 07:14, Saul Wold <sgw@linux.intel.com> wrote:
> Saul Wold (2):
>   bluez5: Add obex as a PACKAGECONFIG and package seperately

I'm still unsure why this patch was needed.  I've nothing against
splitting out the OBEX functionality and controlling it with a
packageconfig, but this does disable it by default when before it was
enabled.

The libical build dependency is only required by obex, so that
dependency needs to move.

>   texinfo: Update to 5.1

Yesterday or so this was marked for testing, I presume it's been
tested and works fine now?

Ross

