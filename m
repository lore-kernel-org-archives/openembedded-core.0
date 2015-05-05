Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 12A5A72376
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 14:40:44 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so100409840igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aM6+6iRkn80Vn62yL3JVdkU6NqHRH+qba4dtm5+FO4I=;
	b=lZmQLy7wcgYNN8yAFktiWQJ9jDxe+ghxt+9AhVZeFgltScO9TfTEWnDM029a4VN0Kr
	ZFql76Mds1L2cquBFYCqbSkWhWus04cN9siOKR5/O6lOY4ee51OD6jOV83yk2zUvtAht
	ind378o82ImPcglEIXvaGECS/prth/VNXtC0CYKTQO+yJIkbMcwc61YrE4k2v1mEyuXr
	oD83tUevhM+GoxMJk2Qv9yWMB6+Nfp4EYTxMIi7/KFkU4ku0XZa0CROXVO9XP1GherXV
	dXXL4fcELbLIP6tYwzLqk3uMonLmoVWcvxYY726sozJxiXwgVX9OiCYTD9+x+LYO+bKd
	K32A==
X-Received: by 10.50.13.5 with SMTP id d5mr2197898igc.4.1430836840797; Tue, 05
	May 2015 07:40:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Tue, 5 May 2015 07:40:10 -0700 (PDT)
In-Reply-To: <CAHiDW_FrGE1ryPPZinOTg-CbmT7ZUQPa3fNod79dwBY1oT=_mA@mail.gmail.com>
References: <1430735858-6704-1-git-send-email-jussi.kukkonen@intel.com>
	<CAMKF1sr7joRJQMLsX4==4e6f185hzkgC9QdwBFhxSVsHjkz64w@mail.gmail.com>
	<CAHiDW_FrGE1ryPPZinOTg-CbmT7ZUQPa3fNod79dwBY1oT=_mA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 May 2015 07:40:10 -0700
Message-ID: <CAMKF1sou2QNk6JaUw9nqWYqqD++x+D7NiBg4Co8gYEY4yp=hnA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shared-mime-info: Upgrade 1.3 -> 1.4
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
X-List-Received-Date: Tue, 05 May 2015 14:40:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 5, 2015 at 12:57 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> [diff]
>         renames = true
>

If set to "copies" or "copy", it will detect copies, as well.

