Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51350.1795430833313707082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 02:47:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pPlAhZfJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-921318b2eb8so45279176d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 02:47:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430832; cv=none;
        d=google.com; s=arc-20260327;
        b=n28JzNmWwB2qLB+TDzPSdCFEC7340okTfXlsvA5Ua/NkKdmxtxrn211fK1f4xeeZg8
         JkP9MxOsySS6zICkFhKr4CWd9JmqUym8Fq587a0m1ANSIx96alcmUj10wuGY9IgE25SG
         O/PcAkFWGchE+N6p1i1/GpA6UOwGSO6+e69HnDBhleS+qXdairmO9dPHIClzR66pFKAl
         JvEsjmVPcCH9AZhEEzi1D93GYr84CaxGMTpJs/rAr8cEsb2Rx5H6SNgufmEFQAQy4QSN
         BsUDxhQXlJrZJHmn3JD0KswKdnHLS15slkqFONt6mUUtJoQTlyZqF4+2DZw56wwbktk3
         vkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ty0r1d20anDNOoJXPQF+aE+wIOPCWqzGpaV8HE6MwVo=;
        fh=aIQIyV84NNnjzkudt+L7EuzF7ZyGtpkmes4hwapSGkE=;
        b=gqnugc3iJi8t1yy//E0JVGjFELeIQemM3b8yxqwEAoiVLNIovaroME4Y1EjAunqhd/
         8v1Rgba0cHYdfpJnfplD2JvLFND33rkY8O4hOpwOdFVL2/qXEdpmw5XxpGuCHj3Kj9nd
         nYnimZ50hzpr0uGRJT14pgQkQiIeJSrtt8Uh9N4O/KtCiG97kdKu4vHLzr1aWTz6dDxF
         X+KCX39ntjO7W/tqMWO9mTyne31dzRDg5K7Z85yjR8tP+uxIG+/GgvLA85BDyTFUTlmc
         twkaQfjdhT2h3aHap+kYrVqEt618sBR7nIu9/1RNnzqFUOJ/0vxi7IS5MQoHKiLzdQDz
         JHRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430832; x=1796035632; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ty0r1d20anDNOoJXPQF+aE+wIOPCWqzGpaV8HE6MwVo=;
        b=pPlAhZfJkBrkcStcB+rsF3JCnDTmZ4JweNjkOR2VtltAMqh0evYtJmuz6ln0Xb5pw1
         CrOpF2fSdKr0qQKvF5aSN+tmrny/l5j9T3RlYKJtPx7TjlLf9udhvXCUJq6uQUSUNYro
         BjFUs9n0chUXcqboNdLcui2jtKY22QOAyupD3jtcQ0bBotoiaBhCo+9yqXuitWMSec3O
         5tNFZniDI3ta69B0Bnbs0qjJvXxUPJodXiAPoPZnZoGGAcBZg16bKLIN1brFbCzWkpBl
         nebt6r3634JMwjeQBYdTVOju210xEUTz9L857zdPGjmSztV3PvXIi6k83ezYWJA7Ax6g
         i81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430832; x=1796035632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ty0r1d20anDNOoJXPQF+aE+wIOPCWqzGpaV8HE6MwVo=;
        b=2hb0+B7HeC5Q7IiWkSUxU2rLo0dnOFBTdfi/H+l/7wuA9pXivZAlPTXfv/nMfiAMER
         D16oknCBUNX4su+Ck974Jn6yi9ohYIoSDMTMrkKay9lM9gDOJb/Q4FwXPpAvWFwqlTko
         RxGCp7DORpQjrShjM9y7j7lFlhVUuOyyIBdFTCaGurOEm8aS3exUGJGSRxInxH9OVtZF
         lMLZIGMX7e7SJbRTV2TGoulDjmVfix6d6abb0M/V6F0YbW74jkylw1n6b/Gjm1/PPNxy
         nVxFVivqolowxi9Mn5WJ0dLv+95vxErd72x6VKIGL1yi41egQ801U6/zTF8L8dHWt02Y
         BKog==
X-Gm-Message-State: APuU4Z+RNuhb1pc7MD0EcASj9oYVi0w9/VWEHX0drOfAMf4zI/KIGBBD
	ww0ZCu9iI18JvQU4vZd2/xXcsJzvIzxBQ9rQLPqbe+gV7RjAnbrh3x8OoVGIDr5X5Pb8HtFp1MS
	HIkcdqlChnCMnQARYBd6seVsmcq+Dqgc=
