Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4613C6A9E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:01:16 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h2so6612694oag.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=7o9Divi5PvLl4c1DPEyDUAPcI/deGAnIZ4pJEHlyIqA=;
	b=h+NfQjij/ojy5WVrFTEuaCC5+DgIPbrWGhNDWgrFz8d9vKGsopciYbyi45ImZBA5Ez
	mq1Sdqp74VHcAwRnsnFDFs2a3vjg1iywX6ntiYVBm3y4cXSKCZsDpo2mmL2TPy07byuZ
	UilsK/C9OKdAy4NXpvaQJUY40K/NOiRPI/NOUX4e7+Y8B3MU41Bzu5GPyn4j8oxPs1F3
	pCvHPCzYGoKuF7HYMtokYt2DHvVLqIDRFpvqAD2yaIbZygRTczYXIDEHo0Lr6gxq+src
	ouaFtwaQ4PUXJe30UBkKtFh35XreRZebhjCzLzBXc9vF4eSJmN4FsZjXJ4fe/7GXHihl
	NNOg==
MIME-Version: 1.0
X-Received: by 10.182.236.104 with SMTP id ut8mr9600063obc.75.1370898077265;
	Mon, 10 Jun 2013 14:01:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 14:01:17 -0700 (PDT)
In-Reply-To: <25d34eb31411dbe5f5d050878591ce260d9bb240.1370896990.git.chris_larson@mentor.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
	<25d34eb31411dbe5f5d050878591ce260d9bb240.1370896990.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 18:01:17 -0300
X-Google-Sender-Auth: 7p4ngzMzlQFsxsZbA7O5VXDcZcA
Message-ID: <CAP9ODKqUr5NN3vW15B3APsvptSt668rTppcXUVFdSq28z23OBQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] packagegroup-base-vfat: include dosfsprogs
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
X-List-Received-Date: Mon, 10 Jun 2013 21:01:16 -0000
Content-Type: multipart/alternative; boundary=001a11c31838eb380304ded31491

--001a11c31838eb380304ded31491
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:47 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> The ext2 group includes e2fsprogs, so this is consistent and should be
> appropriate, I think.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>


Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c31838eb380304ded31491
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 5:47 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: Christopher Larson &lt;<a href=3D"mailto:chris_larso=
n@mentor.com">chris_larson@mentor.com</a>&gt;<br>

<br>
The ext2 group includes e2fsprogs, so this is consistent and should be<br>
appropriate, I think.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></blockquote><div><br></div><div><=
br class=3D"">Reviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@oss=
ystems.com.br">otavio@ossystems.com.br</a>&gt;</div>
<div><br></div></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://w=
ww.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =
=A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=3D"_blank">h=
ttp://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--001a11c31838eb380304ded31491--
