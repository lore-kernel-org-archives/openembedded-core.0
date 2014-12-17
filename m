Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 80C3C7270A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 22:04:13 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id j7so1122017qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 14:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mMnIzus6a9DHnJKr+/+axA4/elo1eyem8OT9YH2ovns=;
	b=Q5pm7xhOuQttE1LhfT55L/9AXaFN09Qdjt3/Rvgwtnye8ZVkFuN2M4bDDirhsMiFLy
	XDeuJlsznnSB/te2VAH3KzmpXPerjFScOMi7z1e2zhhd9tT6aL0gzXBToxm3U6ZFZAZ0
	uFW7mkhQbBIcLvItFuKBFZHk9bLbAXrEFdn5qB1PyWF5UjozDOP9Zwndrt3NnF3V6qHy
	nJT5TM1DsfqTwKd34LATkbiCcLZZgqE7yKsrzFjnUxv1ydT5NkmkaPBX0dQhe1uYO59O
	PBwOyf7qZHiiZcL5QRuf19pViCEJ4uOIP288qfIdaKfEvfWqTAZ+ROBhC9KqOZR/Ljp+
	+LdA==
X-Gm-Message-State: ALoCoQmY5nx68fgZ3vY2gz7mqZkef1szKfcnsLzGYomlw1vPWjJeEVXzrMdFzX+JXnCyF1L5makS
X-Received: by 10.224.25.146 with SMTP id z18mr18032956qab.17.1418853854132;
	Wed, 17 Dec 2014 14:04:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 17 Dec 2014 14:03:53 -0800 (PST)
In-Reply-To: <1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Dec 2014 22:03:53 +0000
Message-ID: <CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Dec 2014 22:04:14 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8ac0f6d251050a70a756

--047d7bdc8ac0f6d251050a70a756
Content-Type: text/plain; charset=UTF-8

Hi Mike,

On 5 December 2014 at 09:58, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
> Upon inserting a USB stick or similar device, mdev will run
> an automounter script that mounts valid partitions on
> /media/<device>. The script first checks /etc/fstab entries
> so that mounting on UUID or LABEL or using custom mount options
> is still possible. If /etc/fstab does not contain particular
> mount options, the script will create (and remove) the mountpoint
> automatically.
> The script also supports full disk partitions (devices without
> partition table).
>

Thanks for this, but can this script be put into a separate recipe to make
it even easier for people who don't want it, or want their own version?
The prior art here is the udev automounting script which is in
udev-extraconf.

Cheers,
Ross

--047d7bdc8ac0f6d251050a70a756
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Mike,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 5 December 2014 at 09:58, Mike =
Looijmans <span dir=3D"ltr">&lt;<a href=3D"mailto:mike.looijmans@topic.nl" =
target=3D"_blank">mike.looijmans@topic.nl</a>&gt;</span> wrote:<blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div id=3D":ex" class=3D"a3s" style=3D"overflow:hidden">=
Upon inserting a USB stick or similar device, mdev will run<br>
an automounter script that mounts valid partitions on<br>
/media/&lt;device&gt;. The script first checks /etc/fstab entries<br>
so that mounting on UUID or LABEL or using custom mount options<br>
is still possible. If /etc/fstab does not contain particular<br>
mount options, the script will create (and remove) the mountpoint<br>
automatically.<br>
The script also supports full disk partitions (devices without<br>
partition table).</div></blockquote></div><br>Thanks for this, but can this=
 script be put into a separate recipe to make it even easier for people who=
 don&#39;t want it, or want their own version?=C2=A0 The prior art here is =
the udev automounting script which is in udev-extraconf.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div class=
=3D"gmail_extra">Ross</div></div>

--047d7bdc8ac0f6d251050a70a756--
