Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UT7KU-0000OW-N9
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 11:10:07 +0200
Received: by mail-vc0-f169.google.com with SMTP id hx10so3514872vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 01:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=C9LOty/mCrejLwAmv8i1LgMX/eyiCNepilXOrYV/otw=;
	b=ZN8DAsxYMyoRZBvcfFfH3xVR27mPUBIvqDB/EEoLbcoO9Q4ltWB2Bt7jhMP+JDv1S9
	ev806wIFPfDsu+E//DZGznRsT+7CR1+/9StwOZiESnrcsTF4U+OE/3VDdezHgxRjLePq
	Sq/ZTPGci+Fol94c5jSuvolQrnQIaJtQZpRFrJcIEVfulZK5Y36l+aBo86XLc8EUiMhk
	ufuoUtr+hJrJa0GRFZUHZyd0i93ugfO7Ssxx60ukaMYP+fMX2fGcyw5vdAUE2jj2VSOd
	yq3UuZmj2VsJ8JGbWIKsr4tzpT2xtuuUND76CT15A7FlZdr0lSc+9mHAVS6ikwz8uSmr
	BIOg==
X-Received: by 10.52.108.10 with SMTP id hg10mr9125675vdb.34.1366361547994;
	Fri, 19 Apr 2013 01:52:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 19 Apr 2013 01:52:06 -0700 (PDT)
In-Reply-To: <CAJTo0LYeJwW-Lbf9bEZogCh1e97bwj7PTgFZV=3NbwN=PMWENg@mail.gmail.com>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
	<6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
	<CAJTo0LYeJwW-Lbf9bEZogCh1e97bwj7PTgFZV=3NbwN=PMWENg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Apr 2013 09:52:06 +0100
Message-ID: <CAJTo0LYRPtG_N1WCE37UTvGvy5HYt7ia1ym12iR874Ykb8QwTg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnwFokvweei3xCjmPku/OPWpzUAbRZ3JtA9uWraM4gtqDcFUdYQV2Qu08Y8dt1xBJnnioKg
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Fri, 19 Apr 2013 09:10:18 -0000
Content-Type: text/plain; charset=UTF-8

On 19 April 2013 09:38, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 April 2013 19:45, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> [koen@rrMBP 1.0-r0]$ grep "configuration required on target" temp/log.do_rootfs
>> gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked only, configuration required on target.
> ..
>
> This is "usual" for postinsts that are intercepted and handled in a
> single go - scroll further down the log and you should see the package
> manager running the intercept scripts (i.e. fontcaches once, gconftool
> once).  I expect you'll see there that the gconftool intercept is
> breaking for some reason.

Actually gconf isn't using triggers but it should happen on the host.

I wonder if we're hitting a problem where the postinsts are doing some
actions on the host and then triggers are "erroring" out and it's all
falling back to the target.  Can you share the complete rootfs log for
this gnome image?

Ross


