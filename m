Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6636F758DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 14:45:46 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id s63so5977755ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 07:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=VW32K7t9gtNBwOM4KIeYqH4dF3SjTTn6dVmov0PKlnA=;
	b=NaI594CURLmPw61pU6GHwleBT91uUmflrHq9YJmj4IiHUxP/LIZC4piKKrccstVxQ9
	rmr6/JXfSsqczNZQZiQYlFgYBVZoHyjCr9DzwRl5d0cvUv+3BhPnaotllmMjeCyCNwrV
	Rthps4tahGiTzPH+3lMtl88Wb59THSGpBy+oFJc9KSnGV2UJgBztPlCqpct8/oPgIZ60
	GQCR3wVZjBoCuv3WfvAQHhEDsz7YLSnIbhojd1sCR7GYETfzAGhQ/pD7VpLFWvExbphs
	nzMbsSR5vvMEXo+KXRbi2s4qVdiZOIvf966raxsjGrcuYBrdw7X5QisOHjQwA7Ag5FNK
	cYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=VW32K7t9gtNBwOM4KIeYqH4dF3SjTTn6dVmov0PKlnA=;
	b=Ckn+HSBPjxYD6FgKv1255iDLqqbuJwoJq4LvkwuHzSQOscT1l+eWWSGp2mdzChkGQh
	+kP7BArIFhBcTNEBZ3geEj+G8xYXqBxk0/e1d0U84kyBdIx6WfXgGj3Rs/OYQMiwwxpp
	oLaXv7RbOZJWcy7VMHWeEnYQdFkG8lqqDMDdqmXGOIngSpgS3eDYT96O87icPqa5vduF
	oeBsc7sz9AtAUcjQj0HOytVuxaPYuNx8SCilNL0O6fsnyO73omslLXWtdNTOw4vgs+Kw
	PxIUragyKzD1xzGUVi4HdwGucv/5L2bj6XNIaU/7B552rK5MalnbpCGNhOTTVxHY/JmQ
	+17Q==
X-Gm-Message-State: ALyK8tIFUwpyrd0GgoVkQ5DeHiP1ZUsdTLqOn73Y0FtjqH3NvdKglqa7CTLmKqn+MNafMU3ybNKem/smeZvjmQ==
X-Received: by 10.107.147.137 with SMTP id v131mr8409383iod.3.1466088346832;
	Thu, 16 Jun 2016 07:45:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Thu, 16 Jun 2016 07:45:27 -0700 (PDT)
In-Reply-To: <1466087231-14928-1-git-send-email-jpardeiro@rapyuta-robotics.com>
References: <1466087231-14928-1-git-send-email-jpardeiro@rapyuta-robotics.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 16 Jun 2016 07:45:27 -0700
X-Google-Sender-Auth: _8brlcFTHUpv2qaioEZ9dgLQn8w
Message-ID: <CABcZANkvgj_+Dje4T9h9Z3W4pdWvvpej_PYdwFLEX4mDVHR7mg@mail.gmail.com>
To: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] The CMake recipes contain a mismatch between the environmental variable which defines where the Modules are installed and the location where they actually are. This patch fixes the environmental variable to point to the proper folder defined according to the cmake version.
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
X-List-Received-Date: Thu, 16 Jun 2016 14:45:46 -0000
Content-Type: multipart/alternative; boundary=94eb2c0031421f56430535664bf2

--94eb2c0031421f56430535664bf2
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 16, 2016 at 7:27 AM, Jose Pardeiro <
jpardeiro@rapyuta-robotics.com> wrote:

> Signed-off-by: Jose Pardeiro <jpardeiro@rapyuta-robotics.com>
>

I can't speak to the content, not knowing cmake very well, but this commit
message violates general git commit message policy and yocto's
specifically.

http://openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks for the contribution, though, it's appreciated. Perhaps someone else
can comment on the patch itself.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c0031421f56430535664bf2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jun 16, 2016 at 7:27 AM, Jose Pardeiro <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:jpardeiro@rapyuta-robotics.com" target=3D"_blank">jpardeiro@rap=
yuta-robotics.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D":1ui=
" class=3D"">Signed-off-by: Jose Pardeiro &lt;<a href=3D"mailto:jpardeiro@r=
apyuta-robotics.com">jpardeiro@rapyuta-robotics.com</a>&gt;</div></blockquo=
te></div><br>I can&#39;t speak to the content, not knowing cmake very well,=
 but this commit message violates general git commit message policy and yoc=
to&#39;s specifically.=C2=A0<br><br clear=3D"all"><div><a href=3D"http://op=
enembedded.org/wiki/Commit_Patch_Message_Guidelines">http://openembedded.or=
g/wiki/Commit_Patch_Message_Guidelines</a><br></div><div><br></div><div>Tha=
nks for the contribution, though, it&#39;s appreciated. Perhaps someone els=
e can comment on the patch itself.</div>-- <br><div class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kerg=
oth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - =
Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c0031421f56430535664bf2--
