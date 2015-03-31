Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 028C573CDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 22:29:57 +0000 (UTC)
Received: by ykfa3 with SMTP id a3so5594359ykf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 15:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=jTCc7Ta3Fn9uNqyQMEbhX0WJvG4VOfnahPTbN9q/va8=;
	b=bYpay6yOKaef/Zy1RR2DBlgtXg7oOLBkxsFFivtNKYXIMXV4IRO6d19jNKc5oXlgKE
	Cm74DQ4jW28mBy1jdn6wlylLnolEMVSzLCPeum6PiLMaBY1K62RxnoiQhFQK7y/uhMm0
	tzRnAhdLqpjF9Xori3JBAEUiE1HbkI4mOEgtVLgC6sqQab7EcpYniHrkOfd7GbG50mvx
	1cxrLGjMWMn/bFPEuAaW9SB/WH4Et5aLPytCRmYKp/OFSMOhBMmq1Ywy3IDngweqiPGr
	bfh0ZD6f/YAS3HkhbOE3KVjvzNcHN8L7x+mPOGzOCkdW+n1s3D51Nky2QUsgY8o3Mwi2
	ghCw==
X-Gm-Message-State: ALoCoQmE6tUNdbJAUaAip9/A+c2RHrU2/wdERjHeO2JVHW1o1cLscrqV+AS9smvE7Q4Z/lIB4O+k
MIME-Version: 1.0
X-Received: by 10.52.30.34 with SMTP id p2mr40523479vdh.89.1427840999055; Tue,
	31 Mar 2015 15:29:59 -0700 (PDT)
Received: by 10.52.124.37 with HTTP; Tue, 31 Mar 2015 15:29:58 -0700 (PDT)
In-Reply-To: <CAJTo0LaiuNTsn6h0pZWeOtpX8Ph4XMz3WoCRG1w2WYqK-ronOA@mail.gmail.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
	<17800ae49667ee311ccc15a539dae026674efc35.1427832505.git.elizabeth.flanagan@intel.com>
	<CAJTo0LaiuNTsn6h0pZWeOtpX8Ph4XMz3WoCRG1w2WYqK-ronOA@mail.gmail.com>
Date: Tue, 31 Mar 2015 23:29:58 +0100
Message-ID: <CAPhnLPAdrfkGABb8yXYOjsAtmmQAQDrA7SURC7mEm_4O118qkQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] distrodata.bbclass/distro_check.py: Fix splits
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
X-List-Received-Date: Tue, 31 Mar 2015 22:30:00 -0000
Content-Type: text/plain; charset=UTF-8

On 31 March 2015 at 23:03, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 31 March 2015 at 21:11, Beth Flanagan <elizabeth.flanagan@intel.com>
> wrote:
>>
>> +        if pnstripped.find("-native") != -1:
>
>
> Shouldn't this be .endswith() or .startswith() to prevent false-positives?
>

Not that we'd ever end up with something like foo-native-dummy (watch
someone prove that wrong), but we wouldn't want .endswith() here as
that would end up with bad data as well. I'm by no means happy with
the solution here, but for the time being it gets packagedata and
check_package working and not spitting out incorrect data.

I think we probably need to take a better look at packagedata and
check_package in 1.9, especially with how we map this to the actual
PN, but in this case, I was of the opinion that better was the enemy
of good enough.

> Ross
>
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

