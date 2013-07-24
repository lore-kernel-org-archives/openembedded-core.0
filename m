Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 38D7C60656
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 20:27:32 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id hi8so691863lab.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 13:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=PlEmqE+dcQsC/Yu1PfCGng4bfqYai3qmi0+CKRg5H1M=;
	b=wLk0lHcpUUI4UhINfEG6UV21C53KL6k3xO23vTzrvSkhrYUCYU2zOrbWeYhSNh79eC
	rb2RSPzL1qjxjqn8x8NYn+ZxwfpdPVR97dpzf3wPjv92VM0BOvw8rfRLOnkzJj7UVJDc
	QG3cLOX9KMcB9ZwkaKCQ0ekGQn0n0ArkriQZ7xAITygP+XhwCitNGPT7r6yYVmX4+lIF
	anaRwfHrAd5fBiijRHheJ7RRktW1q793sOJmNwzod7qLmBnk3J8T20XN78b+dbuMNpVW
	fYQSKSmcyQ6X8qY8rEX+W8xpYPR1h9cagPbDb1rOXXtn1yzZJhjjIKZor2kqoaDygSv6
	TnFw==
X-Received: by 10.152.116.19 with SMTP id js19mr17589154lab.72.1374697651830; 
	Wed, 24 Jul 2013 13:27:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Wed, 24 Jul 2013 13:27:11 -0700 (PDT)
In-Reply-To: <CA+b4E8z+1_okUN0-JhDoc50FoLLM=3+WUxai1BtyyCLRVkmy9Q@mail.gmail.com>
References: <CA+b4E8z+1_okUN0-JhDoc50FoLLM=3+WUxai1BtyyCLRVkmy9Q@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Jul 2013 13:27:11 -0700
X-Google-Sender-Auth: _xkv5lRmQJArVdCugETAegkelU4
Message-ID: <CABcZANk0rWk0z9afLRrvgJQK2XnNgNN2E8UYnbp9bMOz4AS2_w@mail.gmail.com>
To: Brandon Stafford <brandon@rascalmicro.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Making SSL headers available during build?
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
X-List-Received-Date: Wed, 24 Jul 2013 20:27:33 -0000
Content-Type: multipart/alternative; boundary=001a11c1a1ea3608fb04e247bdda

--001a11c1a1ea3608fb04e247bdda
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 24, 2013 at 1:25 PM, Brandon Stafford
<brandon@rascalmicro.com>wrote:

> I'm working on updating an old recipe for uWSGI to add SSL support. I
> think this requires putting a collection of SSL headers in
> sysroots/ARCH/usr/include.
>
> How do I go about telling Bitbake to do that?
>
> If it helps, my current recipe is here:
> https://github.com/rascalmicro/openembedded-rascal/blob/rascal/recipes/uwsgi/uwsgi_1.9.14.bb
>

Add openssl or gnutls (whichever you need) to DEPENDS. Done. :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c1a1ea3608fb04e247bdda
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jul 24, 2013 at 1:25 PM, Brandon Stafford <span dir=3D"ltr">&lt;<a href=
=3D"mailto:brandon@rascalmicro.com" target=3D"_blank">brandon@rascalmicro.c=
om</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>I&#39;m working on updating an old reci=
pe for uWSGI to add SSL support. I think this requires putting a collection=
 of SSL headers in sysroots/ARCH/usr/include.</div>

<div><br></div>
<div>How do I go about telling Bitbake to do that?</div><div><br></div><div=
>If it helps, my current recipe is here:=C2=A0<a href=3D"https://github.com=
/rascalmicro/openembedded-rascal/blob/rascal/recipes/uwsgi/uwsgi_1.9.14.bb"=
 target=3D"_blank">https://github.com/rascalmicro/openembedded-rascal/blob/=
rascal/recipes/uwsgi/uwsgi_1.9.14.bb</a></div>

</blockquote></div><br>Add openssl or gnutls (whichever you need) to DEPEND=
S. Done. :)<br>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>F=
ounder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior =
Software Engineer, Mentor Graphics
</div></div>

--001a11c1a1ea3608fb04e247bdda--
