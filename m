Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id D4F5E72819
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 13:30:36 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id j7so789314qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 05:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UBQFtstgdPgPWwMvi4TuI0yUJ1sc77brQ2BM9loA4b0=;
	b=QPQkWQAcIM6G6qq+wtMrt+IhDjD5btkyhOzGQpQjZObv92p9mHu3ZMi+LTa3tPgYYM
	6vIlLpcSbJmFYqRFwiDUxd7pD1iGDF0sSUL2PUT8fyZqT5qims0JamVJ5BOujIt3O6vC
	vrFo1GPqp+a4FArd4DtIC8FgskK6oFpRZQ7UozS8LMzeCGFV0KHnY9lDosGS/BSs8jjt
	WNA9nkeyIUXUei9rT9+LnOmJYSrerWqXhTlAjBMaO8HkvXavrbhlI3aPJKCd1k7Xq0+P
	dRJrsGEIWMdHMQyEKS3/XhgJxa/oK8mQNKPlI5uVRfmw+Xa4sCi0TaGgse5fPaRkjH8h
	Wraw==
X-Gm-Message-State: ALoCoQljG4K6fwOaSjz2kNaPKSfAJjPW7Khp/wEeGkOzQRnTD3ZI4BDEnNz32AKzdU7TCzzF/zJ3
X-Received: by 10.224.25.146 with SMTP id z18mr3491492qab.17.1418909430818;
	Thu, 18 Dec 2014 05:30:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 18 Dec 2014 05:30:10 -0800 (PST)
In-Reply-To: <549272C4.8060001@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
	<CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>
	<549272C4.8060001@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 13:30:10 +0000
Message-ID: <CAJTo0LYk9szY3r5FxMHLF+MF-G41rAqg1vimhWXzqdo3+kqa2w@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox-mdev: Support automatic mounting of block devices
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
X-List-Received-Date: Thu, 18 Dec 2014 13:30:37 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8ac097bf0b050a7d98b8

--047d7bdc8ac097bf0b050a7d98b8
Content-Type: text/plain; charset=UTF-8

On 18 December 2014 at 06:23, Mike Looijmans <mike.looijmans@topic.nl>
wrote:
>
> Putting the script into its own package is no problem, but how does one
> arrange this with mdev.conf?


That's a fairly good argument for keeping it in the same package, and we
can expect that users of mdev will be providing their own configuration
file anyway.

Ross

--047d7bdc8ac097bf0b050a7d98b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 December 2014 at 06:23, Mike Looijmans <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.=
nl</a>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Putting the script i=
nto its own package is no problem, but how does one arrange this with mdev.=
conf?</blockquote></div><br>That&#39;s a fairly good argument for keeping i=
t in the same package, and we can expect that users of mdev will be providi=
ng their own configuration file anyway.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc8ac097bf0b050a7d98b8--
