Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id E52AD72F4D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 09:17:35 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id p22so108724224qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BE5jb6yiZGpjuFRTMAzapus+A23bOLL7FBT8txVesV4=;
	b=bDeXPD0tqGGwnMn8C20cWDbdkkeQVUFpOhqQ0Tw3ZffEBvx3OpaZrVIO2ojaesyiP0
	Pn7w8qHd9/BJqMFHJr9BxHDihdrGYwOJWzoRZ/ogQOYCsKlxGZv1/Riz2UWP3kKxAszu
	vClWx5l0NuNWQyCwJ25jm6XaKfBNXfzKg6JINSamet+PNx9rVCj+HhGtBnhFUKguPznJ
	E8szDZ8P0jPEPFRoYOXdC1uEr3MP8lvQyPIVhsuDQctT2nMhytHCs/AuxT5jqXlSzDgG
	ioDkc7LKuMTfSKkUow6kU3SdJsSgqY33ujg3H7WkzjQ4/1QpZhiIMtht2s3Xk8y8IRph
	ttww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BE5jb6yiZGpjuFRTMAzapus+A23bOLL7FBT8txVesV4=;
	b=Vdg1Ss1X+1rIXoFfBq+8EZpMqFLkpk6y+qJGdCWA2tYZCzwGkFOp/KBByhTpl8kvmR
	t8+zPzs4nwxfhaf31tUf8fZL7OZ/yacnUi/kl4sukznZKpffXfOtD0BXHufvIH3DkIli
	4Yd3DnvZeR+sp/2pP4Q+ZnLPARW3nKe29qzIe8ysLEcn7IKhcPJXCPH7yw7+HfO3fctV
	Z4ktsgbf88C2HSA4BuL5jWBh1mmHIPyCMwhmmrKhzzqZs3SZRVZdxkQTzZziYsvLnuoW
	XSgVVNmRqWZbLDf27sirYqRP5kK4l6ZNQCNd/oEc1BbxZpsRLYzlho6AqXJeaLr7GyJc
	0u+w==
X-Gm-Message-State: AFeK/H3+7ku4qzXIfLPuEnK9E3ToMRf64INoRFvmM+SUufn9dnyDnA5eEcusiUYRdOdZrpgDmnUIU2R2tkw/0a8j
X-Received: by 10.55.123.6 with SMTP id w6mr16544992qkc.36.1491211057321; Mon,
	03 Apr 2017 02:17:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 3 Apr 2017 02:17:16 -0700 (PDT)
In-Reply-To: <CAHiDW_Ee=0nyBAsHkagd0hfS0orWBDu9ahh4k=2uQHR0tet2Fg@mail.gmail.com>
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
	<1491187907-5752-5-git-send-email-yin.thong.choong@intel.com>
	<CAHiDW_HmcNpGPrmf+oDiKaU8EHS=RoXYZW3XkzPKuZKLFmNauw@mail.gmail.com>
	<CF0C948DE8E2634BB64BF489FF9EF7E7CB114D@PGSMSX105.gar.corp.intel.com>
	<CAHiDW_Ee=0nyBAsHkagd0hfS0orWBDu9ahh4k=2uQHR0tet2Fg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Apr 2017 10:17:16 +0100
Message-ID: <CAJTo0Lb6o=fFerSorzQqJpRtMNB6z1L5ZDqE5AzTE6gCpWNmSA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] logrotate: replace fedorahosted.org SRC_URI with yoctoproject.org source
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
X-List-Received-Date: Mon, 03 Apr 2017 09:17:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c063a185b80b2054c3fa1e7

--94eb2c063a185b80b2054c3fa1e7
Content-Type: text/plain; charset=UTF-8

On 3 April 2017 at 09:30, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> This is true, there's not that much in the repo itself to create trust.
> The major show of trust is here though: http://pkgs.fedoraproject.org/
> cgit/rpms/logrotate.git/commit/?id=9cb55142e51b82085d6c3136448c1f
> 441454e351
> Fedora/Red Hat themselves changed to use this repo when the fedorahosted
> repos were EOL'd (see also Red Hat folks working on the github issues in
> January).
>

So logrotate was originally hosted on Fedora infrastructure that is then
shut down, a github repository appears and Fedora fetch from that github
repository.  Also the commit in the github repository to change the README
from fedorahosted to github (
https://github.com/logrotate/logrotate/commit/09c4fa8bc6cf2c01bad24d33c3ea69371030c014)
was committed by a Red Hat employee (https://github.com/kdudka).

Whilst there are many official-looking forks on github that are just Some
Guy, this is clearly the new canonical home.

Ross

--94eb2c063a185b80b2054c3fa1e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 April 2017 at 09:30, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex"><div>This is true, there&#39;s no=
t that much in the repo itself to create trust. The major show of trust is =
here though: <a href=3D"http://pkgs.fedoraproject.org/cgit/rpms/logrotate.g=
it/commit/?id=3D9cb55142e51b82085d6c3136448c1f441454e351" target=3D"_blank"=
>http://pkgs.fedoraproject.org/<wbr>cgit/rpms/logrotate.git/<wbr>commit/?id=
=3D<wbr>9cb55142e51b82085d6c3136448c1f<wbr>441454e351</a></div><div>Fedora/=
Red Hat themselves changed to use this repo when the fedorahosted repos wer=
e EOL&#39;d (see also Red Hat folks working on the github issues in January=
).</div><div></div></blockquote></div><br>So logrotate was originally hoste=
d on Fedora infrastructure that is then shut down, a github repository appe=
ars and Fedora fetch from that github repository.=C2=A0 Also the commit in =
the github repository to change the README from fedorahosted to github (<a =
href=3D"https://github.com/logrotate/logrotate/commit/09c4fa8bc6cf2c01bad24=
d33c3ea69371030c014">https://github.com/logrotate/logrotate/commit/09c4fa8b=
c6cf2c01bad24d33c3ea69371030c014</a>) was committed by a Red Hat employee (=
<a href=3D"https://github.com/kdudka">https://github.com/kdudka</a>).</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Whilst ther=
e are many official-looking forks on github that are just Some Guy, this is=
 clearly the new canonical home.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--94eb2c063a185b80b2054c3fa1e7--
