Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDF061EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 12:32:37 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so6303092obq.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VB2h5eE8q6nznKwdRVTULoe/T9E1fThAhd+pgNFB0Cs=;
	b=N9UGxvEc2b6m6CTPraLk7cz/yEdLch9JKnni5RnEZ6yttRRQeAoL38D5vqtoNfDzbu
	8CsWO1l0MBrVE6T14dkjYFg+q2MMsSPeqCmvVWoS/urTnxJFffjyQpQurM7oKKGNRnj7
	hF49rNlaeIF6KLLc35TK25VLGXmDoe0oL0ubmLLQyJSpx19nB62dvEVhKB4WLp5SblrL
	YdoIgBBa/wpbNdcu9UOuhSKuDByfTUBbxCTF5rIAOTf8O9KUgFELPtgVwyWgmL7dXmXs
	noFX3QjSdEad3DLtxEYM6R5qFl+0cnJwcTaPEXj6F/fczzvf9QsdzC2QfDT9izSjoss2
	WVsA==
MIME-Version: 1.0
X-Received: by 10.182.79.106 with SMTP id i10mr12233109obx.59.1370608357929;
	Fri, 07 Jun 2013 05:32:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Fri, 7 Jun 2013 05:32:37 -0700 (PDT)
In-Reply-To: <4caf51c1d2225dc66aeef8326ba0616d97f7c691.1370585547.git.Qi.Chen@windriver.com>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
	<4caf51c1d2225dc66aeef8326ba0616d97f7c691.1370585547.git.Qi.Chen@windriver.com>
Date: Fri, 7 Jun 2013 09:32:37 -0300
X-Google-Sender-Auth: 8IyNQxks_lOeLXTWb0ejPxAdpP0
Message-ID: <CAP9ODKoSeooN+tpqVEvB5uEE2U7yyt5O1Jy1LZcPpyOYb7FV8A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] busybox: remove the postinst part of the recipe
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
X-List-Received-Date: Fri, 07 Jun 2013 12:32:38 -0000
Content-Type: multipart/alternative; boundary=047d7b2e3e104d539204de8fa0ce

--047d7b2e3e104d539204de8fa0ce
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 7, 2013 at 3:13 AM, <Qi.Chen@windriver.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Remove the pkg_postinst_${PN} from this recipe, as it's redundant.
> It basically wants to do the same thing as the update-alternatives
> does. But it doesn't do it well.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

Instead of removing it, please convert it here for update-alternatives so
it keeps working on this commit and allow bisect in future if need.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b2e3e104d539204de8fa0ce
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Jun 7, 2013 at 3:13 AM,  <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt=
;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@=
windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
<br>
Remove the pkg_postinst_${PN} from this recipe, as it&#39;s redundant.<br>
It basically wants to do the same thing as the update-alternatives<br>
does. But it doesn&#39;t do it well.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br></blockquote><div><br></div><div style>Instead of=
 removing it, please convert it here for update-alternatives so it keeps wo=
rking on this commit and allow bisect in future if need.=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b2e3e104d539204de8fa0ce--
