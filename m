Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id EBB1A7825B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:08:22 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id k101so1902650iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 06:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b1n/TJfopFml0Df703lNfYfJGyOhfw+2ExlZULHYfeg=;
	b=mYmAiZy/Gmdcu4E15V78PLGzPob43VV5eJK57ELgfPXTGup0uvGlZFpfn44PyDABYK
	o1lpGFH8+pc9yspmBcmiKw93dPvDFxt7Wv1Cw7/963yBURhCffolMQDHgEz7wAn1c2Xv
	6l9qA5w8xDP3UszNZNgM9apGB9jBKQPjsUx5/PAiU0jZOXtxZhseHBasSkgpIlBY6oKD
	jA/lfhsTo3VoecmOffoXyk+PICfFe2fHRkRdfuQZd+JKwSwElRq/EEYUNOiwPSRUhzGG
	62F+zu3bpj45lksmSKh/WNa2PY+1OE+VoXQpL4JR8VL79qgi1wS3SnTudYSfZyHe03jo
	1tRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b1n/TJfopFml0Df703lNfYfJGyOhfw+2ExlZULHYfeg=;
	b=BoysPMg9Ox+7VU66ElkgO5ln2f50EMtdrv2u/gd6JiQeHAZElbZvtpZDSmdq7qPdw+
	2tF0SuKu+pTq9jjEIgKE/mNmgkmreFHGD9wTb7wNsILA+9yf03ZiKERWm3Y6onZfOnIs
	3KNHOFf1u/0tvunjs0DHosEvtTGxijGHDksTj42uCmAU75whaZPmJ1lxf1fZn7CAwrZc
	uNyJMK8ASnPkEX0Hc611WTd1ajaedRBAv833KUTVZl6/prfkYMHmuDbTzrPYHEewu2X7
	NwhoWRHsNOgxG6madhn9U9iSwg7cGdt8kJBEGd+UKdPm7k5VN0ssXQRWMpTv/+w5jnb1
	tMYQ==
X-Gm-Message-State: AHPjjUjqXmo+elZMnFBDFtzsBE4zgEpDrgY8p9uhQVA3d2nXdEAF/CU3
	YhTISDjUTdT4GXojcMfxHgrx2wkJBVXoEQIJDTicTw==
X-Google-Smtp-Source: AOwi7QBFX1OqMVY4pQMzE8PXkQQpT1WPzSCeB0nDsGmE+3U1YvLeHBdVQYw29yjMHBYQ3j5ZvhMtVHCiBUNA6adM3RI=
X-Received: by 10.107.41.135 with SMTP id p129mr4591593iop.142.1505740103783; 
	Mon, 18 Sep 2017 06:08:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 18 Sep 2017 06:08:03 -0700 (PDT)
In-Reply-To: <660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Sep 2017 14:08:03 +0100
Message-ID: <CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] base-files: profile: Do not assume that the 'command' command exists
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
X-List-Received-Date: Mon, 18 Sep 2017 13:08:23 -0000
Content-Type: multipart/alternative; boundary="001a1141f22602d6d005597670c7"

--001a1141f22602d6d005597670c7
Content-Type: text/plain; charset="UTF-8"

On 18 September 2017 at 12:31, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> This is basically the same change as I first sent a patch for in April, and
>> last pinged this Friday... The only real difference is that this one
>> misses
>> passing error output from resize to /dev/null (which it should do to
>> handle
>> the case where tty exists, but resize does not).
>>
>
> Yeah, indeed.
>

Apologies for missing that patch!


> Other problem is that "resize" outputs shell script on stdout to be
> executed, so the proper "total" invokation would be:
>
>   /dev/tty[A-z]*) eval `resize 2>/dev/null` ;;
>
> The "eval" part is missing in your version...


Who is going to submit the One True patch with all the fixes in?  I promise
to merge it.

Ross

--001a1141f22602d6d005597670c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 September 2017 at 12:31, Mike Looijmans <span dir=3D=
"ltr">&lt;<a href=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike=
.looijmans@topic.nl</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h=
5"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">This is basically the same change as I fi=
rst sent a patch for in April, and<br>
last pinged this Friday... The only real difference is that this one misses=
<br>
passing error output from resize to /dev/null (which it should do to handle=
<br>
the case where tty exists, but resize does not).<br>
</blockquote>
<br></div></div>
Yeah, indeed.<br></blockquote><div><br></div><div>Apologies for missing tha=
t patch!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Other problem is that &quot;resize&quot; outputs shell script on stdout to =
be executed, so the proper &quot;total&quot; invokation would be:<br>
<br>
=C2=A0 /dev/tty[A-z]*) eval `resize 2&gt;/dev/null` ;;<br>
<br>
The &quot;eval&quot; part is missing in your version...</blockquote><div><b=
r></div><div>Who is going to submit the One True patch with all the fixes i=
n?=C2=A0 I promise to merge it.</div><div><br></div><div>Ross=C2=A0</div></=
div></div></div>

--001a1141f22602d6d005597670c7--
