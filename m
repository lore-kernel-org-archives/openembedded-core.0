Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7049B6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 21:50:57 +0000 (UTC)
Received: by qgep37 with SMTP id p37so24837997qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 14:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IRdPY7CNLzcIIR6otR/D1aUSfqdwK/kYdzXREf/UkWE=;
	b=gZLn8vcMAgB6opO3pVllAM5oL8eBN/8Dy8VXu2TOoRny4yRoG9lRENylhfvs0nUjzN
	Tjyq44YgoRFRGHzupSgmfXjcesJ2IBXEucYggbVJYfTcsnx4e/ao4vMP1m6HBiRKfoGE
	ZrC5aYUnOuoBSIPBMS3NMIDLoSOEmJRFjaeiYLkn5x4DjPqrJ4MhnoPLTbJ8qtsbYdJT
	1VAyCzATQSnYJgFZBnUbIdsws8R4g+hRScSwMi0/cXQDyXruo8t7HGm+5yKBTWkcDQpU
	dXv8xpKW94pkC8Q9DODGHJdJxFilC/omGYp085UfyDVK6HaM/IzUrsQdH6vGTNZ4prdw
	goJg==
X-Gm-Message-State: ALoCoQlk7INn4edRn1jL9mPCzNSbW25XSd43Dxptw2ANw8IpUe6DvupLQFdehOMowmY+nP8oexuj
X-Received: by 10.140.149.141 with SMTP id 135mr5493592qhv.64.1436997057778;
	Wed, 15 Jul 2015 14:50:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Jul 2015 14:50:38 -0700 (PDT)
In-Reply-To: <55A6CE64.7090206@windriver.com>
References: <1436991327-5726-1-git-send-email-yang.shi@windriver.com>
	<1436991327-5726-2-git-send-email-yang.shi@windriver.com>
	<CAJTo0LbYUqQ6YJ1CO4bK+PStc7NNttEpkYgN6Kdxu9t6urHvVw@mail.gmail.com>
	<55A6CE64.7090206@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Jul 2015 22:50:38 +0100
Message-ID: <CAJTo0LYqF1QBAzHsoPeA76Mjq5GBLU_26B-nOduz607VBOukGg@mail.gmail.com>
To: Yang Shi <yang.shi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] MIPS: Fix build with binutils 2.24.51+
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
X-List-Received-Date: Wed, 15 Jul 2015 21:50:59 -0000
Content-Type: multipart/alternative; boundary=001a11357bf02c2aa1051af0f3b8

--001a11357bf02c2aa1051af0f3b8
Content-Type: text/plain; charset=UTF-8

On 15 July 2015 at 22:19, Yang Shi <yang.shi@windriver.com> wrote:

> Yes, should I resend the patch to linux-yocto?
>

Just in case Bruce didn't see the original and for proper process, that
would be best.

Ross

--001a11357bf02c2aa1051af0f3b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 July 2015 at 22:19, Yang Shi <span dir=3D"ltr">&lt;<a href=3D"mailto:=
yang.shi@windriver.com" target=3D"_blank">yang.shi@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=
=3D"#000000">Yes, should I resend the patch to linux-yocto?<br></div></bloc=
kquote></div><br>Just in case Bruce didn&#39;t see the original and for pro=
per process, that would be best.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a11357bf02c2aa1051af0f3b8--
