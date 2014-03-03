Return-Path: <trevor.woerner@linaro.org>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 891606A9C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 20:41:41 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so11865748ykb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 12:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=VS/bNC3zB2sRo0TThRdK03+1jI4xAudOrtdCteVLtc8=;
	b=l5X4ZCoqJXHO4IjgiaFC3MDR3Z+3aRZUSsZdifbYJqdpHvzynI6dYOvHH3jzjlUHlt
	tad8NPVOxHtEP8qDJvwkQrz5qU732qz0xuiAJcxHvV/FJgposqz8/qCJfb+mb3168Pex
	0NWFS6h0nc0hxvY9EBY3uDZdIYFiOlKLhwSLElELSDyzaMXJkeD2jlYGEfIuiHaqajk/
	kEIHVd77uKnExMIY2+2yQNWLfUISPIBLe0Bhl1MQ38MzlZWsRVRjdh1jg8whBuvnVZHj
	Q2a1tmlhyYtqPB86UMn5+Rn4z2lXPBFXjUm3BjsMlJRf7MvVLz7I4k4ALKct5glz+PKw
	4szA==
X-Gm-Message-State: ALoCoQlqq71rkCy7OyNxxErCAt/1uCqvd2TTx85TqX80JGeNUek0CglSi4tHrc4GTVpQ9UQJgWcW
MIME-Version: 1.0
X-Received: by 10.236.106.99 with SMTP id l63mr4255748yhg.81.1393879302590;
	Mon, 03 Mar 2014 12:41:42 -0800 (PST)
Received: by 10.170.132.148 with HTTP; Mon, 3 Mar 2014 12:41:42 -0800 (PST)
In-Reply-To: <53105913.6020407@enea.com>
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
	<4343044.DpKneM5m4P@peggleto-mobl5.ger.corp.intel.com>
	<53105913.6020407@enea.com>
Date: Mon, 3 Mar 2014 15:41:42 -0500
Message-ID: <CALmOhgm_ScJQNZecKUQS-ki4+YkX_nYuZUDpYZcsLqjYSsECZg@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] do_rootfs: Added PACKAGE_FEED_URIS functionality
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
X-List-Received-Date: Mon, 03 Mar 2014 20:41:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Does this resolve issue 5407?
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5407

