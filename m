Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UX76y-00071z-0u
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:44:39 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz10so226287vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ypVf4DdySVSnFr4hyuJRvbN9m2VAWZ5nEDiP2tF8Yfg=;
	b=dge8oF1Lu+N81UcAdCoDO1SItMIfj6CUymcgODdt9wqLR5nIZj7Th9gAoTLGBlSC9U
	OX1LafYjKr5k3uPB50th/TKOtmPCWmTa2w++ATbbLEyFi8RyNakxZeuaDVrzwujy5ouL
	U3RgqKV0+M1j7ehK4uaHFmgKKj4NL57EZgPE1bnT+Km2v/R10O9DRVRa61otXBSBkoPA
	JaVfrcjMm8KxxTsXHbYMt/N6iI+hSKxjJXqU7v+mybJKVim3oyAJBXbQS4NCVPppw+v1
	MZM7NU7Ml5CYPLi75+nkIN6GHIqX8YPbZ1I+LdWDuDMlmtEar8Y3aE7hLG5GrEA/TAmb
	ZzBw==
X-Received: by 10.220.155.8 with SMTP id q8mr28655093vcw.42.1367314005337;
	Tue, 30 Apr 2013 02:26:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 30 Apr 2013 02:26:25 -0700 (PDT)
In-Reply-To: <0898467A-BB4A-4301-BEA9-696BBE5CE889@dominion.thruhere.net>
References: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb-RNvd85JO6O0iTZSiuJ3HMe6=rpGdgqa4QF4Xv0SE_g@mail.gmail.com>
	<CAJTo0La_jjN2COZzdcst99Cutm5uNER4Yqu8ayc3YXuHYAfJDw@mail.gmail.com>
	<0898467A-BB4A-4301-BEA9-696BBE5CE889@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Apr 2013 10:26:25 +0100
Message-ID: <CAJTo0LY62=ddypnShkyWbXaDrEx2b1ss9mLopnbpb++mSnDafg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnKkQ//dBXfkYgJB+u+JR2IT0suqZ+JHXF8ydfwGd/fd3v80ra8FJbJ0GPCID8G5/PJZoKw
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: do not recommend udev-extraconf for udev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2013 09:45:37 -0000
Content-Type: text/plain; charset=UTF-8

On 30 April 2013 10:21, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Oh, and the images in oe-core need to be fixed to bring in
>> udev-extraconf as required.  The initramfs does already, but then we
>> need to have the debate on what other images should.  core-image-sato
>> certainly should depend on it, but what about core-image-minimal and
>> so on?
>
> If you want people to use those images as a base for their own image: don't drag in udev-extraconf

Sato should as that's basically been part of the defined experience.
minimal was basically a strawman - obviously it shouldn't.  It's the
others which are more debatable.  A series that removes udev-extraconf
from udev and systemd, then adds it to core-image-sato in some way
sounds good to me.

Ross


