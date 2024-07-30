Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236F9C3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 17:44:52 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.23552.1722361481861278575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jD3A3tb6;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso4208226b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722361481; x=1722966281; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OmtLSwSn87Bxdf9Q7swxNzoh7oLBpTMcp0zp0RFfFec=;
        b=jD3A3tb61UcI9t+u3EV4AP3B/CQDBzu/DasFyHV2mo9uI7OcN0wQHvswRIJBoMMBLX
         7n/CBi1/X1hFO0OYj7OlQEZu3FvTFCI7sJ0ZhC/ptHAxj4Pl2/uKf557EcIJYyuKVd5Z
         ACit4FL0SJ7Cw4vQWMhKnYQ4gGUS3QP50Tsj3kx6WZj/fnHCVa0uAyPu5hqkbh9uWKi+
         u+KOaRoYXaVCXYiaClUZDlvNQw70QYpGBcqI6WtuATAGHS11kR1b5f5Al35LxC+/n6wq
         kwYr38J7SEA6F3zj6N2Dnjc236uF9I0bxyvq1Lh5hR1v7J7SgKGd2uRippEP6sbDaY3B
         ZedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722361481; x=1722966281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmtLSwSn87Bxdf9Q7swxNzoh7oLBpTMcp0zp0RFfFec=;
        b=TfgxfFpFTVQr2twtjsYpJvLhOxp2FTIasnIbZKEViWW871uDYuG7wkaAKUKQGTPWUV
         6yCSCZ7qSGK+GpkZWPylXa9GZnjEu6UVIf6nVQ3EKvZ188Bx4Vp25kPbLNx1Y4axFaPQ
         2y3axSMYE7vo6KqQwbAX5plPw7JS4q4IascixY5eVIsFmMqHlNMv6KwIzcxl15AAMTAe
         Tq2Gfr24v9PoVoySEptPDzP0/sxB4I2n9eK/pwHEum5sMwODjLaTShetBiB2HLFe0W6O
         EW+GdIMB72DqS1HGsAvWk4KF0VjMTAnKGnlRNLWfJxDYFusz3N9b2ilcjFMGk5twB+gT
         bM2g==
X-Gm-Message-State: AOJu0Yw6p0aj28aIA1Bcw2vKxzwTlVpPxgC3hqdHqrdEG5XO2iG6gLUy
	D7WEulRiYKi1OecXUaYLCPOAS2Y0AwNn0RuqH94Ri8l20Aq6Yns2Ua+KDO1dC854JfngtWxnGJp
	da4FT69Orl/0JBt/asasxdF0u8tg=
X-Google-Smtp-Source: AGHT+IHb8k9D8cBijQeTzOmaAyLLjm7dxhz5Fg5djkvX10MpC9WNcUKRoAvp9mUF1jRDOYYY33zmwa9vuhkYz3qhe+I=
X-Received: by 2002:a05:6a21:78a9:b0:1c1:89f8:8609 with SMTP id
 adf61e73a8af0-1c4a0e15171mr14662463637.0.1722361481072; Tue, 30 Jul 2024
 10:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240718164219.1007660-1-peter.marko@siemens.com>
In-Reply-To: <20240718164219.1007660-1-peter.marko@siemens.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 30 Jul 2024 19:44:29 +0200
Message-ID: <CAApg2=Twc4xuZoR=_WPyft0Vhdz+8cT49Cgak-Ghxfh9t8en1Q@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libarchive: ignore CVE-2024-37407
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004119fa061e7a88e5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 17:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202680

