Return-Path: <leon@sidebranch.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id D76667C44A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 12:14:46 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id n7so936333uao.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 04:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vXMfT5l7i2BunSvRieVrjpggY9XcASWWmtN5gMoL5Bg=;
	b=w0YNBETI/I5t6bb/yGp8zIAroHgzIH7yDYq/oJtdjG5AkZEf4c8CmR9TR+RmPn8gEM
	9Qw2fRAfTcZxic4/soYms/K9ef58ahSfiKGMFVRKpD+ovwNsKdLNwG4oEDU2jYBxVMe+
	32vUTSwoq4bACLq7khXs00P2fsRS/VR2CJIwFvmXMIhZ+7IFGvSoPtnVcOZcmNSdZfwE
	atu7WaYKpoyR3gSBeIiV2YmzSPgJVKZQHMvj5d/B3aIIt+2mg7vXCoBY82AWR1HQ4p+5
	JwRy6VawCf2di+HHcD7VDS8diBlziLI5nniMaSTTkGp6MIXGaDlPpgzvpX20XH7wQH3u
	eHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vXMfT5l7i2BunSvRieVrjpggY9XcASWWmtN5gMoL5Bg=;
	b=H7vGNGOuKIi93cpYB9/NeGq04U2NJzNgNN/offOIBkWMieeLv0TNwCVKg+24nJkkCG
	KHSOAPRvvvbz0ndv+VKAniV/APQHSjveO8zavsR116CcIqRZ8t9VDBPpJR+TwkP0mHAf
	RBJmgBlEN02t5lmUqPBIamRJ9HGt5vajUuVgnPjKhNYCkQOYbtCF7JzjcFKN9+khqyxJ
	c5/ee1VcFcbl1GPDL+AUsuQ1cGTu7j21P0NIo07ryR1g9ctLwca5I8It34AFP7YKvdyf
	AZuelH2xKIrOBq3ArNOPDNPzOeZcjIpxurq3gJ4TplzewMuRu0NTvhGJX+FblUu7Lg61
	CdmA==
X-Gm-Message-State: AJcUukdD+9w2x4VqG0unzmw23qf2irqN6nctKGqeQwEGJ7rXgnNTrLcP
	8lWuFtodItJAWHSjzSehJErCnjAAZ0Ljy+hBNusCrQ==
X-Google-Smtp-Source: ALg8bN7xHVvcG1gOik+Uzxx04flhcaQ8VXmVLEGRr9Jo/OA6toNnRu0AP+3yWoQTmhvq5mQpyLzKMbZo0RJz1Tv/KUY=
X-Received: by 2002:a9f:300d:: with SMTP id h13mr14703402uab.80.1548936887322; 
	Thu, 31 Jan 2019 04:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<CAJ86T=XUqY8+ZAgRpXfd=OXULoOvMb57we6R2Df_b8N7q2csCA@mail.gmail.com>
	<7f56f94e-07b0-275e-f152-b5bd1c776094@jumpnowtek.com>
	<bb86e6c4-7459-54fe-f8db-eccc9f553ef9@balister.org>
In-Reply-To: <bb86e6c4-7459-54fe-f8db-eccc9f553ef9@balister.org>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Thu, 31 Jan 2019 13:14:35 +0100
Message-ID: <CAMjhiJg4nXPy2mEUmFETtXDzP+GT3hACBLtgbxsTFZtVt-3h6w@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Scott Ellis <scott@jumpnowtek.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Thu, 31 Jan 2019 12:14:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 31, 2019 at 11:16 AM Philip Balister <philip@balister.org> wrote:
>
> On 01/30/2019 09:09 PM, Scott Ellis wrote:
> > Is the busybox devmem functionally different then the standalone devmem2
> > package?
>
> Replying again ....
>
> I've been told they are functionally different and to use devmem2. I
> think the issue with the busybox version is that it does a readback when
> writing, this can be bad for some hardware.
>
And the fact that the devmem2 tool is written with no fixed integer
width. You have to understand that on a 64-bit system, reading a
"word" from a 32-bit hardware peripheral (most are), you are touching
two registers.

        case 'h':
            read_result = *((unsigned short *) virt_addr);
            break;
        case 'w':
            read_result = *((unsigned long *) virt_addr);
            break;

I rewrote it once to use uint<N>_t but I do not think there is a
proper upstream repository / maintenance going on.

Not sure about devmem in Busybox.

Anyway, devmem being useful for development, I do not see why it
should be in BusyBox by default.  We are not shipping devmem2 and
should not.
We can have such reasoning for every tool out there. I rather would
have a single switch to include tools like these.

I disagree that devmem(2) should be included for purposes such as
pin-muxing. Yes, I use it weekly for that during bring-up, but the
released result should be in DTS or DTS overlays, or boot loader code
in the end.

Regards,
-- 
Leon Woestenberg
http://www.sidebranch.com

