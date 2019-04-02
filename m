Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 430B16BC7E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 17:51:23 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id p6so6921899pgh.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 10:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=vHFknsX98AHmjqY6JWvP7YSfwYWkxX9CQ6KrMFxleLE=;
	b=nTqdmoESFthfkw/c2po6nSmU+9M9EdwCkHWcxVyBT6IkZsvPq60RHhdQVh26aTeJoD
	fL7zTifa7tAaq4hqUoj1TnEUyz93tYvKTgpnzQYuAJatfPN9N7LR/qWAA705I62Oitk7
	Zm7nZgcZGxwUr2ZUM+kiCuCXMROWK6+1+c1cVApk9pT7BF6K1aPjX6fHI6qerJs3711k
	+g8t8SHwba6xZCBRlvM4SBN3/ppudjD0rz5D1wzFHWeh9rzp6BS8CAbk+X4r+VYRcZR8
	WFz9/ruA8IDCtWt/djjaX/ieGihXWtCt9ELUriNIEE0O8CbYCwMdff/FG7YlIznSvfNB
	IA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=vHFknsX98AHmjqY6JWvP7YSfwYWkxX9CQ6KrMFxleLE=;
	b=bCTlJAyABVMzJ0w70tl//bIGYTSXdokJ940Ki6sTH8mgN4Yl5t+e/VufVSVSX/PkiP
	TwXBxNZezmQ1KqvloSHN3kgO4wJOyBo9i2GMiDoCUfhcEBMh4nGPe9isNAFVPtoPAnZq
	ApNZh1EvS1Uaw6qtkP034arfZzQOJiLt7Er5ZhkFjkb0JTWR5+/+wSuYcXW9OLoz+WUF
	eRf+bxIuxJLnsYnq283GdQYF8PobjT//6sFROwIEFM55PUq4lhu78irePJKomCTAUlj5
	wVhswtsEAve+VyQfb7pJYmgYm5M55vzsffDo1TfdJKsJiDb+qI+V3SRKnrNtNGHqsq+N
	CndA==
X-Gm-Message-State: APjAAAV7hlNO8T41LiLlLLDNoRYu4hyyTQFzXxy0v035GWMFou1eUGju
	3YpYEm3sf0lAcHT5fdVRLYnbIQ4N
X-Google-Smtp-Source: APXvYqzT9+NBKcbXKZq7OMz/n7rNyeEZ+sxlf8BTLUF6sjqGTzL1ORcBi+S6olKPEJ9YnRuCiuYbqg==
X-Received: by 2002:a63:30c5:: with SMTP id w188mr43836471pgw.76.1554227484235;
	Tue, 02 Apr 2019 10:51:24 -0700 (PDT)
Received: from [10.47.245.159] ([156.39.10.47])
	by smtp.gmail.com with ESMTPSA id
	d25sm19010311pfn.154.2019.04.02.10.51.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 10:51:23 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1552927535-19740-1-git-send-email-akuster808@gmail.com>
	<CALbNGRT1_qD8LYEP7X7JexnEOW7AsC84ceatZ3BLgECoo7vixQ@mail.gmail.com>
	<20190319075206.GK20077@hiutale> <20190324180113.GA1947@jama>
	<f307d6b7-80db-14a1-8703-785ce476d43a@gmail.com>
	<20190324184803.GB1947@jama>
	<CA+chaQfznYy8kNoRYynaZQuc1wA7VOxroxcgcPqp8dJcUB3V9A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <17cbc6a5-4ef8-b618-91fc-6b4b16862213@gmail.com>
Date: Tue, 2 Apr 2019 10:51:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfznYy8kNoRYynaZQuc1wA7VOxroxcgcPqp8dJcUB3V9A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] Revert "boost: update to 1.69.0"
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
X-List-Received-Date: Tue, 02 Apr 2019 17:51:23 -0000
Content-Type: multipart/alternative;
	boundary="------------44BA55AC6ED3C2AE6D969E5D"
Content-Language: en-US

--------------44BA55AC6ED3C2AE6D969E5D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 4/2/19 12:18 AM, Martin Jansa wrote:
> Any update on this one? Or should we downgrade it on our side when
> bumping oe-core/thud revision?
I have this stagged but it missed the QA cutoff. 

