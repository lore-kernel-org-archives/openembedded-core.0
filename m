Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SJo30-0008RQ-P3
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 17:40:58 +0200
Received: by qcso7 with SMTP id o7so3229309qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=19YW3rbxIx5N5OMpeuk1glYMAVFE5SaiXslZTs5JxwE=;
	b=yL6hc2p1hZ8aiZ+GU0fD+T48YvWKQlavKLXVyUwxFWF+50ikAv0kuODAn/IZVyMus8
	Vj2kCC8dIusaKCqyZaTtqRtpGsS6Otwo7oz12opptI1AjEIkMXdNudhp7sdf2L/WK7+P
	l302iCtqSCbOM6RtdiBtNOiKnCjEHybwxRy+6pIeRswXxnOEwL3Tt9rLqAzhfy768dxU
	wLlu8LVKhXuCHxdi4zBBFKfQzeL35SbCvDaZCYIAfnenhiVVBKLvKvEyFBAJ/rn7dIzT
	YH45Alpv91s3Xbo0nMrncj2Z+q9ZVpOXa2wyNeazkcK33H/EVyqDlabBYi6sfa9TkpuW
	1FLw==
MIME-Version: 1.0
Received: by 10.224.31.202 with SMTP id z10mr15900060qac.31.1334590293361;
	Mon, 16 Apr 2012 08:31:33 -0700 (PDT)
Received: by 10.229.94.206 with HTTP; Mon, 16 Apr 2012 08:31:33 -0700 (PDT)
In-Reply-To: <ED413D36-93A5-4400-B9E9-F86B6EE04CFA@dominion.thruhere.net>
References: <1334569676.16992.67.camel@ted>
	<111FD132-7323-472B-8052-283E454DCB6E@dominion.thruhere.net>
	<1334574653.16992.74.camel@ted>
	<ED413D36-93A5-4400-B9E9-F86B6EE04CFA@dominion.thruhere.net>
Date: Mon, 16 Apr 2012 08:31:33 -0700
Message-ID: <CAGDS+nkaJZQ8KOZrSPdzDd0v9ObrhDLpMWL5Wqa-hE6Zr=H8zg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: Fix re-execution problem due to patching configure and configure.in
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 15:40:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 16, 2012 at 4:27 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:

>>> Since this changes the sources it needs a PR bump.
>>
>> It has no effect on the packaged output which was always the criteria
>> for PR bumps as I understood things.
>
> But there's the exception for fixing failures like this so people don't have to -c clean(sstate) things.

Indeed, I had to do a manual -c cleansstate to get the benefit of this
batch of rebuild fixes.  The rebuilds all failed otherwise.

Steve


