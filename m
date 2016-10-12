Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4EBAE6FF69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 11:36:48 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id r30so47456970ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 04:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=McS/TT9hInH9MIBG5PacDCZf7rL+uHEuWTPtPrrjM40=;
	b=CHd2qH2SOjXzBfu9MAAqgrYsdB6zgHTmtpka85hUGAnUrjJSQQN8FzjsNWNwSLTsRy
	vjy0U5449ZEj4Rq6jFn+28taR7cgUDsiAPHkfHJykLng2ff4P6XtRBGgWeHy0hSwqFCw
	yFVJmigYMmWT4BNl+RU4BowkL/WnEmyELTJjjM+Q1zq9wnBwepbnqDKf+nEbAR7CKIwu
	uRJilgO7IzbYZEyyyFKo8ENIfapZTJCnczPI7KIGY1pz5BQWPn89zbTlFr6cDmgrOr9w
	8itSUQDHd1S3EPqLELOv3X8JZqEhuWnVgni6vgWWWqpzMMNGHEkuf+b4o87dPORuI61H
	DsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=McS/TT9hInH9MIBG5PacDCZf7rL+uHEuWTPtPrrjM40=;
	b=Ks93cHCW46OEvnQ0RffG8YhZgoki0J7WN1lF5OaWDnVSWlyZKFxSmOifcZ5pOv4913
	9tC4nIQQ/8W10/702tdsOxKlUCQCttcupyayLUhfLyGXx3Kg8yBSbu3ZfYS4tvICqCVS
	bdQ76jbzjX7h+X2bzweoLcTGcCZuuYiucFP70PVifTPhtcz4voocObK6O76/2eMdV55I
	gwe2tMV31q1Dxys0nCQ4ck79Oo7pzbC39M6mRCj2MJIlTwCTcRzVUh5YaxycK7coLusR
	/dSh2Jr73KUvpvAwb5qgBBQkkDcJ95Km0+fOh1nEUA5O45ZpFBREpffeFJwsoI6DWJUV
	06oQ==
X-Gm-Message-State: AA6/9Rn6DslWWV1VghEze9A3S+km8bGR5ygxHn5SjbiCNkbJtMkhHvvJ6nfCpkEY8A0tr/HifzG0z2XWQzIgVO5l
X-Received: by 10.107.138.15 with SMTP id m15mr920028iod.127.1476272210155;
	Wed, 12 Oct 2016 04:36:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 12 Oct 2016 04:36:29 -0700 (PDT)
In-Reply-To: <239ab1764ad811a12d8da6eb66ced3fff9987891.1476253865.git.liezhi.yang@windriver.com>
References: <cover.1476253865.git.liezhi.yang@windriver.com>
	<239ab1764ad811a12d8da6eb66ced3fff9987891.1476253865.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Oct 2016 12:36:29 +0100
Message-ID: <CAJTo0LYA0ZPi23Avt1=tyMq4_bDSZui-gdQwWcq1gbJN3B2U4Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] xcb-proto: create .pyc files for python2
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
X-List-Received-Date: Wed, 12 Oct 2016 11:36:49 -0000
Content-Type: multipart/alternative; boundary=001a113feb3cadafac053ea96826

--001a113feb3cadafac053ea96826
Content-Type: text/plain; charset=UTF-8

On 12 October 2016 at 07:31, Robert Yang <liezhi.yang@windriver.com> wrote:

> +    cd  ${D}${libdir}/xcb-proto/xcbgen
> +    python -m py_compile *.py
>

The cd is redundant as you can pass absolute paths to py_compile.

Ross

--001a113feb3cadafac053ea96826
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 October 2016 at 07:31, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6e2" =
class=3D"a3s aXjCH m157b7992ee298d37">+=C2=A0 =C2=A0 cd=C2=A0 ${D}${libdir}=
/xcb-proto/xcbgen<br>
+=C2=A0 =C2=A0 python -m py_compile *.py<br></div></blockquote></div><br>Th=
e cd is redundant as you can pass absolute paths to py_compile.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113feb3cadafac053ea96826--
