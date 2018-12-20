Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7D86BBEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 19:50:16 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id p197so3490556itp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 11:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9SkzETzRDOpL4ojYFsym5wSO0qLG1RwuEL9LhLvB0hA=;
	b=GVd1AlXuELwfnL5D0rP1A/PsrQkhOJTjV/yN4FIVbAiTu52CmvhM8byNJfKy2XP2eK
	HaycOIhjEdh3727wzqSr7FBAwBBRbE1p4uAYXWZe6HYqS7a6JW1J/0AJWPolNCoA1Xx4
	HG+zEmlvfuT1YVbzcTyYcXMjEKi5CsiDH+UIuYZTeuK/XhC1/zEEY4+AVMkAR5MJUyAa
	hPfC5BuFRv90UzHSRpCaEpHBAb9QGKN9fgCe4ei3Y6k5cAT7T787bXauCLI+z3mNJc+5
	P3dMf+NTfHRdKXHHSfpiXZGi2Z+PARoQJsdR9KU7zDxFNrG4eZF2HXWahqalQI8Nf1np
	E2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9SkzETzRDOpL4ojYFsym5wSO0qLG1RwuEL9LhLvB0hA=;
	b=hFLY8QStdKVqJCrxxj7VgeJKaGwMg3NeyN42NtqCfreV3yKJE3DpGz+r+PbTdB36B8
	NBb8NaB5Cx3YN0cvYnZoazkOnFPnAJ8uV/qPsEpvi6SVtOg7OobwWl0RgnSLWcxJzU7C
	UT3seOunsoZbKVNlcd1rU05n8WxAOy6YSRukx3u1esft3M5aCHP0EZdX+ndNPAjWXb12
	l/Ct3Q/gOu2pO3/xNmeadB0S5McFBWWHrEdxzS3jqagjt6fjM0trTcgxtYCdSi2/Q5ad
	OymN5J05Pa45Cze0eboOnfep+8JL4SPdUSuxR3BOaNeHlEmn7/4iqYRec2qospI9rnWy
	Hc1Q==
X-Gm-Message-State: AA+aEWZneFoY8EPQR7YEyK6qNXQRJ4wzS+hu5mj8A3lV0H5MlwvGXJbd
	zYvmlquKeQTwcCQWPZvnJ0D0/OqjAogUwNmXqcHBvw==
X-Google-Smtp-Source: AFSGD/VEE4sJ33g9KvR18khm6xZ8KutVKIDaacG6YscsAGl20pOSfxVy3rtuiAsxjalphmHywVYjEH0DmWlArPvns2o=
X-Received: by 2002:a02:1bc5:: with SMTP id 66mr24826148jas.105.1545335417476; 
	Thu, 20 Dec 2018 11:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
	<CAJTo0LZ=Q8EuXqh0s79poWhw0gcrVRouJLyaF0OxgadWqFejMA@mail.gmail.com>
	<d796d8b521000f3fce1b514cedebe1476c57df1c.camel@linuxfoundation.org>
	<CAJTo0LYTwZ-srE+zO-Y2vnW_FhhoH-kPMDSLP78zkd=qbSHGNw@mail.gmail.com>
	<d9129255-2d1d-3b13-de3f-6dd0f299448b@windriver.com>
In-Reply-To: <d9129255-2d1d-3b13-de3f-6dd0f299448b@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 19:50:06 +0000
Message-ID: <CAJTo0La6d5HX0dZUUs38t2WZcvr3WFFxnzQPOHa9Avy_2mw0nQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] glibc: Remove site_config and glibc-initial
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
X-List-Received-Date: Thu, 20 Dec 2018 19:50:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 18:02, Mark Hatle <mark.hatle@windriver.com> wrote:
> As far as zlib/ncurses being the only things that augmented them, when this was
> originally implemented many years ago -- those items were the most commonly used
> by other configure scripts.  So adding those defaults when zlib and/or ncurses
> was provided by the system offered a measurable difference in the performance of
> configure.

Do you know what the zlib and ncurses siteconfig files were doing?
Just short-circuiting the AC_CHECK_HEADER call, which is basically
stat(includedir + header.h).  I'd call that the definition of
premature optimisation. :)

Ross

