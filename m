Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 093F67653B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 16:12:22 +0000 (UTC)
Received: by qgez77 with SMTP id z77so73437163qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 09:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wnuBZh0Dq3jJUndOzDkTGSjPq77zIs4Gq/l7EfK909w=;
	b=abBgDl6XfbRhZUHqQpRpOVtUuqAnqN9kXpePLgp2faI2+RYZevjoIR5v06EYB2kpsP
	O9/i9HB6HbVbBTg6TO3clftUVK1OJRsEA3jK0x/Y1Dx2wDlba/XB75DNQVqCvp0jfmxX
	X/uR5ed9DVH3sp/h0dfesHB5C1tdlFir4AAaiDi9pjJ58BztYphSDZlOX3mR405a7MNl
	PshrRmNu9T2JwK8xDWMvQPqUhxQky3QNdnEnjbMqf3IGtpMcWT3wEAiqvKJJyl4/4AUw
	Hbhxt38xUoiChfgIsqx4Kq8rUwcHg2sb62tV+49FkgYKQlruU9AAzHkWuldw+fW65ZB5
	pPcA==
X-Gm-Message-State: ALoCoQmIcrxnKhZEq6/vVr8I65xqkZsIdNtnMLo7y5ItHfrwXVvLymwFkytJrcblA9xwUkA9s/FA
X-Received: by 10.140.44.11 with SMTP id f11mr7133184qga.80.1443197543243;
	Fri, 25 Sep 2015 09:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 25 Sep 2015 09:12:03 -0700 (PDT)
In-Reply-To: <56056F47.7040004@opendreambox.org>
References: <cover.1443179044.git.jussi.kukkonen@intel.com>
	<aa28a5439d5375728b83962d6814045053f9fdd6.1443179044.git.jussi.kukkonen@intel.com>
	<56056F47.7040004@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Sep 2015 17:12:03 +0100
Message-ID: <CAJTo0LZKYa5h-Ziprps5XP2AEDzpdUNT5O85rdnK23Dd2zBUZw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] connman: Depend on xuser-account unconditionally
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
X-List-Received-Date: Fri, 25 Sep 2015 16:12:27 -0000
Content-Type: multipart/alternative; boundary=001a113b41bce834500520949c66

--001a113b41bce834500520949c66
Content-Type: text/plain; charset=UTF-8

On 25 September 2015 at 16:59, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Whether to add user accounts or not should be a decision made by the
> distro. If this setting is machine specific, which to be honest
> surprised me, why don't you just let the machine specific xorg video
> driver depend on xuser-account unconditionally? Connman really doesn't
> need this account.
>

connman does need the account as it uses it to allow a non-root X user to
actually use connman.  DBus should warn if you try and set policy that uses
users that entirely don't exist.

I wonder if dbus lets multiple files assign policy, so the dbus rules could
go into the xuser package?

Ross

--001a113b41bce834500520949c66
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 September 2015 at 16:59, Andreas Oberritter <span dir=3D"ltr">&lt;<a =
href=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ol" c=
lass=3D"a3s" style=3D"overflow:hidden">Whether to add user accounts or not =
should be a decision made by the<br>
distro. If this setting is machine specific, which to be honest<br>
surprised me, why don&#39;t you just let the machine specific xorg video<br=
>
driver depend on xuser-account unconditionally? Connman really doesn&#39;t<=
br>
need this account.</div></blockquote></div><br>connman does need the accoun=
t as it uses it to allow a non-root X user to actually use connman.=C2=A0 D=
Bus should warn if you try and set policy that uses users that entirely don=
&#39;t exist.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">I wonder if dbus lets multiple files assign policy, so the dbus rul=
es could go into the xuser package?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113b41bce834500520949c66--
