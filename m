Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id E93FC75D2A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:40:41 +0000 (UTC)
Received: by qkbl190 with SMTP id l190so22282422qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 06:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=W5ik0bCEJ33RNuv6O5LLyqLpps75BaRTw+uabHdkS3M=;
	b=BRKwOxcHZdd1V28s4F2ZeghTBC2iTejKqqM+UuSRQoueYmI+F/UFc4GwmiV8ZD6XpY
	C8/d3GK1r9hpG0awkLpZPA/+3lh0z+QQS26NFKnHoU7weynaYVY2qO73cazouLoS9MDx
	bYYUyGXjfpiho5SywfkNramPL+6Q4IFjWkJ9+iUrorFW9llA3UGMWE/zE3ZrrwU34K9V
	LSWqNmtwaMooE3lWKCTVO8AvtYNGiTo5rW1xMny+OWrTmx18AbbbNcl37PC6Z/EZ6jyw
	OTzeFCozqCxt61Uh+J3fs8lhytCjWbEII+ApotpU0eRjKla//lbMj2FLQ0bcEBcwWfaF
	MPGA==
X-Gm-Message-State: ALoCoQlO0p+7Zlwz/+KW3loju8a/Kfflj+LpPthFbFrpSExLo8OLrZ0FdCBT54V6d9fYZ6VuJtDn
X-Received: by 10.55.192.13 with SMTP id o13mr35681417qki.83.1445262041686;
	Mon, 19 Oct 2015 06:40:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 19 Oct 2015 06:40:22 -0700 (PDT)
In-Reply-To: <6286161.Ei9s0vA4WQ@peggleto-mobl.ger.corp.intel.com>
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
	<20151019120904.GB2549@jama>
	<CAJTo0Las=qdUxwGa3w+OibykzRuMnpVs+5oZGojxSGAibH1=QQ@mail.gmail.com>
	<6286161.Ei9s0vA4WQ@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Oct 2015 14:40:22 +0100
Message-ID: <CAJTo0LaJY3qD5_ZWY2nd_YJY0DuHRee6CwbuzEoF_G7+_K0Kbg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] sanity: check that the host has file installed
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
X-List-Received-Date: Mon, 19 Oct 2015 13:40:43 -0000
Content-Type: multipart/alternative; boundary=001a11479cfc9a7e580522754a4a

--001a11479cfc9a7e580522754a4a
Content-Type: text/plain; charset=UTF-8

On 19 October 2015 at 14:34, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> > Well that was embarassing.  I wonder how that test change made it into
> git.
>
> Since this test isn't run on every build, it can be broken or unsatisfied
> and
> the build will still start. Given how quick this check is and that people
> have
> stumbled across the results of the check not having run, I wonder whether
> that
> should be changed.


Agreed.

Ross

--001a11479cfc9a7e580522754a4a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 October 2015 at 14:34, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">&gt; Well that was embarassing.=C2=A0 I wonder how that test chan=
ge made it into git.<br>
<br>
</span>Since this test isn&#39;t run on every build, it can be broken or un=
satisfied and<br>
the build will still start. Given how quick this check is and that people h=
ave<br>
stumbled across the results of the check not having run, I wonder whether t=
hat<br>
should be changed.</blockquote></div><br>Agreed.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11479cfc9a7e580522754a4a--
