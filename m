Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QwMlY-0007Ky-Qm
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 01:21:49 +0200
Received: by vxj14 with SMTP id 14so1233302vxj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 16:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=aArUI1GFy/912ToAbhAcVahQjbVCg9cBBKWaEuQBHp8=;
	b=wSvDUiSeCrrEv+Ybtpdg3aWTPM6KN3evclj7Fy6/KlJaDxhMFmJ51GzPBaTvpOfihZ
	7XJQ6tXRE+SezIplEXBn3eJ+DgbwyMqQEDX6/Byscg+QQuWirzbq2bXI8JCK3czck/1T
	ETsEwA64rf0RlidkrAeOioPylx+qm4dVIhu+E=
Received: by 10.52.20.228 with SMTP id q4mr5355546vde.498.1314227821643; Wed,
	24 Aug 2011 16:17:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.108.229 with HTTP; Wed, 24 Aug 2011 16:16:40 -0700 (PDT)
In-Reply-To: <201108221401.15860.paul.eggleton@linux.intel.com>
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
	<CABcZAN=mt6HCmtMnX+P4-BAOkQwZZ3uCS_sT+uutziBu0VYv9w@mail.gmail.com>
	<20110819221653.GE22251@jama.jama.net>
	<201108221401.15860.paul.eggleton@linux.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 24 Aug 2011 16:16:40 -0700
Message-ID: <CABcZANnHKrkmjODWStf3CyBEMBZRpkcVTZZ5dmVo-bkUn9Ybdw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Wed, 24 Aug 2011 23:21:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 22, 2011 at 6:01 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> FWIW I agree with Martin; I wouldn't hold back the patch just for this reason
> - it's not incorrect code, it's consistent with the rest of the file, and we
> can easily clean these up later.

I strongly disagree with this. The fact is, we almost never go back
and "clean these up later", so crap accrues.

-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


