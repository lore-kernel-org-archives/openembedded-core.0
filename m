Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 38D51736B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 20:25:24 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id p10so6964627lfb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 13:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=o3IAk9ED1RECAdZ/b5pFE45/anbjsIHiEVOoGls8S9I=;
	b=ABIPKrhH4wqS2e/aQn6eErTqHGnkbVxwG5u5wH/B5B8T5f45CcMBQtZkBVIGONvO51
	Xl7L6hJj/HpTa0QHxbzaumfZM/1IHReX7RmRQnUZ7i+bgeHhbG3hbBwzlQb/nIQOvAZg
	MRTarjG00MX3TBVfOuH+06ZTvJmPW0cfe9eAF+QvU0cEwGeb0cnVC3FDn+Pnh2+ULY4K
	5GwVX9xWPECZzb4dPCdqHPFX9HjH3fhM2jTrXF541JBml9NLZDTtXj5J1i5qjSgsPZ6w
	8hLCzCJTQrXMoo8ZNyPeaeANwlCPZgZY4vz5f++d0s15pptHFNp43pjBspAJDpXomaZG
	u6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=o3IAk9ED1RECAdZ/b5pFE45/anbjsIHiEVOoGls8S9I=;
	b=WY1cA8/5xfFFFF8+xYGWs4FtprkXcae+pMPUpZ3o+5sUp5Q8oCZOJ8bkos6lCsJdez
	mtYM4miz06NGkHQyA2lIRGJiVUxS4WOd7sAbbgM4nQ+tEC1h1l1ZHR/xv0bcq4mq4rg5
	2FbfhdKSfCbj4etPHjH3jAKgm2nImoKjPvE0JOejMk7BYF0JmfPxXUo8NmoxBuwjvcRF
	pphc0fgD1VP1W8RI6uaie3ZNftgs7PqTQZu2t56qu+KJOT2HRK8Ccfm6KvCJ3SN93XUH
	UNIWpm/IaNATa9dpll6tg6AwPJEKZvvq4wry3tQ/KsRln3oM3WDuiVW+jtcpNOqFInFF
	Tt3Q==
X-Gm-Message-State: ALyK8tJgczo7MJV7gM2Flyi9qyCiy+nT/u6l28NPNJ2kh1i5OQhoxxwcY7WvccrSDRKBDA==
X-Received: by 10.25.22.89 with SMTP id m86mr2822785lfi.25.1464294324830;
	Thu, 26 May 2016 13:25:24 -0700 (PDT)
Received: from [192.168.0.12] (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	wf4sm2506045lbb.48.2016.05.26.13.25.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2016 13:25:24 -0700 (PDT)
To: Christopher Larson <clarson@kergoth.com>
References: <1464291870-5602-1-git-send-email-liu.ming50@gmail.com>
	<CABcZANk9BJp_1wMrv7mR8-vLk3JfMkdxRqTMqcWm62nHkCrnBw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Message-ID: <57475BB3.1020401@gmail.com>
Date: Thu, 26 May 2016 22:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CABcZANk9BJp_1wMrv7mR8-vLk3JfMkdxRqTMqcWm62nHkCrnBw@mail.gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: hide the error in case swapoff does not exist
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
X-List-Received-Date: Thu, 26 May 2016 20:25:29 -0000
Content-Type: multipart/alternative;
	boundary="------------050303030203010305010100"

--------------050303030203010305010100
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/26/2016 10:11 PM, Christopher Larson wrote:
>
>
> On Thu, May 26, 2016 at 12:44 PM, Ming Liu <liu.ming50@gmail.com 
> <mailto:liu.ming50@gmail.com>> wrote:
>
>     From: Ming Liu <peter.x.liu@external.atlascopco.com
>     <mailto:peter.x.liu@external.atlascopco.com>>
>
>     To avoid reporting errors when swapoff does not exist.
>
>     Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com
>     <mailto:peter.x.liu@external.atlascopco.com>>
>
>
> This will suppress *real* errors as well. Better to just check if 
> swapoff exists and then run it if it does, if that's a concern.
Yes, checking if it exists makes more sense. And swapon is being used 
with 2> /dev/null as well in some places, better to change them also. I 
will send a V1 soon.

//Ming Liu
> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------050303030203010305010100
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 05/26/2016 10:11 PM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANk9BJp_1wMrv7mR8-vLk3JfMkdxRqTMqcWm62nHkCrnBw@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Thu, May 26, 2016 at 12:44 PM,
            Ming Liu <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:liu.ming50@gmail.com" target="_blank">liu.ming50@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
              Ming Liu &lt;<a moz-do-not-send="true"
                href="mailto:peter.x.liu@external.atlascopco.com">peter.x.liu@external.atlascopco.com</a>&gt;<br>
              <br>
              To avoid reporting errors when swapoff does not exist.<br>
              <br>
              Signed-off-by: Ming Liu &lt;<a moz-do-not-send="true"
                href="mailto:peter.x.liu@external.atlascopco.com">peter.x.liu@external.atlascopco.com</a>&gt;<br>
            </blockquote>
            <div><br>
            </div>
            <div>This will suppress *real* errors as well. Better to
              just check if swapoff exists and then run it if it does,
              if that's a concern.</div>
          </div>
        </div>
      </div>
    </blockquote>
    Yes, checking if it exists makes more sense. And swapon is being
    used with 2&gt; /dev/null as well in some places, better to change
    them also. I will send a V1 soon.<br>
    <br>
    //Ming Liu<br>
    <blockquote
cite="mid:CABcZANk9BJp_1wMrv7mR8-vLk3JfMkdxRqTMqcWm62nHkCrnBw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">-- <br>
          <div class="gmail_signature">Christopher Larson<br>
            clarson at kergoth dot com<br>
            Founder - BitBake, OpenEmbedded, OpenZaurus<br>
            Maintainer - Tslib<br>
            Senior Software Engineer, Mentor Graphics</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------050303030203010305010100--
