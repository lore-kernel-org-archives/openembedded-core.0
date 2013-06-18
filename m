Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id D6B8A6023E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:24:50 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ht10so2724007vcb.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 01:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=hvUPIqWa5+fIsqtfL59YUP+KGVxQW25QcXUVTCWpkqs=;
	b=O67XX/bTVgiIZjyKrrjq6QQnWG8O6yw8wFpjxmaA9lmpgpY2JFLIJM1Dt3CX3ZnzaX
	8EY+WZL/ayY4tFi/pZ9B7+fWaWiko6KjPISL8fWMbt7DmcJN41Stlu5LFSySKnYGaJqk
	nuYbZdHt8LHAc6UqYcPDgU8SRHESpYjj802Mz4KsfPyUihchTJJZT6yxfobW/Kc612lT
	8zSzHvG5IUWQVbuQRWZRVLPXW63PdsOiNnps8BmEpx8QwsbraQKf7bzQbbKWZFnXNFvA
	WJNdpxB1inyJLhyQnFOkf/rfKiy4Vdbyf7bAPexDmVx8v6wFv6d4OSN3pPLoWqEsBjCO
	sLsw==
MIME-Version: 1.0
X-Received: by 10.220.78.212 with SMTP id m20mr5868569vck.46.1371543890913;
	Tue, 18 Jun 2013 01:24:50 -0700 (PDT)
Received: by 10.220.13.144 with HTTP; Tue, 18 Jun 2013 01:24:50 -0700 (PDT)
In-Reply-To: <b57b85f69322501fb617a01e625734cda1088b5e.1371539741.git.rongqing.li@windriver.com>
References: <cover.1371539741.git.rongqing.li@windriver.com>
	<b57b85f69322501fb617a01e625734cda1088b5e.1371539741.git.rongqing.li@windriver.com>
Date: Tue, 18 Jun 2013 09:24:50 +0100
Message-ID: <CAJTo0LYbxL2ONThRs8FCrT-Yfyp0n6Zdji02-Oa+ShCqfz2gSg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
X-Gm-Message-State: ALoCoQljJF/UGh/1LIXsVrD/giRIRfoIv30eneSbGGrrQDeSQsMYtfLb3VyoZN7uwFAxRezIqLq3
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] base-files: create /usr/lib/locale dir
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
X-List-Received-Date: Tue, 18 Jun 2013 08:24:51 -0000
Content-Type: multipart/alternative; boundary=047d7b343d56697d3e04df6972d8

--047d7b343d56697d3e04df6972d8
Content-Type: text/plain; charset=UTF-8

On Tuesday, 18 June 2013, wrote:

> -           ${libdir} ${sbindir} ${datadir} \
> +           ${libdir} /usr/lib/locale ${sbindir} ${datadir} \


What Phil said, but also please don't hard-code paths - the rest of the
variable uses ${libdir} for a reason.

Ross

--047d7b343d56697d3e04df6972d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, 18 June 2013,   wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir} ${sbindir} ${datadir} \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir} /usr/lib/locale ${sbindir} $=
{datadir} \</blockquote><div><br></div><div>What Phil said, but also please=
 don&#39;t hard-code paths - the rest of the variable uses ${libdir} for a =
reason.</div><div><br>
Ross</div>

--047d7b343d56697d3e04df6972d8--
