Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4F57D76329
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 16:44:34 +0000 (UTC)
Received: by padck2 with SMTP id ck2so54191887pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=MBNkkKE4qGZkrrBvr2NtHlaRBSHMejrumblXcdYxJXs=;
	b=I6IwvW9ac2PYGApsgRNooBfiW4Ed7tS5lTqzhZh1ZBxzs5pEe47jQt7uIVtbgch0LQ
	MmB2ITTggInSbV+jn/yksV6STA1lQO0rk/mp5jpYRqnXKlIe9NvaBhTcepgG0ZcpYQdi
	hlxFVEoUPHqSVXohs83pwTC+g+yVzibWAKR/ZqyJ+z5f5VH648a8IQMiGDcIeMJTwdZY
	BnbAhX3rxHKFnNNwLkUMdclm2XFRpxJYnh+1gksOHmzHQWAfyS2I1FLc5iLIWtsr0zIG
	+EaEZw/7shK+H/dYn7lN4iEVJA1ePTkht3YUhU51n9nCE+JagZoT7nuVOyLI2qop7bnB
	7NKA==
X-Gm-Message-State: ALoCoQkkTFfffMkKYp7d2xyPVPLGa6KouPM+M3S+imSfIGfzp8sHVLHEdXxojmm5O5v8iUcE4Iv/
X-Received: by 10.67.5.37 with SMTP id cj5mr70543514pad.44.1438015474188;
	Mon, 27 Jul 2015 09:44:34 -0700 (PDT)
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com.
	[209.85.192.180]) by smtp.gmail.com with ESMTPSA id
	v8sm30361879pdm.89.2015.07.27.09.44.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 09:44:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdrg1 with SMTP id g1so54780461pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:44:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.135.104 with SMTP id pr8mr69509066pdb.129.1438015471785; 
	Mon, 27 Jul 2015 09:44:31 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Mon, 27 Jul 2015 09:44:31 -0700 (PDT)
In-Reply-To: <1437996407-29463-2-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
	<1437996407-29463-2-git-send-email-b54851@freescale.com>
Date: Mon, 27 Jul 2015 13:44:31 -0300
Message-ID: <CAP9ODKpMEdbLXiv=kHRpnX0CJ0v7ee_FRF0ZVMWYMW7a18mWdQ@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 1/6] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Mon, 27 Jul 2015 16:44:36 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I am fine with the patch but it needs fixing.

Check below.

On Mon, Jul 27, 2015 at 8:26 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> Use g_utf16_to_utf8() instead of g_convert to fix the issue that
> id3 tags utf16 charaters cannot be extreacted in id3demux when try
> to get the id3v2 tag such as TIT2, TALB etc.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> ---
>  .../fix-id3demux-utf16-to-utf8-issue.patch         | 54 ++++++++++++++++++++++
>  .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
> new file mode 100755
> index 0000000..458d153
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
> @@ -0,0 +1,54 @@
> +Author: Lyon Wang <b12696@freescale.com>
> +Date:   Thu Oct 9 17:37:43 2014 +0800
> +
> +[id3v2frames] Bug fix for id3demux issue
> +
> +Fix the issue that id3 tags utf16 charaters cannot be extreacted in id3demux
> +when I tried to get the id3v2 tag such as TIT2, TALB etc. it will return extrac
> +failed.
> +
> +Checked in id3v2frame.c,  When parse the UTF-16 streams, it used g_convert() to
> +convert the buffer from UTF-16 to UTF-8, however it will return err that this
> +conversion is not supported which cause the extraction failed with these UTF-16
> +characters.
> +
> +In the patch, use g_utf16_to_utf8() instead of g_convert, which can convert the
> +character format successfully.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=741144
> +
> +Upstream Status: Pending

It is:

Upstream-Status:

and it seems all patches you sent has this very same error. Please
update it and resend the whole serie (with this fixed in ALL patches)
as it is easy to get missed while applying the patches and makes
tracking harder.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

