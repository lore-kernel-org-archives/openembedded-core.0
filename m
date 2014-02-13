Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 97D5B6E898
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 03:48:23 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id un15so10165802pbc.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 19:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=KExjbTaPW47u+zMpbwqILbFfOIYrEe4HYy7wBgRT/74=;
	b=adhgi3jEXCd7M9k8GrAq1FCic4vzdGHSS5eoA0hnUCecIiHRNFaiM79TgBABNY/Bm6
	8oLEez01TaA/vkFo8tCLU+MNoeqEJ6jI9USLytpzd7HgvQGeq3ssb7k6e1EWnz9u83Kw
	k9LbpdV9HYDZkNdNjtSMAE9DeL5vLcBl0cFv+YD+bLvB0ZCPew/kRkJZccMhOKxJWL+Y
	fyxPlKbUTgQ5NZSKQqqucXzYgGNm0SgTrT3orsq/8wbgSpxpG8tk9cysdDVWJIUPY76F
	cN78+BR+nwuSO25OxUQi9EXtohFOWusDOZWWp57mccCWkFKQpNlVpZjQOMV4rW8xagbI
	XXIw==
X-Received: by 10.69.0.10 with SMTP id au10mr55931217pbd.48.1392263304428;
	Wed, 12 Feb 2014 19:48:24 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	sy10sm3712607pac.15.2014.02.12.19.48.22 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 19:48:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <52FC3E39.8020601@windriver.com>
Date: Wed, 12 Feb 2014 19:48:21 -0800
Message-Id: <DF624B9F-F61F-4556-8E34-549BFC3A1025@gmail.com>
References: <cover.1392259689.git.hongxu.jia@windriver.com>	<44d5a04a1b2ed639f0f65a05418a63d4cfe7b6d5.1392259689.git.hongxu.jia@windriver.com>
	<CAMKF1spfiZ3298jFuL1k7V_pdnBpBVbvTvuk13R2yv_7TLLDeQ@mail.gmail.com>
	<52FC3E39.8020601@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 2/2] socat: enable ptest
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
X-List-Received-Date: Thu, 13 Feb 2014 03:48:24 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_BEE97664-E8B4-4345-A86E-F4F3CDC24C11"

--Apple-Mail=_BEE97664-E8B4-4345-A86E-F4F3CDC24C11
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Feb 12, 2014, at 7:38 PM, Hongxu Jia <hongxu.jia@windriver.com> =
wrote:

> On 02/13/2014 11:26 AM, Khem Raj wrote:
>> -Khem
>> On Feb 12, 2014 6:57 PM, "Hongxu Jia" <hongxu.jia@windriver.com> =
wrote:
>> >
>> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> > ---
>> >  meta/recipes-connectivity/socat/socat/run-ptest  |  5 +++++
>> >  meta/recipes-connectivity/socat/socat_1.7.2.3.bb | 12 ++++++++++--
>> >  2 files changed, 15 insertions(+), 2 deletions(-)
>> >  create mode 100644 meta/recipes-connectivity/socat/socat/run-ptest
>> >
>> > diff --git a/meta/recipes-connectivity/socat/socat/run-ptest =
b/meta/recipes-connectivity/socat/socat/run-ptest
>> > new file mode 100644
>> > index 0000000..1fffab1
>> > --- /dev/null
>> > +++ b/meta/recipes-connectivity/socat/socat/run-ptest
>> > @@ -0,0 +1,5 @@
>> > +#!/bin/bash
>>=20
>> is bash really needed ?
>=20
> Yes, I am sure.
> The socat's FAQ:
> ...
>  23 Q: I succeeded to configure and make socat, but ./test.sh says =
something
>  24 like:
>  25 ./test.sh: No such file or directory
>  26=20
>  27 A: You need a bash shell, and its location must be correctly =
specified in the
>  28 first line of test.sh, e.g. /usr/local/bin/bash instead of =
/bin/bash.

OK thx


--Apple-Mail=_BEE97664-E8B4-4345-A86E-F4F3CDC24C11
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"><br><div><div>On Feb 12, 2014, at 7:38 PM, Hongxu Jia &lt;<a href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><blockquote type="cite">
  
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  
  <div bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 02/13/2014 11:26 AM, Khem Raj wrote:<br>
    </div>
    <blockquote cite="mid:CAMKF1spfiZ3298jFuL1k7V_pdnBpBVbvTvuk13R2yv_7TLLDeQ@mail.gmail.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><p dir="ltr">-Khem<br>
        On Feb 12, 2014 6:57 PM, "Hongxu Jia" &lt;<a moz-do-not-send="true" href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;
        wrote:<br>
        &gt;<br>
        &gt; Signed-off-by: Hongxu Jia &lt;<a moz-do-not-send="true" href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
        &gt; ---<br>
        &gt; &nbsp;meta/recipes-connectivity/socat/socat/run-ptest &nbsp;| &nbsp;5
        +++++<br>
        &gt; &nbsp;meta/recipes-connectivity/socat/<a moz-do-not-send="true" href="http://socat_1.7.2.3.bb/">socat_1.7.2.3.bb</a> | 12
        ++++++++++--<br>
        &gt; &nbsp;2 files changed, 15 insertions(+), 2 deletions(-)<br>
        &gt; &nbsp;create mode 100644
        meta/recipes-connectivity/socat/socat/run-ptest<br>
        &gt;<br>
        &gt; diff --git
        a/meta/recipes-connectivity/socat/socat/run-ptest
        b/meta/recipes-connectivity/socat/socat/run-ptest<br>
        &gt; new file mode 100644<br>
        &gt; index 0000000..1fffab1<br>
        &gt; --- /dev/null<br>
        &gt; +++ b/meta/recipes-connectivity/socat/socat/run-ptest<br>
        &gt; @@ -0,0 +1,5 @@<br>
        &gt; +#!/bin/bash</p><p dir="ltr">is bash really needed ?<br>
      </p>
    </blockquote>
    <br>
    Yes, I am sure.<br>
    The socat's FAQ:<br>
    ...<br>
    &nbsp;23 Q: I succeeded to configure and make socat, but ./test.sh says
    something<br>
    &nbsp;24 like:<br>
    &nbsp;25 ./test.sh: No such file or directory<br>
    &nbsp;26 <br>
    &nbsp;27 A: You need a bash shell, and its location must be correctly
    specified in the<br>
    &nbsp;28 first line of test.sh, e.g. /usr/local/bin/bash instead of
    /bin/bash.<br></div></blockquote><div><br></div><div>OK thx</div><div><br></div></div></body></html>

--Apple-Mail=_BEE97664-E8B4-4345-A86E-F4F3CDC24C11--
