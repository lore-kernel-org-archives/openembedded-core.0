Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48])
	by mail.openembedded.org (Postfix) with ESMTP id B24547F80E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:23:30 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id z9so7655394uan.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 03:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3c7QEK6XpwaChkkwyNJfxVFjLWJLSQN1LbZ6QUxKnUw=;
	b=Fj7gWjqUtL15GTcH6Tg9iAfQGJcC8jfSuGa9fiLR7Tl3LIVvRlOZoGe6NvOISu3SkB
	5YdagF8bWECzpNF+te8QBnOUM9J29anUfM7R2L8sCQMjJVIyBtGmi6UHulxxckiu50Xm
	vMB7cGwLj4RqFy8qscD2fBEizcgLGZVisHIzOaPMg8eozcm4yxAZNQjdpnYfMtprbUKA
	WoShUSlHaDiOkoiH1LkWcAKWRzNmUzBZ6aU/7BeukEEXwlm9EmMabwkKBsu69AWDT8w5
	EC/kmMlPu3cAuOu5jZFlBGXFM5Uqq4HduhZk7gQcIRl0OTFKwxESo4jRg/6Hk+pSgVfk
	ltvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3c7QEK6XpwaChkkwyNJfxVFjLWJLSQN1LbZ6QUxKnUw=;
	b=Xye0KYmB0V/5Ys7P8TZx5RgbBA1Wn+hIp7rsgoMHLaMMf1gUVAw4Xjb+05l0s3EmwR
	U8h7g/WarkrQZ82gzXEVA3cX+ayWLzO9hcJhtrkeITXR8IaoPzdWIpvHYpIQxQfMcN4X
	OUJPkKHzQhdXsG/BK2bmeJLoqlP42B1yYjG3D7AdYZbIkF/1pf7Tia7BEjGLOJTjX3vX
	nCatKh7IOAUZ0XgkCWoFtKQ8DS5Z5tOggyjdwmWRX7r7Wy//QJGL2Ued/j+h9sJnmCwQ
	mgNbo83qirVhgl40BXIs39/OT5ZqgdpGsDHnK95wCeg+PMR7m3qkuwDCLFe723CFhVR+
	vHJg==
X-Gm-Message-State: APjAAAXZj8H0FcS1bR5d0w6E1Q/ZkJJ5yPkEAVAsye8HHIts+NgGhoqv
	3IZPpQ8P57rsWKXo/fqKeAL3hKVEy9PqxBVelPjmxg==
X-Google-Smtp-Source: APXvYqyj9BNwamt7x7g2jlDb8YQP22qWYlo3a/lNTC9VUvBU4KGhnqvqtUoSmZV85I0JeU8c7Jo8D1Zzci5sH8ozh2o=
X-Received: by 2002:ab0:1c06:: with SMTP id a6mr1262430uaj.93.1574249011412;
	Wed, 20 Nov 2019 03:23:31 -0800 (PST)
MIME-Version: 1.0
References: <20191120062728.105714-1-shohei.maruyama@cybertrust.co.jp>
In-Reply-To: <20191120062728.105714-1-shohei.maruyama@cybertrust.co.jp>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2019 12:23:20 +0100
Message-ID: <CANNYZj8X0YbDb2rDFjrqVMt-gm+Y8VxOgcQpZgr8abeVJ_rgmg@mail.gmail.com>
To: shohei.maruyama@cybertrust.co.jp
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Update checksum of the license file
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
X-List-Received-Date: Wed, 20 Nov 2019 11:23:31 -0000
Content-Type: multipart/alternative; boundary="0000000000001d044f0597c569ab"

--0000000000001d044f0597c569ab
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 07:26, <shohei.maruyama@cybertrust.co.jp> wrote:

> Recently pseudo.inc has been updated to latest master (d50b9c511e17c6f582e
> f39b61eaaa8d4555eabba), but checksum of the license file did not change.
> This commit updates the checksum to latest one.
>

I am not sure I can make sense of this. When the checksum of the file
changes upstream, bitbake will complain and refuse to proceed, which is not
happening with the current master branch.
What error message are you seeing and what commit are you on?

Alex

--0000000000001d044f0597c569ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 20 Nov 2019 at 07:26, &lt;<a href=
=3D"mailto:shohei.maruyama@cybertrust.co.jp">shohei.maruyama@cybertrust.co.=
jp</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Recently pseudo.inc has been updated to latest=
 master (d50b9c511e17c6f582e<br>
f39b61eaaa8d4555eabba), but checksum of the license file did not change.<br=
>
This commit updates the checksum to latest one.<br></blockquote><div><br></=
div><div>I am not sure I can make sense of this. When the checksum of the f=
ile changes upstream, bitbake will complain and refuse to proceed, which is=
 not happening with the current master branch.</div><div>What error message=
 are you seeing and what commit are you on?</div><div><br></div><div>Alex<b=
r></div></div></div>

--0000000000001d044f0597c569ab--
