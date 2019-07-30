Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id B15F67C5F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 18:02:41 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so130272189iot.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 11:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=aG2wuIa2eslgsUAiZTBn9j/tCAy7/mbCg+TsANQMUwM=;
	b=MjN6v3wQp9WM4LGMbgwYezBWBdgCoDPbfJj5d4ymLJLb+j0hYWNDlKWBahwE3oj31M
	4PZZy6eiIpnHhGMQgJW1RRbCvizVy7APIM+oey63+WACrdCAFFXDBeXsLOl1h58XmqIw
	GP09+YW4f3MoC1iHfCjvCxJAaWkNmnLTXJUyKr5bH8nLX2WfDibOhor3gctr33BUVl6d
	OlY7f69Az8tY5Kz1wEj4TmbW5+AcS2koVPyijbN5snVhNVL5WF813UVDadRDHc6pylVt
	S6qCad7n5O6475+i5f2WTdEcmEvHIFhjCwfU2M0cHx84oGEBQPSVrnp6GBLtVzDKkCCu
	t70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=aG2wuIa2eslgsUAiZTBn9j/tCAy7/mbCg+TsANQMUwM=;
	b=mPg+ZFbQ5jvhq2wWZkBPR3MW5Z+NZtQ+QuIj5JPklxxq2Bexfp3lo5UCOjlS73oExs
	IXSQtDdI6U3eYKVa73Jdd8sa/t0S2QnGy3pHzL3Zm9SddvnvSLMTt85Kz5tlsydfBp08
	Z4FvCG773mCDZZEu4p5MkVraqCqswUZFEdM3ejPB+OwIIlOvteyBppv/qoRx6A3Ei9kM
	dNtic4Ml1kQIZLqLsAjfnI2eiBItEiiUaakxZHA00A2olNmZFWf703Oe2aAVw+x8N/pv
	sDKD9FJRJRTGCMRafwpLwIvEFOsm6paVPW8ncZG088pwLUNQelNWWfu48rm4zMacUEoe
	iCYg==
X-Gm-Message-State: APjAAAVEfvngPuew14X/tuVcyroySc6orV3q/7het1mDx1wiatjzW8mo
	eUqxIoG20X9UyVoWfxUJVZY=
X-Google-Smtp-Source: APXvYqygqX7UyHX31R2BgmMNAkvtSfqTCQFebt2LOggefz3CVetr1tTNB16bHbNYi8daQak7iibAGA==
X-Received: by 2002:a02:3b62:: with SMTP id i34mr124417573jaf.91.1564509762368;
	Tue, 30 Jul 2019 11:02:42 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6:49d0:515a:e57b:abb3?
	([2601:646:8500:6bc6:49d0:515a:e57b:abb3])
	by smtp.gmail.com with ESMTPSA id
	j14sm55846551ioa.78.2019.07.30.11.02.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 11:02:41 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	akuster808 <akuster808@gmail.com>
References: <20190729100020.10517-1-bunk@stusta.de>
	<5acdfa6c-f88a-7812-a0b1-108e4532ebbd@gmail.com>
	<CANNYZj8XyDdF_VNHL_YiDcFXeXf4Pk=o-pqg2SD3TO32ozqbyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <5f784845-62c8-8a50-a05a-4a7eba319199@gmail.com>
Date: Tue, 30 Jul 2019 11:02:40 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8XyDdF_VNHL_YiDcFXeXf4Pk=o-pqg2SD3TO32ozqbyw@mail.gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: Remove RECIPE_NO_UPDATE_REASON and follow the ESV releases
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
X-List-Received-Date: Tue, 30 Jul 2019 18:02:41 -0000
Content-Type: multipart/alternative;
	boundary="------------7F111B6F76D7C14D976BF224"
Content-Language: en-US

--------------7F111B6F76D7C14D976BF224
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/30/19 6:01 AM, Alexander Kanavin wrote:
> On Tue, 30 Jul 2019 at 11:21, akuster808 <akuster808@gmail.com 
> <mailto:akuster808@gmail.com>> wrote:
>
>     So are you setting the package update policy to LTS only ?  Its a
>     function over maintenance question.
>
>     I don't understand why this package is being singled out. I think it
>     should be an OE  architecture discussion
>
>
> I am not sure why are you objecting to this. This line:
> RECIPE_NO_UPDATE_REASON = "9.11 is LTS 2021"
> was added by you, and more or less states that update policy for bind 
> is LTS-only.

I see a technical reason where dependent packages like dhcp expects 9.11 
if used from system, there is an option to built the bundled version of 
bind9 but that results in duplication. Unless there are other compelling 
reason for upgrading, I would like us to stick with 9.11

>
> Alex
>

--------------7F111B6F76D7C14D976BF224
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/30/19 6:01 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj8XyDdF_VNHL_YiDcFXeXf4Pk=o-pqg2SD3TO32ozqbyw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Tue, 30 Jul 2019 at 11:21, akuster808 &lt;<a
            href="mailto:akuster808@gmail.com" moz-do-not-send="true">akuster808@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">So are you setting the
            package update policy to LTS only ?  Its a<br>
            function over maintenance question.<br>
            <br>
            I don't understand why this package is being singled out. I
            think it<br>
            should be an OE  architecture discussion<br>
          </blockquote>
          <div><br>
          </div>
          <div>I am not sure why are you objecting to this. This line:</div>
          <div><span class="gmail-im">RECIPE_NO_UPDATE_REASON = "9.11 is
              LTS 2021"</span></div>
          <div><span class="gmail-im">was added by you, and more or less
              states that update policy for bind is LTS-only.<br>
            </span></div>
        </div>
      </div>
    </blockquote>
    <p>I see a technical reason where dependent packages like dhcp
      expects 9.11 if used from system, there is an option to built the
      bundled version of bind9 but that results in duplication. Unless
      there are other compelling reason for upgrading, I would like us
      to stick with 9.11<br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj8XyDdF_VNHL_YiDcFXeXf4Pk=o-pqg2SD3TO32ozqbyw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><span class="gmail-im"><br>
            </span></div>
          <div><span class="gmail-im">Alex<br>
            </span></div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
  </body>
</html>

--------------7F111B6F76D7C14D976BF224--
