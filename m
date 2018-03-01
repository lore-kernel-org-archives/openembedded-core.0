Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7473078818
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 12:19:55 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id w63so7395986ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 04:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6hfYDoZXp2hxMsWymtIznjP8tQ0sf1ugq8vURdl/lXY=;
	b=nChb2QhCn//a95PxUQ7Q8Ck5SHYMX3WDuRJ5P73ZSMMmnodEfaOqErqpBNZLU/0v9h
	S5dSjcgtSWeOpZIc59au5Wt2R8uzein6gHb1bU7zcBktpUoqwJAieTnV+IJbQ4uzO6A+
	yLcBh5VcPewQ5gopVohx1ymGPqVqJXs4E1F+WMWy7O4Emc6bnbqfdtsg5o4iEm68rZJY
	URuMK7miXLqLe1xCMbCe8A7WxC81OtBqQAHN2HCEKHrGswoFIPQ4G+cD5ERQQfPCB/NU
	1KruTrSj2oDmptVcmvV5137IgnudbKeSrRXHzzonhBGr1ug1P2hi5IgL5oUg+B+a8S2P
	ptRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6hfYDoZXp2hxMsWymtIznjP8tQ0sf1ugq8vURdl/lXY=;
	b=WkdxgKwFoYCYllSGxVrpI7G+TENOIo07aae1g9ZW0hjxzLC3p60YzM8MfsnJDrgMR1
	d42NBaMrO75mMwn8QZ6bUgmnkSvPH5+psV4HAAk1eHCLMBQMfwElCkFmlhGGNBmY63uU
	3uhxIjAm8yuiS8a7qFzIF1XiY3/0rtXKs/4TAuMTwK4MkVLSAjCkeVKL4Pc7z6mHESxz
	pCYL0VaeUh00+yuSMQoCdewsaI2zaeeZ61fqCBl7BAflxqAOlEGqvV/ol3RVktDtIxcv
	r9HrGn99hqiIWdpEC0tNLf4mVVPG8kpdluxySO4NdiYlC1IZ+hcNYLQ/JgrqmSdjCWZq
	2arA==
X-Gm-Message-State: APf1xPBlU9oPCeiY5JyQmumXlvTrrTb3/SDPcWua/bXdOlaxgjvvz0zq
	kNY2SqnsS6nFY14WP4cEPkW8gkKGvYg6XJxs+QlfXA==
X-Google-Smtp-Source: AG47ELszDNcV1lIK888CBXgkL8KxKcugbPqK3HZDCzNyVE6IgpdkHauwnRIoMW/8nhuYNr9q6wjakqLRs+dobqd+Bxs=
X-Received: by 10.36.82.84 with SMTP id d81mr2248785itb.34.1519906796777; Thu,
	01 Mar 2018 04:19:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 1 Mar 2018 04:19:36 -0800 (PST)
In-Reply-To: <660e2c8a-8f4d-40af-443b-63d016a7d3fc@windriver.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
	<17b1cd0eb9a731bdf5049a60bb8efd00614f8edd.1519797175.git.Qi.Chen@windriver.com>
	<CAJTo0LZ3d68OW-6t4wTreW5jeAGZaPMeXwvfOeufcqYVZRBzvA@mail.gmail.com>
	<660e2c8a-8f4d-40af-443b-63d016a7d3fc@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Mar 2018 12:19:36 +0000
Message-ID: <CAJTo0LZgTxUwn+YBvpWCjo=6wpmhkN6zS+bYGiGQf8Q5meumtw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] systemd: upgrade to 236
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
X-List-Received-Date: Thu, 01 Mar 2018 12:19:55 -0000
Content-Type: multipart/alternative; boundary="001a11449248b6e069056658e050"

--001a11449248b6e069056658e050
Content-Type: text/plain; charset="UTF-8"

>
> The PACKAGECONFIG 'manpages' is now renamed to 'man'. I forgot to mention
> this in commit message.
> I renamed it to 'man' because in meson_options.txt, we have:
> option('man', type : 'combo', choices : ['auto', 'true', 'false'],
>        description : 'build and install man pages')


For compatibility with people changing the value can we keep the
PACKAGECONFIG as manpages please.

Ross

--001a11449248b6e069056658e050
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex"><span style=3D"font-size:12.8000001907348=
63px">The PACKAGECONFIG &#39;manpages&#39; is now renamed to &#39;man&#39;.=
 I forgot to mention this in commit message.</span><br style=3D"font-size:1=
2.800000190734863px"><span style=3D"font-size:12.800000190734863px">I renam=
ed it to &#39;man&#39; because in meson_options.txt, we have:<br></span><sp=
an style=3D"font-size:12.800000190734863px">option(&#39;man&#39;, type : &#=
39;combo&#39;, choices : [&#39;auto&#39;, &#39;true&#39;, &#39;false&#39;],=
<br></span><span style=3D"font-size:12.800000190734863px">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 description : &#39;build and install man pages&#39;)<=
/span></blockquote><div><br></div><div>For compatibility with people changi=
ng the value can we keep the PACKAGECONFIG as manpages please.</div><div><b=
r></div><div>Ross=C2=A0</div></div>

--001a11449248b6e069056658e050--
