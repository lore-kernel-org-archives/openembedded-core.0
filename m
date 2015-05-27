Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3AA756C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 18:55:06 +0000 (UTC)
Received: by qgez61 with SMTP id z61so7314610qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 11:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=9BvnjKsNFn9lySUe/Mb4OY50VyiKg7AFTWVWNZn2pr4=;
	b=E2aVzsc9gbrlDBcwSsCYC4KHWO1rpAq4oIgWUOV6S91fl4ePzN3jHIH/wOnBnl7du0
	NDh1jtInAWn4JvG4hxGyLtRADBC/yTOV+Y7FwjmQE1jJ8lu9klUgo5U0x6Cy5ZeC95iP
	wbXdu4NroEgjwYTihrWxM4nDW39BI0eIqfr2MsuEzGnBtJZ+GukbbG0f+u19+u9DGutc
	nCyveFwgdXP1hrgRQmsfYmNkIaWVMTwXb2Hgvj+ypRybX1CoGzmtqiNq5we/SCHMVUWH
	uIESNJuNexaA/AzqxMxP5WZJtDZI+6H72WQvC4R9IPy7dBKroczkiboSpoke0IKkapgj
	HIcQ==
X-Received: by 10.140.19.48 with SMTP id 45mr26087174qgg.56.1432752907940;
	Wed, 27 May 2015 11:55:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.117 with HTTP; Wed, 27 May 2015 11:54:47 -0700 (PDT)
In-Reply-To: <061547e2e995fd41cd68e5f3d00f94389dd92bd1.1432706896.git.Qi.Chen@windriver.com>
References: <cover.1432706896.git.Qi.Chen@windriver.com>
	<061547e2e995fd41cd68e5f3d00f94389dd92bd1.1432706896.git.Qi.Chen@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 27 May 2015 11:54:47 -0700
X-Google-Sender-Auth: hoTyYSKxxLlLZ2gWht_Kco3E7vw
Message-ID: <CABcZANnA4C2Y4VG4qrgEzJrU2L4e=KVt_KS0PK6DnNh+gkEkvQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Wed, 27 May 2015 18:55:10 -0000
Content-Type: multipart/alternative; boundary=001a11352a6a20f992051714c801

--001a11352a6a20f992051714c801
Content-Type: text/plain; charset=UTF-8

On Tue, May 26, 2015 at 11:09 PM, Chen Qi <Qi.Chen@windriver.com> wrote:

> If we do `bitbake buildtools-tarball' and then after one day do `bitbake
> core-image-minimal -c populate_sdk_ext', we would meet errors like below.
>
> | install: cannot stat
> '/buildarea2/chenqi/poky/build-systemd/tmp/deploy/sdk/
>
> poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-standalone
> -1.8+snapshot-20150429.sh': No such file or directory
>
> The problem is that the output name for buildtools-tarball has ${DATE} in
> it.
> So if populate_sdk_ext task is executed but buildtools-tarball is not
> rebuilt,
> the above error appears.
>
> Instead of hardcoding ${DISTRO_VERSION} which consists of ${DATE} in the
> install_tools() function, we should find the latest buildtools-tarball
> based
> on the modification time and install it.
>
> [YOCTO #7674]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

Hmm, if buildtools-tarball is required, why not just pull it in via
dependencies and build a current one, rather than assuming/forcing the user
to have done so themselves?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11352a6a20f992051714c801
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 26, 2015 at 11:09 PM, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1j7" class=
=3D"a3s" style=3D"overflow:hidden">If we do `<span class=3D"il">bitbake</sp=
an> buildtools-tarball&#39; and then after one day do `<span class=3D"il">b=
itbake</span><br>
core-image-minimal -c populate_sdk_ext&#39;, we would meet errors like belo=
w.<br>
<br>
| install: cannot stat &#39;/buildarea2/chenqi/poky/build-systemd/tmp/deplo=
y/sdk/<br>
poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-standalo=
ne<br>
-1.8+snapshot-20150429.sh&#39;: No such file or directory<br>
<br>
The problem is that the output name for buildtools-tarball has ${DATE} in i=
t.<br>
So if populate_sdk_ext task is executed but buildtools-tarball is not rebui=
lt,<br>
the above error appears.<br>
<br>
Instead of hardcoding ${DISTRO_VERSION} which consists of ${DATE} in the<br=
>
install_tools() function, we should find the latest buildtools-tarball base=
d<br>
on the modification time and install it.<br>
<br>
[YOCTO #7674]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;</div></blockquote></div><br>Hmm, if buildtools-tarba=
ll is required, why not just pull it in via dependencies and build a curren=
t one, rather than assuming/forcing the user to have done so themselves?<br=
>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at ker=
goth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer -=
 Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11352a6a20f992051714c801--
