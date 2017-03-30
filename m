Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9C9A277D2E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:41:02 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id z204so61548361vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uKgJ4kNqniaprGt550gxbE3aZmjDb5BZXuwXYe//KJc=;
	b=lodtfVh5Jytk8nx6D/ykeH+1okCnmS0QiK7smjGNflHcOFjCqna2j3a8je3T6eQlG8
	nQlUpCzM3MHJ8lHB6MRcc6YrxbVxh1LRyhhRwisOltKkM+GdKg0OosO/s84LWwkSSf8Y
	iBH9Ep+zyrFJIyVNJqfb1+Z2eHCsDEQzdE7wxPdKTtbwDpfI2C1D3ifEDsl9cCG/bOcv
	weU+NfEPJ5YsywfOvIuSZOsYD3bM4tZKjr+3L39WyDI/upej3TWZ8cykAwuqIBy1yLng
	9yvq2DQ7ECCVlqZG272a+GlYCxqcW536W31/WLBYMhaI1gIx6vrndpxns2oSPIgXFzAZ
	9FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uKgJ4kNqniaprGt550gxbE3aZmjDb5BZXuwXYe//KJc=;
	b=ol6gGf+C0C2FwMabFP/hJBlxIxST8O02wGuORZPB/PNMLndEanPk369juwzZ/jA/Qz
	Or2lbCtxdmHT1sfJQa8KzHcB2K9Zrhsgw88Z4qi8ESqlMIdGjhJYiKIIk3rMQ8LXTINH
	IBcmX59Ow+UQjJwAoW8FfJ9J/sNjly5m8KRMR2TjpgYBS2hzccTrlZBNz3msmzc5x7sY
	/k7rCP+HF1KqYvwm/qk/KONw+b34ugC/x/7rcxorqiuonrK2+F7X35l9UY5RwJuBdL4M
	bp0qd18h7ryLudnSZxjbElori+L+O6F7EaYq/KMJRwpJzK7/3KtEBqbjop4nsDwnYKkn
	zmJg==
X-Gm-Message-State: AFeK/H3kmMyVABaKPhq/Odw+HZX31fx7LhJqw58zgYtmqibglFSRnE4tcpLs7iugc7B5zzE0zopAcy2PT34TtA==
X-Received: by 10.159.32.104 with SMTP id 95mr364745uam.31.1490892063156; Thu,
	30 Mar 2017 09:41:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.149.92 with HTTP; Thu, 30 Mar 2017 09:41:02 -0700 (PDT)
In-Reply-To: <1490888052.13980.356.camel@linuxfoundation.org>
References: <1490860656-27448-1-git-send-email-liu.ming50@gmail.com>
	<1490888052.13980.356.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 30 Mar 2017 18:41:02 +0200
Message-ID: <CALatG=6_LxYPfAy5LAwSBGEzLyy434mYTTuCRdqQSo6AVJTBzg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: define REAL_MULTIMACH_TARGET_SYS/SDKTARGETSYSROOT in bitbake.conf
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
X-List-Received-Date: Thu, 30 Mar 2017 16:41:04 -0000
Content-Type: multipart/alternative; boundary=94eb2c03f428d2ae25054bf55bd3

--94eb2c03f428d2ae25054bf55bd3
Content-Type: text/plain; charset=UTF-8

Hi, Richard:

No, it's not about multilib, but just some special requirement from my
company, we have 2 IMX5 machines and we want to separate the sdk install
path for them, so it's decided we append the ${MACHINE} to
REAL_MULTIMACH_TARGET_SYS, but in current poky, to achieve it, I need
extend two recipes, meta-environment.bbappend and populate_sdk_base
inheritor, since I can not override it in a conf file, otherwise some other
"REAL_MULTIMACH_TARGET_SYS = "none"" setting will be overriden as well.

BTW, do you mean this patch: "multilib_header: Update wrapper to handle arm
32/64 bit"?

//Ming Liu


2017-03-30 17:34 GMT+02:00 Richard Purdie <
richard.purdie@linuxfoundation.org>:

> On Thu, 2017-03-30 at 09:57 +0200, liu.ming50@gmail.com wrote:
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > REAL_MULTIMACH_TARGET_SYS is being defined and referred in several
> > recipes, which is redundant and not easy to be overriden, and
> > SDKTARGETSYSROOT is also defined in two recipes.
> >
> > So move their definitions to bitbake.conf.
>
> I have been wondering why you're needing to customise
> REAL_MULTIMACH_TARGET_SYS? Are you having trouble with arm multilibs?
> If so, the patches I just sent out might be useful...
>
> Cheers,
>
> Richard
>

--94eb2c03f428d2ae25054bf55bd3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, Richard:</div><div><br></div><div>No, it&#39;s no=
t about multilib, but just some special requirement from my company, we hav=
e 2 IMX5 machines and we want to separate the sdk install path for them, so=
 it&#39;s decided we append the ${MACHINE} to REAL_MULTIMACH_TARGET_SYS, bu=
t in current poky, to achieve it, I need extend two recipes, meta-environme=
nt.bbappend and populate_sdk_base inheritor, since I can not override it in=
 a conf file, otherwise some other &quot;REAL_MULTIMACH_TARGET_SYS =3D &quo=
t;none&quot;&quot; setting will be overriden as well.</div><div><br></div><=
div>BTW, do you mean this patch: &quot;multilib_header: Update wrapper to h=
andle arm 32/64 bit&quot;?</div><div><br></div><div>//Ming Liu</div><div><b=
r></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">201=
7-03-30 17:34 GMT+02:00 Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@li=
nuxfoundation.org</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">On Thu, 2017-03-30 at 09:57 +0200, <a href=3D"mailto:liu.ming50@g=
mail.com">liu.ming50@gmail.com</a> wrote:<br>
</span><span class=3D"">&gt; From: Ming Liu &lt;<a href=3D"mailto:peter.x.l=
iu@external.atlascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt=
;<br>
&gt;<br>
&gt; REAL_MULTIMACH_TARGET_SYS is being defined and referred in several<br>
&gt; recipes, which is redundant and not easy to be overriden, and<br>
&gt; SDKTARGETSYSROOT is also defined in two recipes.<br>
&gt;<br>
&gt; So move their definitions to bitbake.conf.<br>
<br>
</span>I have been wondering why you&#39;re needing to customise=C2=A0<br>
REAL_MULTIMACH_TARGET_SYS? Are you having trouble with arm multilibs?<br>
If so, the patches I just sent out might be useful...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--94eb2c03f428d2ae25054bf55bd3--
