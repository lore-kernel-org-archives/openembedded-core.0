Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQNtk-00077f-A8
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 21:42:52 +0200
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 12:29:25 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so9246614oag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 12:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=cpun5BCgbZspKnJhD6WmOPPFT5P9faAtE6XHBBCAZ4w=;
	b=Xxr0NySYpUiNSDs2u+egiqssCxUsSzn5zuXy8lN6zJY7tHN+orUo5NX8tmkV0zxZzM
	gfMJH1wjGoCy6FBqoQYs4WCFzwhxN8D7wW4QLxEpXWmhX7zAODtXLYhs4kb366eRLPo/
	7rN+NWaW2nTVpJbY7J9Ng9qmQp/4oSn972+FcZfjfUx9Nk2LgIKhgNDGRQHAILJKSI4K
	ovObRAIh9lpOFuyd55q4ES8C+Pt5nd8y5USJKBtUpe9GJw/AXppEEPh8dYACPWdpcacn
	fegkg6m5ttelFj/+5CekhMml+OP/4Gag5wppaHhf1t8mrhfluNW3PMTjDkcCmgJfnDzv
	GHOw==
Received: by 10.182.225.5 with SMTP id rg5mr7963861obc.49.1350934164255;
	Mon, 22 Oct 2012 12:29:24 -0700 (PDT)
Received: by 10.182.225.5 with SMTP id rg5mr7963860obc.49.1350934164219; Mon,
	22 Oct 2012 12:29:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Mon, 22 Oct 2012 12:29:02 -0700 (PDT)
In-Reply-To: <50858460.3090809@windriver.com>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<50858460.3090809@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Oct 2012 20:29:02 +0100
Message-ID: <CAJTo0La6VoL6FFkE_fCKMPYYsdsTcsJpiVij1YH5EC=twe7Zfw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQnYkUau0cGUZAxEVPHpg5hV+2njiQA9/amlyTVM+AYtZ3hNhsmrpBY3VsBrcYvygd37Q9KyMpgrDwexzmSn6Nj5L9Wjvo0ANNm636ukmpF5oFfHNJ65gyGMvUG1OOe5RgAcOIrzzcw7QWlbqxto45Ovklb6oAJ82G5paRhBt1hQsIhFyCK9qsjhe6BadAlFxzvcs/Hp
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Mon, 22 Oct 2012 19:42:52 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2012 18:37, Mark Hatle <mark.hatle@windriver.com> wrote:
> For systems like BeagleBoard, do they use X11, if so what do they use for
> GL? Most of the ARM systems use raw direct PowerVR drivers in my experience,
> and generally don't use X11.

X works.  GLX doesn't work as it requires GL (unless you're evil), but
that's fine as GLX is effectively deprecated and EGL sort-of/should
work.

Ross


