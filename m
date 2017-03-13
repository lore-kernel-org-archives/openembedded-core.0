Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id F19126025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 10:08:23 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b5so17637580pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=c6ESyEx8TscHj1PShqb47Wo1cjt3APakwEevDdDhSl0=;
	b=WHnyz3vVEcEO5wJgNmla3BGBArptM6gP5pHolnBgP6Gks20CIFdmlKEhdwxX+1KypX
	viq7LGrRQ8pPZgp9oEP5eWAtoo4nHAN9ocJ+Xf+fgfqtX8ajslW/xEiG7J47na38pPvX
	jJlXJNCp/UtnNwUwZyxfYceXlz0DE3Y4ZuVjbBYBuVZs4hUhNwPlKDtu+RzhihiSk/L/
	NsnmZEohCLTJ9hcB7inEq3B25P4mNUzWfe3gjYLk3ozBG/JKubC1xxP3Gf+jsVr7MQjo
	IYGOtQKKV2KBmtFGVbmchTZb1Y4nD99ZfYLemhn2epl3eCW6lKZ3AUmbBBOpFaUhKubP
	ItIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=c6ESyEx8TscHj1PShqb47Wo1cjt3APakwEevDdDhSl0=;
	b=VltkLdVpWOxmFtOGo0vXtOkXExwBnLgumr3RO/jYPiSJT89JucmR3HJuG2kcVZxwOW
	6WT+W60eWS5eIPTUFyKIlG1/hK0bWQkBNJR6c0s++wsWaMRecIDP3Ue9Gn52KoKM+hjY
	YlCxMOkMAaMCyvlyG6NeviyaBzihyzk/pMNChlrdxieKsoVy/3FM6OrHnTtcTLiRkhJz
	b/0oRcJkIeLYNZWxS0aaSJ0fxvBh6omw9DyKywF/ucKpDADxF/FAYwyu3SAZ66sfL7U/
	j8C0lpO0P+WoZr2f+WN3ddvhZrWdgqI5CuLrWgrWvsGupv57/s5JJsXj+bUl1/3XLPsj
	91ag==
X-Gm-Message-State: AMke39lrqgnjxMWTbSt02L2mj5MR/+G7A8liak+6M8IGxEVJ1VQkhhxJu61updyIIheZaA==
X-Received: by 10.84.198.164 with SMTP id p33mr46941084pld.127.1489399705042; 
	Mon, 13 Mar 2017 03:08:25 -0700 (PDT)
Received: from [10.161.103.40] ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	m6sm32376557pgn.58.2017.03.13.03.08.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 03:08:24 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>, Armin Kuster <akuster808@gmail.com>
References: <1489332452-19584-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LZqLtX8zHtfTLOnF8g9t12GoTxM8ABipGJmrGdKZx5ruQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <eac93c3e-e92e-82a5-1356-bb2b573c6080@gmail.com>
Date: Mon, 13 Mar 2017 03:08:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZqLtX8zHtfTLOnF8g9t12GoTxM8ABipGJmrGdKZx5ruQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2][PATCH] license class: try alt encoding when copying license file
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
X-List-Received-Date: Mon, 13 Mar 2017 10:08:25 -0000
Content-Type: multipart/alternative;
	boundary="------------9047EEFA1A41191F1C6C4553"

--------------9047EEFA1A41191F1C6C4553
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/13/2017 02:42 AM, Burton, Ross wrote:
>
> On 12 March 2017 at 15:27, Armin Kuster <akuster808@gmail.com 
> <mailto:akuster808@gmail.com>> wrote:
>
>     Try another encoding if utf-8 fails in file read.
>
> hl
> I sent a patch for this last week (just taking bytes instead of 
> guessing encodings, which will still fail if the encoding isn't UTF-8 
> or 8859-1)
Your patch works great in this case. I was working in a old tree.
- armin
>
> Ross


--------------9047EEFA1A41191F1C6C4553
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 03/13/2017 02:42 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZqLtX8zHtfTLOnF8g9t12GoTxM8ABipGJmrGdKZx5ruQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 12 March 2017 at 15:27, Armin
            Kuster <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:akuster808@gmail.com" target="_blank">akuster808@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":45g" class="a3s aXjCH m15ac32210a55af5c">Try
                another encoding if utf-8 fails in file read.<br>
              </div>
            </blockquote>
          </div>
          hl <br>
          I sent a patch for this last week (just taking bytes instead
          of guessing encodings, which will still fail if the encoding
          isn't UTF-8 or 8859-1)</div>
      </div>
    </blockquote>
    Your patch works great in this case. I was working in a old tree. <br>
    - armin<br>
    <blockquote
cite="mid:CAJTo0LZqLtX8zHtfTLOnF8g9t12GoTxM8ABipGJmrGdKZx5ruQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------9047EEFA1A41191F1C6C4553--
