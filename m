Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF5D73D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 11:09:26 +0000 (UTC)
Received: by qgeg42 with SMTP id g42so28532131qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 04:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=B0DqOev6jnW0nKmXHebjC8My55K+ZVtj2YEGW4LdzdM=;
	b=djFUIOJUocIDlk33VJe0lZsehSv13rHXRK/oQ7sNOahM+pxPbBr/uzQTA43/rUnlZU
	3T0X2WqX5PGBS5cdFALkkfIVltMbOo6DX0D+ijCn+KVd/9mLWZSfK63H5bkvyngecu/I
	es5ymxnTIsBYwX3hApQqsyn+rJUVDObNh/v7qDDheceOvPZ8rqHWfizB8pESKN7KnANd
	1PrF9z5Wpy/w3rRK4IMoFozUMlJPqJAXxyMirOpRY8A4j7SSJbOf7MZSMhNhdsaofkEK
	GO4PIyuF0whhMmCKlvPw063BttgdFhOakmTeTueGlNsUfURY/j0m8XLb42y20m3q5Fmo
	+wzw==
X-Gm-Message-State: ALoCoQnMYK90R9G/k3GTbfCPF3+ogqNSxt3eF+ohypRoM/RBFaFKEjfMyUKXta6nFU7qpIzXNg6E
X-Received: by 10.140.133.67 with SMTP id 64mr8900073qhf.52.1439464166773;
	Thu, 13 Aug 2015 04:09:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Thu, 13 Aug 2015 04:09:07 -0700 (PDT)
In-Reply-To: <1439456956-21602-1-git-send-email-clemens.lang@bmw-carit.de>
References: <1439456956-21602-1-git-send-email-clemens.lang@bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Aug 2015 12:09:07 +0100
Message-ID: <CAJTo0Lb+y8v4SKhgUrdonNivPeT77Lyxd5MFDDoS4T087Zwp8w@mail.gmail.com>
To: Clemens Lang <clemens.lang@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Avoid race condition between do_unpack and do_deploy_archives in archiver.bbclass
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
X-List-Received-Date: Thu, 13 Aug 2015 11:09:29 -0000
Content-Type: multipart/alternative; boundary=001a1136fdce540ae3051d2f5ee7

--001a1136fdce540ae3051d2f5ee7
Content-Type: text/plain; charset=UTF-8

On 13 August 2015 at 10:09, Clemens Lang <clemens.lang@bmw-carit.de> wrote:

> Because do_deploy_archives does not specify a working directory, it
> defaults to $B, which does not exist when do_deploy_archives is run in
> parallel (or before) do_unpack.
>

I'm not sure I follow this.  Functions are executed using exec_func() will
create and cd to the default directory, so if that is ${B} then exec_func
will create ${B} before executing the function.

(I've a branch - ross/dirs - to remove this undesired OE-specific knowledge
in BitBake)

Ross

--001a1136fdce540ae3051d2f5ee7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 August 2015 at 10:09, Clemens Lang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:clemens.lang@bmw-carit.de" target=3D"_blank">clemens.lang@bmw-carit.d=
e</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"ove=
rflow:hidden">Because do_deploy_archives does not specify a working directo=
ry, it<br>
defaults to $B, which does not exist when do_deploy_archives is run in<br>
parallel (or before) do_unpack.</div></blockquote></div><div class=3D"gmail=
_extra"><br></div>I&#39;m not sure I follow this.=C2=A0 Functions are execu=
ted using exec_func() will create and cd to the default directory, so if th=
at is ${B} then exec_func will create ${B} before executing the function.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(I&#39;=
ve a branch - ross/dirs - to remove this undesired OE-specific knowledge in=
 BitBake)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a1136fdce540ae3051d2f5ee7--
