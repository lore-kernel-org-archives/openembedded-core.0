Return-Path: <ross.burton@intel.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 90186605F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 11:03:42 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i7so1735816oag.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 04:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=3TqxgfnulyrAu0Wra+R/ynSkV+BZ5v3hBFKlePS9RVY=;
	b=fKW8K3ckrienHQBMGN0tFq4bjY8CGbr2xvxcXwHEqMEz1IturRqdbfNe1bHhN5/qYp
	Vkq5WRFizts94IoJNGSaN2XhWu25ZawoXh8J5pBYqZoWPnyfkKqm6fl9LkRDqfmfioh2
	aIoBilJSpBx39sAHHWaZEo76w12S638Waqnos0UnA9efPYBn5hl5hSTmzgdJAQhg3c2n
	wWNleQPGmmRuLXxLO4NBopZ9RTATjL/CfqKc3R+4+l54NqEe8nPBq+Xn/3T3kEk0w8Qq
	RzG5Ha2aPnvmydS8hzHdR5KesLt+P+rQu9TDOOxPHvqjbUXSSXYDjluNW2nVArCbnlc5
	M4WQ==
X-Received: by 10.60.94.136 with SMTP id dc8mr5350520oeb.89.1372935823363;
	Thu, 04 Jul 2013 04:03:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.160.41 with HTTP; Thu, 4 Jul 2013 04:03:23 -0700 (PDT)
In-Reply-To: <51D53848.3060209@r-finger.com>
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
	<20130703161921.GB3452@jama> <51D53848.3060209@r-finger.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 12:03:23 +0100
Message-ID: <CAJTo0Lbc+9PaFdZxrGYFn+Y1sevFfEQ4m3w70g+-EWieawwbEQ@mail.gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQlbeSzU3QoPVMc3MVqK0uCQZG3TKRmy1E7Ade1e9J8vsB64oWNu+cuFL/+g/1P3+j7FLyAd
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Allow xuser to shutdown
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
X-List-Received-Date: Thu, 04 Jul 2013 11:03:42 -0000
Content-Type: text/plain; charset=UTF-8

On 4 July 2013 09:54, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
>> I know there is some overhead from having one more package installed on
>> image, but it would be a bit easier if we later decide that xuser also
>> needs some file to be installed in his home or something like that.
>
> Yes, please; the current situation makes it rather awkward if you need
> to tweak some of the xuser parameters in a distro specific way. But
> perhaps it should be called something other than xuser?

Wayland likes to have a non-root user start it up, so make that three
locations and another reason for it not being called "xuser".

Ross

