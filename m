Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id F39D477E1B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 23:00:01 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id p68so59287804qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 16:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sgoq/P0nCYxFZDWjhJPSThYT8f3XbliXBBC20iFq7MY=;
	b=bC/X+K6gvUU6qubofH7F2WkmV/KB6vX85ZEK7N+xtsM6igyeU05i4PyFv3GMvrBuiP
	iBbVEiIH5rC1hEipf4lROJ+ADFitcaheITKtXTruUKqn1sZFl1NlEnht1neOFYRxgclo
	2oS3HDL73z8h0hVL/puKESa509NFK9KN93J831ooefz5cyPMVl8jGeWqy3Ez5vnwXGQN
	YuYidtjgkKt+w2T9QmIveTUjHbDem+QDY3Z52qAboIg/J+WsaxouQpBRIlxQh66EvAxU
	hIvT2FN8kwAOcX8LEOMy2jC+tiFZ9nHJFnz9jwBthA4X31qLlbcWnXtU+hnGOoYlAudS
	OnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sgoq/P0nCYxFZDWjhJPSThYT8f3XbliXBBC20iFq7MY=;
	b=fsM9DStEGUTOHDsBbk4MYirfsTp0mYlHSmXUKjiGjypVv9hRpic9N07YQVlMKHxk0o
	YCLj+JBrPxrQ2mqKQRKUcwqrwibWWn9zXYzynMjM2nC6bNWOup6v3Ksssx+cQM8/6urB
	nhRrlyhnDw4j2eRkWQVWIa5rNX0p6bnY1wcK/Fwjz7gJwuYYACFB7/JmlXYOzCM+WKO8
	tRYdUCh7Agua38UP5CI87hz7kaJGp/i2bf/f4cJmV9MEEr15Kj3WPVH7sIACt4jZM0IA
	3AqFl7WKA/HXtIuZi2ZNHN9i0BsALJ8cBjM8ZRnCJYHVCl2QQaQNqrhDWuhrfzw7dTVN
	TgdA==
X-Gm-Message-State: AN3rC/5bZY4RH9JRDtqCFLJya6QvCxvmsa0W0aMVkwWHcZPypOVM9QBO
	IbOT/K0PPnFgjsr8kQtVP3vjejHdVbLL
X-Received: by 10.55.212.220 with SMTP id s89mr5082681qks.121.1492124402921;
	Thu, 13 Apr 2017 16:00:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 13 Apr 2017 15:59:42 -0700 (PDT)
In-Reply-To: <1492060363-2607-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1492060363-2607-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Apr 2017 23:59:42 +0100
Message-ID: <CAJTo0Lbxobv-vRWwXLPxm-E67k_8B-VshdmBKSdE1Awqa-Fk6A@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] byacc: 20161202 -> 20170201
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
X-List-Received-Date: Thu, 13 Apr 2017 23:00:02 -0000
Content-Type: multipart/alternative; boundary=001a1146cbd4ff4799054d14489c

--001a1146cbd4ff4799054d14489c
Content-Type: text/plain; charset=UTF-8

On 13 April 2017 at 06:12, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> -LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=
> 74533d32ffd38bca4cbf1f1305f8bc60"
> +LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=
> 9176bfb16dab43ebcb8e50d9ee9550b6"
>

Always explain why the license checksum needed changing.

Ross

--001a1146cbd4ff4799054d14489c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2017 at 06:12, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mail=
to:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ek"=
 class=3D"a3s aXjCH m15b65bb200a084d2">-LIC_FILES_CHKSUM =3D &quot;file://p=
ackage/debian/<wbr>copyright;md5=3D<wbr>74533d32ffd38bca4cbf1f1305f8bc<wbr>=
60&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://package/debian/<wbr>copyright;md5=3D<wbr=
>9176bfb16dab43ebcb8e50d9ee9550<wbr>b6&quot;<br></div></blockquote><div><br=
></div><div>Always explain why the license checksum needed changing.</div><=
div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1146cbd4ff4799054d14489c--
