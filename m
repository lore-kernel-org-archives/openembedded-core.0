Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7B317731D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 13:51:13 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id y8so82268496igp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 05:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xRJOn69pdCkDq/qBN8P0GYhOdRDDn+FJIBFbY6j0TWQ=;
	b=LSiZn+J37KbAIJh0GvzEUBQ8+CGRGXHWJFXqcks7Q/Uf8yOhO2AiPY4bKPTMXSYKNv
	eKA37IJXWyE7EZv4sSPzmgWvMHXd3CzOplgbdVBlJJRirqDqCPjiorWN+0h8JRF/l6x2
	PAQTdhQaHSYiRMxkNUCeDerpBxTGV3FY1foXrdCs40Zwf9i5hZIFaH3JfpHuevGqvu9h
	lhWChFuFAF/hzd4dGQ1QGEvTWf0mulRPdZpvM9zo4N9+BtZeMhvXpvh4C8LqrUmAcaa+
	O4vmWqtEfcOig1dbx/oUqwagBxiWIgoZZIUArSdm3K11GGSYIcO+GGe5+qGcSzoXnK+k
	qE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xRJOn69pdCkDq/qBN8P0GYhOdRDDn+FJIBFbY6j0TWQ=;
	b=j1wmDplUuFdXaoYqbpAw1/h2MQ5DDNmSq6WwrVzYskTR83gzV17hXu0I8wmUlGH92k
	miPIz1Osm+uUObV/05/PN7kzm+EkJ8RRU3g4Zn5izL9vm8ZhSdapc2yZ/osGkicCrQOh
	7pdEnnP9iGQhZJHZBYYT64Rm8bzi9r+Viv9/hd5KF9i71kXSqhtTtkWQ8uax0phQinRQ
	gCHjyao+iDOONbmkhPLzWMH0OP50HJFCFq0jeDvjxcyfKFm6+DW7GYcEP5Fon46c6N29
	UHkPFxiDgpbQ77hnsRiSzEg5MrUca3nN3DZ/CtKms9bGD7MRy2/E4kxf7Nj+iltF850Z
	nUzg==
X-Gm-Message-State: AD7BkJJjUSuqVtcV2/48LwAzNcLDimBXWqRggV6fWIRfX5QAb9lc6i1qkIbNZZLHNwEOXDFJD7FodU8d4+P4J/9e
X-Received: by 10.50.78.227 with SMTP id e3mr9088954igx.64.1456753873542; Mon,
	29 Feb 2016 05:51:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 29 Feb 2016 05:50:54 -0800 (PST)
In-Reply-To: <1456753354-7448-1-git-send-email-adrian.ratiu@ni.com>
References: <1456753354-7448-1-git-send-email-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 13:50:54 +0000
Message-ID: <CAJTo0LYcCQ9f0W6gQPtemxKjzCVo55M-pS+iWatV5YsfDrq41A@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Jacob Champion <jacob.champion@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] site: enable pthread support for x86_64 APR builds
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
X-List-Received-Date: Mon, 29 Feb 2016 13:51:18 -0000
Content-Type: multipart/alternative; boundary=089e0111b734287d45052ce8f1d2

--089e0111b734287d45052ce8f1d2
Content-Type: text/plain; charset=UTF-8

On 29 February 2016 at 13:42, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

>   apr_cv_process_shared_works=no: several platforms already set this
>   option, which conservatively disables support for PROCESS_SHARED
>   mutexes.
>

Which is interesting as building apr-native (so the site files don't get
used) for x86-64 gives:

apr_cv_process_shared_works=yes

Can we not go around disabling stuff when it actually does work?

Ross

--089e0111b734287d45052ce8f1d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 February 2016 at 13:42, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex"><div id=3D":32t" class=3D"" style=3D=
"overflow:hidden">=C2=A0 apr_cv_process_shared_works=3Dno: several platform=
s already set this<br>
=C2=A0 option, which conservatively disables support for PROCESS_SHARED<br>
=C2=A0 mutexes.</div></blockquote></div><br>Which is interesting as buildin=
g apr-native (so the site files don&#39;t get used) for x86-64 gives:</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">apr_cv_proc=
ess_shared_works=3Dyes<br></div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Can we not go around disabling stuff when it actually =
does work?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--089e0111b734287d45052ce8f1d2--
