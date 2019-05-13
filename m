Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 045337DFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 16:02:08 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t1so6432463qtc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dwoI9oq4HbwXI/PznTMx5c+48lkk1sYrKV0wLJQAJIE=;
	b=KYcKUhSOrENaCQsCnQKdvU439ezocYkLJIO6tosmIXmn4DD/KDa/kcP8nJHTFeJMwo
	MmJ3nT8EEE6OM2y6iACBQUGHewxdwiEuo3dWPJPqjjE4xS+Tbcw+qA215SfsOS6//Lvy
	7NEkElEtE/v4W+zOlIEzbOgtU3Xb3Z5C4O+/0C4Fb3+fzHmTxdBIwrXwQyiTigjidgna
	87TyngExNDonRXLa3qxqjXLlmSl5pnyARC2EawKWpemjCVrY5+f+nWjd94Cre9ypbRY/
	fzZ+eyZKTTgrS1I51XN1bFRkaJXpgi5s3jLMku6bGEj5TCdK8RC1fvElX/T/qevOCHAX
	MCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dwoI9oq4HbwXI/PznTMx5c+48lkk1sYrKV0wLJQAJIE=;
	b=gT2hmlTICIb9u0uT4FCwsYHNbu2ksNO5GZPmbJuyNFFG18R6Z+o62fRxdlb8Q4ItE/
	1imcYM6tJWPjBhyKhw9tdYc5S7GiW12CN1ZYSJwEDnwi/YHLBuF791+UYceer/ImuT4D
	JYdvT3usn1r9Z2IX7gTpdjBTzjoc5VN7iTh/VGF9A5y0ZOY9rCOJ5uw+47+T/cPISHY9
	FJmW9y3anvbTWGghpmYvN6HJXSnIMzd06epgsPkY3AjTGi4pePZRPjp9y3pDyaH9URUR
	4KXy7fGhTVKl7m6otTW9vonK143ZGSfGfni9cto1pDK6aVOJ3YfS4z+Z6XxL9dC7lq+F
	mEBA==
X-Gm-Message-State: APjAAAX62Uo5/brB638VjKLcYlAA3po3Rx6jDwByVy4oOOenpAoXf+gB
	eF/ZhzJANep6U/Hn7f3VJbR9EtoU6pSBwN28zwY=
X-Google-Smtp-Source: APXvYqz9DifUI6/8ddfZ5A+99MIUeitOvVl00K3SVN2+zsg5FpVXt5xiWCCuissrter200UjFdwQUBHUYBN2z++nf6Y=
X-Received: by 2002:a0c:a361:: with SMTP id u88mr22928592qvu.224.1557763329764;
	Mon, 13 May 2019 09:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
	<CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
	<CAJTo0LZ=yDqyaZYv0PEOokt=6prPMa_gA=hnsYuNRA1oqw9TUQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZ=yDqyaZYv0PEOokt=6prPMa_gA=hnsYuNRA1oqw9TUQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 09:01:59 -0700
Message-ID: <CAMKF1sorBuvDn0kmuPfn24t=vnM3QT_rT358REmcZkmZZS1T-A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Mon, 13 May 2019 16:02:09 -0000
Content-Type: multipart/alternative; boundary="000000000000ea31fb0588c70935"

--000000000000ea31fb0588c70935
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2019 at 9:00 AM Burton, Ross <ross.burton@intel.com> wrote:

> On Mon, 13 May 2019 at 08:55, Khem Raj <raj.khem@gmail.com> wrote:
> > While I like this change I also worry if we are leaving out any
> significant x86 implementation out there in embedded space x86-64 is
> relatively newer compared to 32 bit which was long stable
>
> core2duo isn't exactly a modern chipset though, first released in
> 2006.  Does anyone *know* of any significant 32-bit x86 deployments
> which are using significantly older hardware?
>

If intel bsp folks are okay with this then let=E2=80=99s go for it

>
> Ross
>

--000000000000ea31fb0588c70935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 13, 2019 at 9:00 AM Burton, Ross &lt;<a href=3D=
"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Mon, 13 May 2019 at 08:55, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com=
</a>&gt; wrote:<br>
&gt; While I like this change I also worry if we are leaving out any signif=
icant x86 implementation out there in embedded space x86-64 is relatively n=
ewer compared to 32 bit which was long stable<br>
<br>
core2duo isn&#39;t exactly a modern chipset though, first released in<br>
2006.=C2=A0 Does anyone *know* of any significant 32-bit x86 deployments<br=
>
which are using significantly older hardware?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">If intel bsp fol=
ks are okay with this then let=E2=80=99s go for it=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><br>
Ross<br>
</blockquote></div></div>

--000000000000ea31fb0588c70935--
