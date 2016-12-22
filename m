Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 38033774DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 10:25:40 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id w33so230458550qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sDnDDyP5+rGWG5aL6oG8foW7lOCmqNnXXext3SXkXqA=;
	b=GF1iQf1IPKbtzSsdvbnHJj+E+Tq4yY1yXhZTgzCcwpQ8CnR3gzhv9azlMqEaeF4vuG
	RRnc5GMC0alAVmi4f67eALYpr9JrUfuw0K4ywmUtDjuaAGrDf29E+MRpXmKXVCQRT99v
	QByV8a90nJKo9yw8J80fQnwSDmQ0+DbdBMLL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sDnDDyP5+rGWG5aL6oG8foW7lOCmqNnXXext3SXkXqA=;
	b=iEOqDaYID4kPMQ1msrga4Bnv2uxgciUFk8U3bNNKLbCc8Eb7SbU75HNN7bOOKtkDER
	Favfz4SmaDg8/JMgxgFhdopTe+nJ7cHqk+MZlaZNyjhvZLVE/RFXxdvSQpZ6yc8Z/Brl
	Mi0yjWeoN3xpv7sppoDsUc9dMwieFMow4Vbmd8s3ChOzSeB0V18xlACLDn2Tw4Vs1/ck
	kiHVzDGBCaZNVKlLebqcL1DBPfwrpg84kifzeHMUa3lvtMzOxyC3Z60kusQeqrcql+7r
	NuizoWjGnObk75ROzEr8I+oqW3CsYzZryghrt4fw8WJO0hQ4mLpsFH3XNgduHWZQzr6V
	JcxQ==
X-Gm-Message-State: AIkVDXJj+T79Xwyt8Ja+KxcXbKvHi1O8CAivgox5W8Uaex6XH/0adGophD/dkmlB9ia35xveWhIOy8GphqEY9/X7
X-Received: by 10.200.36.166 with SMTP id s35mr2282329qts.6.1482402342007;
	Thu, 22 Dec 2016 02:25:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.19.72 with HTTP; Thu, 22 Dec 2016 02:25:21 -0800 (PST)
In-Reply-To: <20161222081414.29642-1-raj.khem@gmail.com>
References: <20161222081414.29642-1-raj.khem@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 22 Dec 2016 11:25:21 +0100
Message-ID: <CAP71Wjz+80EHxLwtuUAX81ea8OLLDH5qOP_aFZ1S-HHMgYtgMA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Backport patches for improving live playback
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
X-List-Received-Date: Thu, 22 Dec 2016 10:25:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 22, 2016 at 9:14 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...1-mssdemux-improved-live-playback-support.patch | 929 +++++++++++++++++++++
>  ...ming-implement-adaptivedemux-s-get_live_s.patch | 183 ++++
>  ...ming-use-the-duration-from-the-list-of-fr.patch |  62 ++
>  .../gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb   |   3 +
>  4 files changed, 1177 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
>

Do we really want to do that? Backporting in stable branch looks right
to me, but backporting to master while we know that we will get gst
1.12 on time for the next release anyways, doesn't sound great to me.
maybe we should get these patches merged in 1.10.x instead of carrying
them ourselves?

