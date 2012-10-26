Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRm6L-0001IE-JB
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 17:45:37 +0200
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2012 08:32:06 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so8983985oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 08:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=1RYp43M4iRFTz1z/BcmUzi9sPQvp0SFiuFSXsPi6BDQ=;
	b=haN/jln57+QfR1+Hx+QoxhC/YPTYIf05jcuUxn8qTuFt1ESa3x1euaJumqa9f/Nrjf
	yVuaVWsAu6El8/HT9H5kQaNMtrYW/EY1XbwL0cCyV1hZnw+ruZHRl/O5hjXWMNHOV5an
	rMLeLrlwjAWBxWRBwFxEVIZKPOGLZPXpPPBE5G+L2Sl+0sjvnPhm39bq1E7ivjjm2ucN
	NRDVfN9bmvDkrrf0siu1k8e0Hy8XJgzoh9FyELUnyHkB+NxNzOEiwqefhtBsfnqOPkUJ
	rDENIs0ALofVNYOM49m7zQvgH2brUm/yHukm7RmLMYEZXKShZy9HOvwwU5d3AdmcUcus
	7BaA==
Received: by 10.182.117.74 with SMTP id kc10mr18651275obb.63.1351265525122;
	Fri, 26 Oct 2012 08:32:05 -0700 (PDT)
Received: by 10.182.117.74 with SMTP id kc10mr18651269obb.63.1351265525013;
	Fri, 26 Oct 2012 08:32:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Fri, 26 Oct 2012 08:31:44 -0700 (PDT)
In-Reply-To: <k6e9ht$ra9$1@ger.gmane.org>
References: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
	<k6e9ht$ra9$1@ger.gmane.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Oct 2012 16:31:44 +0100
Message-ID: <CAJTo0Lbkjcr_Yy=CSkH+fHm5K9KpCKF4E9r8jy0XExATmRZqOg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkmrachbbmZ+iKWZ+gfkVIznERgXrXo7noLgPRMs92d5RTAcyL2hsvGP+IYz/1FEr68hfl4bvDnpY7w7huSvOpxKPBGucLh0Nlu/gXL0R0zLVez92CTEPvgU/vksTcE4Qw4pUbiuXgAlSqiGUZbloOZwI2fZEKWiFzc8tY8UZR2TGd0q5Ja76EPym/ouGb0TEBkxzsu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] Danny stable release branch
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
X-List-Received-Date: Fri, 26 Oct 2012 15:45:37 -0000
Content-Type: text/plain; charset=UTF-8

On 26 October 2012 16:17, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Expect to see a ross/danny-next series in the poky-contrib repository
>> fairly soon where I'll be staging the commits.
>
> Who's the maintainer for the oe-core danny branch?

Shush, don't tell anyone, but poky-contrib:ross/danny-next would
actually be a clone of oe-core. </whisper>  Staging a branch for
oe-core using poky commits would be counter-productive.

I'm handling the stable releases of oe-core 1.3.x, not Poky 8.x.  Poky
point releases are a natural consequence of the oe-core point
releases, but not the goal.

Some how the existence of openembedded-core-contrib slipped my mind
when I wrote this first mail.  Expect a ross/danny-next to appear
instead there once I have push access.

Ross


