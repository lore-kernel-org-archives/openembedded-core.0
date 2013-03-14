Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UGGQL-0003Af-4X
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 23:14:57 +0100
Received: by mail-la0-f53.google.com with SMTP id fr10so3039657lab.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 14:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=M0UlMREMoLB7ZrnGRYLyaLn01GR5tJ8Nvk0sYkzz4O4=;
	b=GF8ShJeWTr+09xtSVqnHelcZy7sVeThRDHg4BGWgbz6COaqgsk9ymnbmYq3buGABNG
	k/GO0q4IqXE3RjNHQe3seXpN8mPrLYG6XGy8QjUBKks14oopfIyilYU+ArH7ZcJa6wYL
	1PGMmRzKDqnvWJQ+S2oIEqleosP5RjaBr8N+1mVxKKEVyV+fbGhQ7RHRw3ocIWj7GSwv
	f78sEWY68KVWV7JKIYEP2JzixjxO86/3j9utRYrdDBwNykEjjknfOtCPmuuVty7haTcW
	9elxmgu53w4DlNc0aq672apid6AARYcMJCHhGfLr4SkajfVlohMGOWzGyW8pBXsZ+jdM
	SsvQ==
X-Received: by 10.152.113.34 with SMTP id iv2mr3367722lab.20.1363298294107;
	Thu, 14 Mar 2013 14:58:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.25.195 with HTTP; Thu, 14 Mar 2013 14:57:54 -0700 (PDT)
In-Reply-To: <1363295794-26683-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1363295794-26683-1-git-send-email-marcin.juszkiewicz@linaro.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 14 Mar 2013 14:57:54 -0700
X-Google-Sender-Auth: qWswKCDuADsAbh2YP0GPM9ZXGOU
Message-ID: <CABcZANniMsvUOc-dvTWomu-OthFBx3ZngumnfDWX9JfEZh+OwA@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss-myhostname: add 0.3 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 22:15:01 -0000
Content-Type: multipart/alternative; boundary=f46d040714338b17ae04d7e99e5d

--f46d040714338b17ae04d7e99e5d
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 14, 2013 at 2:16 PM, Marcin Juszkiewicz <
marcin.juszkiewicz@linaro.org> wrote:

> Meta-linaro layer had own netbase.bbappend which took care of adding
> MACHINE name to /etc/hosts to get it resolvable.
>
> Koen Kooi pointed to nss-myhostname as better solution. Tested, works
> fine so I add it for other users.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>

Nice.
-- 
Christopher Larson

--f46d040714338b17ae04d7e99e5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Mar 14, 2013 at 2:16 PM, Marcin Juszkiewicz <span dir=3D"ltr">&lt;<=
a href=3D"mailto:marcin.juszkiewicz@linaro.org" target=3D"_blank">marcin.ju=
szkiewicz@linaro.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":13d">Meta-linaro layer had own n=
etbase.bbappend which took care of adding<br>
MACHINE name to /etc/hosts to get it resolvable.<br>
<br>
Koen Kooi pointed to nss-myhostname as better solution. Tested, works<br>
fine so I add it for other users.<br>
<br>
Signed-off-by: Marcin Juszkiewicz &lt;<a href=3D"mailto:marcin.juszkiewicz@=
linaro.org">marcin.juszkiewicz@linaro.org</a>&gt;</div></blockquote></div><=
br>Nice.<br>-- <br>Christopher Larson</div></div>

--f46d040714338b17ae04d7e99e5d--
