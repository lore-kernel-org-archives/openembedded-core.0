Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web10.4714.1591725537152288515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 10:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HhvBCOJX;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id c9so7492037uao.11
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pEQsspch4UC8IZvc5kxDdEuat7PRL7frd7Q1y+Sk4do=;
        b=HhvBCOJXq+DkX2haRnWir60vs1Q8oEw1b7aD78oAlUpLiO7X01LdXXNQ4WdAGWYyzJ
         Z+Qo/RArhnD86lPCdGQ75psRrA7tIRWdJ9xtvRil6O03MEv7CmUNkoVtO1SV6ldRa5sZ
         sToUDhikz3InFm7MJu/tdBIZzcO78VvlcJsZheW+9/u/y7pLNBHB8fmRMr3h9Kv0qV6Q
         t7Z+qcKYorxMejSkHEB9X/iA3Khz6dIaFqSedxq8kYECUL5JFkYtxif2R1PKbBFYObiA
         lqBAJBs4oZXK0fpcEzjMXKnFkJJtloYKpR+ilGsLblMMxwZS0XXnNokRrNSJdB3+TWMD
         T4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pEQsspch4UC8IZvc5kxDdEuat7PRL7frd7Q1y+Sk4do=;
        b=JIZTNnMmRLehfOOGJ/wwj0t4FCqjuVZ+8ZisebWt4TrX8KvngIa4AMKwR599gmHdd+
         +yqhANUs58mMPGzKIjeVmHTBFdBXHw7DB7kMYGCQ2b1+m0VyqLvPiArDPMAJGo2Rc1ru
         E61VVo808r7UxLKLmi+PM6OeWms5ZzvnfXfGicub0rKzTVOCG31ED2Ma6nyyaBoYXRm1
         CWBwOmz5CclHAWv9LkZ6c37iF46L5YqfBrPBfZVqYdhvPhd+i2WLYFtRdTzjE6bf/1Iw
         JjQvleQCI8SDIi0+bOUp5mkUTR1XAUkdgrSkEyL4STx2ji2VsNR8OP4uW9mEjan2MKWN
         M73A==
X-Gm-Message-State: AOAM530882sLCDDemuzaknV6YskpVTSjHhs6OzS8yehx15BzliWVxWdG
	jaNfGG8+svzmBB6kZv1r7PbgP5V9VkY3ZFj/m1i/ChcE
X-Google-Smtp-Source: ABdhPJx4kAy4/YReZJqBtGbQf5TkD8MVN0euXjJPb2tIMaBgdQb2BjtQbonbL0lyFwsJBO2I3vKVhJjDh3+T+TqCb5U=
X-Received: by 2002:ab0:168c:: with SMTP id e12mr4431909uaf.89.1591725536215;
 Tue, 09 Jun 2020 10:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200608074659.7051-1-alex.kanavin@gmail.com> <20200608074659.7051-34-alex.kanavin@gmail.com>
 <2129b01748864d44ae689b45fc9c8684@XBOX03.axis.com>
In-Reply-To: <2129b01748864d44ae689b45fc9c8684@XBOX03.axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 9 Jun 2020 19:58:45 +0200
Message-ID: <CANNYZj82eEqZsxLBN7m-qUp8wNWniKkXs8fKsBoeQt=c9nxTAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 34/42] lttng-modules: update to 2.12.1
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002a879a05a7aa7b76"

--0000000000002a879a05a7aa7b76
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2020 at 18:24, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> > devupstream variant was incorrectly updated in a059fc67da4
> > (changed to 2.12, but without updating SRCREV), so revert it back
> > to 2.11.2.
>
> I don't understand this. If you update the recipe to 2.12.1, why do
> you not update the devupstream variant to match?
>

Because I have no interest in that variant, other than making sure it is
not misleading; it was added and is (supposedly) maintained by others who
use it to test the bleeding edge.

Generally those 'development' variants tend to bit rot quickly due to lack
of regular updates and testing, oe-core used to have plenty of them and
they were all dropped, except this one.

Alex

--0000000000002a879a05a7aa7b76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 9 Jun 2020 at 18:24, Peter Kjelle=
rstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellersted=
t@axis.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">&gt; devupstream variant was incorrect=
ly updated in a059fc67da4<br>
&gt; (changed to 2.12, but without updating SRCREV), so revert it back<br>
&gt; to 2.11.2.<br>
<br>
I don&#39;t understand this. If you update the recipe to 2.12.1, why do <br=
>
you not update the devupstream variant to match?<br></blockquote><div><br><=
/div><div>Because I have no interest in that variant, other than making sur=
e it is not misleading; it was added and is (supposedly) maintained by othe=
rs who use it to test the bleeding edge.</div><div><br></div><div>Generally=
 those &#39;development&#39; variants tend to bit rot quickly due to lack o=
f regular updates and testing, oe-core used to have plenty of them and they=
 were all dropped, except this one.<br></div><div><br></div><div>Alex<br></=
div></div></div>

--0000000000002a879a05a7aa7b76--
