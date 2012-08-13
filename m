Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T100I-0001Sd-P0
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:08:43 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:56:43 -0700
Received: by obceq6 with SMTP id eq6so5046522obc.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=eKhmlVutif/kdTE45v3vFNWA1G2+OhMcJoCuAshAZ/c=;
	b=EWZ50m885XgBYeAlkd89CVy9jry1KY83pbcYSoXoy8//4GmHJomfFaGfap8T8UoQ/W
	aPV18+vZuI8CR/aR1H0zSj5Wz/+hwHClPqmiTRqMFC2xacLco5XYmtbTDOSGwDs9dRTH
	Pdn+A8b01jeHbJjP/UEjoBZ5y05JAWSgkhxpCFdFIqj+F1yJaBQ65oI3HvYp6y/IQXZg
	5tOrSFDDIWokmWy6555mkUb2P4rQ11Dw1KMiX7MnjZx1PFCRcSR+Y8wNi3ZJYsuu1qoK
	7Dz1p6uxI44agGivrrsd2Hx/gckcrtVX0ZL5q41eLFRVzkl9izbXS6pOyylWXcdrNEce
	LW9g==
Received: by 10.60.13.10 with SMTP id d10mr20430981oec.63.1344884201846; Mon,
	13 Aug 2012 11:56:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Mon, 13 Aug 2012 11:56:21 -0700 (PDT)
In-Reply-To: <CAEsOVNfaNDfTMpPxn7F03QapmyD-TXzZzzL_MvgPaVdOcm7CHQ@mail.gmail.com>
References: <1343335023-28938-1-git-send-email-msm@freescale.com>
	<CAEsOVNe9eWTVy7k2u5yNRGRZz==jRTZ0=nZD+xtdOhS=hSn7rg@mail.gmail.com>
	<CAJTo0LZE-vT5bbr971-Ot7puBp1aXC5yO_XVN5AKVZLrC0A=_A@mail.gmail.com>
	<CAEsOVNfaNDfTMpPxn7F03QapmyD-TXzZzzL_MvgPaVdOcm7CHQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Aug 2012 19:56:21 +0100
Message-ID: <CAJTo0LY8aVvhmgxVQz7HV1OmNhzmmf3VA2ZVgewa0Et5p8Cf7g@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQky4cGHt9np1kLTWukbG4xLniJqYkhWFUpl9Ki/zBLVPS2vN6r+9KTO2mz1KqQRPiXt+EJQ
Subject: Re: [PATCH] owl-video_git.bb: fix compilation on Fedora 13 machine
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
X-List-Received-Date: Mon, 13 Aug 2012 19:08:43 -0000
Content-Type: text/plain; charset=UTF-8

On 13 August 2012 19:06, McClintock Matthew-B29882 <B29882@freescale.com> wrote:
> On Fri, Aug 10, 2012 at 7:54 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 8 August 2012 17:07, McClintock Matthew-B29882 <B29882@freescale.com> wrote:
>>> Any comments on this?
>>
>> owl-video isn't pulling in Xrandr directly, so something is wrong with
>> the linker flags produced by GTK+.  I wonder if -Wl,--as-needed is
>> breaking this...  Can you replicate and provide the full build log?
>
> Err, I went back and now I can't even reproduce this issue... I guess
> we can ignore it for the time being.

Oh good. :)  Thanks for attempting to replicate.

Ross