- armin
>
> On Sun, Mar 24, 2019 at 7:48 PM Martin Jansa <martin.jansa@gmail.com
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     On Sun, Mar 24, 2019 at 11:45:08AM -0700, akuster808 wrote:
>     >
>     >
>     > On 3/24/19 11:01 AM, Martin Jansa wrote:
>     > > On Tue, Mar 19, 2019 at 07:52:06AM +0000, Mikko.Rapeli@bmw.de
>     <mailto:Mikko.Rapeli@bmw.de> wrote:
>     > >> On Mon, Mar 18, 2019 at 06:03:05PM +0100, Andreas Müller wrote:
>     > >>> On Mon, Mar 18, 2019 at 5:45 PM Armin Kuster
>     <akuster808@gmail.com <mailto:akuster808@gmail.com>> wrote:
>     > >>>> This reverts commit a384248938ea9db096866bf4ec8678d35ca62a12.
>     > >>>>
>     > >>>> This package update slipped in doing the maint process.
>     Removing it.
>     > >> <snip>
>     > >>> Just my opinion - don't consider this as NAK.
>     > >>>
>     > >>> * I already fixed the recipes that failed for me. For at
>     least one the
>     > >>> change is no more compatible to 1.68.0.
>     > >>> * This makes PV going backwards
>     > >>>
>     > >>> Thanks for addressing - what do others think?
>     > >> I'm not using thud yet, but updating boost in stable branch
>     would break
>     > >> too many things and I would have to revert that change in our
>     trees. Some boost
>     > >> updates are in the end quite trivial and just require recompiling
>     > >> everything but still, I would prefer that boost is not
>     updated in stable
>     > >> branches unless there is a huge security/stability issue with
>     the old version.
>     > > Agreed.
>     > >
>     > > I care less for PV going backwards nowadays, it's probably
>     less annoying than
>     > > bumping PE first in master and then backporting PE bump to thud.
>     > >
>     > > People with build issues related to boost upgrade probably never
>     > > built whole image to push it as an upgrade to end devices.
>     >
>     > So do you agree with the revert?
>
>     I do.
>
>     -- 
>     Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>
>


--------------44BA55AC6ED3C2AE6D969E5D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/2/19 12:18 AM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQfznYy8kNoRYynaZQuc1wA7VOxroxcgcPqp8dJcUB3V9A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Any update on this one? Or should we downgrade it
        on our side when bumping oe-core/thud revision?</div>
    </blockquote>
    I have this stagged but it missed the QA cutoff.  <br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CA+chaQfznYy8kNoRYynaZQuc1wA7VOxroxcgcPqp8dJcUB3V9A@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Sun, Mar 24, 2019 at 7:48
          PM Martin Jansa &lt;<a href="mailto:martin.jansa@gmail.com"
            moz-do-not-send="true">martin.jansa@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          Sun, Mar 24, 2019 at 11:45:08AM -0700, akuster808 wrote:<br>
          &gt; <br>
          &gt; <br>
          &gt; On 3/24/19 11:01 AM, Martin Jansa wrote:<br>
          &gt; &gt; On Tue, Mar 19, 2019 at 07:52:06AM +0000, <a
            href="mailto:Mikko.Rapeli@bmw.de" target="_blank"
            moz-do-not-send="true">Mikko.Rapeli@bmw.de</a> wrote:<br>
          &gt; &gt;&gt; On Mon, Mar 18, 2019 at 06:03:05PM +0100,
          Andreas Müller wrote:<br>
          &gt; &gt;&gt;&gt; On Mon, Mar 18, 2019 at 5:45 PM Armin Kuster
          &lt;<a href="mailto:akuster808@gmail.com" target="_blank"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
          &gt; &gt;&gt;&gt;&gt; This reverts commit
          a384248938ea9db096866bf4ec8678d35ca62a12.<br>
          &gt; &gt;&gt;&gt;&gt;<br>
          &gt; &gt;&gt;&gt;&gt; This package update slipped in doing the
          maint process. Removing it.<br>
          &gt; &gt;&gt; &lt;snip&gt;<br>
          &gt; &gt;&gt;&gt; Just my opinion - don't consider this as
          NAK.<br>
          &gt; &gt;&gt;&gt;<br>
          &gt; &gt;&gt;&gt; * I already fixed the recipes that failed
          for me. For at least one the<br>
          &gt; &gt;&gt;&gt; change is no more compatible to 1.68.0.<br>
          &gt; &gt;&gt;&gt; * This makes PV going backwards<br>
          &gt; &gt;&gt;&gt;<br>
          &gt; &gt;&gt;&gt; Thanks for addressing - what do others
          think?<br>
          &gt; &gt;&gt; I'm not using thud yet, but updating boost in
          stable branch would break<br>
          &gt; &gt;&gt; too many things and I would have to revert that
          change in our trees. Some boost<br>
          &gt; &gt;&gt; updates are in the end quite trivial and just
          require recompiling<br>
          &gt; &gt;&gt; everything but still, I would prefer that boost
          is not updated in stable<br>
          &gt; &gt;&gt; branches unless there is a huge
          security/stability issue with the old version.<br>
          &gt; &gt; Agreed.<br>
          &gt; &gt;<br>
          &gt; &gt; I care less for PV going backwards nowadays, it's
          probably less annoying than<br>
          &gt; &gt; bumping PE first in master and then backporting PE
          bump to thud.<br>
          &gt; &gt;<br>
          &gt; &gt; People with build issues related to boost upgrade
          probably never<br>
          &gt; &gt; built whole image to push it as an upgrade to end
          devices.<br>
          &gt; <br>
          &gt; So do you agree with the revert?<br>
          <br>
          I do.<br>
          <br>
          -- <br>
          Martin 'JaMa' Jansa     jabber: <a
            href="mailto:Martin.Jansa@gmail.com" target="_blank"
            moz-do-not-send="true">Martin.Jansa@gmail.com</a><br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------44BA55AC6ED3C2AE6D969E5D--