X-Gm-Gg: AZFdTZcvOpfm6V0jiW1nFqtSuqZaJlKNgOKYcDx+1wdVGChRL5H78CaXWk3KbaxG2Cj
	Nl9ZMsaRiYuNOptlBqI7ZN6E3rGB3hOftU8x6DaOXI/hRA7ivjzuy1wFbU8O1EdPsGHPSQcsBfL
	PNDKNV64c7NvUkk02EZxls+Ga8uELuO51gow/XmZOoXjpsqVHJUkhYY4DzW/vqjChgMxNfL5do5
	TIwPVD2oRvT8yI5422Jd1m98AzcAWwJAxVoO32CKox/uFcikKN24xwG98CUDlo+GSw2QbiD695p
	3/hKpYhMVLqU0anZb6ZCR7833skxD4vOe5ZM+R9MIMKvFVHzhLazF9F0v1I127FEwNBXab4//gb
	tpzXVLqvGvqCm75oq1TqxCcakw/aRXyTNM2OuAOMc7dDZ6rCjQxxHwTq6XVdX3VgDZqXksIE=
X-Received: by 2002:a05:6214:4197:b0:91e:9b17:2be9 with SMTP id
 6a1803df08f44-92134a8c2cemr188708656d6.36.1795430832164; Mon, 23 Nov 2026
 02:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20261120121359.11514-1-UpStream_IP-SK@bmwtechworks.in>
In-Reply-To: <20261120121359.11514-1-UpStream_IP-SK@bmwtechworks.in>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Nov 2026 11:47:02 +0100
X-Gm-Features: Aa3M54r-qRVLytOmO9EYu9g66ilO1MaPyfYXV8VqgfnVW9uuCSAFxz01I7bHbs4
Message-ID: <CANNYZj8CVnY15dz4n=PDDkNWWTxB72uyhh1fX3pJCO34pcsotA@mail.gmail.com>
Subject: Re: [oe-core][wrynose][PATCH] gettext: Fix falsely flagged static
 linking issue
To: UpStream_IP-SK@bmwtechworks.in
Cc: openembedded-core@lists.openembedded.org, 
	Sana Kazi <Kazi.S@bmwtechworks.in>
Content-Type: multipart/alternative; boundary="000000000000f853570660ef507f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 10:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250897

--000000000000f853570660ef507f
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 17:16, Sana Kazi via openembedded-core
<UpStream_IP-SK=bmwtechworks.in@lists.openembedded.org> wrote:

> touch <file> just updates a file's "last modified" time
> to right now, so that when make runs it knows that those
> files are not stale and need not run config.status --recheck
> which throws the false positive
>
> +do_configure:append() {
> +    touch "${S}/gettext-runtime/intl/aclocal.m4"
> +    touch "${S}/gettext-runtime/intl/configure"
> +    touch "${S}/gettext-runtime/intl/config.h.in"
> +    touch "${S}/gettext-runtime/intl/Makefile.in"
> +    touch "${B}/gettext-runtime/intl/config.status"
> +    touch "${B}/gettext-runtime/intl/config.h"
> +    touch "${B}/gettext-runtime/intl/Makefile"
> +}


I read the commit message several times and I still don't understand the
problem. What is the specific issue you have that this fixes? Can we find a
better fix than forcing timestamps after configuration? Is some file
supposed to be deleted instead? Should you talk to upstream first about it?

Alex

--000000000000f853570660ef507f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 20 Nov 2026 at 17:16, Sana Kazi v=
ia openembedded-core &lt;UpStream_IP-SK=3D<a href=3D"mailto:bmwtechworks.in=
@lists.openembedded.org">bmwtechworks.in@lists.openembedded.org</a>&gt; wro=
te:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
touch &lt;file&gt; just updates a file&#39;s &quot;last modified&quot; time=
<br>
to right now, so that when make runs it knows that those<br>
files are not stale and need not run config.status --recheck<br>
which throws the false positive<br><br>
+do_configure:append() {<br>
+=C2=A0 =C2=A0 touch &quot;${S}/gettext-runtime/intl/aclocal.m4&quot;<br>
+=C2=A0 =C2=A0 touch &quot;${S}/gettext-runtime/intl/configure&quot;<br>
+=C2=A0 =C2=A0 touch &quot;${S}/gettext-runtime/intl/<a href=3D"http://conf=
ig.h.in" rel=3D"noreferrer" target=3D"_blank">config.h.in</a>&quot;<br>
+=C2=A0 =C2=A0 touch &quot;${S}/gettext-runtime/intl/Makefile.in&quot;<br>
+=C2=A0 =C2=A0 touch &quot;${B}/gettext-runtime/intl/config.status&quot;<br=
>
+=C2=A0 =C2=A0 touch &quot;${B}/gettext-runtime/intl/config.h&quot;<br>
+=C2=A0 =C2=A0 touch &quot;${B}/gettext-runtime/intl/Makefile&quot;<br>
+}</blockquote><div><br></div><div>I read the commit message several times =
and I still don&#39;t understand the problem. What is the specific issue yo=
u have that this fixes? Can we find a better fix than forcing timestamps af=
ter configuration? Is some file supposed to be deleted instead? Should you =
talk to upstream first about it?=C2=A0</div><div><br></div><div>Alex</div><=
/div></div>

--000000000000f853570660ef507f--
