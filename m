Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sww3c-0001X3-Et
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:07:20 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 06:55:37 -0700
Received: by obbuo19 with SMTP id uo19so12054925obb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 06:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=voWE8OlIk9QdRZswmWWMb12O3JcfOTcl7wN4L4LSkpI=;
	b=frxMb9iFiZritb/u6AELkLGmOfKseEC50emAJaAR89/4VY1Pp12G2ZgPtXdhbK1+hQ
	15sjJkQ0sUu1gTYjdOrIv+e8horGnrwVMvsR5M6Izw7SJ3+rIWQflYKv2dj9VTixdSYf
	ot2DXrhQMq27IdePuCCKDERKfP968r04rOcz4VpIPlYjTc2OxfRqiyd46Z9UWg+fom9/
	XULO3wIBrlFIDxIaOue3zgQn+NVJwOSLdNAWJgosaoQREd8bwQxVWKQvLUyOKeqWZHi3
	BGGEkTvHg2NoXuCZNUkC6TZdKg8//KqI7/zWJjesIAUvg9uv7N2Tk6GZL2sT3FOT4zrD
	Yhzg==
Received: by 10.182.232.101 with SMTP id tn5mr37338636obc.49.1343915736720;
	Thu, 02 Aug 2012 06:55:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Thu, 2 Aug 2012 06:55:16 -0700 (PDT)
In-Reply-To: <CD1E2BF4-09A1-4800-8191-553B40E4CF6B@dominion.thruhere.net>
References: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
	<CD1E2BF4-09A1-4800-8191-553B40E4CF6B@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Aug 2012 14:55:16 +0100
Message-ID: <CAJTo0LakdrRqVVx+jAeUK7Upx570=jLo=PYONZ63=xDNiwD5jA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn7EQpyECjNCyb9H7wojGApQgPVKkKq1IK6N1NCMJCADQ1oWGKajmpu64KvoO1VnFBlL3tx
Subject: Re: [PATCH v2] usbutils: Upgrade usbutils to upstream v006
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
X-List-Received-Date: Thu, 02 Aug 2012 14:07:20 -0000
Content-Type: text/plain; charset=UTF-8

On 2 August 2012 14:50, Koen Kooi <koen@dominion.thruhere.net> wrote:
> That's the default value, so you can drop this hunk

Can we settle this once and for all?  Sure, it's the default, but it's
also going to be added back in again the moment there's a change...
I'm a fan of leaving a PR in there, even at r0, so its not constantly
being added and removed.

Ross


