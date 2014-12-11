Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 770C9723A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 21:21:22 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id q1so5040439lam.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 13:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+kwgM1C3+L4+dnmBPfIStD5EGh/rKjPDOrW/FHFVD2s=;
	b=VZBo6uNG9T6ZTmsxP8Dlpyia5jd/dflsFGOCCBhK4y8JVXf47/rkJzwlkzmI1r/TXz
	G3I+k6IuLih7+Awvp6zAB8RPESyskeIHZSUVHIfoukF/Rp9hvreyjVoDXXmHhadfJUZR
	shw80zfAYDpDoWiXieHrcxcD+zbJ9TGVLBahbTKPMPThe100OmC9dxodd8yaaKf/gYY3
	JySSfWurzBBSKeWPJn6tgvyuQneAw8bImRcvq0IxOHkKNfDy8W/8up6mQG9hcCODFKCB
	VQA8kUVoO07la7uRAtQGGqOo/xHkILzXhUpevNnn3t/hd2htREv6bNlCKd8LCuTqVvw6
	csDw==
MIME-Version: 1.0
X-Received: by 10.152.238.1 with SMTP id vg1mr12112929lac.83.1418332882254;
	Thu, 11 Dec 2014 13:21:22 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 11 Dec 2014 13:21:22 -0800 (PST)
In-Reply-To: <CAJTo0LY8B-GOaMbhv4iLZw8XvYLXqRX6ycYjRXv7qP3tc8foaA@mail.gmail.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0LaGa3ACsL+vLjzUDgEQDDxJ2L2m1WQgj1LHdbzpsJPLUg@mail.gmail.com>
	<CADkTA4P0XMtSxKop9vqr6SbS8KBmaGuZfKFs7Ej0CsDcqLt4DQ@mail.gmail.com>
	<1418306324.22903.72.camel@linuxfoundation.org>
	<1418309772.22903.74.camel@linuxfoundation.org>
	<CADkTA4MHJm2RpHxSLy3cfVQEKfhMp6WBpJMWL28NByt0qnY4NA@mail.gmail.com>
	<CAJTo0LY8B-GOaMbhv4iLZw8XvYLXqRX6ycYjRXv7qP3tc8foaA@mail.gmail.com>
Date: Thu, 11 Dec 2014 16:21:22 -0500
Message-ID: <CADkTA4OFRgwi8uN4cTFZT9P81bXewhv031ZW4HNom9DOKr1fzg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH 0/9] kernel: version updates
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
X-List-Received-Date: Thu, 11 Dec 2014 21:21:26 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 11, 2014 at 10:35 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 December 2014 at 15:26, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> Do we want to leave the series as is, and I can send it as an incremental
>> patch, or would you rather it squashed and the branches updated ?
>
>
> Squash and re-push would be best.

Done. Both the zedd/kernel and zedd/kernel-updates are repushed with the patches
merged.

Bruce

>
> Cheers,
> Ross



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