--0000000000004119fa061e7a88e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 6:43=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> History of code changes:
> * introduced:
> https://github.com/ilibarchive/libarchive/commit/390d83012fdba8c8db7fc991=
5338805882b0597a
> (v3.7.2-52-g390d8301)
> * reverted: 6
> https://github.com/libarchive/libarchive/commit/2c8caf6611a7d0662d80176c4=
fdb40f85794699
> (v3.7.2-53-g62c8caf6)
> * re-introduced: 9
> https://github.com/libarchive/libarchive/commit/1f27004a5c88589658e38d68e=
46d223da6b75ca
> (v3.7.3-14-g91f27004)
> * fixed: bhttps://
> github.com/libarchive/libarchive/commit/6a979481b7d77c12fa17bbed94576b63b=
bcb0c0
> (v3.7.3-24-gb6a97948)
>
>
For further reference, the commits in the message are malformed. Likely
should be:
* introduced:
https://github.com/ilibarchive/libarchive/commit/390d83012fdba8c8db7fc99153=
38805882b0597a
(v3.7.2-52-g390d8301)
* reverted:
https://github.com/libarchive/libarchive/commit/62c8caf6611a7d0662d80176c4f=
db40f85794699
<https://github.com/libarchive/libarchive/commit/2c8caf6611a7d0662d80176c4f=
db40f85794699>
(v3.7.2-53-g62c8caf6)
* re-introduced:
https://github.com/libarchive/libarchive/commit/91f27004a5c88589658e38d68e4=
6d223da6b75ca
<https://github.com/libarchive/libarchive/commit/1f27004a5c88589658e38d68e4=
6d223da6b75ca>
(v3.7.3-14-g91f27004)
* fixed: https://
github.com/libarchive/libarchive/commit/b6a979481b7d77c12fa17bbed94576b63bb=
cb0c0
<http://github.com/libarchive/libarchive/commit/6a979481b7d77c12fa17bbed945=
76b63bbcb0c0>
(v3.7.3-24-gb6a97948)

Kind regards,
Marta

--0000000000004119fa061e7a88e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 18, 2024 at 6:43=E2=80=AF=
PM Peter Marko via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembe=
dded.org">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a href=
=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.c=
om</a>&gt;<br>
<br>
History of code changes:<br>
* introduced: <a href=3D"https://github.com/ilibarchive/libarchive/commit/3=
90d83012fdba8c8db7fc9915338805882b0597a" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/ilibarchive/libarchive/commit/390d83012fdba8c8db7fc99=
15338805882b0597a</a> (v3.7.2-52-g390d8301)<br>
* reverted: 6<a href=3D"https://github.com/libarchive/libarchive/commit/2c8=
caf6611a7d0662d80176c4fdb40f85794699" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/libarchive/libarchive/commit/2c8caf6611a7d0662d80176c4fd=
b40f85794699</a> (v3.7.2-53-g62c8caf6)<br>
* re-introduced: 9<a href=3D"https://github.com/libarchive/libarchive/commi=
t/1f27004a5c88589658e38d68e46d223da6b75ca" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/libarchive/libarchive/commit/1f27004a5c88589658e38d=
68e46d223da6b75ca</a> (v3.7.3-14-g91f27004)<br>
* fixed: bhttps://<a href=3D"http://github.com/libarchive/libarchive/commit=
/6a979481b7d77c12fa17bbed94576b63bbcb0c0" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/libarchive/libarchive/commit/6a979481b7d77c12fa17bbed94576b6=
3bbcb0c0</a> (v3.7.3-24-gb6a97948)<br>
<br></blockquote><div><br></div>For further reference, the commits in the m=
essage are malformed. Likely should be:</div><div class=3D"gmail_quote">* i=
ntroduced: <a href=3D"https://github.com/ilibarchive/libarchive/commit/390d=
83012fdba8c8db7fc9915338805882b0597a" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/ilibarchive/libarchive/commit/390d83012fdba8c8db7fc99153=
38805882b0597a</a> (v3.7.2-52-g390d8301)<br>
* reverted: <a href=3D"https://github.com/libarchive/libarchive/commit/2c8c=
af6611a7d0662d80176c4fdb40f85794699" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/libarchive/libarchive/commit/62c8caf6611a7d0662d80176c4fd=
b40f85794699</a> (v3.7.2-53-g62c8caf6)<br>
* re-introduced: <a href=3D"https://github.com/libarchive/libarchive/commit=
/1f27004a5c88589658e38d68e46d223da6b75ca" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/libarchive/libarchive/commit/91f27004a5c88589658e38d=
68e46d223da6b75ca</a> (v3.7.3-14-g91f27004)<br>
* fixed: https://<a href=3D"http://github.com/libarchive/libarchive/commit/=
6a979481b7d77c12fa17bbed94576b63bbcb0c0" rel=3D"noreferrer" target=3D"_blan=
k">github.com/libarchive/libarchive/commit/b6a979481b7d77c12fa17bbed94576b6=
3bbcb0c0</a> (v3.7.3-24-gb6a97948)</div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote">Kind regards,</div><div class=3D"gmail_quote">=
Marta<br></div><div class=3D"gmail_quote"><br></div></div>

--0000000000004119fa061e7a88e5--

